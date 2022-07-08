import sentry_sdk
from pyramid.config import Configurator
from pyramid.settings import asbool
from sentry_sdk.integrations.pyramid import PyramidIntegration
from sentry_sdk.integrations.sqlalchemy import SqlalchemyIntegration


def includeme(config: Configurator):

    if asbool(config.registry.settings.get("monitoring.view_monitor")):
        config.add_tween("monitoring.tweens.view_monitor_tween_factory")

    sentry_key = config.registry.settings.get("monitoring.sentry_key")
    if sentry_key:

        sentry_sdk.init(
            dsn=f"https://{sentry_key}@o1002848.ingest.sentry.io/5963155",
            integrations=[
                PyramidIntegration(transaction_style="route_pattern"),
                SqlalchemyIntegration(),
            ],
            traces_sample_rate=1.0,
            send_default_pii=True,
            release="220708",
            environment=config.registry.settings.get("ara"),
            attach_stacktrace=False,
            request_bodies="medium",
        )
