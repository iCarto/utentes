import datetime
import decimal

from pyramid.authentication import AuthTktAuthenticationPolicy
from pyramid.authorization import ACLAuthorizationPolicy
from pyramid.config import Configurator
from pyramid.decorator import reify
from pyramid.renderers import JSON
from pyramid.request import Request
from sqlalchemy import engine_from_config
from sqlalchemy.orm import sessionmaker
from webassets.filter import register_filter

from utentes.constants import perms as perm
from utentes.lib import webassets_filters
from utentes.tenant_custom_code import adjust_settings
from utentes.user_utils import get_user_from_request, get_user_role


ONE_HOUR = 3600  # in seconds


class RequestWithDB(Request):
    @reify
    def db(self):
        """Return a session.

        Only called once per request, thanks to @reify decorator
        """
        session_factory = self.registry.settings["db.session_factory"]
        self.add_finished_callback(self.close_db_connection)
        return session_factory()

    def close_db_connection(self, request):
        request.db.commit()
        request.db.close()


def date_adapter(obj, request):
    """Returns string in format 'yyyy-mm-dd' or None."""
    return obj.isoformat() if obj else None


def decimal_adapter(obj, request):
    return float(obj) if obj or (obj == 0) else None


def main(global_config, **settings):

    engine = engine_from_config(settings, "sqlalchemy.")
    session_factory = sessionmaker(bind=engine)
    settings["db.session_factory"] = session_factory

    adjust_settings(settings)

    config = Configurator(
        settings=settings,
        request_factory=RequestWithDB,
        root_factory="utentes.user_utils.RootFactory",
    )
    config.add_request_method(get_user_from_request, "user", reify=True)

    json_renderer = JSON()
    json_renderer.add_adapter(datetime.date, date_adapter)
    json_renderer.add_adapter(decimal.Decimal, decimal_adapter)
    config.add_renderer("json", json_renderer)

    # auth
    authn_policy = AuthTktAuthenticationPolicy(
        "utentes", callback=get_user_role, cookie_name="utentes", hashalg="sha512"
    )
    authz_policy = ACLAuthorizationPolicy()
    config.set_authentication_policy(authn_policy)
    config.set_authorization_policy(authz_policy)

    config.include("pyramid_jinja2")
    config.include("pyramid_webassets")
    # https://github.com/Pylons/pyramid_jinja2/issues/111
    config.commit()

    config.add_jinja2_renderer(".html")

    register_filter(webassets_filters.StrictMode)
    config.add_jinja2_extension("webassets.ext.jinja2.AssetsExtension")
    assets_env = config.get_webassets_env()
    jinja2_env = config.get_jinja2_environment()
    jinja2_env.assets_environment = assets_env
    jinja2_env.globals["perm"] = perm

    config.add_static_view("static", "static", cache_max_age=ONE_HOUR)
    config.include("utentes.urls")

    config.scan(ignore=["utentes.test"])
    return config.make_wsgi_app()
