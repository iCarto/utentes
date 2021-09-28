import unittest

from pyramid.httpexceptions import HTTPBadRequest

from utentes.api.exploracaos import exploracaos_update
from utentes.models.constants import K_SUBTERRANEA
from utentes.models.exploracao import Exploracao
from utentes.models.fonte import Fonte
from utentes.repos.exploracao_repo import get_exploracao_by_pk
from utentes.tests.api import DBIntegrationTest
from utentes.tests.fixtures.build_json import from_exploracao
from utentes.tests.fixtures.create_exploracao import get_test_exploracao_from_db


class ExploracaoUpdateFonteTests(DBIntegrationTest):
    def test_update_exploracao_create_fonte(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        count = len(expected_json["fontes"])
        expected_json["fontes"].append(
            {
                "tipo_agua": K_SUBTERRANEA,
                "red_monit": "NO",
                "tipo_fonte": "Furo",
                "lat_lon": "23,23 42,21",
                "d_dado": "2001-01-01",
                "c_soli": 23.42,
                "c_max": 42.23,
                "c_real": 4.3,
                "sist_med": "Contador",
                "metodo_est": "manual",
                "observacio": "nao",
            }
        )
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, gid)
        self.assertEqual(count + 1, len(actual.fontes))

    def test_update_exploracao_create_fonte_validation_fails(self):
        expected = get_test_exploracao_from_db(self.request.db)
        expected_count = len(expected.fontes)
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["fontes"].append({"tipo_fonte": "Furo"})
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, exploracaos_update, self.request)
        actual = get_exploracao_by_pk(self.create_new_session(), gid)
        self.assertEqual(expected_count, len(actual.fontes))

    def test_update_exploracao_update_fonte_values(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        gid_fonte = expected.fontes[0].gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["fontes"][0]["lat_lon"] = "23,23 42,21"
        expected_json["fontes"][0]["d_dado"] = "2001-01-01"
        expected_json["fontes"][0]["c_soli"] = 23.42
        expected_json["fontes"][0]["c_max"] = 42.23
        expected_json["fontes"][0]["c_real"] = 4.3
        expected_json["fontes"][0]["sist_med"] = "Contador"
        expected_json["fontes"][0]["metodo_est"] = "manual"
        expected_json["fontes"][0]["observacio"] = "nao"
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = self.request.db.query(Fonte).filter(Fonte.gid == gid_fonte).one()
        self.assertEqual("23,23 42,21", actual.lat_lon)
        self.assertEqual("2001-01-01", actual.d_dado.isoformat())
        self.assertEqual(23.42, float(actual.c_soli))
        self.assertEqual(42.23, float(actual.c_max))
        self.assertEqual(4.3, float(actual.c_real))
        self.assertEqual("Contador", actual.sist_med)
        self.assertEqual("manual", actual.metodo_est)
        self.assertEqual("nao", actual.observacio)
        self.assertEqual(gid, actual.exploracao)

    def test_update_exploracao_update_fonte_validation_fails(self):
        expected = self.request.db.query(Exploracao).first()
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        tipo_agua = expected_json["fontes"][0]["tipo_agua"]
        expected_json["fontes"][0]["tipo_agua"] = None
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, exploracaos_update, self.request)
        actual = get_exploracao_by_pk(self.create_new_session(), gid)
        self.assertEqual(tipo_agua, actual.fontes[0].tipo_agua)

    def test_update_exploracao_delete_fonte(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["fontes"] = []
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, gid)
        self.assertEqual(0, len(actual.fontes))


if __name__ == "__main__":
    unittest.main()
