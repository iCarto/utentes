import datetime
from decimal import Decimal
from typing import Dict, List

from pyramid.view import view_config
from sqlalchemy import or_
from sqlalchemy.orm import Session

from utentes.erp.model import (
    MANUAL_SYNC_TIME,
    ExploracaosERP,
    FacturacaoERP,
    InvoicesResultSet,
)
from utentes.erp.response import FileType, file_response
from utentes.lib.utils import dates
from utentes.models.base import badrequest_exception_user
from utentes.models.constants import (
    INVOIZABLE_STATES,
    K_SUBTERRANEA,
    K_SUPERFICIAL,
    PENDING_PAYMENT,
)
from utentes.models.exploracao import ExploracaoBase
from utentes.models.facturacao import Facturacao


DEFAULT_EMPTY_TIPO_AGUA = Decimal("0.00")


@view_config(route_name="api_erp_invoices")
def api_erp_invoices(request):
    invoices_to_export = get_and_update_bd(request.db)
    sheets = {"Sheet1": invoices_to_export}
    return file_response(request, sheets, build_filename(), FileType.xlsx)


def get_and_update_bd(db: Session):
    entities = get_db_entities(db)
    prepare_entities(entities)
    invoices_to_export = [build_data_to_export(e) for e in entities]
    db.add_all(e.invoice_erp for e in entities)
    return invoices_to_export


def get_db_entities(db: Session) -> List[InvoicesResultSet]:
    """Returns all the needed data from the database in form of Entities.

    For the invoices (Facturacao) return those that are in PENDING_PAYMENT and (are
    modified from the last export, or are not already being exported)
    """
    not_exported_or_updated_after_export_invoices = or_(
        FacturacaoERP.exported_at.is_(None),
        Facturacao.updated_at > FacturacaoERP.exported_at,
    )
    entities = (
        db.query(Facturacao, ExploracaoBase, ExploracaosERP, FacturacaoERP)
        .join(ExploracaoBase, ExploracaoBase.gid == Facturacao.exploracao)
        .outerjoin(
            ExploracaosERP, ExploracaosERP.exploracao_gid == Facturacao.exploracao
        )
        .outerjoin(FacturacaoERP, FacturacaoERP.facturacao_gid == Facturacao.gid)
        .filter(ExploracaoBase.estado_lic.in_(INVOIZABLE_STATES))  # See: #2008#note-50
        .filter(Facturacao.created_at > MANUAL_SYNC_TIME)
        .filter(not_exported_or_updated_after_export_invoices)
        .filter(Facturacao.fact_estado == PENDING_PAYMENT)
    )

    return [
        InvoicesResultSet(
            invoice=e.Facturacao,
            exploracao_base=e.ExploracaoBase,
            exploracao_erp=e.ExploracaosERP,
            invoice_erp=(e.FacturacaoERP or FacturacaoERP()),
        )
        for e in entities
        if (
            # Workaround. Remove early invoices for old Exps that where not matched when
            # the MANUAL_SYNC was done
            (e.ExploracaoBase.created_at > MANUAL_SYNC_TIME)
            or (e.ExploracaoBase.created_at <= MANUAL_SYNC_TIME and e.ExploracaosERP)
        )
    ]


def prepare_entities(entities: List[InvoicesResultSet]) -> None:
    now = datetime.datetime.now()
    for e in entities:
        if not e.exploracao_erp:
            raise badrequest_exception_user(
                "Você está tentando exportar uma fatura sem primeiro exportar a"
                " exploracao"
            )
        e.invoice_erp.exported_at = now
        e.invoice_erp.facturacao_gid = e.invoice.gid
        e.invoice_erp.update_link_id(e.invoice)


def build_data_to_export(e: InvoicesResultSet) -> Dict:
    invoice = e.invoice
    invoice_erp = e.invoice_erp

    if invoice_erp.id:
        estado = "Existente"
    else:
        estado = "Novo"

    if invoice.has_water_type("sup"):
        taxa_fixa_sup = invoice.taxa_fixa_sup * invoice._month_factor()  # noqa: WPS437
        consumo_sup = invoice.consumo_fact_sup * invoice._month_factor()  # noqa: WPS437
        taxa_uso_sup = invoice.taxa_uso_sup
    else:
        taxa_fixa_sup = DEFAULT_EMPTY_TIPO_AGUA
        consumo_sup = DEFAULT_EMPTY_TIPO_AGUA
        taxa_uso_sup = DEFAULT_EMPTY_TIPO_AGUA

    if invoice.has_water_type("sub"):
        taxa_fixa_sub = invoice.taxa_fixa_sub * invoice._month_factor()  # noqa: WPS437
        consumo_sub = invoice.consumo_fact_sub * invoice._month_factor()  # noqa: WPS437
        taxa_uso_sub = invoice.taxa_uso_sub
    else:
        taxa_fixa_sub = DEFAULT_EMPTY_TIPO_AGUA
        consumo_sub = DEFAULT_EMPTY_TIPO_AGUA
        taxa_uso_sub = DEFAULT_EMPTY_TIPO_AGUA

    return {
        "Cliente": e.exploracao_erp.erp_id,
        "Nro_Exploracao": e.exploracao_base.exp_id,
        "IDuCli": e.exploracao_erp.link_id,
        "Nro_Factura": invoice.fact_id,
        "Factura_Prim": invoice_erp.erp_id,
        "IDuFac": invoice_erp.link_id,
        "Estado": estado,
        "Data": invoice.fact_date,
        "Fact_tipo": invoice.fact_tipo,
        "Periodo_Factura": invoice.billing_period(),
        "Descricao": e.exploracao_base.actividade.tipo,
        "Superficial": K_SUPERFICIAL,
        "Con_Sup": consumo_sup,
        "TaxaUso_sup": taxa_uso_sup,
        "TaxaFixa_Sup": taxa_fixa_sup,
        "Subterranea": K_SUBTERRANEA,
        "Con_Sub": consumo_sub,
        "TaxaUso_Sub": taxa_uso_sub,
        "TaxaFixa_Sub": taxa_fixa_sub,
        "Valor": (
            (invoice.pago_mes_sub or DEFAULT_EMPTY_TIPO_AGUA)
            + (invoice.pago_mes_sup or DEFAULT_EMPTY_TIPO_AGUA)
        )
        or DEFAULT_EMPTY_TIPO_AGUA,
        "IVA": invoice.iva,
        "valor_IVA": (
            (invoice.pago_iva_sub or DEFAULT_EMPTY_TIPO_AGUA)
            + (invoice.pago_iva_sup or DEFAULT_EMPTY_TIPO_AGUA)
        )
        or DEFAULT_EMPTY_TIPO_AGUA,
        "Multa": invoice.juros,
        "Valor final": invoice.pago_iva,
    }


def build_filename() -> str:
    today = dates.today().strftime("%y%m%d")
    return f"{today}_facturas_primavera"
