import datetime

from pyramid.view import view_config

from utentes.constants import perms as perm
from utentes.lib.utils.dates import diff_month_include_upper, last_day_of_month, today
from utentes.models.constants import K_USOS_COMUNS
from utentes.models.exploracao import Exploracao
from utentes.repos.stats_repo import usos_privativos


row_headers = (
    "gid",
    "exp_id",
    "utente_id",
    "utente",
    "numero_facturas_esperadas",
    "consumo_facturas_esperadas",
    "importe_facturas_esperadas",
    "numero_facturas_emitidas",
    "consumo_facturas_emitidas",
    "importe_facturas_emitidas",
    "numero_facturas_cobradas",
    "consumo_facturas_cobradas",
    "importe_facturas_cobradas",
)


@view_config(
    route_name="api_facturacao_stats",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
def facturacao_stats(request):
    tipo_agua = request.params.get("tipo_agua")
    uso_explotacion = request.params.get("uso_explotacion")
    utentes = request.params.getall("utente")

    d_inicio = _get_d_inicio(
        request.params.get("mes_inicio"), request.params.get("ano_inicio")
    )
    d_fim = _get_d_fim(request.params.get("mes_fim"), request.params.get("ano_fim"))

    results = []
    if not uso_explotacion or uso_explotacion == "Usos privativos":
        results.extend(usos_privativos(request, d_inicio, d_fim, tipo_agua, utentes))

    if not uso_explotacion or uso_explotacion == "Usos comuns":
        results.extend(usos_comuns(request, d_inicio, d_fim, tipo_agua, utentes))

    return [dict(list(zip(row_headers, result))) for result in results]


def usos_comuns(request, d_inicio, d_fim, tipo_agua, utentes):
    # Los datos de estadísticas para las Utentes de usos comuns se generan
    # al vuelo

    exps = request.db.query(Exploracao).filter(Exploracao.estado_lic == K_USOS_COMUNS)
    for e in exps:

        if utentes and str(e.utente_rel.gid) not in utentes:
            continue

        c_real = e.c_real
        if tipo_agua:
            lic = e.get_licencia(tipo_agua[:3])
            if lic.gid is None:
                continue
            c_real = lic.c_real_tot

        d_exp = e.d_soli or e.created_at.date()
        # Empiezo a contar en lo que sea mayor la fecha seleccionado por el
        # usuario o la fecha de la explotación
        new_d_inicio = max(d_inicio, d_exp)
        if new_d_inicio > d_fim:
            # Si la fecha para la que puedo empezar a contar es mayor que la
            # que el usuario escogió como máximo no incluyo la exp
            continue
        months = diff_month_include_upper(d_fim, new_d_inicio)
        yield (
            e.gid,
            e.exp_id,
            e.utente_rel.gid,
            e.utente_rel.nome,
            0,
            months * c_real,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
        )


def _get_d_inicio(mes_inicio, ano_inicio):
    d_inicio = datetime.date.min
    if mes_inicio and ano_inicio:
        d_inicio = datetime.date(int(ano_inicio), int(mes_inicio), 1)
    return d_inicio


def _get_d_fim(mes_fim, ano_fim):
    d_fim = today()
    if mes_fim and ano_fim:
        user_input_d_fim = last_day_of_month(int(ano_fim), int(mes_fim))
        if user_input_d_fim < d_fim:
            d_fim = user_input_d_fim
    return d_fim
