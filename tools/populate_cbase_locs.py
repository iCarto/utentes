from types import MappingProxyType

import geopandas
import pandas
from ietl import geopandas_utils, pandas_utils
from ietl.exceptions import IETLError
from populate_cbase_utils import common_df_checks
from ssh import function_over


Relationship = list[dict[str, str]]


def extract_common_locations(
    data: pandas.DataFrame, columns_to_use
) -> pandas.DataFrame:

    grouped = data.groupby(columns_to_use, as_index=False)
    result = grouped.agg(
        total_elements=("has_geom", "size"),
        without_geom=("has_geom", lambda lst: sum(not x for x in lst)),
    )
    return result.sort_values(by=columns_to_use)


def get_locations_joined(
    common_data_locations: pandas.DataFrame,
    new_locations: pandas.DataFrame,
    drop_ara=True,
):
    if drop_ara:
        _new_locations = new_locations.drop(columns="ara")
    else:
        _new_locations = new_locations.copy()
    return common_data_locations.drop_duplicates().merge(
        _new_locations.drop_duplicates(),
        on=None,
        how="outer",
        sort=True,
        indicator=True,
        validate="one_to_one",
    )


def get_dataframe_from_bd(
    id, conn_str, schema, table, columns, geom_column="geom", workaround_callbacks=None
):
    """
    Gets a dataframe from a database table.
    """

    str_columns = ", ".join(columns)
    if geom_column:
        str_columns += f", {geom_column} as geom"
        get_dataframe_from_postgresql_query = (
            geopandas_utils.get_dataframe_from_postgresql_query
        )
    else:
        get_dataframe_from_postgresql_query = (
            pandas_utils.get_dataframe_from_postgresql_query
        )

    sql = f"SELECT gid, {str_columns} FROM {schema}.{table};"  # noqa: S608
    exps = get_dataframe_from_postgresql_query(
        sql,
        conn_str,
    )
    if workaround_callbacks:
        exps = workaround_callbacks(exps)

    exps = exps.drop(columns=["geom", "the_geom"], errors="ignore")
    exps["tipo"] = table
    exps["database"] = id

    return exps


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


def enum(fieldname, rule_definition, df):
    def my_cond(x):
        trimmed_x = x.strip()
        if trimmed_x != x:
            return True
        return x not in rule_definition["values"]

    pandas_utils.check_condition_from_dataframe(
        df[fieldname], my_cond, raise_error=True, title="enum"
    )


def not_empty(fieldname, rule_definition, df):
    def my_cond(x):
        trimmed_x = x.strip()
        if trimmed_x != x:
            return True
        return x == ""

    pandas_utils.check_condition_from_dataframe(
        df[fieldname], my_cond, raise_error=True, title="not empty"
    )


RULE_DEFINITION = {
    "str_list": str_list,
    "enum": enum,
    "not_empty": not_empty,
}


class Locations(object):
    def __init__(self, items, database_conn_strs) -> None:
        self.items = items
        self.database_conn_strs = database_conn_strs
        self.relations = build_relations(self.items)

    def __bool__(self):
        return bool(self.items)

    def write_analysis(
        self,
        output_file: str,
        new_locations,
        prod_data,
        common_data_locations,
        locations_joined,
        not_existent_on_new_locations,
        geom_doesnt_match_adm_loc,
    ) -> None:
        with pandas.ExcelWriter(output_file) as writer:
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


def build_relations(items):
    relations = list(RELATIONSHIPS)
    for r in relations:
        for i in items:
            if r["table"] == i.table:
                r["uri"] = i.file
    return [r for r in relations if r["uri"]]


def get_new_locations(relations: Relationship, callback):
    # print("get_new_locations", relations)

    data = [geopandas_utils.get_dataframe_from_file(p["uri"]) for p in relations]
    data = [
        df.drop(p["drop_columns"], axis="columns") for df, p in zip(data, relations)
    ]
    # data = [workaround(df) for df in data]

    for df, p in zip(data, relations):
        # if "Provincias" in p["uri"] or "Distritos" in p["uri"]:
        #    continue
        common_df_checks(df)
        check_rules(df, p)
    return callback(data)


def check_rules(df, p):
    for field_name, field_rules in p["rules"].items():
        for rule_name, rule_definition in field_rules.items():
            rule = RULE_DEFINITION[rule_name]
            rule(field_name, rule_definition, df)


