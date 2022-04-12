from sqlalchemy import Column, Integer, Text

from utentes.models.base import PGSQL_SCHEMA_DOMAINS, DeclarativeBase


LICENSED = "Licenciada"
DE_FACTO = "Utente de facto"
PENDING_RENOV_LICENSE = "Pendente Renovação da licença (DARH)"
PENDING_REVIEW_DIR = "Pendente Revisão Renovação (Direcção)"
PENDING_REVIEW_DJ = "Pendente Análise Renovação Licença (DSU-J)"
PENDING_TECH_DECISION = "Pendente Parecer Técnico Renovação (DRH)"
PENDING_EMIT_LICENSE = "Pendente Emissão Renovação Licença (DSU-J)"
PENDING_DADOS_LICENSE = "Pendente Dados Renovação Licença (DSU-J)"
PENDING_DIR_SIGN = "Pendente Firma Renovação Licença (Direcção)"
NOT_APPROVED = "Não aprovada"

FINISHED_RENOVACAO_STATES = (LICENSED, DE_FACTO, NOT_APPROVED)


class EstadoRenovacao(DeclarativeBase):
    __tablename__ = "licencia_estado_renovacao"
    __table_args__ = {"schema": PGSQL_SCHEMA_DOMAINS}

    category = Column(Text, nullable=False, primary_key=True)
    key = Column(Text, nullable=False, primary_key=True)
    value = Column(Text)
    ordering = Column(Integer)
    parent = Column(Text, primary_key=True)
    tooltip = Column(Text)

    def __json__(self, request):
        return {
            "category": self.category,
            "text": self.key,
            "alias": self.value,
            "order": self.ordering,
            "parent": self.parent,
            "tooltip": self.tooltip,
        }
