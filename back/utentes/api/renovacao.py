from dateutil.relativedelta import relativedelta
from pyramid.view import view_config

from utentes.constants import perms as perm
from utentes.lib.utils import dates
from utentes.models.base import badrequest_exception
from utentes.models.constants import RENEWABLE_STATES
from utentes.models.estado_renovacao import FINISHED_RENOVACAO_STATES
from utentes.models.exploracao_con_renovacao import ExpConRenovacao
from utentes.models.licencia import Licencia
from utentes.models.renovacao import Renovacao, create
from utentes.repos.exploracao_repo import get_exploracao_by_pk


N_MONTHS_TO_GO_BACK = 6


@view_config(
    route_name="api_renovacao",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
def renovacao_get(request):

    threshold_renewal_date = dates.today() + relativedelta(months=N_MONTHS_TO_GO_BACK)

    lics_ids_query = (
        request.db.query(Licencia.exploracao)
        .filter(Licencia.estado.in_(RENEWABLE_STATES))
        .filter(Licencia.d_validade < threshold_renewal_date)
        .group_by(Licencia.exploracao)
    )
    exp_ids = [lic[0] for lic in lics_ids_query]

    exploracaos = (
        request.db.query(ExpConRenovacao).filter(ExpConRenovacao.gid.in_(exp_ids)).all()
    )

    for f in exploracaos:
        renovacoes = [
            r for r in f.renovacao if r.estado not in FINISHED_RENOVACAO_STATES
        ]

        if len(renovacoes) > 1:
            raise badrequest_exception(
                {"error": "Há mais de uma renovação em progresso para a exploração"}
            )

        r_to_be_used = renovacoes[0] if renovacoes else create(f)

        f.renovacao = [r_to_be_used]

    states = request.GET.getall("states[]")
    features = [e for e in exploracaos if e.renovacao[0].estado in states]

    return {"type": "FeatureCollection", "features": features}


@view_config(
    route_name="api_renovacao_id",
    permission=perm.PERM_UPDATE_RENOVACAO,
    request_method=("PATCH", "PUT"),
    renderer="json",
)
def renovacao_update(request):
    gid = request.matchdict["id"]
    body = request.json_body

    renovacoes = (
        request.db.query(Renovacao)
        .filter(Renovacao.exploracao == gid)
        .filter(Renovacao.estado.notin_(FINISHED_RENOVACAO_STATES))
        .all()
    )

    if len(renovacoes) > 1:
        raise badrequest_exception(
            {"error": "Há mais de uma renovação em progresso para a exploração"}
        )

    r_to_be_used = renovacoes[0] if renovacoes else Renovacao()

    r_to_be_used.update_from_json(body)

    if r_to_be_used.estado in FINISHED_RENOVACAO_STATES:
        exp = get_exploracao_by_pk(request.db, r_to_be_used.exploracao)
        exp.update_from_json_renovacao(request, body)
        request.db.add(exp)

    request.db.add(r_to_be_used)
    request.db.commit()
    return r_to_be_used


@view_config(
    route_name="api_renovacao_historico_id",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
def renovacao_get_historical(request):
    exp_gid = request.matchdict.get("id")

    return (
        request.db.query(Renovacao)
        .filter(Renovacao.exploracao == exp_gid)
        .filter(Renovacao.estado.in_(FINISHED_RENOVACAO_STATES))
        .order_by(
            Renovacao.d_validade_sub_old.desc(), Renovacao.d_validade_sup_old.desc()
        )
        .all()
    )
