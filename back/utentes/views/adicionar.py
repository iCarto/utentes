from pyramid.httpexceptions import HTTPTemporaryRedirect
from pyramid.view import view_config, view_defaults

from utentes.constants import perms as perm
from utentes.models.constants import (
    K_DE_FACTO,
    K_INCOMPLETE_DT,
    K_PENDING_FIELD_VISIT,
    K_USOS_COMUNS,
)
from utentes.services.exp_service import get_license_state


@view_defaults(renderer="utentes:templates/exploracao-new.jinja2")
class Adicionar(object):
    def __init__(self, request):
        self.request = request

    @view_config(
        route_name="adicionar_ficha",
        permission=perm.PERM_CREATE_EXPLORACAO,
    )
    def adicionar_ficha(self):
        ensure_exp_is_in_correct_state(self.request)
        return {}

    @view_config(
        route_name="adicionar_usos_comuns",
        permission=perm.PERM_PAGE_ADICIONAR_USOS_COMUNS,
    )
    def adicionar_usos_comuns(self):
        return {"next_state": K_USOS_COMUNS}

    @view_config(
        route_name="adicionar_utente_facto",
        permission=perm.PERM_PAGE_ADICIONAR_UTENTE_FACTO,
    )
    def adicionar_utente_facto(self):
        return {"next_state": K_DE_FACTO}


def ensure_exp_is_in_correct_state(request):
    # Commonly it happens pressing back button after visit this page
    gid = request.GET.get("id")
    estado_lic = get_license_state(request, gid)
    if estado_lic not in [K_PENDING_FIELD_VISIT, K_INCOMPLETE_DT]:
        url = request.route_url("exploracao-show", _query={"id": gid})
        raise HTTPTemporaryRedirect(location=url)
