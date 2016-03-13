# -*- coding: utf-8 -*-

from pyramid.view import view_config

from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound

from utentes.lib.schema_validator.validator import Validator
from utentes.models.utente import Utente
from utentes.models.utente_schema import UTENTE_SCHEMA
from utentes.models.exploracao import Exploracao
from utentes.models.exploracao_schema import EXPLORACAO_SCHEMA
from utentes.models.licencia_schema import LICENCIA_SCHEMA
from utentes.models.base import badrequest_exception

import logging
log = logging.getLogger(__name__)


@view_config(route_name='exploracaos',    request_method='GET', renderer='json')
@view_config(route_name='exploracaos_id', request_method='GET', renderer='json')
def exploracaos_get(request):
    gid = None
    if request.matchdict:
        gid = request.matchdict['id'] or None

    if gid:  # return individual explotacao
        try:
            return request.db.query(Exploracao).filter(Exploracao.gid == gid).one()
        except(MultipleResultsFound, NoResultFound):
            # TODO translate msg
            raise badrequest_exception({
                'error': 'El código no existe',
                'gid': gid
                })

    else:  # return collection
        return {
            'type': 'FeatureCollection',
            'features': request.db.query(Exploracao).order_by(Exploracao.exp_id).all()
        }


@view_config(route_name='exploracaos_id', request_method='DELETE', renderer='json')
def exploracaos_delete(request):
    gid = request.matchdict['id']
    if not gid:
        # TODO translate msg
        raise badrequest_exception({
            'error': 'gid es un campo necesario'
        })
    try:
        e = request.db.query(Exploracao).filter(Exploracao.gid == gid).one()
        request.db.delete(e)
        request.db.commit()
    except(MultipleResultsFound, NoResultFound):
        # TODO translate msg
        raise badrequest_exception({
            'error': 'El código no existe',
            'gid': gid
        })
    return {'gid': gid}


@view_config(route_name='exploracaos_id', request_method='PUT', renderer='json')
def exploracaos_update(request):
    gid = request.matchdict['id']
    if not gid:
        # TODO translate msg
        raise badrequest_exception({
            'error': 'gid es un campo necesario'
        })

    body = request.json_body
    msgs = validate_entities(body)
    if len(msgs) > 0:
        raise badrequest_exception({'error': msgs})

    try:
        u_filter = Utente.nome == body.get('utente').get('nome')
        u = request.db.query(Utente).filter(u_filter).first()
        if not u:
            u = Utente.create_from_json(body['utente'])
            request.db.add(u)
        e = request.db.query(Exploracao).filter(Exploracao.gid == gid).one()
        # TODO instead of using licencias.length use a sequence in DB
        # related to not delete licencias but make it inactive with a flag
        e.update_from_json(request.json_body, len(e.licencias))
        e.utente_rel = u
        request.db.add(e)
        request.db.commit()
    except(MultipleResultsFound, NoResultFound):
        # TODO translate msg
        raise badrequest_exception({
            'error': 'El código no existe',
            'gid': gid
        })
    except ValueError as ve:
        log.error(ve)
        # TODO translate msg
        raise badrequest_exception({'error': 'body is not a valid json'})

    return e


@view_config(route_name='exploracaos', request_method='POST', renderer='json')
def exploracaos_create(request):
    try:
        body = request.json_body
        exp_id = body.get('exp_id')
    except ValueError as ve:
        log.error(ve)
        # TODO translate msg
        raise badrequest_exception({'error': 'body is not a valid json'})

    msgs = validate_entities(body)
    e = request.db.query(Exploracao).filter(Exploracao.exp_id == exp_id).first()
    if e:
        # TODO translate msg
        msgs.append('La exploracao ya existe')
    if len(msgs) > 0:
        raise badrequest_exception({'error': msgs})

    u_filter = Utente.nome == body.get('utente').get('nome')
    u = request.db.query(Utente).filter(u_filter).first()
    if not u:
        u = Utente.create_from_json(body['utente'])
        request.db.add(u)
    e = Exploracao.create_from_json(body)
    e.utente_rel = u
    request.db.add(e)
    request.db.commit()
    return e


def validate_entities(body):
    import re
    validatorExploracao = Validator(EXPLORACAO_SCHEMA)
    validatorExploracao.add_rule('EXP_ID_FORMAT', {'fails': lambda v: v and (not re.match('^\d{4}-\d{3}$', v))})
    msgs = validatorExploracao.validate(body)

    validatorLicencia = Validator(LICENCIA_SCHEMA)
    validatorLicencia.add_rule('LIC_NRO_FORMAT', {'fails': lambda v: v and (not re.match('^\d{4}-\d{3}-\d{3}$', v))})
    for l in body.get('licencias'):
        msgs = msgs + validatorLicencia.validate(l)

    validatorUtente = Validator(UTENTE_SCHEMA)
    msgs = msgs + validatorUtente.validate(body['utente'])

    return msgs
