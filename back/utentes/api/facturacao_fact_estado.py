from pyramid.view import view_config

from utentes.constants import perms as perm
from utentes.models.facturacao_fact_estado import FacturacaoFactEstado


@view_config(
    route_name="api_domains_facturacao_fact_estado",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
def domains_facturacao_fact_estado(request):
    return (
        request.db.query(FacturacaoFactEstado)
        .order_by(
            FacturacaoFactEstado.category,
            FacturacaoFactEstado.ordering,
            FacturacaoFactEstado.key,
        )
        .all()
    )
