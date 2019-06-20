# -*- coding: utf-8 -*-

from pyramid.view import view_config

from utentes.user_utils import (
    PERM_CREATE_EXPLORACAO,
    PERM_CREATE_REQUERIMENTO,
    PERM_FACTURACAO,
    PERM_GET,
    PERM_RENOVACAO,
    PERM_REQUERIMENTO,
    PERM_UPDATE_CULTIVO_TANQUE,
)


@view_config(
    route_name="exploracao-gps",
    permission=PERM_UPDATE_CULTIVO_TANQUE,
    renderer="utentes:templates/exploracao-gps.jinja2",
)
def exploracao_gps(request):
    return {}


@view_config(
    route_name="exploracao-new",
    permission=PERM_CREATE_EXPLORACAO,
    renderer="utentes:templates/exploracao-new.jinja2",
)
def exploracao_new(request):
    return {}


@view_config(
    route_name="exploracao-search",
    permission=PERM_GET,
    renderer="utentes:templates/exploracao-search.jinja2",
)
def exploracao_search(request):
    return {}


@view_config(
    route_name="exploracao-show",
    permission=PERM_GET,
    renderer="utentes:templates/exploracao-show.jinja2",
)
def exploracao_show(request):
    return {}


@view_config(
    route_name="facturacao",
    permission=PERM_FACTURACAO,
    renderer="utentes:templates/facturacao.jinja2",
)
def facturacao(request):
    return {}


@view_config(
    route_name="requerimento-new",
    permission=PERM_CREATE_REQUERIMENTO,
    renderer="utentes:templates/requerimento-new.jinja2",
)
def requerimento_new(request):
    return {}


@view_config(
    route_name="requerimento-pendente",
    permission=PERM_REQUERIMENTO,
    renderer="utentes:templates/requerimento-pendente.jinja2",
)
def requerimento_pendente(request):
    return {}


@view_config(
    route_name="renovacao",
    permission=PERM_RENOVACAO,
    renderer="utentes:templates/renovacao.jinja2",
)
def renovacao(request):
    return {}


@view_config(
    route_name="utentes",
    permission=PERM_GET,
    renderer="utentes:templates/utentes.jinja2",
)
def utentes(request):
    return {}


@view_config(
    route_name="facturacao-stats",
    permission=PERM_GET,
    renderer="utentes:templates/facturacao-stats.jinja2",
)
def facturacao_stats(request):
    return {}
