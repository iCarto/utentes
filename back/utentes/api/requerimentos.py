# -*- coding: utf-8 -*-

from pyramid.view import view_config
from utentes.models.base import badrequest_exception
from utentes.models.exploracao import Exploracao
from utentes.models.licencia import Licencia
from utentes.models.ara import Ara
from utentes.api.error_msgs import error_msgs
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound
from pyramid.renderers import JSON

from utentes.user_utils import PERM_GET, PERM_UPDATE_REQUERIMENTO, PERM_CREATE_REQUERIMENTO

import datetime

import logging
log = logging.getLogger(__name__)


@view_config(route_name='api_requerimento', permission=PERM_GET, request_method='GET', renderer='json')
@view_config(route_name='api_requerimento_id', permission=PERM_GET, request_method='GET', renderer='json')
def requerimento_get(request):
    gid = None
    if request.matchdict:
        gid = request.matchdict['id'] or None

    if gid:  # return individual explotacao
        try:
            return request.db.query(Exploracao).filter(Exploracao.gid == gid).one()
        except(MultipleResultsFound, NoResultFound):
            raise badrequest_exception({
                'error': error_msgs['no_gid'],
                'gid': gid
            })

    else:  # return collection
        states = request.GET.getall('states[]')
        if states:
            features = request.db.query(Exploracao).filter(Exploracao.estado_lic.in_(states)).all()
        else:
            features = request.db.query(Exploracao).all()

        return {
            'type': 'FeatureCollection',
            'features': features
        }


@view_config(route_name='api_requerimento_id', permission=PERM_UPDATE_REQUERIMENTO, request_method='PATCH', renderer='json')
@view_config(route_name='api_requerimento_id', permission=PERM_UPDATE_REQUERIMENTO, request_method='PUT', renderer='json')
def requerimento_update(request):
    gid = request.matchdict['id']
    body = request.json_body
    e = request.db.query(Exploracao).filter(Exploracao.gid == gid).one()
    e.update_from_json_requerimento(body)
    request.db.add(e)
    request.db.commit()
    return e


@view_config(route_name='api_requerimento', permission=PERM_CREATE_REQUERIMENTO, request_method='POST', renderer='json')
# admin || administrativo
def requerimento_create(request):
    try:
        body = request.json_body
    except ValueError as ve:
        log.error(ve)
        raise badrequest_exception({'error': error_msgs['body_not_valid']})

    e = Exploracao()
    e.update_from_json_requerimento(body)
    ara = request.registry.settings.get('ara')
    e.exp_id = calculate_new_exp_id(request, ara)
    e.ara = ara

    request.db.add(e)
    request.db.commit()
    return e


def calculate_new_exp_id(request, ara):
    year = datetime.date.today().year
    sql = '''
    SELECT substring(exp_id, 1, 3)
    FROM utentes.exploracaos
    WHERE upper(ara) = '{}' AND substring(exp_id, 10, 14) = '{}'
    ORDER BY 1 DESC LIMIT 1;
    '''.format(ara, year)
    next_number = request.db.execute(sql).first() or [0]
    next_id = '%0*d' % (3, int(next_number[0]) + 1)

    return '{}/{}/{}'.format(next_id, ara, year)

@view_config(route_name='api_requerimento_print_license', permission=PERM_GET, request_method='GET', renderer='json')
def save_printed_license(request):
    gid = None
    if request.matchdict:
        gid = request.matchdict['id'] or None

    if gid:
        try:
            licencia =  request.db.query(Licencia).filter(Licencia.gid == gid).one()
            if licencia.printed is False:
                licencia.printed = True
                request.db.add(licencia)
                request.db.commit()
                return True
            return True
        except(MultipleResultsFound, NoResultFound):
            raise badrequest_exception({
                'error': error_msgs['no_gid'],
                'gid': gid
            })

@view_config(route_name='api_requerimento_get_datos_ara', permission=PERM_GET, request_method='GET', renderer='json')
def get_datos_ara(request):
    ara = request.registry.settings.get('ara');
    result = request.db.query(Ara).filter(Ara.id == ara).one()
    return result;
