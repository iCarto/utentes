import datetime
import decimal

from psycopg2.extras import DateRange
from pyramid.renderers import JSON


def date_adapter(obj, request=None):
    """Returns string in format 'yyyy-mm-dd' or None."""
    return obj.isoformat() if obj else None


def decimal_adapter(obj, request=None):
    return float(obj) if obj or (obj == 0) else None


def daterange_adapter(obj, request=None):
    lower = obj.lower if obj.lower_inc else obj.lower + datetime.timedelta(days=1)
    upper = obj.upper if obj.upper_inc else obj.upper - datetime.timedelta(days=1)
    return (lower, upper)


def factory():
    renderer = JSON()
    renderer.add_adapter(datetime.date, date_adapter)
    renderer.add_adapter(decimal.Decimal, decimal_adapter)
    renderer.add_adapter(DateRange, daterange_adapter)
    return renderer
