from sqlalchemy.orm import Session

from utentes.models.facturacao import Facturacao


def get_invoice_by_pk(db: Session, pk: int) -> Facturacao:
    return db.query(Facturacao).filter(Facturacao.gid == pk).one()


def get_invoices_by_exploracao(db: Session, exploracao_pk: int):
    return (
        db.query(Facturacao)
        .filter(Facturacao.exploracao == exploracao_pk)
        .order_by(Facturacao.ano, Facturacao.mes)
        .all()
    )
