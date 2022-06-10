"""Notes about this module.

quarter is always referred to natural quarters yyyy-01-01 to yyyy-03-31, yyyy-04-01 to
yyyy-06-30, ...
"""

import datetime
from typing import Tuple

from dateutil import rrule
from dateutil.relativedelta import relativedelta


def diff_month(d1, d2) -> int:
    return abs((d1.year - d2.year) * 12 + d1.month - d2.month)  # noqa: WPS221


def diff_month_include_upper(d1, d2) -> int:
    return diff_month(d1, d2) + 1


def now() -> datetime.datetime:
    return datetime.datetime.now()
    # return datetime.datetime(2022, 4, 5)


def today() -> datetime.date:
    return datetime.date.today()
    # return datetime.date(2022, 4, 5)


def first_day_of_current_month():
    return today() + relativedelta(day=1)


def quarter_range(
    d: datetime.date = None,
) -> Tuple[datetime.datetime, datetime.datetime]:
    """Returns the first and last date for the quarter d is within."""
    # https://stackoverflow.com/a/13766929/930271
    # https://github.com/adamjstewart/fiscalyear
    # https://stackoverflow.com/a/37708216/930271
    if d:
        this_date = datetime.datetime(d.year, d.month, d.day)
    else:
        this_date = now()

    year = this_date.year
    quarters = rrule.rrule(
        rrule.MONTHLY,
        bymonth=(1, 4, 7, 10),
        bysetpos=-1,
        dtstart=datetime.datetime(year, 1, 1),
        count=8,  # to avoid issues with next year, but 5 should be enougth
    )

    first_day = quarters.before(this_date)
    last_day = quarters.after(this_date) - relativedelta(days=1)
    return (first_day.date(), last_day.date())


def last_day_of_current_month():
    # https://stackoverflow.com/a/14994380/930271
    return today() + relativedelta(day=31)


def last_day_of_month(year, month):
    return datetime.date(year, month, 1) + relativedelta(day=31)


def quarter_ordinal(d: datetime.date = None):
    """Returns the ordinal (1 to 4) for the quarter in which d is.

    If d is not given today() is used
    """
    month = d.month if d else today().month
    return (month - 1) // 3 + 1


def is_same_month(d1: datetime.date, d2: datetime.date):
    return diff_month(d1, d2) == 0


def is_full_natural_year(d1: datetime.date, d2: datetime.date):
    return d1.year == d2.year and d1.month == d2.month


def range_overlap(r1, r2):
    # https://stackoverflow.com/questions/9044084/
    # https://stackoverflow.com/questions/325933/
    # https://stackoverflow.com/questions/6821156/
    latest_start = max(r1[0], r2[0])
    earliest_end = min(r1[1], r2[1])
    return latest_start < earliest_end
