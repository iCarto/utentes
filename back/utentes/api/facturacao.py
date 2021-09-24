import logging

from pyramid.view import view_config
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound

from utentes.api.error_msgs import error_msgs
from utentes.constants import perms as perm
from utentes.models.base import badrequest_exception
from utentes.models.exploracao import ExploracaoConFacturacao
from utentes.models.facturacao import Facturacao


log = logging.getLogger(__name__)


@view_config(
    route_name="api_facturacao",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
@view_config(
    route_name="api_facturacao_exploracao_id",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
def facturacao_get(request):
    gid = None
    if request.matchdict:
        gid = request.matchdict["id"] or None

    if gid:  # return individual explotacao
        try:
            return (
                request.db.query(ExploracaoConFacturacao)
                .filter(ExploracaoConFacturacao.gid == gid)
                .one()
            )
        except (MultipleResultsFound, NoResultFound):
            raise badrequest_exception({"error": error_msgs["no_gid"], "gid": gid})

    else:  # return collection
        query = request.db.query(ExploracaoConFacturacao)
        states = request.GET.getall("states[]")

        if states:
            query = query.filter(ExploracaoConFacturacao.estado_lic.in_(states))

        fact_estado = request.GET.getall("fact_estado[]")
        if fact_estado:
            query = query.filter(ExploracaoConFacturacao.fact_estado.in_(fact_estado))

        features = query.order_by(ExploracaoConFacturacao.exp_id).all()
        return {"type": "FeatureCollection", "features": features}


@view_config(
    route_name="api_facturacao_new_fact_id",
    permission=perm.PERM_UPDATE_CREATE_FACTURACAO,
    request_method="GET",
    renderer="json",
)
def new_fact_id(request):

    gid = request.matchdict["id"]

    try:
        facturacao = request.db.query(Facturacao).filter(Facturacao.gid == gid).one()
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception({"error": error_msgs["no_gid"], "gid": gid})

    exp_id = facturacao.exploracao
    if facturacao.fact_id is not None:
        return facturacao.fact_id

    try:
        exploracao = (
            request.db.query(ExploracaoConFacturacao)
            .filter(ExploracaoConFacturacao.gid == exp_id)
            .one()
        )
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception({"error": error_msgs["no_gid"], "gid": gid})

    if not exploracao.loc_divisao:
        raise badrequest_exception(
            {"error": "A divisão é un campo obligatorio", "exp_id": exp_id}
        )

    facturacao.fact_id = num_factura_get_id_formatted(
        request.db, exploracao.loc_divisao, facturacao.ano
    )
    request.db.add(facturacao)
    request.db.commit()

    return facturacao.fact_id


@view_config(
    route_name="api_facturacao_new_recibo_id",
    permission=perm.PERM_UPDATE_CREATE_FACTURACAO,
    request_method="GET",
    renderer="json",
)
def new_recibo_id(request):

    gid = request.matchdict["id"]

    try:
        facturacao = request.db.query(Facturacao).filter(Facturacao.gid == gid).one()
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception({"error": error_msgs["no_gid"], "gid": gid})

    exp_id = facturacao.exploracao
    if facturacao.recibo_id is not None:
        return facturacao.recibo_id

    try:
        exploracao = (
            request.db.query(ExploracaoConFacturacao)
            .filter(ExploracaoConFacturacao.gid == exp_id)
            .one()
        )
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception({"error": error_msgs["no_gid"], "gid": gid})

    if not exploracao.loc_divisao:
        raise badrequest_exception(
            {"error": "A divisão é un campo obligatorio", "exp_id": exp_id}
        )

    facturacao.recibo_id = num_recibo_get_id_formatted(
        request.db, exploracao.loc_divisao, facturacao.ano
    )
    request.db.add(facturacao)
    request.db.commit()

    return facturacao.recibo_id


@view_config(
    route_name="api_facturacao_exploracao_id",
    permission=perm.PERM_UPDATE_CREATE_FACTURACAO,
    request_method=("PATCH", "PUT"),
    renderer="json",
)
def facturacao_exploracao_update(request):
    gid = request.matchdict["id"]
    body = request.json_body
    e = (
        request.db.query(ExploracaoConFacturacao)
        .filter(ExploracaoConFacturacao.gid == gid)
        .one()
    )
    e.update_from_json_facturacao(body)
    request.db.add(e)
    request.db.commit()
    return e


def num_factura_get_id_formatted(db, divisao, ano):
    sql = r"""
        SELECT substring(fact_id, 0, 5)::int + 1
        FROM utentes.facturacao
        WHERE substring(fact_id from '\d{4}-(.*)') = :divisao_ano
        ORDER BY fact_id DESC
        LIMIT 1;
        """
    return _get_id_formatted(db, divisao, ano, sql)


def num_recibo_get_id_formatted(db, divisao, ano):
    sql = r"""
        SELECT substring(recibo_id, 0, 5)::int + 1
        FROM utentes.facturacao
        WHERE substring(recibo_id from '\d{4}-(.*)') = :divisao_ano
        ORDER BY recibo_id DESC
        LIMIT 1;
        """
    return _get_id_formatted(db, divisao, ano, sql)


def _get_id_formatted(db, divisao, ano, sql):
    params = {"seq_id": None, "divisao_ano": f"{divisao}/{ano}"}
    query_result = db.execute(sql, params).first()
    if query_result:
        params["seq_id"] = query_result[0]
    else:
        params["seq_id"] = 1

    # 0001-UGBI/2020
    return "{seq_id:04d}-{divisao_ano}".format(**params)
