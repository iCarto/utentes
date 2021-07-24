import datetime
import math

import dateutil


class IsNotNull(object):
    def fails(self, value):
        return value is None


class IsDate(object):
    """
    The received value is a valid datetime.date object or can be parsed with
    dateutil.parser. This allows strings in ISO8601 or RFC3329 or others
    """

    def fails(self, value):
        if not value:
            return False
        if isinstance(value, (datetime.date, datetime.datetime)):
            return False
        try:
            dateutil.parser.parse(value)
        except Exception:
            return True

        return False


class IsNumeric(object):
    """
    The received value is the representation of a number.
    So '5' is considered valid
    """

    def fails(self, value):
        if not value and value != 0:
            return False
        try:
            float(value)
        except Exception:
            return True
        return False


class IntLessThan8(object):
    """
    The int part of the received number has less that
    8 digits
    """

    def fails(self, value):
        if not value and value != 0:
            return False
        try:
            int_length = len(str(math.trunc(value)))
        except Exception:
            return True
        return int_length > 8


class IsBoolean(object):
    """
    Value is a proper boolean.
    """

    def fails(self, value):
        return value not in {True, False, None}


class IsArrayNotVoid(object):
    def fails(self, value):
        return not (isinstance(value, list) and value)


class Validator(object):
    def __init__(self, schema):
        self.messages = []
        self.schema = schema
        self.rules = {
            "NOT_NULL": IsNotNull(),
            "IS_DATE": IsDate(),
            "IS_NUMERIC": IsNumeric(),
            "IS_BOOLEAN": IsBoolean(),
            "ARRAY_NOT_VOID": IsArrayNotVoid(),
            "INT_LESS_THAN_8": IntLessThan8(),
        }

    def append_schema(self, schema):
        self.schema.extend(schema)

    def validate(self, model):
        self.messages = []

        for definition in self.schema:
            for rulename in definition["rules"]:
                rule = self.get_rule(rulename)
                rule_fails_for = rule["fails"] if isinstance(rule, dict) else rule.fails
                value_under_test = model.get(definition["fieldname"])
                if rule_fails_for(value_under_test):
                    self.messages.append(definition["message"])

        return self.messages

    def get_rule(self, rulename):
        return self.rules[rulename]

    def add_rule(self, rulename, rule_def):
        self.rules[rulename] = rule_def
