from pyramid.security import Allow, Authenticated
from pyramid.settings import asbool

from users import user_groups, user_roles
from utentes.constants import perms as perm
from utentes.models.user import User
from utentes.repos.user_repo import get_user_by_username
from utentes.services.settings_service import get_ara
from utentes.tenant_custom_code import group_to_roles


class RootFactory(object):
    __acl__ = [
        (Allow, Authenticated, perm.PERM_GET),
        (
            Allow,
            user_roles.ADMIN,
            (
                perm.PERM_ADMIN,
                perm.PERM_UTENTES,
                perm.PERM_CREATE_EXPLORACAO,
                perm.PERM_UPDATE_EXPLORACAO,
                perm.PERM_FACTURACAO,
                perm.PERM_UPDATE_CREATE_FACTURACAO,
                perm.PERM_UPDATE_CULTIVO_TANQUE,
                perm.PERM_REQUERIMENTO,
                perm.PERM_CREATE_REQUERIMENTO,
                perm.PERM_UPDATE_REQUERIMENTO,
                perm.PERM_CREATE_DOCUMENTO,
                perm.PERM_DELETE_DOCUMENTO,
                perm.PERM_RENOVACAO,
                perm.PERM_UPDATE_RENOVACAO,
                perm.PERM_EM_PROCESSO,
                perm.PERM_NEW_INVOICE_CYCLE,
                perm.PERM_GET_USAGE_COMMON,
                perm.PERM_CREATE_USAGE_COMMON,
                perm.PERM_PAGE_ADICIONAR_UTENTE_FACTO,
                perm.PERM_PAGE_ADICIONAR_USOS_COMUNS,
            ),
        ),
        (
            Allow,
            user_roles.ADMINISTRATIVO,
            (
                perm.PERM_REQUERIMENTO,
                perm.PERM_CREATE_REQUERIMENTO,
                perm.PERM_UPDATE_REQUERIMENTO,
                perm.PERM_CREATE_EXPLORACAO,
                perm.PERM_UPDATE_EXPLORACAO,
                perm.PERM_CREATE_DOCUMENTO,
                perm.PERM_DELETE_DOCUMENTO,
                perm.PERM_RENOVACAO,
                perm.PERM_UPDATE_RENOVACAO,
                perm.PERM_EM_PROCESSO,
            ),
        ),
        (
            Allow,
            user_roles.FINANCIERO,
            (
                perm.PERM_FACTURACAO,
                perm.PERM_UPDATE_CREATE_FACTURACAO,
                perm.PERM_CREATE_DOCUMENTO,
                perm.PERM_DELETE_DOCUMENTO,
                perm.PERM_EM_PROCESSO,
            ),
        ),
        (
            Allow,
            user_roles.DIRECCION,
            (
                perm.PERM_REQUERIMENTO,
                perm.PERM_UPDATE_REQUERIMENTO,
                perm.PERM_RENOVACAO,
                perm.PERM_UPDATE_RENOVACAO,
                perm.PERM_EM_PROCESSO,
            ),
        ),
        (
            Allow,
            user_roles.TECNICO,
            (
                perm.PERM_UTENTES,
                perm.PERM_CREATE_EXPLORACAO,
                perm.PERM_UPDATE_EXPLORACAO,
                perm.PERM_FACTURACAO,
                perm.PERM_UPDATE_CREATE_FACTURACAO,
                perm.PERM_UPDATE_CULTIVO_TANQUE,
                perm.PERM_REQUERIMENTO,
                perm.PERM_UPDATE_REQUERIMENTO,
                perm.PERM_CREATE_DOCUMENTO,
                perm.PERM_DELETE_DOCUMENTO,
                perm.PERM_RENOVACAO,
                perm.PERM_UPDATE_RENOVACAO,
                perm.PERM_EM_PROCESSO,
                perm.PERM_GET_USAGE_COMMON,
                perm.PERM_CREATE_USAGE_COMMON,
                perm.PERM_PAGE_ADICIONAR_UTENTE_FACTO,
                perm.PERM_PAGE_ADICIONAR_USOS_COMUNS,
            ),
        ),
        (
            Allow,
            user_roles.JURIDICO,
            (
                perm.PERM_UPDATE_EXPLORACAO,
                perm.PERM_REQUERIMENTO,
                perm.PERM_UTENTES,
                perm.PERM_UPDATE_REQUERIMENTO,
                perm.PERM_CREATE_DOCUMENTO,
                perm.PERM_DELETE_DOCUMENTO,
                perm.PERM_RENOVACAO,
                perm.PERM_UPDATE_RENOVACAO,
                perm.PERM_EM_PROCESSO,
            ),
        ),
        (
            Allow,
            user_roles.OBSERVADOR,
            (
                perm.PERM_FACTURACAO,
                perm.PERM_REQUERIMENTO,
                perm.PERM_RENOVACAO,
            ),
        ),
        (
            Allow,
            user_roles.BASIN_DIVISION,
            (
                perm.PERM_FACTURACAO,
                perm.PERM_REQUERIMENTO,
                perm.PERM_RENOVACAO,
                perm.PERM_CREATE_DOCUMENTO,
                perm.PERM_DELETE_DOCUMENTO,
                perm.PERM_EM_PROCESSO,
            ),
        ),
    ]

    def __init__(self, request):
        pass  # noqa: WPS420


def get_user_role(username, request):
    current_group_to_roles = group_to_roles(get_ara(request))
    user = get_user_by_username(request.db, username)
    return current_group_to_roles[user.usergroup]


def get_user_from_request(request):
    username = request.authenticated_userid
    return get_user_by_username(request.db, username)


def get_user_from_db(request):
    if asbool(request.registry.settings.get("users.debug")):
        get_user_from_db_stub(request)

    login_user = request.POST.get("user", "")
    login_pass = request.POST.get("passwd", "")
    user = get_user_by_username(request.db, login_user)

    if user and user.check_password(login_pass):
        return user


def get_user_from_db_stub(request):
    valid_logins = {
        "admin": user_groups.ADMIN,
        "administrativo": user_groups.ADMINISTRATIVO,
        "financieiro": user_groups.FINANCIERO,
        "secretaria": user_groups.DIRECCION,
        "tecnico": user_groups.TECNICO,
        "juridico": user_groups.JURIDICO,
        "observador": user_groups.OBSERVADOR,
        "divisao": user_groups.BASIN_DIVISION,
    }

    username = request.POST.get("user", "")
    if username in list(valid_logins.keys()):
        user = get_user_by_username(request.db, username)
        if not user:
            user = User()
            user.username = username
            user.usergroup = valid_logins[username]
            user.set_password(username)
            request.db.add(user)
            request.db.commit()
        return user
