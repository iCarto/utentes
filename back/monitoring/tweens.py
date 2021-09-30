import logging
import time

from pyramid.request import Request

from monitoring.models import ViewMonitor


log = logging.getLogger(__name__)


def view_monitor_tween_factory(handler, registry):
    # one-time configuration code goes here

    def view_monitor_tween(request: Request):
        if request.path_qs.startswith("/api/cartography") or request.path_qs.startswith(
            "/api/domains"
        ):
            return handler(request)

        start = time.time()
        try:
            response = handler(request)
        finally:
            end = time.time()
            duration = end - start
            try:
                session_factory = registry.settings["db.session_factory"]
                db = session_factory()
                view_monitor = ViewMonitor(
                    request.authenticated_userid,
                    request.method,
                    request.path_qs,
                    duration,
                )
                db.add(view_monitor)
                db.commit()
            except Exception as e:
                db.rolloback()
                log.exception(e)
            finally:
                db.close()

        return response

    return view_monitor_tween
