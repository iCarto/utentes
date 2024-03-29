from sqlalchemy import Column, ForeignKey, Integer, Numeric, Text, text

from utentes.lib.schema_validator.validator import Validator
from utentes.models.actividades_schema import ActividadeSchema
from utentes.models.base import PGSQL_SCHEMA_UTENTES, Base


class ActividadesReses(Base):
    __tablename__ = "actividades_reses"
    __table_args__ = {"schema": PGSQL_SCHEMA_UTENTES}

    gid = Column(
        Integer,
        primary_key=True,
        server_default=text("nextval('utentes.actividades_reses_gid_seq'::regclass)"),
    )
    actividade = Column(
        ForeignKey(
            "utentes.actividades_pecuaria.gid", ondelete="CASCADE", onupdate="CASCADE"
        ),
        nullable=False,
    )
    c_estimado = Column(Numeric(10, 2), nullable=False, doc="Consumo mensal estimado")
    reses_tipo = Column(Text, nullable=False, doc="Tipo de reses")
    reses_nro = Column(Integer, nullable=False, doc="Número de reses")
    c_res = Column(Numeric(10, 2), nullable=False, doc="Consumo res")
    observacio = Column(Text, doc="Observações")

    @staticmethod
    def create_from_json(json):
        res = ActividadesReses()
        res.update_from_json(json)
        return res

    def update_from_json(self, json):
        # actividade - handled by sqlalchemy relationship
        self.gid = json.get("id")
        self.c_estimado = json.get("c_estimado")
        self.reses_tipo = json.get("reses_tipo")
        self.reses_nro = json.get("reses_nro")
        self.c_res = json.get("c_res")
        self.observacio = json.get("observacio")

    def validate(self, json):
        validator = Validator(ActividadeSchema["Reses"])
        return validator.validate(json)
