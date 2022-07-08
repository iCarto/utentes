import os

from ietl import pandas_utils


def common_df_checks(df):
    pandas_utils.check_not_duplicated_headers(df)
    pandas_utils.check_spaces_from_headers(df)
    pandas_utils.check_spaces_from_dataframe(df)
    pandas_utils.check_not_na(df)
    # pandas_utils.print_number_of_na_per_column(df)
    # get_na_column_names
    # get_na_columns
    # check_condition_from_dataframe


def common_df_fixes(df):
    df = pandas_utils.strip_from_dataframe(df)
    return pandas_utils.strip_from_headers(df)


def path_for_file(relpath: str) -> str:
    this_file_dir = os.path.dirname(__file__)
    return os.path.join(this_file_dir, relpath)


def read_file(filepath: str) -> str:
    with open(path_for_file(filepath)) as f:
        return f.read()
