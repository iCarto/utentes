#!/usr/bin/env python

import argparse
import os
import tempfile
from typing import List, TextIO

import geopandas as gpd
from dataclasses import dataclass
from exceptions import SIRHAError
from ietl import rewrite_shp2pgsql_output
from ietl.find_file import find_all_by_pattern
from ietl.postgres import query_delete_all_data_in_schema
from ietl.shp import calculate_encoding
from populate_cbase_adm_locs import ADMLocations
from populate_cbase_config import (
    ADM_LOC_CBASE_TABLES,
    CBASE_TABLES,
    EPSG,
    HYDRO_LOC_CBASE_TABLES,
    OUTPUT_FILE,
    TMP_CBASE_SQL,
    TMP_OUTPUT_FILE,
    get_database_conn_str,
)
from populate_cbase_utils import common_df_checks, read_file
from populate_cbase_workarounds import workaround


@dataclass
class CBaseItem(object):
    table: str
    file: str


class HydroLocations(object):
    def __init__(self, items, database_conn_strs) -> None:
        self.items = items
        self.database_conn_strs = database_conn_strs

    def __bool__(self):
        return bool(self.items)


def join_list_with_newlines(phrases: List[str]) -> str:
    return "{0}\n\n".format("\n".join(phrases))


def build_delete_queries(schema: str, tables: List[str]) -> str:
    query = "DELETE FROM {schema}.{table};"
    queries = [query.format(schema=schema, table=table) for table in tables]
    return join_list_with_newlines(queries)


def build_restart_gid_queries(schema: str, tables: List[str]) -> str:
    query = "ALTER TABLE {schema}.{table} ALTER COLUMN gid RESTART WITH 1;"
    queries = [query.format(schema=schema, table=table) for table in tables]
    return join_list_with_newlines(queries)


def filepath_matches_tablename(filepath: str, tablename: str) -> bool:
    return filepath.lower().endswith(f"{tablename}.shp")


def look_for_file(shp_files, table):
    candidates = [f for f in shp_files if filepath_matches_tablename(f, table)]
    if len(candidates) != 1:
        raise SIRHAError(f"No hay candidatos o hay más de uno: {candidates}")
    return candidates[0]


def execute_shp2pgsql(encoding, shp, table):
    shp2pgsql = f"shp2pgsql -s {EPSG} -a -g geom -D -W {encoding} -N abort '{shp}' cbase.{table} >> {TMP_CBASE_SQL}"
    os.system(shp2pgsql)


def dump_shp_to_sql(item: CBaseItem):
    encoding = calculate_encoding.main(item.file)
    df = gpd.read_file(item.file, encoding=encoding)
    df.drop(columns="gid", inplace=True, errors="ignore")
    common_df_checks(df)
    # df = common_df_fixes(df)

    # https://github.com/geopandas/geopandas/pull/1955
    # and a couple of issues more
    # https://gis.stackexchange.com/q/327748/4177
    df.crs = f"EPSG:{EPSG}"
    df.set_geometry(col="geometry", inplace=True)
    new_shp = os.path.join(tempfile.gettempdir(), os.path.basename(item.file))
    df.to_file(new_shp, encoding=encoding)
    execute_shp2pgsql(encoding, new_shp, item.table)


