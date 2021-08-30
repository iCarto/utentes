from users.user_roles import GROUPS_TO_ROLES


def group_to_roles(ara):
    """Allows customize the mapping between groups and roles for different ARAs.

    Example:
        An example of how customize the mapping::

            base_group_to_roles = dict(GROUPS_TO_ROLES)
            if ara == "ARAS":
                base_group_to_roles[JURIDICO] = [
                    JURIDICO,
                    DIRECCION,
                ]
    """
    return dict(GROUPS_TO_ROLES)


# This must be improved
# https://stackoverflow.com/questions/29587224 read this
# https://stackoverflow.com/questions/30784341
# https://stackoverflow.com/questions/29258175
# https://stackoverflow.com/questions/27492574
# https://stackoverflow.com/questions/58775524
def adjust_settings(settings):
    """Mofifies the settings in place to customize for different ARAs."""
    settings["ara_app_name"] = {
        "ARAN": "SIRHAN: Utentes",
        "ARAC": "SIRHAC: Utentes",
        "ARAS": "SIRHAS: Utentes",
    }[settings["ara"]]
