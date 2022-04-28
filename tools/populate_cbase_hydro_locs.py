from codecs import ignore_errors

import geopandas
import pandas
from basic_query import basic_query
from ietl import geopandas_utils, pandas_utils
from populate_cbase_locs import (
    Locations,
    extract_common_locations,
    get_dataframe_from_bd,
    get_locations_joined,
    get_new_locations,
    get_prod_data,
)
from populate_cbase_utils import read_file


SORT_VALUES_BY = ["divisao", "bacia", "subacia", "tipo", "code"]


class HydroLocations(Locations):
    def do_it(self):
        if not self.items:
            print("No HydroLocations. Skipping")
            return
        new_locations = get_new_locations(self.relations, merge_hydro_files)
        prod_data = get_prod_data(
            self.database_conn_strs,
            bar,
            SORT_VALUES_BY,
            callback_mark_issues_subacias,
        )
        common_data_locations = extract_common_locations(
            prod_data, columns_to_use=["ara", "divisao", "bacia", "subacia"]
        )
        locations_joined = get_locations_joined(
            common_data_locations, new_locations, drop_ara=False
        )

        not_existent_on_new_locations = locations_joined[
            locations_joined["_merge"] == "left_only"
        ].drop(columns="_merge")

        geom_doesnt_match_adm_loc = get_prod_data(
            self.database_conn_strs,
            get_geom_doesnt_match_hydro_loc,
            SORT_VALUES_BY,
            # callback_mark_issues_subacias,
        )
        self.write_analysis(
            "analysis_populate_hydro.xlsx",
            new_locations,
            prod_data,
            common_data_locations,
            locations_joined,
            not_existent_on_new_locations,
            geom_doesnt_match_adm_loc,
        )


def merge_hydro_files(data):
    left = data[0]  # divisoes
    right = data[1]  # bacias
    # revisar sort
    result = left.merge(
        right,
        how="outer",
        left_on=["ara", "siglas"],
        right_on=["ara", "divisao"],
        sort=False,
        indicator=True,
        validate="one_to_many",
    )
    result.to_excel("/tmp/foo.xlsx")
    left = result
    right = data[2]  # subacias
    result = left.merge(
        right,
        how="outer",
        left_on=["ara", "siglas", "nome_y"],
        right_on=["ara", "divisao", "bacia"],
        sort=False,
        indicator="_merge2",
        # validate="one_to_many", Sen identificar se repite
    )

    result = result[["ara", "siglas", "nome_y", "nome"]].rename(
        columns={"siglas": "divisao", "nome_y": "bacia", "nome": "subacia"}
    )
    return result.sort_values(by=["ara", "divisao", "bacia", "subacia"])


def exploracaos_workaround_callback_get_dataframe_from_bd(exps):
    subacias = geopandas.read_file(
        "/var/development/sixhiara/Tareas/tarea_2994_actualizar_bacias/05_BD_Unica_ARAsIP_Cbase/01_Hidrologia/2204_Subacias.shp"
    )
    exps = exps.sjoin(subacias, how="left", predicate="intersects")

    if "divisao_right" in exps.columns:
        exps["geom_divisao"] = exps["divisao_right"]
    else:
        exps["geom_divisao"] = None

    exps["geom_bacia"] = exps["bacia_right"]
    exps["geom_subacia"] = exps["nome"]
    exps = exps.drop(
        columns=[
            "ara_right",
            "rio_prin",
            "long_rio",
            "afluentes",
            "index_right",
            "area",
            "nome",
            "divisao_right",
            "bacia_right",
        ],
        errors="ignore",
    )
    exps = exps.rename(
        columns={"ara_left": "ara", "divisao_left": "divisao", "bacia_left": "bacia"}
    )
    return exps


def get_geom_doesnt_match_hydro_loc(database_metadata):
    query = (
        read_file("sql-functions/create_tmp_tables_geom_doesnt_match_hydro_loc.sql")
        + "\nSELECT * FROM tmp_geom_doesnt_match_hydro_loc;"
    )
    return basic_query(database_metadata, query)


def bar(database):
    exps = get_dataframe_from_bd(
        database[0],
        database[1]["conn_str"],
        "utentes",
        "exploracaos",
        [
            f"'ARA-{database[0].capitalize()}, IP' as ara",
            "exp_name as code",
            "loc_divisao as divisao",
            "loc_bacia as bacia",
            "loc_subaci as subacia",
            "the_geom IS NOT NULL as has_geom",
            "estado_lic as estado",
            "c_licencia as c_licencia",
            "(SELECT string_agg(lat_lon, '\n') FROM utentes.fontes f WHERE f.exploracao = exploracaos.gid GROUP BY exploracao) as lat_long_fontes",
        ],
        "the_geom",
        exploracaos_workaround_callback_get_dataframe_from_bd,
    )

    barragens = get_dataframe_from_bd(
        database[0],
        database[1]["conn_str"],
        "inventario",
        "barragens",
        [
            f"'ARA-{database[0].capitalize()}, IP' as ara",
            "cod_barra as code",
            "bacia as bacia",
            "subacia as subacia",
            "geom IS NOT NULL as has_geom",
        ],
        "geom",
        exploracaos_workaround_callback_get_dataframe_from_bd,
    )

    estacoes = get_dataframe_from_bd(
        database[0],
        database[1]["conn_str"],
        "inventario",
        "estacoes",
        [
            f"'ARA-{database[0].capitalize()}, IP' as ara",
            "cod_estac as code",
            "bacia as bacia",
            "subacia as subacia",
            "geom IS NOT NULL as has_geom",
        ],
        "geom",
        exploracaos_workaround_callback_get_dataframe_from_bd,
    )

    fontes = get_dataframe_from_bd(
        database[0],
        database[1]["conn_str"],
        "inventario",
        "fontes",
        [
            f"'ARA-{database[0].capitalize()}, IP' as ara",
            "cadastro as code",
            "loc_divisao as divisao",
            "bacia as bacia",
            "subacia as subacia",
            "geom IS NOT NULL as has_geom",
        ],
        "geom",
        exploracaos_workaround_callback_get_dataframe_from_bd,
    )
    return pandas.concat((exps, barragens, estacoes, fontes))


def callback_mark_issues_subacias(result):
    # Hack para marcarlas
    subacias_problematicas = (
        "Gorongozi",
        # "Lurio",
        # "Licungo",
        "Meluli",
        # "Mogincual",
        "Molocue",
        # "Monapo",
        # "Megaruma",
        # "Messalo",
        # "Montepuez",
        # "Rovuma",
        "Incomati",
        # "Sabie",
        # "Limpopo",
        # "Maputo"
        "Inharrime",
        # "Save",
        # "Tembe",
        "Impaputo",
        "Umbelúzi",
    )

    result["problematica"] = result.apply(
        lambda row: "x" if row["subacia"] in subacias_problematicas else "", axis=1
    )
    result["new_divisao"] = ""
    result["new_bacia"] = ""
    result["new_subacia"] = ""
    return result
