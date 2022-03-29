import logging

from pyramid.view import view_config

from utentes.constants import perms
from utentes.lib.utils import dates
from utentes.models.base import unauthorized_exception
from utentes.models.constants import (
    FLAT_FEE,
    INVOICE_STATE_PENDING_CONSUMPTION,
    INVOIZABLE_STATES,
    PENDING_INVOICE,
    PER_UNIT,
)
from utentes.models.exploracao import ExploracaoConFacturacao
from utentes.models.facturacao import Facturacao
from utentes.services.invoice_service import (
    BillingPeriodCalculator,
    is_invoizable_this_month,
)


log = logging.getLogger(__name__)


def raise_if_not_authorized(request):
    request_token = request.GET.get("token_new_fact_cycle")
    settings_token = request.registry.settings["token_new_fact_cycle"]
    authorized_by_token = request_token == settings_token
    authorized_by_perm = request.has_permission(perms.PERM_NEW_INVOICE_CYCLE)
    authorized = authorized_by_token or authorized_by_perm
    if not authorized:
        raise unauthorized_exception()


@view_config(
    route_name="nuevo_ciclo_facturacion", request_method="GET", renderer="json"
)
def nuevo_ciclo_facturacion(request):
    raise_if_not_authorized(request)
    exps = (
        request.db.query(ExploracaoConFacturacao)
        .filter(ExploracaoConFacturacao.estado_lic.in_(INVOIZABLE_STATES))
        .all()
    )
    billing_period_calculator = BillingPeriodCalculator()

    invoizables_this_month = []

    # e for e in exps if is_invoizable_this_month(e, dates.today())

    today = dates.today()
    for e in exps:
        lic_sup = e.get_licencia("sup")
        lic_sub = e.get_licencia("sub")

        # Que el tipo de consumo esté a nivel licencia es problemático, obliga a hacks como este
        consumo_tipo = (
            PER_UNIT
            if PER_UNIT in {lic_sup.consumo_tipo, lic_sub.consumo_tipo}
            else FLAT_FEE
        )

        f = Facturacao()

        if consumo_tipo == FLAT_FEE:
            f.fact_estado = PENDING_INVOICE
        else:
            f.fact_estado = INVOICE_STATE_PENDING_CONSUMPTION

        f.periodo_fact = billing_period_calculator.real(
            consumo_tipo,
            e.fact_tipo,
            lic_sup.d_emissao or lic_sub.d_emissao,
            e.created_at,
            e.facturacao[-1].periodo_fact_normalized() if e.facturacao else None,
        )

        if not is_invoizable_this_month(e, f.periodo_fact_normalized(), today):
            continue

        invoizables_this_month.append(e)
        f.exploracao = e.gid

        f.juros = 0
        f.c_licencia_sup = lic_sup.c_licencia
        f.c_licencia_sub = lic_sub.c_licencia
        f.consumo_tipo_sup = lic_sup.consumo_tipo
        f.consumo_tipo_sub = lic_sub.consumo_tipo
        f.created_at = dates.now()
        f.ano = f.created_at.strftime("%Y")
        f.mes = f.created_at.strftime("%m")
        # fact_tipo no se cambia para la factura en curso desde la interfaz
        # si no para la explotación para tenerlo en cuenta para las siguientes
        # facturas y no para la actual
        f.fact_tipo = e.fact_tipo or "Mensal"
        if e.facturacao:
            f.pago_lic = e.facturacao[-1].pago_lic
            if lic_sup.estado in INVOIZABLE_STATES:
                f.consumo_fact_sup = e.facturacao[-1].consumo_fact_sup
                f.taxa_fixa_sup = e.facturacao[-1].taxa_fixa_sup
                f.taxa_uso_sup = e.facturacao[-1].taxa_uso_sup
                f.iva_sup = e.facturacao[-1].iva_sup
            if lic_sub.estado in INVOIZABLE_STATES:
                f.consumo_fact_sub = e.facturacao[-1].consumo_fact_sub
                f.taxa_fixa_sub = e.facturacao[-1].taxa_fixa_sub
                f.taxa_uso_sub = e.facturacao[-1].taxa_uso_sub
                f.iva_sub = e.facturacao[-1].iva_sub
            f.iva = e.facturacao[-1].iva
        else:
            f.pago_lic = False
            if lic_sup.estado in INVOIZABLE_STATES:
                f.consumo_fact_sup = lic_sup.c_licencia
                f.taxa_fixa_sup = lic_sup.taxa_fixa
                f.taxa_uso_sup = lic_sup.taxa_uso
                f.iva_sup = lic_sup.iva
            if lic_sub.estado in INVOIZABLE_STATES:
                f.consumo_fact_sub = lic_sub.c_licencia
                f.taxa_fixa_sub = lic_sub.taxa_fixa
                f.taxa_uso_sub = lic_sub.taxa_uso
                f.iva_sub = lic_sub.iva
            f.iva = lic_sup.iva or lic_sub.iva

        f.calculate_pagos()

        f.observacio = [
            {"created_at": None, "autor": None, "text": None, "state": None}
        ]
        e.pago_lic = f.pago_lic
        e.facturacao.append(f)

    request.db.add_all(invoizables_this_month)
    request.db.commit()
    return stats(exps, invoizables_this_month)


def stats(exps, invoizables_this_month):
    return {
        "n_exps_invoizables_total": len(exps),
        "n_exps_invoizables_this_month": len(invoizables_this_month),
        "n_exps_pending_invoice": len(
            [
                x
                for x in invoizables_this_month
                if x.facturacao[-1].fact_estado == PENDING_INVOICE
            ]
        ),
        "n_exps_pending_consumption": len(
            [
                x
                for x in invoizables_this_month
                if x.facturacao[-1].fact_estado == INVOICE_STATE_PENDING_CONSUMPTION
            ]
        ),
        "today": dates.today(),
    }
