import unittest

from pyramid.httpexceptions import HTTPBadRequest

from utentes.api.cultivos import cultivos_update
from utentes.models.cultivo import ActividadesCultivos
from utentes.tests.api import DBIntegrationTest
from utentes.tests.fixtures import build_json
from utentes.tests.fixtures.create_cultivo import (
    get_test_cultivo_from_db,
    get_test_cultivo_with_geom_from_db,
)


class CultivosUpdateTests(DBIntegrationTest):
    def setUp(self):
        super().setUp()
        self.expected = get_test_cultivo_from_db(self.request.db)

    def test_update_cultivo(self):
        gid = self.expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = build_json.simple_geojson(self.request, self.expected)
        # expected_json['gid'] = json.get('id')
        # expected_json['cult_id'] = json.get('cult_id')
        expected_json["cultivo"] = "Verduras"
        expected_json["c_estimado"] = 3
        expected_json["rega"] = "Gravidade"
        expected_json["eficiencia"] = 33
        expected_json["observacio"] = "uma observacio"
        self.request.json_body = expected_json
        self.expected.the_geom = None
        self.request.db.commit()
        cultivos_update(self.request)
        actual = (
            self.request.db.query(ActividadesCultivos)
            .filter(ActividadesCultivos.gid == gid)
            .first()
        )
        self.assertEqual("Verduras", actual.cultivo)
        self.assertEqual(3, actual.c_estimado)
        self.assertEqual("Gravidade", actual.rega)
        self.assertEqual(33, actual.eficiencia)
        self.assertEqual("uma observacio", actual.observacio)
        self.assertIsNone(actual.the_geom)

    def test_update_cultivo_the_geom(self):
        gid = self.expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = build_json.simple_geojson(self.request, self.expected)
        expected_json["geometry_edited"] = True
        expected_json["geometry"] = {
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
        }
        self.request.json_body = expected_json
        cultivos_update(self.request)
        actual = (
            self.request.db.query(ActividadesCultivos)
            .filter(ActividadesCultivos.gid == gid)
            .first()
        )
        self.assertAlmostEqual(367.77, float(actual.area), 2)

    def test_not_update_cultivo_the_geom(self):
        gid = self.expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = build_json.simple_geojson(self.request, self.expected)
        expected_json["geometry_edited"] = False
        expected_json["geometry"] = {
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
        }
        self.request.json_body = expected_json
        self.expected.the_geom = None
        self.request.db.commit()
        cultivos_update(self.request)
        actual = (
            self.request.db.query(ActividadesCultivos)
            .filter(ActividadesCultivos.gid == gid)
            .first()
        )
        self.assertIsNone(actual.the_geom)

    def test_update_cultivo_delete_the_geom(self):
        self.expected = get_test_cultivo_with_geom_from_db(self.request.db)
        gid = self.expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = build_json.simple_geojson(self.request, self.expected)
        expected_json["geometry_edited"] = True
        expected_json["geometry"] = None
        self.request.json_body = expected_json
        cultivos_update(self.request)
        actual = (
            self.request.db.query(ActividadesCultivos)
            .filter(ActividadesCultivos.gid == gid)
            .first()
        )
        self.assertIsNone(actual.the_geom)
        self.assertEqual(float(actual.area), 0)  # ticket #3008

    def test_update_cultivo_validation_fails(self):
        gid = self.expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = build_json.simple_geojson(self.request, self.expected)
        rega = expected_json["rega"]
        expected_json["rega"] = None
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, cultivos_update, self.request)
        s = self.create_new_session()
        actual = (
            s.query(ActividadesCultivos).filter(ActividadesCultivos.gid == gid).first()
        )
        self.assertEqual(rega, actual.rega)


if __name__ == "__main__":
    unittest.main()
