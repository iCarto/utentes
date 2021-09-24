import logging

from pyramid.view import view_config
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound

from utentes.api.error_msgs import error_msgs
from utentes.constants import perms as perm
from utentes.lib.schema_validator.validation_exception import ValidationException
from utentes.lib.schema_validator.validator import Validator
from utentes.models.base import badrequest_exception
from utentes.models.documento import delete_exploracao_documentos
from utentes.models.exploracao import Exploracao, ExploracaoBase
from utentes.models.exploracao_schema import (
    EXPLORACAO_SCHEMA,
    EXPLORACAO_SCHEMA_CON_FICHA,
)
from utentes.models.fonte_schema import FONTE_SCHEMA
from utentes.models.licencia import Licencia
from utentes.models.licencia_schema import LICENCIA_SCHEMA
from utentes.models.utente import Utente
from utentes.models.utente_schema import UTENTE_SCHEMA
from utentes.services.id_service import is_not_valid_exp_id, is_not_valid_lic_nro


log = logging.getLogger(__name__)


@view_config(
    route_name="api_exploracaos",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
@view_config(
    route_name="api_exploracaos_id",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
def exploracaos_get(request):
    gid = None
    if request.matchdict:
        gid = request.matchdict["id"] or None

    if gid:  # return individual explotacao
        try:
            return request.db.query(Exploracao).filter(Exploracao.gid == gid).one()
        except (MultipleResultsFound, NoResultFound):
            raise badrequest_exception({"error": error_msgs["no_gid"], "gid": gid})

    else:  # return collection
        query = request.db.query(Exploracao)
        states = request.GET.getall("states[]")

        if states:
            query = query.filter(Exploracao.estado_lic.in_(states))

        features = query.order_by(Exploracao.exp_id).all()
        return {"type": "FeatureCollection", "features": features}


@view_config(
    route_name="api_exploracaos_id",
    permission=perm.PERM_ADMIN,
    request_method="DELETE",
    renderer="json",
)
def exploracaos_delete(request):
    gid = request.matchdict["id"]
    if not gid:
        raise badrequest_exception({"error": error_msgs["gid_obligatory"]})
    try:
        e = request.db.query(Exploracao).filter(Exploracao.gid == gid).one()
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception({"error": error_msgs["no_gid"], "gid": gid})

    delete_exploracao_documentos(request, gid)
    request.db.delete(e)
    request.db.commit()

    return {"gid": gid}


def upsert_utente(request, body):
    u_filter = Utente.nome == body.get("utente").get("nome")
    u = request.db.query(Utente).filter(u_filter).all()
    if u:
        return u[0]

    validatorUtente = Validator(UTENTE_SCHEMA)
    msgs = validatorUtente.validate(body["utente"])
    if msgs:
        raise badrequest_exception({"error": msgs})
    u = Utente.create_from_json(body["utente"])
    request.db.add(u)
    return u


@view_config(
    route_name="api_exploracaos_id",
    permission=perm.PERM_UPDATE_EXPLORACAO,
    request_method="PUT",
    renderer="json",
)
def exploracaos_update(request):
    gid = request.matchdict["id"]
    if not gid:
        raise badrequest_exception({"error": error_msgs["gid_obligatory"]})

    try:
        body = request.json_body
    except ValueError as ve:
        log.error(ve)
        raise badrequest_exception({"error": error_msgs["body_not_valid"]})

    msgs = validate_entities(request, body)
    if msgs:
        raise badrequest_exception({"error": msgs})

    try:
        e = request.db.query(Exploracao).filter(Exploracao.gid == gid).one()
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception({"error": error_msgs["no_gid"], "gid": gid})

    try:
        u = upsert_utente(request, body)
    except ValidationException as val_e:
        if e:
            request.db.refresh(e)
        raise badrequest_exception(val_e.msgs)

    e.utente_rel = u
    e.utente_rel.sexo_gerente = body.get("utente").get("sexo_gerente")

    if _tipo_actividade_changes(e, request.json_body):
        request.db.delete(e.actividade)
        del e.actividade

    try:
        e.update_from_json(request, request.json_body)
    except ValidationException as val_exp:
        if u:
            request.db.refresh(u)
        if e:
            request.db.refresh(e)
        raise badrequest_exception(val_exp.msgs)

    request.db.add(e)
    request.db.commit()

    return e


def _tipo_actividade_changes(e, json):
    return (
        e.actividade
        and json.get("actividade")
        and (e.actividade.tipo != json.get("actividade").get("tipo"))
    )


@view_config(
    route_name="api_exploracaos",
    permission=perm.PERM_CREATE_EXPLORACAO,
    request_method="POST",
    renderer="json",
)
def exploracaos_create(request):
    try:
        body = request.json_body
    except ValueError as ve:
        log.error(ve)
        raise badrequest_exception({"error": error_msgs["body_not_valid"]})

    exp_id = body.get("exp_id")
    msgs = validate_entities(request, body)
    if msgs:
        raise badrequest_exception({"error": msgs})

    e = (
        request.db.query(ExploracaoBase)
        .filter(ExploracaoBase.exp_id == exp_id)
        .one_or_none()
    )
    if e:
        raise badrequest_exception({"error": error_msgs["exploracao_already_exists"]})

    u_filter = Utente.nome == body.get("utente").get("nome")
    u = request.db.query(Utente).filter(u_filter).one_or_none()
    if not u:
        validatorUtente = Validator(UTENTE_SCHEMA)
        msgs = validatorUtente.validate(body["utente"])
        if msgs:
            raise badrequest_exception({"error": msgs})
        u = Utente.create_from_json(body["utente"])
        request.db.add(u)
    try:
        e = Exploracao.create_from_json(request, body)
    except ValidationException as val_exp:
        if u:
            request.db.refresh(u)
        if e:
            request.db.refresh(e)
        raise badrequest_exception(val_exp.msgs)
    e.utente_rel = u

    request.db.add(e)
    request.db.commit()
    return e


def activity_fail(v):
    return (
        (v is None)
        or (v == "")
        or (len(v) == 0)
        or (v.get("tipo") is None)
        or (v.get("tipo") == "Actividade non declarada")
    )


def validate_entities(request, body):

    validatorExploracao = Validator(EXPLORACAO_SCHEMA)

    validatorExploracao.add_rule("EXP_ID_FORMAT", {"fails": is_not_valid_exp_id})

    validatorExploracao.add_rule("ACTIVITY_NOT_NULL", {"fails": activity_fail})
    if Licencia.implies_validate_ficha(body.get("estado_lic")):
        validatorExploracao.append_schema(EXPLORACAO_SCHEMA_CON_FICHA)

    msgs = validatorExploracao.validate(body)

    validatorFonte = Validator(FONTE_SCHEMA)
    for fonte in body.get("fontes"):
        msgs = msgs + validatorFonte.validate(fonte)

    if Licencia.implies_validate_ficha(body.get("estado_lic")):
        validatorLicencia = Validator(LICENCIA_SCHEMA)

        validatorLicencia.add_rule("LIC_NRO_FORMAT", {"fails": is_not_valid_lic_nro})

        for lic in body.get("licencias"):
            if Licencia.implies_validate_activity(lic.get("estado")):
                msgs = msgs + validatorLicencia.validate(lic)

    return msgs
