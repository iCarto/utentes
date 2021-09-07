import urllib

from pyramid.httpexceptions import HTTPFound
from pyramid.security import remember
from pyramid.view import view_config

from users import user_groups
from utentes.user_utils import get_user_from_db


@view_config(route_name="index", renderer="utentes:templates/login.jinja2")
@view_config(route_name="login", renderer="utentes:templates/login.jinja2")
def login(request):

    login_url = request.route_url("login")
    root_url = request.route_url("index")

    # In some configurations, referrer does not add the trailing slash
    # when the root url is visited. This should be fixed in a more correct way
    root_url_without_trailing_slash = (
        root_url[:-1] if root_url.endswith("/") else root_url
    )

    referrer = request.url

    if referrer in {login_url, root_url, root_url_without_trailing_slash}:
        referrer = request.route_url(
            request.registry.settings.get("users.after_login_url")
        )
    next = request.params.get("next", referrer)

    if request.authenticated_userid and request.url in {
        root_url,
        root_url_without_trailing_slash,
    }:
        return HTTPFound(location=next)

    if "submit" in request.POST:
        user = get_user_from_db(request)
        if user:
            headers = remember(request, user.username)
            if user.usergroup == user_groups.FINANCIERO and next == request.route_url(
                request.registry.settings.get("users.after_login_url")
            ):
                next = request.route_url("facturacao")
            response = HTTPFound(location=next, headers=headers)
            response.set_cookie("utentes_stub_user", value=user.username)

            usergroup = urllib.parse.quote(user.usergroup)
            response.set_cookie("utentes_stub_group", value=usergroup)
            if user.divisao is not None:
                divisao = urllib.parse.quote(user.divisao)
                response.set_cookie("utentes_stub_divisao", value=divisao)
            response.delete_cookie(
                "utentes_stub_role"
            )  # Remove after some versions are released
            response.delete_cookie(
                "utentes_stub_unidade"
            )  # Remove after some versions are released
            return response

    return {"title": request.registry.settings.get("ara_app_name"), "next": next}
