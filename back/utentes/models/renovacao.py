from sqlalchemy import Column, Date, ForeignKey, Integer, Numeric, Text, text
from sqlalchemy.dialects.postgresql.json import JSONB

from utentes.models.base import PGSQL_SCHEMA_UTENTES, Base, ColumnBooleanNotNull


class Renovacao(Base):
    __tablename__ = "renovacoes"
    __table_args__ = {"schema": PGSQL_SCHEMA_UTENTES}
    __eager_defaults__ = (
        "carta_ren",
        "carta_ren_v",
        "ident_pro",
        "ident_pro_v",
        "certi_reg",
        "certi_reg_v",
        "duat",
        "duat_v",
        "anali_doc",
        "soli_visit",
        "parecer_divisao",
        "p_tec",
        "doc_legal",
        "p_juri",
        "p_rel",
        "lic_imp",
        "obser",
    )

    gid = Column(
        Integer,
        primary_key=True,
        server_default=text("nextval('utentes.renovacoes_gid_seq'::regclass)"),
    )

    exp_id = Column(Text, nullable=False, unique=True, doc="Número da exploração")

    d_soli = Column(Date, doc="Data da solicitação")
    d_ultima_entrega_doc = Column(
        Date,
        nullable=False,
        server_default=text("now()"),
        doc="Data de entrega da última documentação",
    )

    estado = Column(Text, doc="Estado renovação")

    carta_ren = ColumnBooleanNotNull(doc="Carta de requerimento de renovação")
    carta_ren_v = ColumnBooleanNotNull(
        doc="Carta de requerimento de renovação (validada)"
    )

    ident_pro = ColumnBooleanNotNull(doc="Identificação do propietário")
    ident_pro_v = ColumnBooleanNotNull(doc="Identificação do propietário (validada)")

    certi_reg = ColumnBooleanNotNull(doc="Certificado de registo comercial")
    certi_reg_v = ColumnBooleanNotNull(
        doc="Certificado de registo comercial (validada)"
    )

    duat = ColumnBooleanNotNull(
        doc="DUAT ou declaração das estructuras locais (bairro)"
    )
    duat_v = ColumnBooleanNotNull(
        doc="DUAT ou declaração das estructuras locais (bairro) (validada)"
    )

    anali_doc = ColumnBooleanNotNull(doc="Análise da documentação")
    soli_visit = ColumnBooleanNotNull(doc="Solicitação da visitoria")
    parecer_divisao = ColumnBooleanNotNull(doc="Parecer da Divisão")
    p_tec = ColumnBooleanNotNull(doc="Parecer técnico")
    doc_legal = ColumnBooleanNotNull(doc="Documentação legal")
    p_juri = ColumnBooleanNotNull(doc="Parecer técnico")

    p_rel = ColumnBooleanNotNull(doc="Parecer de instituições relevantes")
    lic_imp = ColumnBooleanNotNull(doc="Licença impressa")

    obser = Column(JSONB, doc="Observações renovacao")

    tipo_lic_sup_old = Column(
        Text, nullable=False, doc="Tipo de Licença superficial previa"
    )
    d_emissao_sup_old = Column(Date, doc="Data de emissão superficial previa")
    d_validade_sup_old = Column(Date, doc="Data de validade superficial previa")
    c_licencia_sup_old = Column(
        Numeric(10, 2), doc="Consumo licenciado superficial previo"
    )
    consumo_fact_sup_old = Column(
        Numeric(10, 2), doc="Consumo facturado superficial previo"
    )

    tipo_lic_sup = Column(Text, nullable=False, doc="Tipo de Licença superficial")
    d_emissao_sup = Column(Date, doc="Data de emissão superficial")
    d_validade_sup = Column(Date, doc="Data de validade superficial")
    c_licencia_sup = Column(Numeric(10, 2), doc="Consumo licenciado superficial")

    tipo_lic_sub_old = Column(
        Text, nullable=False, doc="Tipo de Licença subterrânea previa"
    )
    d_emissao_sub_old = Column(Date, doc="Data de emissão subterrânea previa")
    d_validade_sub_old = Column(Date, doc="Data de validade subterrânea previa")
    c_licencia_sub_old = Column(
        Numeric(10, 2), doc="Consumo licenciado subterrânea previo"
    )
    consumo_fact_sub_old = Column(
        Numeric(10, 2), doc="Consumo facturado subterrâneo previo"
    )

    tipo_lic_sub = Column(Text, nullable=False, doc="Tipo de Licença subterrânea")
    d_emissao_sub = Column(Date, doc="Data de emissão subterrânea")
    d_validade_sub = Column(Date, doc="Data de validade subterrânea")
    c_licencia_sub = Column(Numeric(10, 2), doc="Consumo licenciado subterrânea")

    exploracao = Column(
        ForeignKey("utentes.exploracaos.gid", ondelete="CASCADE", onupdate="CASCADE"),
        nullable=False,
    )

    def update_from_json(self, json):
        renovacao = json.get("renovacao")
        for column in set(self.__mapper__.columns.keys()) - {"gid"}:
            setattr(self, column, renovacao.get(column))

    def update_from_json_renovacao(self, json):
        self.exploracao = json.get("id")
        self.update_from_json(json)
