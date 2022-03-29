import unittest

from utentes.api.tanques_piscicolas import tanques_piscicolas_get
from utentes.models.tanques_piscicolas import ActividadesTanquesPiscicolas
from utentes.tests.api import DBIntegrationTest
from utentes.tests.e2e.testing_database import insert_exp
from utentes.tests.fixtures import build_json, create_tanque
from utentes.tests.fixtures.create_actividade import piscicola
from utentes.tests.fixtures.create_exploracao import create_test_exploracao


class TestTanquesPiscicolasGET(DBIntegrationTest):
    def setUp(self):
        super().setUp()
        exp = create_test_exploracao(actividade=piscicola())
        tanque = create_tanque.create_test_tanque()
        tanque.tanque_id = f"{exp.exp_id}/001"
        exp.actividade.tanques_piscicolas.append(tanque)
        insert_exp(self.request.db, exp)
        self.test_exp = exp

    def test_tanque_get_length(self):
        actual = tanques_piscicolas_get(self.request)
        count = self.request.db.query(ActividadesTanquesPiscicolas).count()
        self.assertEqual(len(actual["features"]), count)

    def test_tanque_get_returns_a_geojson_collection(self):
        actual = tanques_piscicolas_get(self.request)
        self.assertTrue("features" in actual)
        self.assertTrue("type" in actual)
        self.assertEqual("FeatureCollection", actual["type"])

    def test_tanque_get_id_returns_a_geojson(self):
        actual = build_json.simple_geojson(
            self.request, tanques_piscicolas_get(self.request)["features"][0]
        )
        self.assertTrue("geometry" in actual)
        self.assertTrue("type" in actual)


if __name__ == "__main__":
    unittest.main()
