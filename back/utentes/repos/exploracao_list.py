from sqlalchemy.orm import relationship

from utentes.erp.model import ExploracaosERP
from utentes.models.exploracao import Exploracao


class ExploracaoList(Exploracao):
    fontes = None
    actividade = relationship(
        "ActividadeBase", cascade="all, delete-orphan", lazy="joined", uselist=False
    )
    __mapper_args__ = {"exclude_properties": ["fontes"]}


class ExploracaoFacturacaoList(ExploracaoList):
    exploracao_erp = relationship(ExploracaosERP, lazy="joined", uselist=False)
