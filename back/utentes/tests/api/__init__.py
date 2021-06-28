import unittest

from pyramid import testing
from pyramid.paster import get_appsettings
from sqlalchemy import engine_from_config
from sqlalchemy.orm import sessionmaker
from webob.multidict import MultiDict

from utentes.models.utente import Utente  # noqa: F401


settings = get_appsettings("development.ini", "main")
engine = engine_from_config(settings, "sqlalchemy.")
session_factory = sessionmaker()


class DBIntegrationTest(unittest.TestCase):
    def setUp(self):
        self.config = testing.setUp(settings=settings)

        self.connection = engine.connect()
        self.transaction = self.connection.begin()
        self.db_session = session_factory(bind=self.connection)
        self.request = testing.DummyRequest()
        self.request.GET = MultiDict()
        self.request.db = self.db_session

    def tearDown(self):
        testing.tearDown()
        self.transaction.rollback()
        self.db_session.close()
        self.connection.close()

    def create_new_session(self):
        # La idea de generar una sesión distinta para este último chequeo
        # es que no haya cosas cacheadas en la sesión original
        new_settings = get_appsettings("development.ini", "main")
        new_engine = engine_from_config(new_settings, "sqlalchemy.")
        session = sessionmaker()
        session.configure(bind=new_engine)
        return session()

    def delete_exp_id(self, exp_id):
        self.request.db.execute(
            "DELETE FROM utentes.exploracaos WHERE exp_id = :exp_id", {"exp_id": exp_id}
        )
        # Los tests están mal construidos y siempre quedo esto colgando
        self.request.db.execute(
            "DELETE FROM utentes.exploracaos WHERE exp_id = :exp_id",
            {"exp_id": "001/ARAS/2008/CL"},
        )

        self.request.db.commit()