class Main(object):
    def __init__(
        self,
        cbase_tables: List[str],
        shp_files: List[str],
        database_conn_strs,
        divisoes_name_changes,
    ):
        if len(shp_files) != len(cbase_tables):
            raise SIRHAError("El número de ficheros no coincide con el esperado")
        self.cbase_tables = list(cbase_tables)
        self.shp_files = list(shp_files)
        self.database_conn_strs = database_conn_strs
        self.divisoes_name_changes = divisoes_name_changes
        self.items = [
            CBaseItem(table, look_for_file(self.shp_files, table))
            for table in self.cbase_tables
        ]
        self.adm_locations = ADMLocations(
            [i for i in self.items if i.table in ADM_LOC_CBASE_TABLES],
            database_conn_strs,
        )
        self.adm_locations.do_it()
        self.hydro_locations = HydroLocations(
            [i for i in self.items if i.table in HYDRO_LOC_CBASE_TABLES],
            database_conn_strs,
        )

        self.dump_cbase_shps_to_sql()
        self.write_tmp_output_file()

    def dump_cbase_shps_to_sql(self):
        with open(TMP_CBASE_SQL, "w") as f:
            f.write("-- temp cbase data file\n")

        for item in self.items:
            print(item.table)  # noqa: WPS421
            dump_shp_to_sql(item)

    def write_tmp_output_file(self):
        with open(TMP_OUTPUT_FILE, "w") as f:
            f.write("BEGIN;\n\n")

            f.write(build_delete_queries("cbase", self.cbase_tables))

            f.write(build_restart_gid_queries("cbase", self.cbase_tables))

            self._append_cbase_sql_data(f)

            workaround(f)

            self._append_fill_domains_from_cbase_adm_locs(f)
            self._append_fill_domains_from_cbase_hydro_locs(f)

            if self.divisoes_name_changes:
                f.write(
                    read_file()("sql-functions/rename_fact_codes_for_new_divisoes.sql")
                )

            self._append_rebuild_cbase_ara_data(f)

            f.write("\n\nCOMMIT;\n")

    def _append_cbase_sql_data(self, f):
        f.write("\n\n")
        with open(TMP_CBASE_SQL) as cbase_sql_file:
            for line in cbase_sql_file:
                f.write(line)
        f.write("\n\n")

    def _append_fill_domains_from_cbase_adm_locs(self, f: TextIO):
        if not self.adm_locations:
            return
        sql = read_file("sql-functions/fill_domains_from_cbase_adm_locs.sql")

        placeholder = "/* REPLACE THIS: UPDATE DATA FOR NEW LOCATIONS */"

        updates = (
            # Update based on geometries
            read_file("sql-functions/create_tmp_tables_geom_doesnt_match_adm_loc.sql")
            + "\n\n"
            + read_file("sql-functions/update_from_geom_adm_locs.sql")
            # + TODO UPDATE BASED ON OTHER CRITERIA
        )
        sql = sql.replace(placeholder, updates)

        f.write(sql)

    def _append_fill_domains_from_cbase_hydro_locs(self, f: TextIO):
        if not self.hydro_locations:
            return
        f.write(read_file()("sql-functions/fill_domains_from_cbase_hydro_locs.sql"))

    def _append_rebuild_cbase_ara_data(self, f: TextIO):
        # cbase_ara is completly "rebuild" in each process.
        f.write(query_delete_all_data_in_schema.main("cbase_ara"))
        f.write(read_file("sql-functions/insert_cbase_into_cbase_ara.sql"))


def main(args):
    shp_files = find_all_by_pattern("*.shp", args.shp_folder_path)

    if args.only_adm:
        cbase_tables = list(ADM_LOC_CBASE_TABLES)
    else:
        cbase_tables = list(CBASE_TABLES)

    Main(
        cbase_tables,
        shp_files,
        get_database_conn_str(args.prod),
        args.divisoes_name_changes,
    )

    rewrite_shp2pgsql_output.data(TMP_OUTPUT_FILE, OUTPUT_FILE)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Populate schema cbase")
    parser.add_argument(
        "shp_folder_path", help="Path to the folder containing the shp files"
    )
    parser.add_argument(
        "--only-adm",
        action="store_true",
        help="Process only administrative locations layers",
    )

    parser.add_argument(
        "--divisoes-name-changes",
        action="store_true",
        help="Must be used if there are names in the names of the divisoes",
    )

    parser.add_argument("--prod", action="store_true", help="Gets data from prod")

    args = parser.parse_args()
    main(args)
