from pyramid.view import view_config

from utentes.constants import perms as perm
from utentes.models.constants import THREE_DAYS_IN_SECONDS
from utentes.models.estado_renovacao import EstadoRenovacao


@view_config(
    route_name="api_domains_licencia_estado_renovacao",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
    http_cache=THREE_DAYS_IN_SECONDS,
)
def domains_licencia_estado_renovacao_get(request):
    return (
        request.db.query(EstadoRenovacao)
        .order_by(
            EstadoRenovacao.category, EstadoRenovacao.ordering, EstadoRenovacao.key
        )
        .all()
    )
