import logging

from pyramid.view import view_config
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound

from utentes.api.error_msgs import error_msgs
from utentes.constants import perms as perm
from utentes.lib.schema_validator.validator import Validator
from utentes.models.actividades_schema import ActividadeSchema
from utentes.models.base import badrequest_exception
from utentes.models.tanques_piscicolas import ActividadesTanquesPiscicolas as UsedModel


log = logging.getLogger(__name__)


@view_config(
    route_name="api_tanques_piscicolas",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
@view_config(
    route_name="api_tanques_piscicolas_id",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
def tanques_piscicolas_get(request):
    gid = None
    if request.matchdict:
        gid = request.matchdict["id"] or None

    if gid:
        try:
            return request.db.query(UsedModel).filter(UsedModel.gid == gid).one()
        except (MultipleResultsFound, NoResultFound):
            raise badrequest_exception({"error": error_msgs["no_gid"], "gid": gid})
    else:
        return {
            "type": "FeatureCollection",
            "features": request.db.query(UsedModel).order_by(UsedModel.tanque_id).all(),
        }


@view_config(
    route_name="api_tanques_piscicolas_id",
    permission=perm.PERM_UPDATE_CULTIVO_TANQUE,
    request_method="PUT",
    renderer="json",
)
def tanques_piscicolas_update(request):
    gid = request.matchdict["id"]
    if not gid:
        raise badrequest_exception({"error": error_msgs["gid_obligatory"]})

    msgs = validate_entities(request.json_body)
    if msgs:
        raise badrequest_exception({"error": msgs})

    try:
        used_model = request.db.query(UsedModel).filter(UsedModel.gid == gid).one()
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception({"error": error_msgs["no_cultivo_gid"], "gid": gid})

    try:
        used_model.update_from_json(request.json_body)
    except ValueError as ve:
        log.error(ve)
        raise badrequest_exception({"error": error_msgs["body_not_valid"]})

    request.db.add(used_model)
    request.db.commit()

    return used_model


def validate_entities(body):
    return Validator(ActividadeSchema["TanquesPiscicolas"]).validate(body)
