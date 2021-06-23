from pyramid.security import Allow, Authenticated, Deny
from pyramid.settings import asbool
from pyramid.threadlocal import get_current_registry
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound

from users import user_roles
from utentes.constants import perms as perm
from utentes.models.user import User
from utentes.tenant_custom_code import group_to_roles


# GESTIONAR UNIQUE USER
class RootFactory(object):
    __acl__ = [
        (
            Deny,
            user_roles.ROL_SINGLE,
            (
                perm.PERM_PAGE_ADICIONAR_USOS_COMUNS,
                perm.PERM_PAGE_ADICIONAR_UTENTE_FACTO,
                perm.PERM_FACTURACAO,
            ),
        ),
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
            user_roles.UNIDAD_DELEGACION,
            (
                perm.PERM_FACTURACAO,
                perm.PERM_REQUERIMENTO,
                perm.PERM_RENOVACAO,
                perm.PERM_CREATE_DOCUMENTO,
                perm.PERM_DELETE_DOCUMENTO,
                perm.PERM_EM_PROCESSO,
            ),
        ),
        (Allow, user_roles.ROL_SINGLE, perm.PERM_PAGE_ADICIONAR_EXPLORACAO),
    ]

    def __init__(self, request):
        pass  # noqa: WPS420


def is_single_user_mode(settings=None):
    settings = settings or get_current_registry().settings
    return settings.get("ara") == ""


def get_user_role(username, request):
    ara = request.registry.settings.get("ara")
    current_group_to_roles = group_to_roles(ara)

    if is_single_user_mode():
        return current_group_to_roles[get_unique_user().usergroup]
    try:
        user = request.db.query(User).filter(User.username == username).one()
    except (MultipleResultsFound, NoResultFound):
        return []
    return current_group_to_roles[user.usergroup]


def get_user_from_request(request):
    if is_single_user_mode():
        return get_unique_user()

    username = request.authenticated_userid
    if username is not None:
        try:
            return request.db.query(User).filter(User.username == username).one()
        except (MultipleResultsFound, NoResultFound):
            return None
    else:
        return None


def get_user_from_db(request):
    if is_single_user_mode():
        return get_unique_user()

    if asbool(request.registry.settings.get("users.debug")):
        get_user_from_db_stub(request)

    login_user = request.POST.get("user", "")
    login_pass = request.POST.get("passwd", "")
    try:
        user = request.db.query(User).filter(User.username == login_user).one()
    except (MultipleResultsFound, NoResultFound):
        return None
    if user.check_password(login_pass):
        return user


def get_unique_user():
    return User.create_from_json(
        {
            "username": user_roles.SINGLE_USER,
            "usergroup": user_roles.ROL_SINGLE,
            "password": user_roles.SINGLE_USER,
        }
    )


def get_user_from_db_stub(request):
    valid_logins = {
        "admin": user_roles.ADMIN,
        "administrativo": user_roles.ADMINISTRATIVO,
        "financieiro": user_roles.FINANCIERO,
        "secretaria": user_roles.DIRECCION,
        "tecnico": user_roles.TECNICO,
        "juridico": user_roles.JURIDICO,
        "observador": user_roles.OBSERVADOR,
        "unidade": user_roles.UNIDAD_DELEGACION,
    }

    username = request.POST.get("user", "")
    if username in list(valid_logins.keys()):
        user = request.db.query(User).filter(User.username == username).first()
        if not user:
            user = User()
            user.username = username
            user.usergroup = valid_logins[username]
            user.set_password(username)
            request.db.add(user)
            request.db.commit()
        return user
