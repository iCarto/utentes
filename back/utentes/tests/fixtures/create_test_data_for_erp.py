import datetime

from utentes.erp.model import ExploracaosERP
from utentes.models.constants import K_LICENSED, K_SUBTERRANEA, MONTHTLY
from utentes.models.exploracao import Exploracao
from utentes.models.facturacao import Facturacao
from utentes.models.facturacao_fact_estado import PENDING_PAYMENT
from utentes.models.licencia import Licencia
from utentes.models.utente import Utente
from utentes.services.id_service import calculate_lic_nro
from utentes.tests.fixtures.create_actividade import abastecemento
from utentes.tests.utils import domain_generator
from utentes.tests.utils.exp_id_generator import ExpIdGenerator
from utentes.tests.utils.gid_generator import GIDGenerator


def create_test_licencia(exp_id, **kwargs):
    licencia = Licencia()
    licencia.gid = GIDGenerator.next_licencia()
    licencia.tipo_agua = K_SUBTERRANEA
    licencia.c_licencia = 2

    licencia.estado = K_LICENSED  # Utente de facto UF
    for k, v in kwargs.items():
        setattr(licencia, k, v)
    licencia.lic_nro = calculate_lic_nro(exp_id, licencia.tipo_agua)
    # licencia.exploracao =
    return licencia


def create_test_utente():
    utente = Utente()
    utente.gid = GIDGenerator.next_utente()
    utente.nome = f"Utente {utente.gid}"
    utente.bi_di_pas = "012345678901I"
    utente.nuit = "012345678"
    utente.telefone = "827821780/873081514"
    utente.email = "utente@test.com"
    utente.sexo_gerente = "Outros"
    return utente


def create_test_exploracao(**kwargs):
    exp = Exploracao()
    exp.gid = GIDGenerator.next_exploracao()
    exp.exp_id = ExpIdGenerator.from_serial(exp.gid)
    exp.exp_name = f"Exploracao {exp.gid}"
    exp.estado_lic = K_LICENSED
    hydro_location = domain_generator.hydro_location()
    exp.loc_unidad = hydro_location.loc_unidad
    exp.loc_bacia = hydro_location.loc_bacia
    exp.loc_subaci = hydro_location.loc_subaci
    adm_location = domain_generator.adm_location()
    exp.loc_provin = adm_location.loc_provin
    exp.loc_distri = adm_location.loc_distri
    exp.loc_posto = adm_location.loc_posto
    exp.loc_nucleo = adm_location.loc_nucleo
    exp.fact_estado = "Pendente Emisão Factura (DF)"

    exp.actividade = abastecemento()
    exp.utente_rel = create_test_utente()
    exp.licencias.append(create_test_licencia(exp.exp_id))

    exp.sexo_gerente = "Outros"

    for k, v in kwargs.items():
        setattr(exp, k, v)
    return exp


def create_test_exploracao_erp(exp: Exploracao):
    exp_erp = ExploracaosERP()
    exp_erp.id = GIDGenerator.next_erp_client()
    exp_erp.exploracao_gid = exp.gid
    exp_erp.update_link_id(exp)
    return exp_erp


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


def create_test_invoice(exp: Exploracao, year, month, **kwargs):
    invoice = Facturacao()
    invoice.gid = GIDGenerator.next_facturacao()
    invoice.exploracao = exp.gid
    invoice.created_at = datetime.datetime(year, month, 1)
    invoice.updated_at = invoice.updated_at
    invoice.ano = year
    invoice.mes = month
    invoice.fact_estado = PENDING_PAYMENT
    invoice.fact_tipo = MONTHTLY
    _fill_lic_invoice_data(invoice, exp.get_licencia("sup"))
    _fill_lic_invoice_data(invoice, exp.get_licencia("sub"))
    invoice.iva = 12.75
    invoice.juros = 1
    invoice.pago_mes = 1
    invoice.pago_iva = 1
    invoice.fact_id = invoice.gid
    invoice.fact_date = datetime.date(year, month, 5)
    for k, v in kwargs.items():
        setattr(invoice, k, v)
    return invoice
