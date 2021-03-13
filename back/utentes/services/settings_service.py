from pyramid.threadlocal import get_current_registry


def get_ara(request=None):
    if request:
        settings = request.registry.settings
    else:
        settings = get_current_registry().settings

    return settings.get("ara")
