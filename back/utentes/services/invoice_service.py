import datetime

from dateutil.relativedelta import relativedelta
from psycopg2.extras import DateRange

from utentes.lib.utils import dates
from utentes.models.constants import FLAT_FEE, INVOIZABLE_STATES, PER_UNIT
from utentes.models.exploracao import ExploracaoConFacturacao


THREE_MONTHS = relativedelta(months=3)
ONE_MONTH = relativedelta(months=1)
ONE_YEAR = relativedelta(years=1)


def is_invoizable_this_month(
    e: ExploracaoConFacturacao, periodo_fact, today: datetime.datetime = None
):

    if e.estado_lic not in INVOIZABLE_STATES:
        return False

    if periodo_fact[0] > periodo_fact[1]:
        return False

    today = today or dates.today()

    if e.fact_tipo == "Trimestral" and today.month not in {4, 7, 10, 1}:
        return False
    if e.fact_tipo == "Anual" and today.month != 1:
        return False

    if e.facturacao:
        last_billing_period = e.facturacao[-1].periodo_fact
        if today in last_billing_period:
            return False
        if dates.range_overlap(
            e.facturacao[-1].periodo_fact_normalized(), periodo_fact
        ):
            return False

    return True


def issue_or_creation(
    d_emissao: datetime.date, created_at: datetime.date
) -> datetime.date:
    # Workarounds to avoid troubles with d_emissao and created_at:
    # * Incorrect (in the future)
    # * Empty
    # * Issued this month before the new_invoice_cycle for this month. It's handled
    #   the next month generating two invoices (FLAT_FEE) or one (PER_UNIT)

    if d_emissao and d_emissao < dates.first_day_of_current_month():
        return d_emissao

    return created_at.date()


def daterange_factory(lower: datetime.date, upper: datetime.date) -> DateRange:
    return DateRange(lower, upper, "[]")


def daterange_for_current_month():
    return daterange_factory(
        dates.first_day_of_current_month(), dates.last_day_of_current_month()
    )


def daterange_for_current_quarter():
    return daterange_factory(*dates.quarter_range())


def daterange_for_current_year():
    today = dates.now()
    first_day_of_current_year = datetime.date(today.year, 1, 1)
    last_day_of_current_year = datetime.date(today.year, 12, 31)
    return daterange_factory(first_day_of_current_year, last_day_of_current_year)


def daterange_for_previous_month():
    current_month = daterange_for_current_month()
    return daterange_factory(
        current_month.lower - ONE_MONTH,
        current_month.upper - ONE_MONTH + relativedelta(day=31),
    )


def daterange_for_previous_quarter():
    current_quarter = daterange_for_current_quarter()
    return daterange_factory(
        current_quarter.lower - THREE_MONTHS,
        current_quarter.upper - THREE_MONTHS + relativedelta(day=31),
    )


def daterange_for_previous_year():
    current_year = daterange_for_current_year()
    return daterange_factory(
        current_year.lower - ONE_YEAR, current_year.upper - ONE_YEAR
    )


class BillingPeriodCalculator(object):
    def __init__(self):
        self.data = {
            FLAT_FEE: {
                "Mensal": daterange_for_current_month(),
                "Trimestral": daterange_for_current_quarter(),
                "Anual": daterange_for_current_year(),
            },
            PER_UNIT: {
                "Mensal": daterange_for_previous_month(),
                "Trimestral": daterange_for_previous_quarter(),
                "Anual": daterange_for_previous_year(),
            },
        }

    def theorical(self, consumo_tipo, fact_tipo):
        return self.data[consumo_tipo][fact_tipo]

    def real(self, consumo_tipo, fact_tipo, d_emissao, created_at, previous_invoice):
        theorical = self.theorical(consumo_tipo, fact_tipo)

        # The lower bound of the period will be the theorical
        lower = theorical.lower

        # or later if the license was emitted or created after the theorical date
        # As DE_FACTO does not have d_emissao, the lowest possible date to start invocing
        # those licenses will be the created_at field for those directly created or the
        # last state set date in req_obs. We simplify to use only created_at
        issue_or_creation_date = issue_or_creation(d_emissao, created_at)
        lower = max(lower, issue_or_creation_date)

        # But if there is a previous invoice that date takes precedence and we just make
        # the invoice from the next day
        if previous_invoice:
            previous_invoice_next_day_date = previous_invoice[1] + relativedelta(days=1)
            lower = min(lower, previous_invoice_next_day_date)

        # Renovaciones: Sólo LICENCIADA se renueva por tanto siempre habrá un
        # previous_invoice y tendrá precedencia sobre el nuevo d_emissao. En caso de
        # cambio de consumo_tipo o fact_tipo sigue siendo como un caso normal

        return DateRange(lower, theorical.upper, "[]")