# TODO: Check this list against the database
ADM_LOC_CBASE_TABLES = (
    "provincias",
    "distritos",
    "postos",
)

DOMAIN_ARAS = ("ARA-Norte, IP", "ARA-Sul, IP", "ARA-Centro, IP")
DOMAIN_DIVISOES = (
    "DGBB",
    "DGBI",
    "DGBL",
    "DGBLIC",
    "DGBM",
    "DGBP",
    "DGBR",
    "DGBS",
    "DGBUM",
    "DGBZ",
)

HYDRO_LOC_CBASE_TABLES = ("divisoes", "bacias", "subacias")

CBASE_TABLES = (
    (
        "aras",
        "bacias_representacion",
        "entidades_populacao",
        "lagos",
        "estradas",
        "oceanos",
        "rios",
        "paises_limitrofes",
        "albufeiras",
        "batimetria",
    )
    + HYDRO_LOC_CBASE_TABLES
    + ADM_LOC_CBASE_TABLES
)


RULES = MappingProxyType(
    {
        "ara": {
            "str_list": {
                "values": DOMAIN_ARAS,
                "separator": "; ",
                "cond": "any",  # cualquiera de la lista. all todos, ... en ningún caso se admite uno que no esté
            }
        }
    }
)


RELATIONSHIPS = (
    {
        "table": "provincias",
        "uri": "",  # "FOLDER_PATH/2201_Provincias.shp",
        "key": "nome",
        "parent": None,
        "drop_columns": ["geometry"],
        "rules": RULES,
    },
    {
        "table": "distritos",
        "uri": "",
        "key": "nome",
        "parent": ["loc_provin"],
        "drop_columns": ["geometry"],
        "rules": RULES,
    },
    {
        "table": "postos",
        "uri": "",
        "key": "nome",
        "parent": ["loc_provin", "loc_distri"],
        "drop_columns": ["geometry"],
        "rules": RULES,
    },
    {
        "table": "bacias_representacion",
        "uri": "",
        "key": "nome",
        "parent": None,
        "drop_columns": ["geometry"],
        "rules": MappingProxyType({"nome": {"not_empty": {}}}),
    },
    {
        "table": "aras",
        "uri": "",
        "key": "nome",
        "parent": None,
        "drop_columns": ["geometry"],
        "rules": MappingProxyType(
            {
                "nome": {
                    "enum": {
                        "values": DOMAIN_ARAS,
                    }
                }
            }
        ),
    },
    {
        "table": "divisoes",
        "uri": "",
        "key": "siglas",
        "parent": None,
        "drop_columns": ["geometry"],
        "rules": MappingProxyType(
            {
                "nome": {"not_empty": {}},
                "siglas": {
                    "enum": {
                        "values": DOMAIN_DIVISOES,
                    }
                },
                "ara": {
                    "enum": {
                        "values": DOMAIN_ARAS,
                    }
                },
            },
        ),
    },
    {
        "table": "bacias",
        "uri": "",
        "key": "nome",
        "parent": ["siglas"],
        "drop_columns": ["geometry"],
        "rules": MappingProxyType(
            {
                "nome": {"not_empty": {}},
                "divisao": {
                    "enum": {
                        "values": DOMAIN_DIVISOES,
                    }
                },
                "ara": {
                    "enum": {
                        "values": DOMAIN_ARAS,
                    }
                },
            },
        ),
    },
    {
        "table": "subacias",
        "uri": "",
        "key": "nome",
        "parent": ["divisao", "bacia"],
        "drop_columns": ["geometry"],
        "rules": MappingProxyType(
            {
                "nome": {"not_empty": {}},
                "bacia": {"not_empty": {}},
                "divisao": {
                    "enum": {
                        "values": DOMAIN_DIVISOES,
                    }
                },
                "ara": {
                    "enum": {
                        "values": DOMAIN_ARAS,
                    }
                },
            },
        ),
    },
)


def get_prod_data(
    database_conn_strs, callback, sort_values_by, callback_mark_issues=None
):
    print("conecting to...", database_conn_strs)
    _result = [
        function_over(database, callback) for database in database_conn_strs.items()
    ]
    result = pandas.concat(_result).sort_values(by=sort_values_by)

    if callback_mark_issues:
        result = callback_mark_issues(result)
    return result
