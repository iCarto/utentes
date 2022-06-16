from sqlalchemy import Column, ForeignKey, UniqueConstraint, func, text
from sqlalchemy.dialects.postgresql import DATERANGE, JSONB
from sqlalchemy.ext.hybrid import hybrid_property
from sqlalchemy.sql.expression import and_, case, null
from sqlalchemy.types import Boolean, Date, DateTime, Integer, Numeric, Text

from utentes.lib import json_renderer
from utentes.lib.utils.dates import (
    diff_month_include_upper,
    is_full_natural_year,
    is_same_month,
)
from utentes.models.base import PGSQL_SCHEMA_UTENTES, Base
from utentes.models.constants import FLAT_FEE, INVOICE_STATE_PENDING_CONSUMPTION


class Facturacao(Base):
    __tablename__ = "facturacao"
    __table_args__ = (
        UniqueConstraint("exploracao", "ano", "mes"),
        {"schema": PGSQL_SCHEMA_UTENTES},
    )

    gid = Column(
        Integer,
        primary_key=True,
        server_default=text("nextval('utentes.facturacao_gid_seq'::regclass)"),
    )
    exploracao = Column(
        ForeignKey("utentes.exploracaos.gid", ondelete="CASCADE", onupdate="CASCADE"),
        nullable=False,
    )
    # exploracao = Column(Integer, nullable=False)
    created_at = Column(DateTime, nullable=False, server_default=text("now()"))
    updated_at = Column(DateTime, nullable=False, server_default=text("now()"))

    ano = Column(
        Text, nullable=False, server_default=text("to_char(now(), 'YYYY'::text)")
    )
    mes = Column(
        Text, nullable=False, server_default=text("to_char(now(), 'MM'::text)")
    )
    observacio = Column(JSONB)
    fact_estado = Column(
        Text,
        nullable=False,
        server_default=text(f"'{INVOICE_STATE_PENDING_CONSUMPTION}'::text"),
    )
    fact_tipo = Column(Text, nullable=False, server_default=text("'Mensal'::text"))
    pago_lic = Column(Boolean)
    c_licencia_sup = Column(Numeric(10, 2))
    c_licencia_sub = Column(Numeric(10, 2))
    consumo_tipo_sup = Column(
        Text, nullable=False, server_default=text(f"'{FLAT_FEE}'::text")
    )
    consumo_fact_sup = Column(Numeric(10, 2))
    taxa_fixa_sup = Column(Numeric(10, 2))
    taxa_uso_sup = Column(Numeric(10, 2))
    pago_mes_sup = Column(Numeric(10, 2))
    pago_iva_sup = Column(Numeric(10, 2))
    consumo_tipo_sub = Column(
        Text, nullable=False, server_default=text(f"'{FLAT_FEE}'::text")
    )
    consumo_fact_sub = Column(Numeric(10, 2))
    taxa_fixa_sub = Column(Numeric(10, 2))
    taxa_uso_sub = Column(Numeric(10, 2))
    pago_mes_sub = Column(Numeric(10, 2))
    pago_iva_sub = Column(Numeric(10, 2))
    iva = Column(Numeric(10, 2))
    juros = Column(Numeric(10, 2))
    pago_mes = Column(Numeric(10, 2))
    pago_iva = Column(Numeric(10, 2))
    fact_id = Column(Text, unique=True)
    recibo_id = Column(Text, unique=True)
    fact_date = Column(Date)
    recibo_date = Column(Date)
    periodo_fact = Column(DATERANGE)

    def has_water_type(self, _water_type: str) -> bool:
        """Returns true if the invoice has the water type.

        TODO: This method is error prone, but tries to stablish a common way to
        check this situation, based on check that c_licencia_x, taxa_fixa_x and
        taxa_uso_x are not empty for this invoice.

        Args:
            _water_type: A string like 'Sup', 'Superficial', 'sup', ...

        Returns:
            true if this invoice has data for this kind of water type
        """
        water_type = _water_type[:3].lower()
        template_atts_to_eval = ("c_licencia_", "taxa_fixa_", "taxa_uso_")
        atts_to_eval = [f"{att}{water_type}" for att in template_atts_to_eval]
        return all(getattr(self, att) is not None for att in atts_to_eval)

    def billing_period(self) -> str:
        """Calculates the string representation of the billing period."""
        periodo_fact = self.periodo_fact_normalized()

        periodo_fact_lower_str = periodo_fact[0].strftime("%m/%Y")
        periodo_fact_upper_str = periodo_fact[1].strftime("%m/%Y")

        if is_same_month(periodo_fact[0], periodo_fact[1]):
            return periodo_fact_lower_str

        if is_full_natural_year(periodo_fact[0], periodo_fact[1]):
            return periodo_fact[0].strftime("%Y")

        return f"{periodo_fact_lower_str} - {periodo_fact_upper_str}"

    def periodo_fact_normalized(self):
        return json_renderer.daterange_adapter(self.periodo_fact)

    @hybrid_property
    def consumo(self):
        # es la suma del consumo facturado para la licencia subterránea y el consumo
        # facturado para la licencia superficial. En caso de que no hayan introducido
        # ningún consumo facturado en la factura, entonces el consumo facturado es el
        # consumo licenciado
        return case(
            [
                (
                    and_(
                        self.consumo_fact_sub == null(), self.consumo_fact_sup == null()
                    ),
                    self.consumo_lic,
                )
            ],
            else_=func.coalesce(self.consumo_fact_sub, 0)
            + func.coalesce(self.consumo_fact_sup, 0),
        )

    @hybrid_property
    def consumo_lic(self):
        # es la suma del consumo licenciado para la licencia subterránea y el consumo
        # licenciado para la licencia superficial
        return func.coalesce(self.c_licencia_sub, 0) + func.coalesce(
            self.c_licencia_sup, 0
        )

    def calculate_pagos(self):
        self._calcula_pagos_lic("sup")
        self._calcula_pagos_lic("sub")

        self.pago_mes = ((self.pago_mes_sub or 0) + (self.pago_mes_sup or 0)) or None
        self.pago_iva = (
            ((self.pago_iva_sub or 0) + (self.pago_iva_sup or 0))
            * (1 + float(self.juros) / 100)
        ) or None

    def __json__(self, request):
        result = super().__json__(request)
        result["billing_period"] = self.billing_period()
        return result

    def _calcula_pagos_lic(self, tipo_agua):
        taxa_fixa = float(getattr(self, f"taxa_fixa_{tipo_agua}", 0) or 0)
        taxa_uso = float(getattr(self, f"taxa_uso_{tipo_agua}", 0) or 0)
        consumo_fact = float(getattr(self, f"consumo_fact_{tipo_agua}", 0) or 0)
        iva = float(self.iva or 0)
        pago_mes = (taxa_fixa + taxa_uso * consumo_fact) * self._month_factor()
        pago_iva = pago_mes * (1 + iva / 100)

        # Sets pago_mes, pago_iva to None if 0 or any needed value is None
        setattr(self, f"pago_mes_{tipo_agua}", pago_mes or None)
        setattr(self, f"pago_iva_{tipo_agua}", pago_iva or None)

    def _month_factor(self):
        lower, upper = self.periodo_fact_normalized()
        return diff_month_include_upper(lower, upper)
