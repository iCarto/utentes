import bcrypt
from sqlalchemy import TIMESTAMP, Column, DateTime, Integer, Text, func, text

from users.user_roles import BASIN_DIVISION
from utentes.lib.schema_validator.validation_exception import ValidationException
from utentes.lib.schema_validator.validator import Validator
from utentes.models.base import PGSQL_SCHEMA_USERS, Base
from utentes.models.user_schema import USER_SCHEMA


ENCODING = "utf8"


class User(Base):
    __tablename__ = "users"
    __table_args__ = {"schema": PGSQL_SCHEMA_USERS}

    id = Column(Integer, primary_key=True)
    username = Column(Text, unique=True)
    password = Column(Text)
    # screen_name = Column(Text)
    usergroup = Column(Text)
    divisao = Column(Text)
    last_login = Column(TIMESTAMP(timezone=False))
    new_login = Column(TIMESTAMP(timezone=False), server_default=func.now())
    created_at = Column(DateTime, nullable=False, server_default=text("now()"))

    @staticmethod
    def create_from_json(json):
        msgs = Validator(USER_SCHEMA).validate(json)
        if msgs:
            raise ValidationException({"error": msgs})
        user = User()
        user.update_from_json(json)
        return user

    def update_from_json(self, json):
        self.username = json.get("username")
        # self.screen_name = json.get('screen_name')
        previous_group = self.usergroup
        if json.get("usergroup"):
            self.usergroup = json.get("usergroup")
        if json.get("password"):
            self.set_password(json.get("password"))
        if json.get("divisao"):
            self.divisao = json.get("divisao")
        if previous_group == BASIN_DIVISION and self.usergroup != BASIN_DIVISION:
            self.divisao = None

    def set_password(self, pw):
        pwhash = bcrypt.hashpw(pw.encode(ENCODING), bcrypt.gensalt())
        self.password = pwhash.decode(ENCODING)

    def check_password(self, pw):
        if self.password is not None:
            expected_hash = self.password.encode(ENCODING)
            return bcrypt.checkpw(pw.encode(ENCODING), expected_hash)
        return False

    def __json__(self, request):
        return {
            "id": self.id,
            "username": self.username,
            "usergroup": self.usergroup,
            "divisao": self.divisao,
        }
