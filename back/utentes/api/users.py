import logging

from pyramid.view import view_config
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound

from utentes.api.error_msgs import error_msgs
from utentes.constants import perms as perm
from utentes.lib.schema_validator.validation_exception import ValidationException
from utentes.models.base import badrequest_exception, unauthorized_exception
from utentes.models.user import User


log = logging.getLogger(__name__)


@view_config(route_name="api_users", permission=perm.PERM_ADMIN, renderer="json")
def users_read(request):
    return request.db.query(User).order_by(User.username).all()


@view_config(
    route_name="api_users",
    request_method="POST",
    permission=perm.PERM_ADMIN,
    renderer="json",
)
def user_create(request):
    try:
        body = request.json_body
    except ValueError as ve:
        log.error(ve)
        raise badrequest_exception({"error": error_msgs["body_not_valid"]})

    user = request.db.query(User).filter(User.username == body.get("username")).first()
    if user:
        raise badrequest_exception({"error": error_msgs["user_already_exists"]})

    try:
        user = User.create_from_json(request.json_body)
    except ValidationException as val_exp:
        request.db.rollback()
        raise badrequest_exception(val_exp.msgs)
    except Exception:
        log.error("Failed to create user", exc_info=True)
        request.db.rollback()
        raise badrequest_exception({"error": error_msgs["unknown_error"]})

    request.db.add(user)
    request.db.commit()
    return user


@view_config(
    route_name="api_users_id",
    request_method="DELETE",
    permission=perm.PERM_ADMIN,
    renderer="json",
)
def user_delete(request):
    user_id = request.matchdict["id"]
    if not user_id:
        raise badrequest_exception({"error": error_msgs["username_obligatory"]})

    try:
        user = request.db.query(User).filter(User.id == user_id).one()
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception(
            {"error": error_msgs["user_not_exists"], "id": user_id}
        )

    request.db.delete(user)
    request.db.commit()
    return {"username": user.username}


@view_config(
    route_name="api_users_id",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
def user_read(request):
    user_id = request.matchdict["id"]
    if not user_id:
        raise badrequest_exception({"error": error_msgs["username_obligatory"]})

    user = request.db.query(User).filter(User.id == user_id).one()
    granted = (str(request.user.id) == str(user.id)) or request.has_permission(
        perm.PERM_ADMIN
    )

    if granted:
        try:
            return user
        except (MultipleResultsFound, NoResultFound):
            raise badrequest_exception(
                {"error": error_msgs["user_not_exists"], "id": user_id}
            )
    else:
        raise unauthorized_exception()


@view_config(
    route_name="api_users_id",
    permission=perm.PERM_GET,
    request_method="PUT",
    renderer="json",
)
def user_update(request):
    json = request.json_body
    user_id = request.matchdict["id"]
    if not user_id:
        raise badrequest_exception({"error": error_msgs["username_obligatory"]})
    try:
        user = request.db.query(User).filter(User.id == user_id).one()
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception(
            {"error": error_msgs["username_obligatory"], "id": user_id}
        )

    if str(user.id) != str(json["id"]):
        raise badrequest_exception({"error": error_msgs["username_obligatory"]})

    granted = (request.user.id == user.id) or (request.has_permission(perm.PERM_ADMIN))

    if not granted:
        raise unauthorized_exception()

    if user.username != json["username"]:
        bads = request.db.query(User).filter(User.username == json["username"]).all()
        if bads:
            raise badrequest_exception({"error": error_msgs["user_already_exists"]})

    user.update_from_json(json)
    request.db.add(user)
    request.db.commit()
    return user
