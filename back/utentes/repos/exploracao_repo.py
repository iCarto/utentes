from sqlalchemy.orm import Session

from utentes.models.exploracao import Exploracao


def get_exploracao_by_pk(db: Session, pk: int):
    return db.query(Exploracao).filter(Exploracao.gid == pk).one()
