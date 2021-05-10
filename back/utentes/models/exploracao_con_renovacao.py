import json

from sqlalchemy.orm import relationship

from utentes.models.exploracao import ExploracaoConFacturacao
from utentes.models.renovacao import Renovacao


class ExpConRenovacao(ExploracaoConFacturacao):

    actividade = relationship(
        "Actividade",
        cascade="all, delete-orphan",
        lazy="joined",
        # backref='exploracao_rel',
        uselist=False,
    )

    renovacao = relationship(
        "Renovacao",
        cascade="all, delete-orphan",
        # primaryjoin="ExpConRenovacao.gid == Renovacao.exploracao",
        lazy="joined",
        passive_deletes=True,
    )

    def update_from_json_renovacao(self, data):
        self.exploracao = data.get("id")
        renovacao = data.get("renovacao")
        for column in set(Renovacao.__mapper__.columns.keys()) - {"gid"}:
            setattr(self, column, renovacao.get(column))

    def __json__(self, request):
        the_geom = None
        if self.the_geom is not None:
            the_geom = json.loads(self.geom_as_geojson)

        renovacao = self.renovacao or {}
        properties = {}

        properties = {c: getattr(self, c) for c in list(self.__mapper__.columns.keys())}
        del properties["the_geom"]
        del properties["gid"]
        properties["id"] = self.gid
        properties["licencias"] = [l.__json__(request) for l in self.licencias]
        properties["actividade"] = self.actividade
        properties["fontes"] = self.fontes
        properties["facturacao"] = [f.__json__(request) for f in self.facturacao]

        properties["renovacao"] = []
        if renovacao:
            for idx, val in enumerate(renovacao):
                properties["renovacao"].append(renovacao[idx].__json__(request))

        if self.utente_rel:
            properties["utente"] = self.utente_rel.own_columns_as_dict()

        return {"type": "Feature", "properties": properties, "geometry": the_geom}
