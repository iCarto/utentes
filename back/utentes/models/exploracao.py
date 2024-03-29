import json

from geoalchemy2 import Geometry
from geoalchemy2.functions import GenericFunction
from sqlalchemy import Column, ForeignKey, func, text
from sqlalchemy.dialects.postgresql import ARRAY
from sqlalchemy.dialects.postgresql.json import JSONB
from sqlalchemy.orm import column_property, relationship
from sqlalchemy.types import Date, DateTime, Integer, Numeric, Text

from utentes.lib.formatter.formatter import to_decimal
from utentes.lib.schema_validator.validation_exception import ValidationException
from utentes.models import constants as c
from utentes.models.actividade import Actividade
from utentes.models.base import (
    PGSQL_SCHEMA_UTENTES,
    Base,
    ColumnBooleanNotNull,
    update_area,
    update_array,
    update_geom,
)
from utentes.models.facturacao import Facturacao
from utentes.models.fonte import Fonte
from utentes.models.licencia import Licencia
from utentes.services import exp_size_billing_service, id_service


class ST_Multi(GenericFunction):
    name = "ST_Multi"
    type = Geometry


SPECIAL_CASES = ("gid",)

REQUERIMENTO_FIELDS = (
    "carta_re",
    "ficha_pe",
    "ident_pro",
    "certi_reg",
    "duat",
    "licen_am",
    "mapa",
    "licen_fu",
    "r_perf",
    "b_a_agua",
    "carta_re_v",
    "ficha_pe_v",
    "ident_pro_v",
    "certi_reg_v",
    "duat_v",
    "licen_am_v",
    "mapa_v",
    "licen_fu_v",
    "r_perf_v",
    "b_a_agua_v",
    "anali_doc",
    "soli_visit",
    "parecer_divisao",
    "p_tec",
    "p_tec_disp_hidrica",
    "doc_legal",
    "p_juri",
    "p_rel",
    "sexo_gerente",
    "req_obs",
    "created_at",
    "exp_name",
    "lic_imp",
    "d_soli",
    "d_ultima_entrega_doc",
)

FACTURACAO_FIELDS = ("fact_tipo", "pago_lic")
INVOICE_READ_ONLY = (
    "created_at",
    "billing_cyle",
    "fact_tipo",
    "periodo_fact",
    "gid",
    "id",
)


NORMAL_FIELDS = (
    "observacio",
    "loc_provin",
    "loc_distri",
    "loc_posto",
    "loc_nucleo",
    "loc_endere",
    "loc_divisao",
    "loc_bacia",
    "loc_subaci",
    "loc_rio",
    "cadastro_uni",
    "d_titulo",
    "d_proceso",
    "d_folha",
    "d_parcela",
    "d_area",
    "d_d_emis",
    "d_l_emis",
    "c_soli",
    "c_licencia",
    "c_real",
    "c_estimado",
)

READ_ONLY = ("created_at",)


class ExploracaoBase(Base):
    __tablename__ = "exploracaos"
    __table_args__ = {"schema": PGSQL_SCHEMA_UTENTES}

    gid = Column(
        Integer,
        primary_key=True,
        server_default=text("nextval('utentes.exploracaos_gid_seq'::regclass)"),
    )
    utente = Column(
        ForeignKey("utentes.utentes.gid", ondelete="CASCADE", onupdate="CASCADE"),
        nullable=False,
    )
    exp_id = Column(Text, nullable=False, unique=True, doc="Número da exploração")
    exp_id_historic = Column(ARRAY(Text), doc="Histórico de Número da exploração")
    exp_name = Column(Text, nullable=False, doc="Nome da exploração")
    estado_lic = Column(Text, nullable=False, doc="Estado")

    created_at = Column(
        DateTime,
        nullable=False,
        server_default=text("now()"),
        doc="Data creación requerimento",
    )

    actividade = relationship(
        "Actividade",
        cascade="all, delete-orphan",
        lazy="joined",
        # backref='exploracao_rel',
        uselist=False,
    )

    def __json__(self, request):
        # Workaround #1645
        actividade = self.actividade or {"id": None, "tipo": "Actividade non declarada"}
        return {
            "gid": self.gid,
            "exp_name": self.exp_name,
            "exp_id": self.exp_id,
            "actividade": actividade,
            "estado_lic": self.estado_lic,
        }


