#!/usr/bin/env python

import argparse
import os
import tempfile
from typing import List, TextIO

import geopandas as gpd
from ietl import pandas_utils, rewrite_shp2pgsql_output
from ietl.find_file import find_all_by_pattern
from ietl.shp import calculate_encoding


class SIRHAError(Exception):
    """Base class for the exceptions of this module."""


# TODO: Check this list against the database
cbase_tables = [
    "aras",
    "bacias",
    "distritos",
    "entidades_populacao",
    "lagos",
    "estradas",
    "oceanos",
    "rios",
    "paises_limitrofes",
    "provincias",
    "postos",
    "albufeiras",
    "bacias_representacion",
    "batimetria",
    "unidades",
]
cbase_ara_tables = [
    "entidades_populacao",
    "rios",
    "bacias",
    "unidades_weap",
    "unidades",
    "postos",
    "oceanos",
    "provincias",
    "estradas",
    "lagos",
    "aras",
    "batimetria",
    "bacias_representacion",
    "albufeiras",
    "distritos",
    "paises_limitrofes",
    "provincias_outras",
]

OUTPUT_FILE = os.path.join(tempfile.gettempdir(), "salida.sql")
TMP_OUTPUT_FILE = os.path.join(tempfile.gettempdir(), "foo.sql")
TMP_CBASE_SQL = os.path.join(tempfile.gettempdir(), "foo_cbase.sql")

EPSG = 32737


def path_for_file(relpath: str) -> str:
    this_file_dir = os.path.dirname(__file__)
    return os.path.join(this_file_dir, relpath)


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


def build_insert_into_cbase_ara():
    filepath = path_for_file("sql-functions/insert_cbase_into_cbase_ara.sql")
    with open(filepath) as f:
        return f.read()


def build_fill_domains_from_cbase():
    filepath = path_for_file("sql-functions/fill_domains_from_cbase.sql")
    with open(filepath) as f:
        return f.read()


def build_rename_fact_codes_for_new_divisoes():
    """
    If the names of the divisoes/unidades changes, the codes used in facturacao,
    probably should be also changed
    """
    return """
    WITH to_update AS (
        SELECT
            f.gid as f_gid
            , e.gid e_gid
            , e.loc_unidad
            , f.fact_id
            , f.recibo_id
            , left(f.fact_id, 5) || e.loc_unidad || right(f.fact_id, 5) as new_fact_id
            , left(f.recibo_id, 5) || e.loc_unidad || right(f.recibo_id, 5) as new_recibo_id
        FROM
            utentes.exploracaos e
        JOIN
            utentes.facturacao f on e.gid = f.exploracao
    )
    UPDATE utentes.facturacao SET
        fact_id = to_update.new_fact_id
        , recibo_id = to_update.new_recibo_id
    FROM to_update
    WHERE gid = to_update.f_gid
    ;
    """


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


def dump_shp_to_sql(shp: str, table: str):
    encoding = calculate_encoding.main(shp)
    df = gpd.read_file(shp, encoding=encoding)
    df.drop(columns="gid", inplace=True, errors="ignore")

    # Temp Woraround
    df.rename(columns={"divisao": "unidade"}, inplace=True, errors="ignore")

    pandas_utils.check_not_duplicated_columns_names(df)
    pandas_utils.check_spaces_from_dataframe(df)
    df = pandas_utils.strip_from_dataframe(df)

    pandas_utils.strip_from_headers(df)
    # pandas_utils.print_number_of_na_per_column(df)
    # get_na_column_names
    # get_na_columns
    # check_condition_from_dataframe

    # https://github.com/geopandas/geopandas/pull/1955
    # and a couple of issues more
    df.crs = f"EPSG:{EPSG}"
    new_shp = os.path.join(tempfile.gettempdir(), os.path.basename(shp))
    df.to_file(new_shp, encoding=encoding)
    execute_shp2pgsql(encoding, new_shp, table)


def dump_cbase_shps_to_sql(shp_files: List[str]):
    with open(TMP_CBASE_SQL, "w") as f:
        f.write("-- temp cbase data file\n")

    for table in cbase_tables:
        print(table)  # noqa: WPS421
        shp = look_for_file(shp_files, table)
        dump_shp_to_sql(shp, table)


def workaround(f: TextIO):
    f.write(  # noqa: WPS462
        """
    UPDATE cbase.oceanos SET ara = replace(ara, 'ARA-Norte,IP', 'ARA-Norte, IP');
    UPDATE cbase.batimetria SET ara = replace(ara, 'ARA-Norte,IP', 'ARA-Norte, IP');
    UPDATE cbase.paises_limitrofes SET ara = replace(ara, 'ARA-Norte,IP', 'ARA-Norte, IP');
    """
    )  # noqa: WPS355


def write_tmp_output_file():
    with open(TMP_OUTPUT_FILE, "w") as f:
        f.write("BEGIN;\n\n")

        f.write(build_delete_queries("cbase", cbase_tables))
        f.write(build_delete_queries("cbase_ara", cbase_ara_tables))
        f.write(build_restart_gid_queries("cbase", cbase_tables))

        f.write("\n\n")

        with open(TMP_CBASE_SQL) as cbase_sql_file:
            for line in cbase_sql_file:
                f.write(line)
        f.write("\n\n")

        workaround(f)

        f.write(build_insert_into_cbase_ara())
        f.write(build_fill_domains_from_cbase())
        f.write(build_rename_fact_codes_for_new_divisoes())

        f.write("\n\nCOMMIT;\n")


def main(args):
    shp_files = find_all_by_pattern("*.shp", args.shp_folder_path)
    if len(shp_files) != len(cbase_tables):
        raise SIRHAError("El número de ficheros no coincide con el esperado")

    dump_cbase_shps_to_sql(shp_files)
    write_tmp_output_file()

    rewrite_shp2pgsql_output.data(TMP_OUTPUT_FILE, OUTPUT_FILE)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Populate schema cbase")
    parser.add_argument(
        "shp_folder_path", help="Path to the folder containing the shp files"
    )

    args = parser.parse_args()
    main(args)
