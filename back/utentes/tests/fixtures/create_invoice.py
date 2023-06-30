import datetime

from utentes.models.constants import MONTHLY, PENDING_PAYMENT
from utentes.models.exploracao import Exploracao
from utentes.models.facturacao import Facturacao
from utentes.models.licencia import Licencia
from utentes.services.invoice_service import BillingPeriodCalculator
from utentes.tests.utils.gid_generator import GIDGenerator


def create_test_invoice(exp: Exploracao, year, month, **kwargs) -> Facturacao:
    invoice = Facturacao()
    invoice.gid = GIDGenerator.next_facturacao()
    invoice.exploracao = exp.gid
    invoice.created_at = datetime.datetime(year, month, 1)
    invoice.updated_at = invoice.updated_at
    invoice.ano = year
    invoice.mes = month
    invoice.fact_estado = PENDING_PAYMENT
    invoice.fact_tipo = MONTHLY
    _fill_lic_invoice_data(invoice, exp.get_licencia("sup"))
    _fill_lic_invoice_data(invoice, exp.get_licencia("sub"))
    invoice.periodo_fact = BillingPeriodCalculator().theorical(
        invoice.consumo_tipo_sup or invoice.consumo_tipo_sub, invoice.fact_tipo
    )
    invoice.iva = 12.75
    invoice.juros = 1
    invoice.pago_iva = 1
    invoice.fact_id = invoice.gid
    invoice.fact_date = datetime.date(year, month, 5)
    for k, v in kwargs.items():
        setattr(invoice, k, v)
    return invoice


def _fill_lic_invoice_data(invoice: Facturacao, licencia: Licencia):
    if not licencia.c_licencia:
        return
    tipo_agua = licencia.tipo_agua[:3].lower()

    for field in ("c_licencia", "consumo_tipo"):
        setattr(invoice, f"{field}_{tipo_agua}", getattr(licencia, field))

    setattr(invoice, f"consumo_fact_{tipo_agua}", licencia.c_licencia)

    dummy_value = 1 if tipo_agua == "sup" else 2

    for field in ("taxa_fixa", "taxa_uso", "pago_mes", "pago_iva", "iva"):
        setattr(invoice, f"{field}_{tipo_agua}", dummy_value)
