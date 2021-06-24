"""Entry point for access all the settings.

This module is the entry point for all access to harcoded settings, mainly obtained from
.ini files or throught enviroment variables.

All settings access must be present in this module as methods to get a semantic way of
getting it.
"""

from pyramid.request import Request
from pyramid.threadlocal import get_current_registry


def get_ara(request: Request = None) -> str:
    """Return the `ARA` value in the .ini files.

    It will be a value of `['ARAN', 'ARAC', 'ARAS']` and it will not include the `-IP`
    suffix.
    """
    if request:
        settings = request.registry.settings
    else:
        settings = get_current_registry().settings

    return settings.get("ara")
