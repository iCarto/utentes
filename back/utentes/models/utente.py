from sqlalchemy import Column, Date, Integer, Text, text
from sqlalchemy.orm import relationship

from utentes.models.base import PGSQL_SCHEMA_UTENTES, Base


SPECIAL_CASES = ("gid",)


class Utente(Base):
    __tablename__ = "utentes"
    __table_args__ = {"schema": PGSQL_SCHEMA_UTENTES}

    gid = Column(
        Integer,
        primary_key=True,
        server_default=text("nextval('utentes.utentes_gid_seq'::regclass)"),
    )
    nome = Column(Text, nullable=False, unique=True, doc="Nome")
    uten_tipo = Column(Text, doc="Tipo de utente")
    nuit = Column(Text, unique=True, doc="Nuit")
    uten_gere = Column(Text, doc="Nome do Gerente/Presidente")
    sexo_gerente = Column(Text, nullable=False, doc="Sexo do Gerente/Presidente")
    uten_memb = Column(Integer, doc="Número de membros")
    uten_mulh = Column(Integer, doc="Número de mulheres")
    contacto = Column(Text, doc="Pessoa de contacto")
    email = Column(Text, doc="Email")
    telefone = Column(Text, doc="Telefone")
    bi_di_pas = Column(Text, doc="BI / Dire / Passaporte")
    bi_d_emis = Column(Date, doc="Data de emissão")
    bi_l_emis = Column(Text, doc="Local de emissão")
    loc_provin = Column(Text, doc="Província")
    loc_distri = Column(Text, doc="Distrito")
    loc_posto = Column(Text, doc="Posto administrativo")
    loc_nucleo = Column(Text, doc="Bairro")
    loc_endere = Column(Text, doc="Endereço")
    reg_comerc = Column(Text, doc="Número de Registo Comercial")
    reg_zona = Column(Text, doc="Local do registo")
    observacio = Column(Text, doc="Observações da actividade")

    exploracaos = relationship(
        "ExploracaoBase",
        lazy="joined",
        cascade="all, delete-orphan",
        passive_deletes="True",
    )

    @staticmethod
    def create_from_json(json):
        u = Utente()
        u.update_from_json(json)
        return u

    def update_from_json(self, json):
        self.gid = json.get("id")
        for column in list(self.__mapper__.columns.keys()):
            if column in SPECIAL_CASES:
                continue
            setattr(self, column, json.get(column))

    def own_columns_as_dict(self):
        payload = {"id": self.gid}
        for column in list(self.__mapper__.columns.keys()):
            if column in SPECIAL_CASES:
                continue
            payload[column] = getattr(self, column)

        return payload

    def __json__(self, request):
        payload = self.own_columns_as_dict()
        payload["exploracaos"] = self.exploracaos
        return payload
