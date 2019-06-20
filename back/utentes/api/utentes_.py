# -*- coding: utf-8 -*-

from pyramid.view import view_config
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound

from utentes.lib.schema_validator.validator import Validator
from utentes.models.base import badrequest_exception
from utentes.models.utente_schema import UTENTE_SCHEMA
from utentes.models.utente import Utente
from utentes.models.documento import delete_exploracao_documentos
from error_msgs import error_msgs

from utentes.user_utils import PERM_ADMIN, PERM_UTENTES, PERM_GET

import logging

log = logging.getLogger(__name__)


@view_config(
    route_name="api_utentes", permission=PERM_GET, request_method="GET", renderer="json"
)
@view_config(
    route_name="api_utentes_id",
    permission=PERM_GET,
    request_method="GET",
    renderer="json",
)
def utentes_get(request):
    gid = None
    if request.matchdict:
        gid = request.matchdict["id"] or None

    if gid:  # return individual utente
        try:
            return request.db.query(Utente).filter(Utente.gid == gid).one()
        except (MultipleResultsFound, NoResultFound):
            raise badrequest_exception({"error": error_msgs["no_gid"], "gid": gid})
    else:
        return request.db.query(Utente).all()


@view_config(
    route_name="api_utentes_id",
    permission=PERM_ADMIN,
    request_method="DELETE",
    renderer="json",
)
def utentes_delete(request):
    gid = request.matchdict["id"]
    if not gid:
        raise badrequest_exception({"error": error_msgs["gid_obligatory"]})
    try:
        u = request.db.query(Utente).filter(Utente.gid == gid).one()
        for e in u.exploracaos:
            delete_exploracao_documentos(request, e.gid)
        request.db.delete(u)
        request.db.commit()
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception({"error": error_msgs["no_gid"], "gid": gid})
    return {"gid": gid}


@view_config(
    route_name="api_utentes_id",
    permission=PERM_UTENTES,
    request_method="PUT",
    renderer="json",
)
def utentes_update(request):
    gid = request.matchdict["id"]
    if not gid:
        raise badrequest_exception({"error": error_msgs["gid_obligatory"]})

    msgs = validate_entities(request.json_body)
    if len(msgs) > 0:
        raise badrequest_exception({"error": msgs})

    try:
        e = request.db.query(Utente).filter(Utente.gid == gid).one()
        e.update_from_json(request.json_body)
        request.db.add(e)
        request.db.commit()
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception({"error": error_msgs["no_gid"], "gid": gid})
    except ValueError as ve:
        log.error(ve)
        raise badrequest_exception({"error": error_msgs["body_not_valid"]})

    return e


@view_config(
    route_name="api_utentes",
    permission=PERM_UTENTES,
    request_method="POST",
    renderer="json",
)
def utentes_create(request):
    try:
        body = request.json_body
        nome = body.get("nome")
    except ValueError as ve:
        log.error(ve)
        raise badrequest_exception({"error": error_msgs["body_not_valid"]})

    msgs = validate_entities(body)
    if len(msgs) > 0:
        raise badrequest_exception({"error": msgs})

    # TODO:320 is this not covered by schema validations?
    if not nome:
        raise badrequest_exception({"error": "nome es um campo obligatorio"})

    e = request.db.query(Utente).filter(Utente.nome == nome).all()
    print(e)
    if e:
        print("excepcion")
        raise badrequest_exception({"error": error_msgs["utente_already_exists"]})

    u = Utente.create_from_json(body)
    request.db.add(u)
    request.db.commit()
    return u


def validate_entities(body):
    return Validator(UTENTE_SCHEMA).validate(body)
