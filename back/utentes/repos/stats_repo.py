from sqlalchemy import func, or_

from utentes.models.constants import (
    INVOICE_STATE_PENDING_CONSUMPTION,
    K_SUBTERRANEA,
    K_SUPERFICIAL,
    PAID,
    PENDING_INVOICE,
)
from utentes.models.exploracao import Exploracao
from utentes.models.facturacao import Facturacao
from utentes.models.utente import Utente


def usos_privativos(request, d_inicio, d_fim, tipo_agua, utentes):

    fields = [
        Facturacao.exploracao.label("exploracao_gid"),
        func.count(Facturacao.exploracao).label("numero_facturas"),
    ]
    if not tipo_agua:
        fields.extend(
            [
                func.sum(Facturacao.consumo).label("consumo"),
                func.sum(Facturacao.pago_iva).label("importe"),
            ]
        )
    if tipo_agua == K_SUPERFICIAL:
        fields.extend(
            [
                func.sum(
                    func.coalesce(
                        Facturacao.consumo_fact_sup, Facturacao.c_licencia_sup, 0
                    )
                ).label("consumo"),
                func.sum(
                    func.coalesce(Facturacao.pago_mes_sup, 0)
                    * (1 + func.coalesce(Facturacao.iva, 0) / 100)
                    * (1 + func.coalesce(Facturacao.juros, 0) / 100)
                ).label("importe"),
            ]
        )

    if tipo_agua == K_SUBTERRANEA:
        fields.extend(
            [
                func.sum(
                    func.coalesce(
                        Facturacao.consumo_fact_sub, Facturacao.c_licencia_sub, 0
                    )
                ).label("consumo"),
                func.sum(
                    func.coalesce(Facturacao.pago_mes_sub, 0)
                    * (1 + func.coalesce(Facturacao.iva, 0) / 100)
                    * (1 + func.coalesce(Facturacao.juros, 0) / 100)
                ).label("importe"),
            ]
        )

    subquery_esperadas = (
        request.db.query(*fields)
        .filter(Facturacao.created_at.between(d_inicio, d_fim))
        .group_by(Facturacao.exploracao)
    )

    subquery_emitidas = (
        request.db.query(*fields)
        .filter(
            Facturacao.fact_estado != INVOICE_STATE_PENDING_CONSUMPTION,
            Facturacao.fact_estado != PENDING_INVOICE,
        )
        .filter(Facturacao.created_at.between(d_inicio, d_fim))
        .group_by(Facturacao.exploracao)
    )

    subquery_cobradas = (
        request.db.query(*fields)
        .filter(Facturacao.fact_estado == PAID)
        .filter(Facturacao.created_at.between(d_inicio, d_fim))
        .group_by(Facturacao.exploracao)
    )

    if tipo_agua:
        if tipo_agua == K_SUPERFICIAL:
            subquery_esperadas = subquery_esperadas.filter(
                Facturacao.c_licencia_sup.isnot(None)
            )
        if tipo_agua == K_SUBTERRANEA:
            subquery_esperadas = subquery_esperadas.filter(
                Facturacao.c_licencia_sub.isnot(None)
            )

    subquery_esperadas = subquery_esperadas.subquery()
    subquery_emitidas = subquery_emitidas.subquery()
    subquery_cobradas = subquery_cobradas.subquery()

    query = (
        request.db.query(
            Exploracao.gid,
            Exploracao.exp_id,
            Utente.gid.label("utente_id"),
            Utente.nome.label("utente"),
            func.coalesce(
                subquery_esperadas.c.numero_facturas.label("numero_facturas_esperadas"),
                0,
            ),
            func.coalesce(
                subquery_esperadas.c.consumo.label("consumo_facturas_esperadas"), 0
            ),
            func.coalesce(
                subquery_esperadas.c.importe.label("importe_facturas_esperadas"), 0
            ),
            func.coalesce(
                subquery_emitidas.c.numero_facturas.label("numero_facturas_emitidas"), 0
            ),
            func.coalesce(
                subquery_emitidas.c.consumo.label("consumo_facturas_emitidas"), 0
            ),
            func.coalesce(
                subquery_emitidas.c.importe.label("importe_facturas_emitidas"), 0
            ),
            func.coalesce(
                subquery_cobradas.c.numero_facturas.label("numero_facturas_cobradas"), 0
            ),
            func.coalesce(
                subquery_cobradas.c.consumo.label("consumo_facturas_cobradas"), 0
            ),
            func.coalesce(
                subquery_cobradas.c.importe.label("importe_facturas_cobradas"), 0
            ),
        )
        .join(Utente, Exploracao.utente == Utente.gid)
        .join(subquery_esperadas, subquery_esperadas.c.exploracao_gid == Exploracao.gid)
        .outerjoin(
            subquery_emitidas, subquery_emitidas.c.exploracao_gid == Exploracao.gid
        )
        .outerjoin(
            subquery_cobradas, subquery_cobradas.c.exploracao_gid == Exploracao.gid
        )
        .order_by(Exploracao.gid)
    )

    if utentes:
        query = query.filter(
            or_(*[Utente.gid == int(utente_id) for utente_id in utentes])
        )
    return query.all()
