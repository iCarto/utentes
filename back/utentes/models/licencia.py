from sqlalchemy import Column, Date, ForeignKey, Integer, Numeric, Text, text

from utentes.lib.formatter.formatter import to_date, to_decimal
from utentes.models.base import PGSQL_SCHEMA_UTENTES, Base
from utentes.models.constants import (
    FLAT_FEE,
    IMPLIES_VALIDADE_ACTIVITY_STATES,
    IMPLIES_VALIDADE_FICHA_STATES,
)


class Licencia(Base):
    __tablename__ = "licencias"
    __table_args__ = {"schema": PGSQL_SCHEMA_UTENTES}

    gid = Column(
        Integer,
        primary_key=True,
        server_default=text("nextval('utentes.licencias_gid_seq'::regclass)"),
    )
    lic_nro = Column(Text, nullable=False, unique=True, doc="Número de Licença")
    tipo_agua = Column(Text, nullable=False, doc="Tipo de água")
    tipo_lic = Column(Text, nullable=False, doc="Tipo de Licença")
    n_licen_a = Column(Text, doc="Número de licença histórico")
    estado = Column(Text, nullable=False, doc="Estado")
    d_emissao = Column(Date, doc="Data de emissão")
    d_validade = Column(Date, doc="Data de validade")
    c_soli_tot = Column(Numeric(10, 2), doc="Consumo solicitado total")
    c_soli_int = Column(Numeric(10, 2), doc="Consumo solicitado intermédio")
    c_soli_fon = Column(Numeric(10, 2), doc="Consumo solicitado fontes")
    c_licencia = Column(Numeric(10, 2), doc="Consumo licenciado")
    c_real_tot = Column(Numeric(10, 2), doc="Consumo real total")
    c_real_int = Column(Numeric(10, 2), doc="Consumo real intermédio")
    c_real_fon = Column(Numeric(10, 2), doc="Consumo real fontes")
    taxa_fixa = Column(Numeric(10, 2), nullable=False, doc="Taxa fixa")
    taxa_uso = Column(Numeric(10, 2), nullable=False, doc="Taxa de uso")
    pago_mes = Column(Numeric(10, 2), doc="Valor pago mensual")
    iva = Column(Numeric(10, 2), nullable=False, doc="IVA")
    pago_iva = Column(Numeric(10, 2), doc="Valor com IVA")
    consumo_tipo = Column(
        Text, nullable=False, server_default=text(f"'{FLAT_FEE}'::text")
    )
    consumo_fact = Column(Numeric(10, 2), doc="Consumo facturado mensal")
    exploracao = Column(
        ForeignKey("utentes.exploracaos.gid", ondelete="CASCADE", onupdate="CASCADE"),
        nullable=False,
    )

    @staticmethod
    def create_from_json(json):
        l = Licencia()
        l.update_from_json(json)
        return l

    @staticmethod
    def implies_validate_activity(estado):
        # En realidad no deberían ser iguales validate_ficha y validate_activity
        # en validate_ficha sería sólo validar not null loc_provin, ...
        return estado in IMPLIES_VALIDADE_ACTIVITY_STATES

    @staticmethod
    def implies_validate_ficha(estado):
        return estado in IMPLIES_VALIDADE_FICHA_STATES

    def update_from_json(self, json):
        self.gid = json.get("id")
        self.lic_nro = json.get("lic_nro")
        self.tipo_agua = json.get("tipo_agua")
        self.tipo_lic = json.get("tipo_lic")
        self.finalidade = json.get("finalidade")
        self.n_licen_a = json.get("n_licen_a")
        self.estado = json.get("estado")
        self.d_emissao = to_date(json.get("d_emissao"))
        self.d_validade = to_date(json.get("d_validade"))
        self.c_soli_tot = to_decimal(json.get("c_soli_tot"))
        self.c_soli_int = to_decimal(json.get("c_soli_int"))
        self.c_soli_fon = to_decimal(json.get("c_soli_fon"))
        self.c_licencia = to_decimal(json.get("c_licencia"))
        self.c_real_tot = to_decimal(json.get("c_real_tot"))
        self.c_real_int = to_decimal(json.get("c_real_int"))
        self.c_real_fon = to_decimal(json.get("c_real_fon"))
        self.taxa_fixa = to_decimal(json.get("taxa_fixa"))
        self.taxa_uso = to_decimal(json.get("taxa_uso"))
        self.pago_mes = to_decimal(json.get("pago_mes"))
        self.iva = to_decimal(json.get("iva"))
        self.pago_iva = to_decimal(json.get("pago_iva"))
        self.consumo_tipo = json.get("consumo_tipo") or FLAT_FEE
        self.consumo_fact = to_decimal(json.get("consumo_fact"))

    def validate(self, json):
        return []
