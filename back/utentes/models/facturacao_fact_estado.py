# -*- coding: utf-8 -*-

from sqlalchemy import Column, Integer, Text

from .base import DeclarativeBase, PGSQL_SCHEMA_DOMAINS


class FacturacaoFactEstado(DeclarativeBase):
    __tablename__ = 'facturacao_fact_estado'
    __table_args__ = {u'schema': PGSQL_SCHEMA_DOMAINS}
    __mapper_args__ = {
        'order_by': ['category', 'ordering', 'key']
    }

    ESTADOS_FACTURABLES = ['Licenciada', 'Irregular', 'Utente de facto']

    category = Column(Text, nullable=False, primary_key=True)
    key = Column(Text, nullable=False, primary_key=True)
    value = Column(Text)
    ordering = Column(Integer)
    parent = Column(Text, primary_key=True)
    tooltip = Column(Text)

    def __json__(self, request):
        return {
            'category': self.category,
            'text': self.key,
            'alias': self.value,
            'order': self.ordering,
            'parent': self.parent,
            'tooltip': self.tooltip
        }