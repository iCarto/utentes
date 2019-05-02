# -*- coding: utf-8 -*-

import logging

from pyramid.view import view_config

from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound
from utentes.api.error_msgs import error_msgs
from utentes.models.base import badrequest_exception
from utentes.models.exploracao import Exploracao
from utentes.models.facturacao import Facturacao
from utentes.user_utils import PERM_UPDATE_CREATE_FACTURACAO, PERM_GET

log = logging.getLogger(__name__)


@view_config(
    route_name='api_facturacao',
    permission=PERM_GET,
    request_method='GET',
    renderer='json')
@view_config(
    route_name='api_facturacao_exploracao_id',
    permission=PERM_GET,
    request_method='GET',
    renderer='json')
def facturacao_get(request):
    gid = None
    if request.matchdict:
        gid = request.matchdict['id'] or None

    if gid:  # return individual explotacao
        try:
            return request.db.query(Exploracao).filter(
                Exploracao.gid == gid).one()
        except (MultipleResultsFound, NoResultFound):
            raise badrequest_exception({
                'error': error_msgs['no_gid'],
                'gid': gid
            })

    else:  # return collection
        query = request.db.query(Exploracao)
        states = request.GET.getall('states[]')

        if states:
            query = query.filter(Exploracao.estado_lic.in_(states))

        fact_estado = request.GET.getall('fact_estado[]')
        if fact_estado:
            query = query.filter(Exploracao.fact_estado.in_(fact_estado))




            query = query.filter(Exploracao.gid.in_([2315, 2317]))

        features = query.all()
        return {'type': 'FeatureCollection', 'features': features}


@view_config(
    route_name='api_facturacao_new_factura',
    permission=PERM_UPDATE_CREATE_FACTURACAO,
    request_method='GET',
    renderer='json')
def num_factura_get(request):

    gid = None
    if request.matchdict:
        gid = request.matchdict['id'] or None

    if not gid:
        raise badrequest_exception({'error': error_msgs['no_gid'], 'gid': gid})

    try:
        facturacao = request.db.query(Facturacao).filter(
            Facturacao.gid == gid).one()
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception({'error': error_msgs['no_gid'], 'gid': gid})

    exp_id = facturacao.exploracao
    if facturacao.fact_id is not None:
        return facturacao.fact_id

    try:
        exploracao = request.db.query(Exploracao).filter(
            Exploracao.gid == exp_id).one()
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception({'error': error_msgs['no_gid'], 'gid': gid})

    if not exploracao.loc_unidad:
        raise badrequest_exception({
            'error':
            'A unidade é un campo obligatorio',
            'exp_id':
            exp_id
        })

    params = {
        'unidad': exploracao.loc_unidad,
        'ano': facturacao.ano,
    }

    sql = '''
        SELECT substring(fact_id, 0, 5)::int + 1
        FROM utentes.facturacao
        WHERE fact_id ~ '.*-{unidad}/{ano}'
        ORDER BY fact_id DESC
        LIMIT 1;
        '''.format(**params)

    # TODO. Para 2018. Debemos dejar reservados números de facturas
    # Estos defaults serán eliminados a futuro
    FACTURAS_DEFAULT_VALUES = {
        'UGBI/2018': [2500],
        'UGBL/2018': [1800],
        'UGBU/2018': [9000],
        'UGBS/2018': [1500]
    }

    params['next_serial'] = (request.db.execute(sql).first() or [
        FACTURAS_DEFAULT_VALUES.get('{unidad}/{ano}'.format(**params), 1)
    ])[0]

    num_factura = '{next_serial:04d}-{unidad}/{ano}'.format(**params)

    facturacao.fact_id = num_factura

    request.db.add(facturacao)
    request.db.commit()

    return num_factura


@view_config(
    route_name='api_facturacao_exploracao_id',
    permission=PERM_UPDATE_CREATE_FACTURACAO,
    request_method='PATCH',
    renderer='json')
@view_config(
    route_name='api_facturacao_exploracao_id',
    permission=PERM_UPDATE_CREATE_FACTURACAO,
    request_method='PUT',
    renderer='json')
def facturacao_exploracao_update(request):
    id = request.matchdict['id']
    body = request.json_body
    e = request.db.query(Exploracao).filter(Exploracao.gid == id).one()
    e.update_from_json_facturacao(body)
    request.db.add(e)
    request.db.commit()
    return e


# @view_config(route_name='api_facturacao', request_method='POST', renderer='json')
# # admin || administrativo
# def facturacao_create(request):
#     try:
#         body = request.json_body
#     except ValueError as ve:
#         log.error(ve)
#         raise badrequest_exception({'error': error_msgs['body_not_valid']})
#
#     e = Exploracao()
#     e.update_from_json_facturacao(body)
#     ara = request.registry.settings.get('ara')
#     # e.exp_id = calculate_new_exp_id(request, ara)
#     e.ara = ara
#
#     request.db.add(e)
#     request.db.commit()
#     return e