class ExploracaoGeom(ExploracaoBase):
    the_geom = Column(Geometry("MULTIPOLYGON", "32737"), index=True)
    geom_as_geojson = column_property(
        func.coalesce(func.ST_AsGeoJSON(func.ST_Transform(the_geom, 4326)), None)
    )

    def __json__(self, request):
        properties = {"exp_id": self.exp_id}
        the_geom = None
        if self.the_geom is not None:
            the_geom = json.loads(self.geom_as_geojson)
        return {"type": "Feature", "properties": properties, "geometry": the_geom}


class Exploracao(ExploracaoGeom):

    d_soli = Column(
        Date, nullable=False, server_default=text("now()"), doc="Data da solicitação"
    )
    d_ultima_entrega_doc = Column(
        Date,
        nullable=False,
        server_default=text("now()"),
        doc="Data de entrega da última documentação",
    )
    observacio = Column(Text, doc="Observações")
    d_titulo = Column(Text, doc="Número do título")
    d_proceso = Column(Text, doc="Número do processo")
    d_folha = Column(Text, doc="Número de folha")
    d_parcela = Column(Text, doc="Número de parcela")
    d_area = Column(Numeric(10, 4), doc="Área (ha)")
    d_d_emis = Column(Date, doc="Data de emissão")
    d_l_emis = Column(Text, doc="Local de emissão")
    loc_provin = Column(Text, doc="Província")
    loc_distri = Column(Text, doc="Distrito")
    loc_posto = Column(Text, doc="Posto administrativo")
    loc_nucleo = Column(Text, doc="Bairro")
    loc_endere = Column(Text, doc="Endereço")
    loc_divisao = Column(Text, doc="Divisão de Gestão da Bacia")
    loc_bacia = Column(Text, doc="Bacia")
    loc_subaci = Column(Text, doc="Sub-bacia")
    loc_rio = Column(Text, doc="Rio")
    cadastro_uni = Column(Text, doc="Número do cadastro unificado")
    c_soli = Column(Numeric(10, 2), doc="Consumo mensal solicitado ")
    c_licencia = Column(Numeric(10, 2), doc="Consumo mensal licenciado")
    c_real = Column(Numeric(10, 2), doc="Consumo mensal real")
    c_estimado = Column(Numeric(10, 2), doc="Consumo mensal estimado ")
    area = Column(Numeric(10, 4), doc="")

    carta_re = ColumnBooleanNotNull(doc="Carta de requerimento")
    ficha_pe = ColumnBooleanNotNull(doc="Ficha de pedido preenchida")
    ident_pro = ColumnBooleanNotNull(doc="Identificação do proprietário")
    certi_reg = ColumnBooleanNotNull(doc="Certificado de registo comercial")
    duat = ColumnBooleanNotNull(
        doc="DUAT ou declaração das estructuras locais (bairro)"
    )
    licen_am = ColumnBooleanNotNull(doc="Licença ambiental (se é preciso)")
    mapa = ColumnBooleanNotNull(doc="Mapa de localização")
    licen_fu = ColumnBooleanNotNull(
        doc="Licença de apertura de poço/furo  (se é preciso)"
    )
    r_perf = ColumnBooleanNotNull(doc="Relatório técnico de perforação (se é preciso)")
    b_a_agua = ColumnBooleanNotNull(doc="Boletim de análise de água")

    carta_re_v = ColumnBooleanNotNull(doc="Carta de requerimento (validada)")
    ficha_pe_v = ColumnBooleanNotNull(doc="Ficha de pedido preenchida (validada)")
    ident_pro_v = ColumnBooleanNotNull(doc="Identificação do proprietário (validada)")
    certi_reg_v = ColumnBooleanNotNull(
        doc="Certificado de registo comercial (validada)"
    )
    duat_v = ColumnBooleanNotNull(
        doc="DUAT ou declaração das estructuras locais (bairro) (validada)"
    )
    licen_am_v = ColumnBooleanNotNull(
        doc="Relatório técnico de perforação (se é preciso) (validada)"
    )
    mapa_v = ColumnBooleanNotNull(doc="Mapa de localização (validada)")
    licen_fu_v = ColumnBooleanNotNull(
        doc="Licença de apertura de poço/furo  (se é preciso) (validada)"
    )
    r_perf_v = ColumnBooleanNotNull(doc="Licença ambiental (se é preciso) (validada)")
    b_a_agua_v = ColumnBooleanNotNull(doc="Boletim de análise de água (validada)")

    anali_doc = ColumnBooleanNotNull(doc="Análise da documentação")
    soli_visit = ColumnBooleanNotNull(doc="Solicitação da vistoria")
    parecer_divisao = ColumnBooleanNotNull(doc="Parecer da Divisão")
    p_tec = ColumnBooleanNotNull(doc="Parecer técnico")
    p_tec_disp_hidrica = ColumnBooleanNotNull(
        doc="Avaliação disponibilidade hídrica (WEAP WAM-T)"
    )
    doc_legal = ColumnBooleanNotNull(doc="Documentação legal")
    p_juri = ColumnBooleanNotNull(doc="Parecer técnico")
    p_rel = ColumnBooleanNotNull(doc="Parecer de instituições relevantes")

    sexo_gerente = Column(
        Text, nullable=False, server_default="Outros", doc="Sexo do Gerente/Presidente"
    )
    req_obs = Column(JSONB, doc="Observações requerimento")
    ara = Column(Text, nullable=False, doc="ARA")

    fact_tipo = Column(
        Text,
        nullable=False,
        server_default=text("'Mensal'::text"),
        doc="Mensal/Trimestral/Anual",
    )
    pago_lic = ColumnBooleanNotNull(doc="Factura emisión licencia pagada")
    lic_imp = ColumnBooleanNotNull(doc="Licença impressa")

    utente_rel = relationship("Utente", lazy="joined")

    licencias = relationship(
        "Licencia", cascade="all, delete-orphan", lazy="joined", passive_deletes=True
    )
    fontes = relationship(
        "Fonte", cascade="all, delete-orphan", lazy="joined", passive_deletes=True
    )

    @staticmethod
    def create_from_json(request, body):
        e = Exploracao()
        e.update_from_json(request, body)
        return e

    def get_licencia(self, tipo):
        for lic in self.licencias:
            if lic.tipo_agua.upper().startswith(tipo.upper()):
                return lic
        return Licencia()

    def set_lic_state_and_exp_id(self, request, body):
        exp_id_to_use = self._which_exp_id_should_be_used(request, body)

        if self.exp_id and exp_id_to_use != self.exp_id:
            # por como funciona sqlalchemy si hacemos el append directamente
            # en el campo no se entera de que ha cambiado (es el mismo obj)
            # tenemos que asignarle otro objeto
            exp_id_historic = self.exp_id_historic[:] if self.exp_id_historic else []
            exp_id_historic.append(self.exp_id)
            self.exp_id_historic = exp_id_historic

        self.exp_id = exp_id_to_use
        for lic in self.licencias:
            lic.lic_nro = id_service.calculate_lic_nro(self.exp_id, lic.tipo_agua)
        if self.actividade and getattr(self.actividade, "cultivos", None):
            for cult in self.actividade.cultivos:
                cult.cult_id = id_service.replace_exp_id_in_code(
                    cult.cult_id, self.exp_id
                )
        if self.actividade and getattr(self.actividade, "tanques_piscicolas", None):
            for tanque in self.actividade.tanques_piscicolas:
                tanque.tanque_id = id_service.replace_exp_id_in_code(
                    tanque.tanque_id, self.exp_id
                )

        if body.get("state_to_set_after_validation"):
            new_state = body.get("state_to_set_after_validation")
            self.estado_lic = new_state
            for lic in self.licencias:
                lic.estado = new_state
        else:
            new_state = body.get("estado_lic")
            self.estado_lic = new_state

    def update_from_json_requerimento(self, request, data):
        self._update_requerimento_fields(data)
        self.set_lic_state_and_exp_id(request, data)
        self.pago_lic = False

    def update_from_json_renovacao(self, request, data):
        self.set_lic_state_and_exp_id(request, data)

        # Si no son nulos habré pasado por JuridicoDatos/Pendente Datos Renovacao
        # y al llegar a uno de estos estados debo actualizar datos en la exp.
        # Para no llamar directamente a api/exploracaos (puedo no tener todos los
        # campo de la exp) lo hago aqui.
        self.d_soli = data.get("d_soli")
        self.d_ultima_entrega_doc = data.get("d_ultima_entrega_doc")
        self.c_licencia = data.get("c_licencia")
        # Automatic update fact_tipo based on exploration consumption
        self.fact_tipo = exp_size_billing_service.get_billing_type(
            data.get("c_licencia")
        )
        for json_lic in data.get("licencias"):
            lic = self.get_licencia(json_lic["tipo_agua"])
            lic.tipo_lic = json_lic.get("tipo_lic")
            lic.d_emissao = json_lic.get("d_emissao")
            lic.d_validade = json_lic.get("d_validade")
            lic.c_licencia = to_decimal(json_lic.get("c_licencia"))
            # Automatic update consumo_tipo based on exploration consumption
            lic.consumo_tipo = exp_size_billing_service.get_consumption_type(
                data.get("c_licencia")
            )

    def update_from_json_facturacao(self, data):
        self.fact_tipo = data["fact_tipo"]
        self.pago_lic = data["pago_lic"]

        # get last factura emited order by date desc
        data["facturacao"] = sorted(
            data["facturacao"],
            key=lambda invoice: invoice["ano"] + invoice["mes"],
            reverse=True,
        )
        last_invoice = data["facturacao"][0]

        # complete licenca data with last factura values
        lic_sup = self.get_licencia("sup")
        lic_sup.consumo_tipo = last_invoice["consumo_tipo_sup"]
        lic_sup.taxa_fixa = last_invoice["taxa_fixa_sup"]
        lic_sup.taxa_uso = last_invoice["taxa_uso_sup"]
        lic_sup.consumo_fact = last_invoice["consumo_fact_sup"]
        lic_sup.iva = last_invoice["iva"]
        lic_sup.pago_mes = last_invoice["pago_mes_sup"]
        lic_sup.pago_iva = last_invoice["pago_iva_sup"]

        lic_sub = self.get_licencia("sub")
        lic_sub.consumo_tipo = last_invoice["consumo_tipo_sub"]
        lic_sub.taxa_fixa = last_invoice["taxa_fixa_sub"]
        lic_sub.taxa_uso = last_invoice["taxa_uso_sub"]
        lic_sub.consumo_fact = last_invoice["consumo_fact_sub"]
        lic_sub.iva = last_invoice["iva"]
        lic_sub.pago_mes = last_invoice["pago_mes_sub"]
        lic_sub.pago_iva = last_invoice["pago_iva_sub"]

        # update all facturacao elements
        for json_fact in data["facturacao"]:
            fact = next(
                (
                    factura
                    for factura in self.facturacao
                    if factura.gid == json_fact["id"]
                ),
                None,
            )
            for column in list(json_fact.keys()):
                if column in INVOICE_READ_ONLY:
                    continue
                setattr(fact, column, json_fact.get(column))
            fact.calculate_pagos()

    def update_from_json(self, request, data):
        self.gid = data.get("id")
        self.update_some_fields(request, data)
        self.the_geom = update_geom(self.the_geom, data)
        self.fact_tipo = data.get("fact_tipo") or "Mensal"
        self.pago_lic = data.get("pago_lic") or False

        self._update_requerimento_fields(data)
        update_area(self, data)
        self.update_and_validate_activity(data)

        # update relationships
        update_array(self.fontes, data.get("fontes"), Fonte.create_from_json)

        update_array(self.licencias, data.get("licencias"), Licencia.create_from_json)

        self.set_lic_state_and_exp_id(request, data)

    def update_some_fields(self, request, data):
        # Probablmente se podrían gestionar aquí sin problemas otras columnas
        # como c_soli que hace el to_decimal, pero no se ha probado. Queda para
        # futuros refactorings
        self.gid = data.get("id")
        for column in list(self.__mapper__.columns.keys()):
            if column in SPECIAL_CASES:
                continue
            if column not in NORMAL_FIELDS:
                continue
            setattr(self, column, data.get(column))

    def update_and_validate_activity(self, data):
        actividade_json = data.get("actividade")
        if data.get("geometry_edited"):
            actividade_json["area_exploracao_for_calcs"] = self.area
        actividade_json["exp_id"] = data.get("exp_id")

        if not self.actividade:
            actv = Actividade.create_from_json(actividade_json)
            msgs = self.validate_activity(actv, data.get("actividade"), data)
            if msgs:
                raise ValidationException({"error": msgs})
            self.actividade = actv
        elif self.actividade:
            msgs = self.validate_activity(self.actividade, actividade_json, data)
            if msgs:
                raise ValidationException({"error": msgs})
            self.actividade.update_from_json(actividade_json)

        if actividade_json.get("tipo") == c.K_AGRICULTURA:
            self.c_estimado = self.actividade.c_estimado

    def validate_activity(self, activity, attributes, data):
        msgs = []
        statuses = [
            Licencia.implies_validate_activity(lic["estado"])
            for lic in data["licencias"]
        ]
        if any(statuses):
            msgs = activity.validate(attributes)
        return msgs

    def __json__(self, request):
        the_geom = None
        if self.the_geom is not None:
            the_geom = json.loads(self.geom_as_geojson)

        payload = {
            "type": "Feature",
            "properties": {
                "id": self.gid,
                "exp_id": self.exp_id,
                "estado_lic": self.estado_lic,
                "actividade": self.actividade,
                "area": self.area,
                "fontes": self.fontes or [],
                "licencias": self.licencias,
                "utente": {},
            },
            "geometry": the_geom,
        }

        for column in REQUERIMENTO_FIELDS:
            payload["properties"][column] = getattr(self, column)

        for column in FACTURACAO_FIELDS:
            payload["properties"][column] = getattr(self, column)

        for column in NORMAL_FIELDS:
            payload["properties"][column] = getattr(self, column)

        if self.utente_rel:
            payload["properties"]["utente"] = self.utente_rel.own_columns_as_dict()

        if hasattr(self, "exploracao_erp"):
            payload["properties"]["primavera"] = True if self.exploracao_erp else False

        return payload

    def _update_requerimento_fields(self, data):
        for column in set(REQUERIMENTO_FIELDS) - set(READ_ONLY):
            setattr(self, column, data.get(column))
        if not self.sexo_gerente:
            self.sexo_gerente = data.get("utente", {}).get("sexo_gerente")

    def _which_exp_id_should_be_used(self, request, body):
        new_state = body.get("state_to_set_after_validation") or body.get("estado_lic")
        if not self.exp_id and not body.get("exp_id"):
            return id_service.calculate_new_exp_id(request, new_state)

        if new_state == self.estado_lic:
            return body.get("exp_id")

        if not self.estado_lic:
            return id_service.calculate_new_exp_id(request, new_state)

        if new_state == c.K_DE_FACTO or self.estado_lic == c.K_DE_FACTO:
            return id_service.calculate_new_exp_id(request, new_state)

        if new_state == c.K_USOS_COMUNS or self.estado_lic == c.K_USOS_COMUNS:
            return id_service.calculate_new_exp_id(request, new_state)

        return body.get("exp_id")


class ExploracaoConFacturacao(Exploracao):
    fontes = None
    actividade = relationship(
        "ActividadeBase",
        cascade="all, delete-orphan",
        lazy="joined",
        # backref='exploracao_rel',
        uselist=False,
    )

    facturacao = relationship(
        Facturacao,
        cascade="all, delete-orphan",
        lazy="joined",
        passive_deletes=True,
        order_by="Facturacao.exploracao, Facturacao.ano, Facturacao.mes",
    )

    __mapper_args__ = {"exclude_properties": ["fontes"]}

    def __json__(self, request):
        payload = super().__json__(request)
        payload["properties"]["facturacao"] = self.facturacao
        return payload
