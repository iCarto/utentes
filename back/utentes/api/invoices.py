from pyramid.view import view_config

from utentes.constants import perms as perm
from utentes.repos.invoice_repo import get_invoices_by_exploracao


@view_config(
    route_name="api_invoices_by_exploracao",
    permission=perm.PERM_FACTURACAO,
    request_method="GET",
    renderer="json",
)
def api_invoices_by_exploracao(request):
    exploracao_pk = int(request.GET.get("exploracao"))
    return get_invoices_by_exploracao(request.db, exploracao_pk)
