from users.user_roles import ADMINISTRATIVO, DIRECCION, GROUPS_TO_ROLES, JURIDICO


def group_to_roles(ara):
    base_group_to_roles = dict(GROUPS_TO_ROLES)
    if ara == "ARAS":
        base_group_to_roles[JURIDICO] = [
            JURIDICO,
            DIRECCION,
        ]
    else:
        base_group_to_roles[JURIDICO] = [
            JURIDICO,
            DIRECCION,
            ADMINISTRATIVO,
        ]

    return base_group_to_roles


# This must be improved
# https://stackoverflow.com/questions/29587224 read this
# https://stackoverflow.com/questions/30784341
# https://stackoverflow.com/questions/29258175
# https://stackoverflow.com/questions/27492574
# https://stackoverflow.com/questions/58775524
def adjust_settings(settings):
    """
    Mofifies dict settings in place to set values that can be derived from
    the .ini files
    """
    settings["ara_app_name"] = {
        "ARAN": "SIRHAN: Utentes",
        "ARAC": "SIRHAC: Utentes",
        "ARAS": "SIRHAS: Utentes",
    }[settings["ara"]]
