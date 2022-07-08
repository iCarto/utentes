from typing import TextIO


def workaround_after_append_cbase_sql_data1(f: TextIO):
    f.write(  # noqa: WPS462
        """
    UPDATE cbase.oceanos SET ara = replace(ara, 'ARA-Norte,IP', 'ARA-Norte, IP');
    UPDATE cbase.batimetria SET ara = replace(ara, 'ARA-Norte,IP', 'ARA-Norte, IP');
    UPDATE cbase.paises_limitrofes SET ara = replace(ara, 'ARA-Norte,IP', 'ARA-Norte, IP');
    """
    )  # noqa: WPS355


def workaround(f: TextIO):
    """
    Nothing to do now
    """
    # workaround_after_append_cbase_sql_data1(f)
