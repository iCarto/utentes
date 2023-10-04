from typing import List

from dateutil.relativedelta import relativedelta
from sqlalchemy.orm import Session

from utentes.lib.utils import dates
from utentes.models.constants import RENEWABLE_STATES
from utentes.models.exploracao import Exploracao, ExploracaoConFacturacao
from utentes.models.exploracao_con_renovacao import ExpConRenovacao
from utentes.models.licencia import Licencia
from utentes.repos.exploracao_list import ExploracaoFacturacaoList, ExploracaoList


def get_exploracao_by_pk(db: Session, pk: int):
    return db.query(Exploracao).filter(Exploracao.gid == pk).one()


def get_exploracao_with_invoices_by_pk(db: Session, exp_pk) -> ExploracaoConFacturacao:
    return (
        db.query(ExploracaoConFacturacao)
        .filter(ExploracaoConFacturacao.gid == exp_pk)
        .one()
    )


def get_exploracao_for_facturacao_list(db: Session, states):
    """Returns a list of ExploracaoList.

    db: Session
    states: list[str]

    return list[ExploracaoList]

    """
    return (
        db.query(ExploracaoFacturacaoList)
        .filter(ExploracaoList.estado_lic.in_(states))
        .order_by(ExploracaoFacturacaoList.exp_id)
        .all()
    )


def get_exploracao_with_invoices_by_state(db: Session, states):
    return (
        db.query(ExploracaoConFacturacao)
        .filter(ExploracaoConFacturacao.estado_lic.in_(states))
        .order_by(ExploracaoConFacturacao.exp_id)
        .all()
    )


def get_renewable_exploracaos(db: Session) -> List[ExpConRenovacao]:
    n_months_to_go_back = 6
    threshold_renewal_date = dates.today() + relativedelta(months=n_months_to_go_back)

    lics_ids_query = (
        db.query(Licencia.exploracao)
        .filter(Licencia.estado.in_(RENEWABLE_STATES))
        .filter(Licencia.d_validade < threshold_renewal_date)
        .group_by(Licencia.exploracao)
    )
    pks = (lic[0] for lic in lics_ids_query)
    return db.query(ExpConRenovacao).filter(ExpConRenovacao.gid.in_(pks)).all()
