import unittest

from pyramid.httpexceptions import HTTPBadRequest

from utentes.api.tanques_piscicolas import tanques_piscicolas_update
from utentes.models.tanques_piscicolas import ActividadesTanquesPiscicolas as Entity
from utentes.tests.api import DBIntegrationTest
from utentes.tests.e2e.testing_database import insert_exp
from utentes.tests.fixtures import build_json, create_tanque
from utentes.tests.fixtures.create_actividade import piscicola
from utentes.tests.fixtures.create_exploracao import create_test_exploracao


class TanquesPiscicolasUpdateTests(DBIntegrationTest):
    def setUp(self):
        super().setUp()
        exp = create_test_exploracao(actividade=piscicola())
        tanque = create_tanque.create_test_tanque()
        tanque.tanque_id = f"{exp.exp_id}/001"
        exp.actividade.tanques_piscicolas.append(tanque)
        insert_exp(self.request.db, exp)
        self.expected_gid = tanque.gid
        self.expected = tanque
        self.test_exp = exp

    def test_update_tanque(self):
        self.request.matchdict.update({"id": self.expected_gid})
        self.request.json_body = build_json.simple_geojson(self.request, self.expected)
        self.request.json_body.update(
            {
                "tipo": "Tanque",
                "cumprimen": 3,
                "observacio": "Texto con ñ y tildes como camión",
                "venda": 33,
            }
        )

        tanques_piscicolas_update(self.request)
        actual = self._get_actual(self.request.db)
        self.assertEqual("Tanque", actual.tipo)
        self.assertEqual(3, actual.cumprimen)
        self.assertEqual("Texto con ñ y tildes como camión", actual.observacio)
        self.assertEqual(33, actual.venda)
        self.assertIsNone(actual.the_geom)

    def test_update_tanque_the_geom(self):
        self.assertIsNone(self.expected.the_geom)
        self.request.matchdict.update({"id": self.expected_gid})
        self.request.json_body = build_json.simple_geojson(self.request, self.expected)
        self.request.json_body.update(
            {
                "geometry_edited": True,
                "geometry": {
                    "type": "MultiPolygon",
                    "coordinates": [
                        [
                            [
                                [40.3566078671374, -12.8577371684984],
                                [40.3773594643965, -12.8576290475983],
                                [40.3774400124151, -12.8723906015176],
                                [40.3566872025163, -12.8724988506617],
                                [40.3566078671374, -12.8577371684984],
                            ]
                        ]
                    ],
                },
            }
        )
        tanques_piscicolas_update(self.request)
        actual = self._get_actual(self.request.db)
        self.assertTrue(actual.the_geom is not None)

    def test_not_update_tanque_the_geom(self):
        self.assertIsNone(self.expected.the_geom)
        self.request.matchdict.update({"id": self.expected_gid})
        self.request.json_body = build_json.simple_geojson(self.request, self.expected)
        self.request.json_body.update(
            {
                "geometry_edited": False,
                "geometry": {
                    "type": "MultiPolygon",
                    "coordinates": [
                        [
                            [
                                [40.3566078671374, -12.8577371684984],
                                [40.3773594643965, -12.8576290475983],
                                [40.3774400124151, -12.8723906015176],
                                [40.3566872025163, -12.8724988506617],
                                [40.3566078671374, -12.8577371684984],
                            ]
                        ]
                    ],
                },
            }
        )
        tanques_piscicolas_update(self.request)
        actual = self._get_actual(self.request.db)
        self.assertIsNone(actual.the_geom)

    def test_update_tanque_validation_fails(self):
        self.request.matchdict.update({"id": self.expected_gid})
        self.request.json_body = build_json.simple_geojson(self.request, self.expected)
        self.request.json_body.update({"cumprimen": "un texto en lugar de un número"})
        self.assertRaises(HTTPBadRequest, tanques_piscicolas_update, self.request)

    def _get_actual(self, db) -> Entity:
        return db.query(Entity).filter(Entity.gid == self.expected_gid).first()


if __name__ == "__main__":
    unittest.main()
