import unittest

from pyramid import testing
from pyramid.paster import get_appsettings
from sqlalchemy import engine_from_config, func, select
from sqlalchemy.orm import sessionmaker
from webob.multidict import MultiDict

from utentes.models.exploracao import Exploracao
from utentes.models.fonte import Fonte
from utentes.models.licencia import Licencia
from utentes.models.utente import Utente  # noqa: F401
from utentes.tests.e2e.testing_database import create_exp_piscicola


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

    def get_test_exploracao(self):

        # Explotación licenciada con al menos una fuente y una sóla licencia
        at_lest_one_source = (
            select([func.count(Exploracao.fontes)])
            .where(Exploracao.gid == Fonte.exploracao)
            .as_scalar()
        )
        only_one_license = (
            select([func.count(Exploracao.licencias)])
            .where(Exploracao.gid == Licencia.exploracao)
            .as_scalar()
        )
        return (
            self.request.db.query(Exploracao)
            .filter(
                Exploracao.estado_lic == "Licenciada", Exploracao.c_estimado != None
            )
            .filter(at_lest_one_source > 0)
            .filter(only_one_license == 1)
            .order_by(Exploracao.exp_id)
            .all()[0]
        )

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


class TanquesPiscicolasTests(DBIntegrationTest):
    def create_tanque_test(self, commit=False):
        e_test = create_exp_piscicola(self.request)
        actv = e_test.actividade
        # actv = self.request.db.query(ActividadesPiscicultura).all()[0]
        # query = "SELECT exp_id from utentes.exploracaos WHERE gid = " + str(
        #     actv.exploracao
        # )
        # exp = list(self.request.db.execute(query))

        actv_json = actv.__json__(self.request)
        actv_json["exp_id"] = e_test.exp_id
        tanques = [
            f.__json__(self.request)["properties"]
            for f in actv_json.get("tanques_piscicolas", {}).get("features", [])
        ]
        tanques.append(
            {
                "estado": "Operacional",
                "esp_culti": "Peixe gato",
                "tipo": "Gaiola",
                "actividade": actv.gid,
            }
        )
        actv_json["tanques_piscicolas"] = tanques
        actv.update_from_json(actv_json)
        self.request.db.add(actv)
        if commit:
            self.request.db.commit()
        return actv.tanques_piscicolas[-1]
