import geopandas
import pandas
from ietl import geopandas_utils, pandas_utils
from ietl.exceptions import IETLError
from ietl.geopandas_utils import get_dataframe_from_file
from populate_cbase_config import RELATIONSHIPS
from populate_cbase_utils import common_df_checks, read_file
from ssh import function_over


Relationship = list[dict[str, str]]


class ADMLocations(object):
    def __init__(self, items, database_conn_strs) -> None:
        self.items = items
        self.database_conn_strs = database_conn_strs
        self.relations = list(RELATIONSHIPS)
        for r in self.relations:
            for i in items:
                if r["table"] == i.table:
                    r["uri"] = i.file

    def __bool__(self):
        return bool(self.items)

    def do_it(self):
        new_locations = get_new_locations(self.relations)
        prod_data = get_prod_data(self.database_conn_strs, bar)
        common_data_locations = extract_common_locations(prod_data)

        locations_joined = common_data_locations.drop_duplicates().merge(
            new_locations.drop(columns="ara").drop_duplicates(),
            on=None,
            how="outer",
            sort=True,
            indicator=True,
            validate="one_to_one",
        )
        not_existent_on_new_locations = locations_joined[
            locations_joined["_merge"] == "left_only"
        ].drop(columns="_merge")

        geom_doesnt_match_adm_loc = get_prod_data(self.database_conn_strs, bar22)

        with pandas.ExcelWriter("foo.xlsx") as writer:
            new_locations.to_excel(writer, sheet_name="Nuevas_Locs")
            prod_data.to_excel(writer, sheet_name="Datos_Produccion")
            common_data_locations.to_excel(
                writer, sheet_name="Datos_Produccion_Locs_Comunes"
            )
            locations_joined.to_excel(
                writer, sheet_name="Comparativa_Nuevas_Viejas_Datos_Prod"
            )
            not_existent_on_new_locations.to_excel(
                writer, sheet_name="Locs_A_Emparejar"
            )
            geom_doesnt_match_adm_loc.to_excel(
                writer, sheet_name="Geoms_DoesntMatch_Adm_Loc"
            )


def get_new_locations(relations: Relationship):
    data = [get_dataframe_from_file(p["uri"]) for p in relations]
    data = [
        df.drop(p["drop_columns"], axis="columns") for df, p in zip(data, relations)
    ]
    # data = [workaround(df) for df in data]

    for df, p in zip(data, relations):
        # if "Provincias" in p["uri"] or "Distritos" in p["uri"]:
        #    continue
        print(p["uri"])  # noqa: WPS421
        common_df_checks(df)
        check_rules(df, p)
    return merge_adm_files(data)


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
    df.ara = df.ara.str.replace("Cento", "Centro")
    df.ara = df.ara.str.replace("ARA-Norte,IP", "ARA-Norte, IP")
    return df


def str_list(field_name, rule_definition, df):
    def any_cond(x):
        trimmed_x = [v.strip() for v in x]
        if trimmed_x != x:
            return True
        set_x = set(trimmed_x)
        if len(set_x) != len(trimmed_x):
            return True
        return not all(v in rule_definition["values"] for v in set_x)

    fff = df[field_name].str.split(rule_definition["separator"])
    if rule_definition["cond"] == "any":
        pandas_utils.check_condition_from_dataframe(
            fff, any_cond, raise_error=True, title="str_list"
        )
    else:
        raise IETLError("Unsupported operation")
    print("all good")


RULE_DEFINITION = {
    "str_list": str_list,
}


def check_rules(df, p):
    for field_name, field_rules in p["rules"].items():
        for rule_name, rule_definition in field_rules.items():
            rule = RULE_DEFINITION[rule_name]
            rule(field_name, rule_definition, df)


def get_dataframe_from_bd(id, conn_str, schema, table, columns):
    """
    Gets a dataframe from a database table.
    """

    sql = f"SELECT gid, {columns[0]} as code, {columns[1]} as provincia, {columns[2]} as distrito, {columns[3]} as posto, {columns[4]} as nucleo, {columns[5]} as enderezo, {columns[6]} IS NOT NULL as has_geom, {columns[7]} as exploracao, {columns[8]} as estado, {columns[9]} as c_licencia, {columns[10]} as lat_long_fontes FROM {schema}.{table};"  # noqa: S608
    if table == "exploracaos":
        sql = f"SELECT gid, {columns[0]} as code, {columns[1]} as provincia, {columns[2]} as distrito, {columns[3]} as posto, {columns[4]} as nucleo, {columns[5]} as enderezo, {columns[6]} IS NOT NULL as has_geom, {columns[7]} as exploracao, {columns[8]} as estado, {columns[9]} as c_licencia, {columns[10]} as lat_long_fontes, the_geom as geom FROM {schema}.{table};"  # noqa: S608
        exps = geopandas_utils.get_dataframe_from_postgresql_query(
            sql,
            conn_str,
        )
        postos = geopandas.read_file(
            "/var/development/sixhiara/Tareas/tarea_2994_actualizar_loc_adm_censo/2202_Postos.shp"
        )
        exps = exps.sjoin(postos, how="left", predicate="intersects")
        exps["geom_provincia"] = exps["loc_provin"]
        exps["geom_distrito"] = exps["loc_distri"]
        exps["geom_posto"] = exps["nome"]
        exps = exps.drop(
            columns=["geom", "ara", "loc_provin", "loc_distri", "nome", "index_right"]
        )
    else:
        exps = pandas_utils.get_dataframe_from_postgresql_query(
            sql,
            conn_str,
        )
    exps["tipo"] = table
    exps["database"] = id

    return exps


