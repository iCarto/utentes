import logging

from pyramid.view import view_config

from utentes.constants import perms as perm
from utentes.models.constants import INVOIZABLE_STATES
from utentes.repos.exploracao_repo import (
    get_exploracao_list,
    get_exploracao_with_invoices_by_pk,
)
from utentes.repos.invoice_repo import get_invoice_by_pk


log = logging.getLogger(__name__)


@view_config(
    route_name="api_facturacao",
    permission=perm.PERM_FACTURACAO,
    request_method="GET",
    renderer="json",
)
def facturacao_get(request):
    states = request.GET.getall("states[]") or INVOIZABLE_STATES
    exploracaos = get_exploracao_list(request.db, states)
    return {"type": "FeatureCollection", "features": exploracaos}


@view_config(
    route_name="api_facturacao_new_fact_id",
    permission=perm.PERM_UPDATE_CREATE_FACTURACAO,
    request_method="GET",
    renderer="json",
)
def new_fact_id(request):
    invoice_pk = request.matchdict["id"]
    invoice = get_invoice_by_pk(request.db, invoice_pk)

    if invoice.fact_id:
        return invoice.fact_id

    exploracao = get_exploracao_with_invoices_by_pk(request.db, invoice.exploracao)

    invoice.fact_id = num_factura_get_id_formatted(
        request.db, exploracao.loc_divisao, invoice.ano
    )
    request.db.add(invoice)
    request.db.commit()

    return invoice.fact_id


@view_config(
    route_name="api_facturacao_new_recibo_id",
    permission=perm.PERM_UPDATE_CREATE_FACTURACAO,
    request_method="GET",
    renderer="json",
)
def new_recibo_id(request):
    invoice_pk = request.matchdict["id"]
    invoice = get_invoice_by_pk(request.db, invoice_pk)

    if invoice.recibo_id:
        return invoice.recibo_id

    exploracao = get_exploracao_with_invoices_by_pk(request.db, invoice.exploracao)

    invoice.recibo_id = num_recibo_get_id_formatted(
        request.db, exploracao.loc_divisao, invoice.ano
    )
    request.db.add(invoice)
    request.db.commit()

    return invoice.recibo_id


@view_config(
    route_name="api_facturacao_exploracao_id",
    permission=perm.PERM_UPDATE_CREATE_FACTURACAO,
    request_method=("PATCH", "PUT"),
    renderer="json",
)
def facturacao_exploracao_update(request):
    exp_pk = request.matchdict["id"]
    body = request.json_body
    exploracao = get_exploracao_with_invoices_by_pk(request.db, exp_pk)
    exploracao.update_from_json_facturacao(body)
    request.db.add(exploracao)
    request.db.commit()
    return exploracao


def num_factura_get_id_formatted(db, divisao, ano):
    sql = r"""
        SELECT substring(fact_id, 0, 5)::int + 1
        FROM utentes.facturacao
        WHERE substring(fact_id from '\d{4}-(.*)') = :divisao_ano
        ORDER BY fact_id DESC
        LIMIT 1;
        """
    return _get_id_formatted(db, divisao, ano, sql)


def num_recibo_get_id_formatted(db, divisao, ano):
    sql = r"""
        SELECT substring(recibo_id, 0, 5)::int + 1
        FROM utentes.facturacao
        WHERE substring(recibo_id from '\d{4}-(.*)') = :divisao_ano
        ORDER BY recibo_id DESC
        LIMIT 1;
        """
    return _get_id_formatted(db, divisao, ano, sql)


def _get_id_formatted(db, divisao, ano, sql):
    params = {"seq_id": None, "divisao_ano": f"{divisao}/{ano}"}
    query_result = db.execute(sql, params).first()
    if query_result:
        params["seq_id"] = query_result[0]
    else:
        params["seq_id"] = 1

    # 0001-UGBI/2020
    return "{seq_id:04d}-{divisao_ano}".format(**params)
