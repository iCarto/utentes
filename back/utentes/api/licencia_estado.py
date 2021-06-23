from pyramid.view import view_config

from utentes.constants import perms as perm
from utentes.models.estado import Estado


@view_config(
    route_name="api_domains_licencia_estado",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
def domains_licencia_estado_get(request):
    ara = {
        "ARAN": "Norte",
        "ARAS": "Sul",
        "ARAZ": "Zambeze",
        "ARAC": "Centro",
        "ARACN": "Centro-Norte",
    }[request.registry.settings.get("ara")]
    return (
        request.db.query(Estado)
        .filter(Estado.app.any(ara))
        .order_by(Estado.category, Estado.ordering, Estado.key)
        .all()
    )
