import unittest

from pyramid.httpexceptions import HTTPBadRequest

from utentes.api.exploracaos import exploracaos_update
from utentes.models.actividade import Actividade
from utentes.models.constants import (
    K_AGRICULTURA,
    K_INACTIVE,
    K_SANEAMENTO,
    K_SUBTERRANEA,
    K_SUPERFICIAL,
)
from utentes.models.exploracao import Exploracao
from utentes.models.licencia import Licencia
from utentes.repos.exploracao_repo import get_exploracao_by_pk
from utentes.services.id_service import calculate_lic_nro
from utentes.tests.api import DBIntegrationTest
from utentes.tests.fixtures.build_json import from_exploracao
from utentes.tests.fixtures.create_exploracao import get_test_exploracao_from_db
from utentes.tests.utils import domain_generator


class ExploracaoUpdateTests(DBIntegrationTest):
    def test_update_exploracao(self):
        # Filter to use a Exploracao in a final state
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["exp_name"] = "new name"
        expected_json["d_soli"] = "2001-01-01"
        expected_json["observacio"] = "new observ"
        expected_json["loc_provin"] = "Niassa"
        expected_json["loc_distri"] = "Lago"
        expected_json["loc_posto"] = "Cobue"
        expected_json["loc_nucleo"] = "new loc_nucleo"
        expected_json["loc_endere"] = "new enderezo"
        hydro_location = domain_generator.hydro_location(loc_subaci="Tembe")
        expected_json["loc_divisao"] = hydro_location.loc_divisao
        expected_json["loc_bacia"] = hydro_location.loc_bacia
        expected_json["loc_subaci"] = hydro_location.loc_subaci
        expected_json["c_soli"] = 19.02
        expected_json["c_licencia"] = 29
        expected_json["c_real"] = 92
        expected_json["c_estimado"] = 42.23
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, gid)
        self.assertEqual("new name", actual.exp_name)
        self.assertEqual("2001-01-01", actual.d_soli.isoformat())
        self.assertEqual("new observ", actual.observacio)
        self.assertEqual("Niassa", actual.loc_provin)
        self.assertEqual("Lago", actual.loc_distri)
        self.assertEqual("Cobue", actual.loc_posto)
        self.assertEqual("new loc_nucleo", actual.loc_nucleo)
        self.assertEqual("new enderezo", actual.loc_endere)
        self.assertEqual("DGBUM", actual.loc_divisao)
        self.assertEqual("Tembe", actual.loc_bacia)
        self.assertEqual("Tembe", actual.loc_subaci)
        self.assertEqual(19.02, float(actual.c_soli))
        self.assertEqual(29, float(actual.c_licencia))
        self.assertEqual(92, float(actual.c_real))
        self.assertEqual(42.23, float(actual.c_estimado))

    def test_update_exploracao_the_geom(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
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
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, gid)
        self.assertAlmostEqual(367.77, float(actual.area), 2)

    def test_update_exploracao_delete_the_geom(self):
        expected = (
            self.request.db.query(Exploracao)
            .filter(Exploracao.the_geom.isnot(None))
            .first()
        )
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["geometry_edited"] = True
        expected_json["geometry"] = None
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, gid)
        self.assertIsNone(actual.the_geom)
        self.assertIsNone(actual.area)

    def test_update_exploracao_validation_fails(self):
        expected = self.request.db.query(Exploracao).first()
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        exp_name = expected_json["exp_name"]
        expected_json["exp_name"] = None
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, exploracaos_update, self.request)
        actual = get_exploracao_by_pk(self.create_new_session(), gid)
        self.assertEqual(exp_name, actual.exp_name)


if __name__ == "__main__":
    unittest.main()
