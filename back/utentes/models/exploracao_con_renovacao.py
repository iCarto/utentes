from sqlalchemy.orm import relationship

from utentes.models.exploracao import Exploracao


class ExpConRenovacao(Exploracao):
    fontes = None
    __mapper_args__ = {"exclude_properties": ["fontes"]}

    renovacao = relationship(
        "Renovacao", cascade="all, delete-orphan", lazy="joined", passive_deletes=True
    )

    def __json__(self, request):
        payload = super().__json__(request)
        payload["properties"]["renovacao"] = self.renovacao[0]
        return payload
