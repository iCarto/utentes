from pyramid.view import view_config

from utentes.constants import perms as perm
from utentes.models.constants import K_USOS_COMUNS
from utentes.services.exp_service import get_license_state


@view_config(
    route_name="exploracao-search",
    permission=perm.PERM_GET,
    renderer="utentes:templates/exploracao-search.jinja2",
)
def exploracao_search(request):
    return {}


@view_config(
    route_name="exploracao-show",
    permission=perm.PERM_GET,
    renderer="utentes:templates/exploracao-show.jinja2",
)
def exploracao_show(request):
    gid = request.GET.get("id")
    estado_lic = get_license_state(request, gid)
    return {
        "next_state": estado_lic,
        "d_soli_label": "Data de cadastramento"
        if estado_lic == K_USOS_COMUNS
        else "Data de solicitação",
    }


@view_config(
    route_name="facturacao",
    permission=perm.PERM_FACTURACAO,
    renderer="utentes:templates/facturacao.jinja2",
)
def facturacao(request):
    return {}


@view_config(
    route_name="requerimento-new",
    permission=perm.PERM_CREATE_REQUERIMENTO,
    renderer="utentes:templates/requerimento-new.jinja2",
)
def requerimento_new(request):
    return {}


@view_config(
    route_name="requerimento-pendente",
    permission=perm.PERM_REQUERIMENTO,
    renderer="utentes:templates/requerimento-pendente.jinja2",
)
def requerimento_pendente(request):
    return {}


@view_config(
    route_name="renovacao",
    permission=perm.PERM_RENOVACAO,
    renderer="utentes:templates/renovacao.jinja2",
)
def renovacao(request):
    return {}


@view_config(
    route_name="utentes",
    permission=perm.PERM_GET,
    renderer="utentes:templates/utentes.jinja2",
)
def utentes(request):
    return {}


@view_config(
    route_name="facturacao-stats",
    permission=perm.PERM_GET,
    renderer="utentes:templates/facturacao-stats.jinja2",
)
def facturacao_stats(request):
    return {}
