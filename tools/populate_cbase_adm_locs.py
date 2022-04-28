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


SORT_VALUES_BY = ["provincia", "distrito", "posto", "tipo", "code"]


class ADMLocations(Locations):
    def do_it(self):
        if not self.items:
            print("No ADMLocations. Skipping")
            return
        new_locations = get_new_locations(self.relations, merge_adm_files)
        prod_data = get_prod_data(
            self.database_conn_strs,
            bar,
            SORT_VALUES_BY,
            callback_mark_issues_postos,
        )
        common_data_locations = extract_common_locations(
            prod_data, columns_to_use=["provincia", "distrito", "posto"]
        )

        locations_joined = get_locations_joined(common_data_locations, new_locations)
        not_existent_on_new_locations = locations_joined[
            locations_joined["_merge"] == "left_only"
        ].drop(columns="_merge")

        geom_doesnt_match_adm_loc = get_prod_data(
            self.database_conn_strs,
            get_geom_doesnt_match_adm_loc,
            SORT_VALUES_BY,
            callback_mark_issues_postos,
        )

        self.write_analysis(
            "analysis_populate_adm.xlsx",
            new_locations,
            prod_data,
            common_data_locations,
            locations_joined,
            not_existent_on_new_locations,
            geom_doesnt_match_adm_loc,
        )


def merge_adm_files(data):
    left = data[0]
    right = data[1]
    # revisar sort
    result = left.merge(
        right,
        how="outer",
        left_on="nome",
        right_on="loc_provin",
        sort=False,
        indicator=True,
        validate="one_to_many",
    )

    left = result
    right = data[2]
    result = left.merge(
        right,
        how="outer",
        # left_on="loc_provin", nome_y
        left_on=["nome_x", "nome_y"],
        right_on=["loc_provin", "loc_distri"],
        sort=False,
        indicator="_merge2",
        validate="one_to_many",
    )

    result = result[["nome_x", "nome_y", "nome", "ara"]].rename(
        columns={"nome_x": "provincia", "nome_y": "distrito", "nome": "posto"}
    )
    return result.sort_values(by=["provincia", "distrito", "posto"])


def workaround(df):
    # df.ara = df.ara.str.replace("Cento", "Centro")
    # df.ara = df.ara.str.replace("ARA-Norte,IP", "ARA-Norte, IP")
    return df


def exploracaos_workaround_callback_get_dataframe_from_bd(exps):
    postos = geopandas.read_file("PATH_TO_POSTOS")
    exps = exps.sjoin(postos, how="left", predicate="intersects")
    exps["geom_provincia"] = exps["loc_provin"]
    exps["geom_distrito"] = exps["loc_distri"]
    exps["geom_posto"] = exps["nome"]
    exps = exps.drop(columns=["ara", "loc_provin", "loc_distri", "nome", "index_right"])
    return exps


def get_geom_doesnt_match_adm_loc(database_metadata):
    query = (
        read_file("sql-functions/create_tmp_tables_geom_doesnt_match_adm_loc.sql")
        + "\nSELECT * FROM tmp_geom_doesnt_match_adm_loc;"
    )
    return basic_query(database_metadata, query)


def bar(database):
    exps = get_dataframe_from_bd(
        database[0],
        database[1]["conn_str"],
        "utentes",
        "exploracaos",
        [
            "exp_name as code",
            "loc_provin as provincia",
            "loc_distri as distrito",
            "loc_posto as posto",
            "loc_nucleo as nucleo",
            "loc_endere as enderezo",
            "the_geom IS NOT NULL as has_geom",
            "estado_lic as estado",
            "c_licencia as c_licencia",
            "(SELECT string_agg(lat_lon, '\n') FROM utentes.fontes f WHERE f.exploracao = exploracaos.gid GROUP BY exploracao) as lat_long_fontes",
        ],
        "the_geom",
        exploracaos_workaround_callback_get_dataframe_from_bd,
    )
    utentes = get_dataframe_from_bd(
        database[0],
        database[1]["conn_str"],
        "utentes",
        "utentes",
        [
            "nome as code",
            "loc_provin as provincia",
            "loc_distri as distrito",
            "loc_posto as posto",
            "loc_nucleo as nucleo",
            "loc_endere as enderezo",
            "false as has_geom",
            "(SELECT string_agg(e.loc_provin || ' / ' ||  e.loc_distri || ' / ' || e.loc_posto, ' | ') FROM utentes.exploracaos e WHERE e.utente = utentes.gid GROUP BY utentes.gid) as exploracao",
            "(SELECT string_agg(e.estado_lic, ' | ') FROM utentes.exploracaos e WHERE e.utente = utentes.gid GROUP BY utentes.gid) as estado",
        ],
        None,
    )

    barragens = get_dataframe_from_bd(
        database[0],
        database[1]["conn_str"],
        "inventario",
        "barragens",
        [
            "cod_barra as code",
            "provincia as provincia",
            "distrito as distrito",
            "posto_adm as posto",
            "nucleo as nucleo",
            "geom IS NOT NULL as has_geom",
        ],
    )

    estacoes = get_dataframe_from_bd(
        database[0],
        database[1]["conn_str"],
        "inventario",
        "estacoes",
        [
            "cod_estac as code",
            "provincia as provincia",
            "distrito as distrito",
            "posto_adm as posto",
            "nucleo as nucleo",
            "geom IS NOT NULL as has_geom",
        ],
    )

    fontes = get_dataframe_from_bd(
        database[0],
        database[1]["conn_str"],
        "inventario",
        "fontes",
        [
            "cadastro as code",
            "provincia as provincia",
            "distrito as distrito",
            "posto_adm as posto",
            "nucleo as nucleo",
            "geom IS NOT NULL as has_geom",
        ],
    )
    return pandas.concat((exps, utentes, barragens, estacoes, fontes))


def callback_mark_issues_postos(result):
    # Hack para marcarlas
    postos_problematicos = (
        "Olumbi",
        "Chigubo",
        "Cidade De Xai-Xai",
        "Zongoene",
        "Cidade De Chimoio",
        "Cidade De Maputo",
        "Palmeira",
        "Cidade De Nampula",
        "Nacala",
        "Cidade De Lichinga",
        "Cidade Da Beira",
        "Dondo",
        "Kachembe",
        "Cidade De Quelimane",
        "Mulevala",
        "Molumbo",
    )
    result["problematica"] = result.apply(
        lambda row: "x" if row["posto"] in postos_problematicos else "", axis=1
    )
    result["new_provincia"] = ""
    result["new_distrito"] = ""
    result["new_posto"] = ""
    return result
