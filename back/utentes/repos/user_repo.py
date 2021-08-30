from sqlalchemy.orm import Session
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound

from utentes.models.user import User


def get_user_by_username(db: Session, username: str):
    try:
        return db.query(User).filter(User.username == username).one()
    except (MultipleResultsFound, NoResultFound):
        return None
