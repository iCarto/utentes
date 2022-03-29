from sqlalchemy.orm import Session

from utentes.models.cultivo import ActividadesCultivos


def get_test_cultivo_from_db(db: Session):
    return db.query(ActividadesCultivos).order_by(ActividadesCultivos.cult_id).first()


def get_test_cultivo_with_geom_from_db(db: Session):
    return (
        db.query(ActividadesCultivos)
        .filter(ActividadesCultivos.the_geom.isnot(None))
        .first()
    )
