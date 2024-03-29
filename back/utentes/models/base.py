import json

from geoalchemy2.elements import WKTElement
from pyramid.httpexceptions import (
    HTTPBadRequest,
    HTTPMethodNotAllowed,
    HTTPNotFound,
    HTTPUnauthorized,
)
from sqlalchemy import Boolean, Column, text
from sqlalchemy.ext.declarative import declarative_base

from utentes.lib.geomet import wkt
from utentes.lib.schema_validator.validation_exception import ValidationException


PGSQL_SCHEMA_UTENTES = "utentes"
PGSQL_SCHEMA_DOMAINS = "domains"
PGSQL_SCHEMA_USERS = "utentes"
PGSQL_SCHEMA_CBASE = "cbase"
PGSQL_SCHEMA_CBASE_ARA = "cbase_ara"
PGSQL_SCHEMA_INVENTARIO = "inventario"


def ColumnBooleanNotNull(*args, **kwargs):  # noqa: N802
    # https://stackoverflow.com/questions/29522557/
    kwargs.setdefault("nullable", False)
    kwargs.setdefault("server_default", text("false"))
    kwargs.setdefault("default", False)
    return Column(*args, Boolean, **kwargs)


def defaults_included_constructor(instance, **kwds):
    # https://variable-scope.com/posts/setting-eager-defaults-for-sqlalchemy-orm-models
    for attr, value in kwds.items():
        setattr(instance, attr, value)
    for attr in set(getattr(instance, "__eager_defaults__", ())) - set(kwds):
        column = getattr(type(instance), attr)
        setattr(instance, attr, column.default.arg)


class BaseClass(object):
    # python uses this method to compare objects
    # for example, in exploracao.update_array
    def __eq__(self, other):
        if (self.gid is None) or (other.gid is None):
            # shall we in this case compare all attributes?
            return False
        return self.gid == other.gid

    def __json__(self, request):
        json = {c: getattr(self, c) for c in list(self.__mapper__.columns.keys())}
        if "gid" in json:
            json["id"] = json.pop("gid")
        return json


DeclarativeBase = declarative_base()
Base = declarative_base(cls=BaseClass, constructor=defaults_included_constructor)


def unauthorized_exception(body=None):
    body = body or {"error": "No autorizado"}
    return build_exception(HTTPUnauthorized, body)


def badrequest_exception(body=None):
    body = body or {"error": "Peticion incorrecta"}
    return build_exception(HTTPBadRequest, body)


def notfound_exception(body=None):
    body = body or {"error": "No encontrado"}
    return build_exception(HTTPNotFound, body)


def methodnotallowed_exception(body=None):
    body = body or {"error": "No permitido"}
    return build_exception(HTTPMethodNotAllowed, body)


def build_exception(httpexc, body):
    response = httpexc()
    response.text = json.dumps(body)
    response.content_type = "application/json"
    response.charset = "utf-8"
    return response


def badrequest_exception_user(msg):
    """Builds an HTTPBadRequest Excepcion.

    It's used to raise exception from api or views to redirect the user to a
    new web page where the `msg` with the problem is shown
    """
    return HTTPBadRequest(body=msg)


class APIAction(object):

    OK = "ok"
    FAILED = "failed"

    def __init__(self, operation="", status="", exp_type="", exp_id="", user_name=""):
        self.operation = operation
        self.status = status
        self.exp_type = exp_type
        self.exp_id = exp_id
        self.user_name = user_name

    def __json__(self, request):
        return {
            "status": self.status,
            "operation": self.operation,
            "type": self.exp_type,
            "id": self.exp_id,
            "name": self.user_name,
        }


def update_array(olds, news_json, factory):
    news = []
    update_dict = {}
    news_json = news_json or []
    for n in news_json:
        new = factory(n)
        msgs = new.validate(n)
        if msgs:
            raise ValidationException({"error": msgs})
        news.append(new)
        if n.get("id"):
            update_dict[n.get("id")] = n

    # this needs objects to declare when they are equals
    # by declaring the method __eq__
    to_remove = [el for el in olds if el not in news]
    to_update = [el for el in olds if el in news]
    to_append = [el for el in news if el not in olds]

    for old in to_remove:
        olds.remove(old)

    for old in to_update:
        new = update_dict[old.gid]
        if new:
            old.update_from_json(new)

    for new in to_append:
        olds.append(new)


def update_geom(org_geom, data):
    to_update = data.get("geometry_edited")
    if not to_update:
        return org_geom

    g = data.get("geometry")
    if not g:
        return None
    the_geom = WKTElement(wkt.dumps(g), srid=4326)
    return the_geom.ST_Multi().ST_Transform(32737)


def update_area(model, data, divisor=10000, fieldname="area", empty_value=None):
    if data.get("geometry_edited"):
        if model.the_geom is None:
            setattr(model, fieldname, empty_value)
        else:
            setattr(model, fieldname, model.the_geom.ST_Area() / divisor)
