from dateutil.relativedelta import relativedelta
from pyramid.view import view_config
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound

from utentes.api.error_msgs import error_msgs
from utentes.constants import perms as perm
from utentes.lib.utils import dates
from utentes.models.base import badrequest_exception
from utentes.models.constants import K_SUBTERRANEA, K_SUPERFICIAL, RENEWABLE_STATES
from utentes.models.estado_renovacao import (
    DE_FACTO,
    FINISHED_RENOVACAO_STATES,
    LICENSED,
    NOT_APPROVED,
    PENDING_RENOV_LICENSE,
)
from utentes.models.exploracao import Exploracao
from utentes.models.exploracao_con_renovacao import ExpConRenovacao
from utentes.models.licencia import Licencia
from utentes.models.renovacao import Renovacao


@view_config(
    route_name="api_renovacao",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
def renovacao_get(request):
    n_months_to_go_back = 6
    threshold_renewal_date = dates.today() + relativedelta(months=n_months_to_go_back)

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

    exploracaos_filtered = [e.__json__(request) for e in exploracaos]

    for f in exploracaos_filtered:
        valid = [
            r
            for r in f.get("properties").get("renovacao")
            if r.get("estado") not in FINISHED_RENOVACAO_STATES
        ]

        if not valid:
            r_to_be_used = fill_renovacao_from_exploracao(f)

        elif len(valid) == 1:
            r_to_be_used = valid[0]

        else:
            raise badrequest_exception(
                {
                    "error": (
                        "Há mais de uma renovação em progresso para a exploração"
                        " selecionada"
                    )
                }
            )

        f["properties"]["renovacao"] = r_to_be_used

    states = request.GET.getall("states[]")
    features = [
        e
        for e in exploracaos_filtered
        if e.get("properties").get("renovacao").get("estado") in states
    ]

    return {"type": "FeatureCollection", "features": features}


def fill_renovacao_from_exploracao(exp):
    renovacao = {}
    renovacao["exploracao"] = exp["properties"]["id"]
    renovacao["exp_id"] = exp["properties"]["exp_id"]
    renovacao["estado"] = PENDING_RENOV_LICENSE

    for lic in exp["properties"]["licencias"]:
        if lic["tipo_agua"] == K_SUBTERRANEA:
            renovacao["tipo_lic_sub_old"] = lic["tipo_lic"]
            renovacao["d_emissao_sub_old"] = lic["d_emissao"]
            renovacao["d_validade_sub_old"] = lic["d_validade"]
            renovacao["c_licencia_sub_old"] = lic["c_licencia"]
        if lic["tipo_agua"] == K_SUPERFICIAL:
            renovacao["tipo_lic_sup_old"] = lic["tipo_lic"]
            renovacao["d_emissao_sup_old"] = lic["d_emissao"]
            renovacao["d_validade_sup_old"] = lic["d_validade"]
            renovacao["c_licencia_sup_old"] = lic["c_licencia"]

    if exp["properties"]["facturacao"]:
        f = exp["properties"]["facturacao"][-1]
        if f["consumo_fact_sub"]:
            exp["properties"]["consumo_fact_sub_old"] = f["consumo_fact_sub"]
        if f["consumo_fact_sup"]:
            exp["properties"]["consumo_fact_sup_old"] = f["consumo_fact_sup"]

    return renovacao


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
        .filter(Renovacao.exploracao == gid, Renovacao.estado != LICENSED)
        .all()
    )

    valid = [r for r in renovacoes if r.estado not in FINISHED_RENOVACAO_STATES]

    if len(valid) > 1:
        raise badrequest_exception(
            {
                "error": (
                    "Há mais de uma renovação em progresso para a exploração"
                    " selecionada"
                )
            }
        )

    if not valid:
        r = Renovacao()
        r.update_from_json_renovacao(body)
    elif len(valid) == 1:
        r = valid[0]
        r.update_from_json(body)

    if r.estado in {LICENSED, DE_FACTO, NOT_APPROVED}:
        exp = (
            request.db.query(Exploracao).filter(Exploracao.gid == r.exploracao).all()[0]
        )
        exp.update_from_json_renovacao(request, body)
        request.db.add(exp)

    request.db.add(r)
    request.db.commit()
    return r


@view_config(
    route_name="api_renovacao_historico_id",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
def renovacao_get_historical(request):
    exp_gid = request.matchdict.get("id")
    if not exp_gid:
        raise badrequest_exception({"error": error_msgs["no_gid"], "gid": exp_gid})

    try:
        return (
            request.db.query(Renovacao)
            .filter(
                Renovacao.exploracao == exp_gid,
                Renovacao.estado.in_(FINISHED_RENOVACAO_STATES),
            )
            .order_by(
                Renovacao.d_validade_sub_old.desc(), Renovacao.d_validade_sup_old.desc()
            )
            .all()
        )

    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception({"error": error_msgs["no_gid"], "gid": exp_gid})
