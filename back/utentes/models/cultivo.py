import json

from geoalchemy2 import Geometry
from sqlalchemy import Column, ForeignKey, Integer, Numeric, Text, func, text
from sqlalchemy.orm import column_property

from utentes.lib.schema_validator.validator import Validator
from utentes.models.actividades_schema import ActividadeSchema
from utentes.models.base import PGSQL_SCHEMA_UTENTES, Base, update_area, update_geom


class ActividadesCultivos(Base):
    __tablename__ = "actividades_cultivos"
    __table_args__ = {"schema": PGSQL_SCHEMA_UTENTES}

    gid = Column(
        Integer,
        primary_key=True,
        server_default=text(
            "nextval('utentes.actividades_cultivos_gid_seq'::regclass)"
        ),
    )
    cult_id = Column(Text, nullable=False, unique=True, doc="Id de cultura")
    actividade = Column(
        ForeignKey(
            "utentes.actividades_agricultura_rega.gid",
            ondelete="CASCADE",
            onupdate="CASCADE",
        ),
        nullable=False,
    )
    c_estimado = Column(Numeric(10, 2), nullable=False, doc="Consumo mensal estimado")
    cultivo = Column(Text, nullable=False, doc="Tipo de cultura")
    rega = Column(Text, nullable=False, doc="Tipo de rega")
    eficiencia = Column(Numeric(10, 2), doc="Eficiência da rega")
    area = Column(Numeric(10, 4), nullable=False, doc="Área (ha)")
    observacio = Column(Text, doc="Observações")
    the_geom = Column(Geometry("MULTIPOLYGON", "32737"), index=True)
    geom_as_geojson = column_property(
        func.coalesce(func.ST_AsGeoJSON(func.ST_Transform(the_geom, 4326)), None)
    )

    @staticmethod
    def create_from_json(data):
        cultivo = ActividadesCultivos()
        cultivo.update_from_json(data)
        return cultivo

    def update_from_json(self, data):
        # actividade - handled by sqlalchemy relationship
        self.gid = data.get("id")
        self.cult_id = data.get("cult_id")
        self.c_estimado = data.get("c_estimado")
        self.cultivo = data.get("cultivo")
        self.rega = data.get("rega")
        self.eficiencia = data.get("eficiencia")
        self.area = data.get("area")
        self.observacio = data.get("observacio")
        self.the_geom = update_geom(self.the_geom, data)
        update_area(self, data, empty_value=0)  # #3008
        if data.get("geometry_edited"):
            if (
                self.area is None or self.area == 0
            ):  # avoid error between float and Decimal in the else
                self.c_estimado = 0
            elif self.rega == "Regional":
                self.c_estimado = self.area * 10000 / 12
            elif self.eficiencia is None:
                self.c_estimado = 0
            else:
                self.c_estimado = (self.area * 30 * 86400 * 0.21) / (
                    1000 * self.eficiencia
                )

    def validate(self, data):
        validator = Validator(ActividadeSchema["Cultivos"])
        return validator.validate(data)

    def __json__(self, request):
        the_geom = None
        if self.the_geom is not None:
            the_geom = json.loads(self.geom_as_geojson)
        return {
            "type": "Feature",
            "properties": {
                "id": self.gid,
                "cult_id": self.cult_id,
                "actividade": self.actividade,
                "c_estimado": self.c_estimado,
                "cultivo": self.cultivo,
                "rega": self.rega,
                "eficiencia": self.eficiencia,
                "area": self.area,
                "observacio": self.observacio,
            },
            "geometry": the_geom,
        }
