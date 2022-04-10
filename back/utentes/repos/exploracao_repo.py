from sqlalchemy.orm import Session

from utentes.models.exploracao import Exploracao, ExploracaoConFacturacao
from utentes.repos.exploracao_list import ExploracaoList


def get_exploracao_by_pk(db: Session, pk: int):
    return db.query(Exploracao).filter(Exploracao.gid == pk).one()


def get_exploracao_with_invoices_by_pk(db: Session, exp_pk) -> ExploracaoConFacturacao:
    return (
        db.query(ExploracaoConFacturacao)
        .filter(ExploracaoConFacturacao.gid == exp_pk)
        .one()
    )


def get_exploracao_list(db: Session, states):
    """Returns a list of ExploracaoList.

    db: Session
    states: list[str]

    return list[ExploracaoList]

    """
    return (
        db.query(ExploracaoList)
        .filter(ExploracaoList.estado_lic.in_(states))
        .order_by(ExploracaoList.exp_id)
        .all()
    )


def get_exploracao_with_invoices_by_state(db: Session, states):
    return (
        db.query(ExploracaoConFacturacao)
        .filter(ExploracaoConFacturacao.estado_lic.in_(states))
        .order_by(ExploracaoConFacturacao.exp_id)
        .all()
    )
