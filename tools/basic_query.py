from ietl import pandas_utils


def basic_query(database_metadata, query):
    database_id = database_metadata[0]
    database_conn_str = database_metadata[1]["conn_str"]

    result = pandas_utils.get_dataframe_from_postgresql_query(
        query,
        database_conn_str,
    )
    result["database_id"] = database_id

    return result