def bar22(database):
    query = (
        read_file("sql-functions/create_tmp_tables_geom_doesnt_match_adm_loc.sql")
        + "\nSELECT * FROM tmp_geom_doesnt_match_adm_loc;"
    )
    geom_doesnt_match_adm_loc = pandas_utils.get_dataframe_from_postgresql_query(
        query,
        database[1]["conn_str"],
    )
    geom_doesnt_match_adm_loc["database"] = database[0]

    return geom_doesnt_match_adm_loc


def bar(database):
    exps = get_dataframe_from_bd(
        database[0],
        database[1]["conn_str"],
        "utentes",
        "exploracaos",
        [
            "exp_name",
            "loc_provin",
            "loc_distri",
            "loc_posto",
            "loc_nucleo",
            "loc_endere",
            "the_geom",
            "NULL",
            "estado_lic",
            "c_licencia",
            "(SELECT string_agg(lat_lon, '\n') FROM utentes.fontes f WHERE f.exploracao = exploracaos.gid GROUP BY exploracao)",
        ],
    )
    utentes = get_dataframe_from_bd(
        database[0],
        database[1]["conn_str"],
        "utentes",
        "utentes",
        [
            "nome",
            "loc_provin",
            "loc_distri",
            "loc_posto",
            "loc_nucleo",
            "loc_endere",
            "NULL",
            "(SELECT string_agg(e.loc_provin || ' / ' ||  e.loc_distri || ' / ' || e.loc_posto, ' | ') FROM utentes.exploracaos e WHERE e.utente = utentes.gid GROUP BY utentes.gid)",
            # "(SELECT u.nome, u.loc_provin, u.loc_distri, u.loc_posto, string_agg(e.loc_provin || ' / ' ||  e.loc_distri || ' / ' || e.loc_posto, ' | ') FROM utentes.utentes u JOIN utentes.exploracaos e ON u.gid = e.utente WHERE e.the_geom IS NOT NULL GROUP BY u.nome, u.loc_provin, u.loc_distri, u.loc_posto)",
            "(SELECT string_agg(e.estado_lic, ' | ') FROM utentes.exploracaos e WHERE e.utente = utentes.gid GROUP BY utentes.gid)",
            "NULL",
            "NULL",
        ],
    )

    barragens = get_dataframe_from_bd(
        database[0],
        database[1]["conn_str"],
        "inventario",
        "barragens",
        [
            "cod_barra",
            "provincia",
            "distrito",
            "posto_adm",
            "nucleo",
            "''",
            "geom",
            "NULL",
            "NULL",
            "NULL",
            "NULL",
        ],
    )

    estacoes = get_dataframe_from_bd(
        database[0],
        database[1]["conn_str"],
        "inventario",
        "estacoes",
        [
            "cod_estac",
            "provincia",
            "distrito",
            "posto_adm",
            "nucleo",
            "''",
            "geom",
            "NULL",
            "NULL",
            "NULL",
            "NULL",
        ],
    )

    fontes = get_dataframe_from_bd(
        database[0],
        database[1]["conn_str"],
        "inventario",
        "fontes",
        [
            "cadastro",
            "provincia",
            "distrito",
            "posto_adm",
            "nucleo",
            "''",
            "geom",
            "NULL",
            "NULL",
            "NULL",
            "NULL",
        ],
    )
    return pandas.concat((exps, utentes, barragens, estacoes, fontes))


def get_prod_data(database_conn_strs, callback):
    print("conecting to...")
    print(database_conn_strs)
    result = pandas.concat(
        function_over(database, callback) for database in database_conn_strs.items()
    ).sort_values(by=["provincia", "distrito", "posto", "tipo", "code"])

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


def extract_common_locations(data: pandas.DataFrame) -> pandas.DataFrame:
    columns_to_use = ["provincia", "distrito", "posto"]
    grouped = data.groupby(columns_to_use, as_index=False)
    result = grouped.agg(
        total_elements=("has_geom", "size"),
        without_geom=("has_geom", lambda lst: sum(not x for x in lst)),
    )
    return result.sort_values(by=columns_to_use)
