import unittest

from pyramid.httpexceptions import HTTPBadRequest

from utentes.api.exploracaos import exploracaos_update
from utentes.models.constants import K_INACTIVE, K_SUBTERRANEA, K_SUPERFICIAL
from utentes.models.licencia import Licencia
from utentes.repos.exploracao_repo import get_exploracao_by_pk
from utentes.services.id_service import calculate_lic_nro
from utentes.tests.api import DBIntegrationTest
from utentes.tests.fixtures.build_json import from_exploracao
from utentes.tests.fixtures.create_exploracao import get_test_exploracao_from_db


class ExploracaoUpdateLicenciaTests(DBIntegrationTest):
    def test_update_exploracao_create_licencia(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        existent_tipo_agua = expected.licencias[0].tipo_agua
        new_tipo_agua = (
            K_SUPERFICIAL if existent_tipo_agua == K_SUBTERRANEA else K_SUBTERRANEA
        )
        expected_json["licencias"].append(
            {
                # lic_nro is built from client side, so shouldn't be null
                "lic_nro": calculate_lic_nro(expected_json["exp_id"], new_tipo_agua),
                "tipo_agua": new_tipo_agua,
                "estado": K_INACTIVE,
                "d_emissao": "2020-2-2",
                "d_validade": "2010-10-10",
                "c_licencia": 10,
                "iva": 12.75,
                "consumo_tipo": "Fixo",
            }
        )
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, gid)
        self.assertEqual(2, len(actual.licencias))

    def test_update_exploracao_create_licencia_validation_fails(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["licencias"].append({"tipo_agua": "Superficial", "estado": None})
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, exploracaos_update, self.request)
        actual = get_exploracao_by_pk(self.create_new_session(), gid)
        self.assertEqual(1, len(actual.licencias))

    def test_update_exploracao_update_licencia(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        lic_gid = expected.licencias[0].gid
        lic_nro = expected.licencias[0].lic_nro
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["licencias"][0]["estado"] = "Não aprovada"
        expected_json["licencias"][0]["d_emissao"] = "1999-9-9"
        expected_json["licencias"][0]["d_validade"] = "1999-8-7"
        expected_json["licencias"][0]["c_soli_tot"] = 23.45
        expected_json["licencias"][0]["c_soli_int"] = 0.45
        expected_json["licencias"][0]["c_soli_fon"] = 23
        expected_json["licencias"][0]["c_licencia"] = 999
        expected_json["licencias"][0]["c_real_tot"] = 23.45
        expected_json["licencias"][0]["c_real_int"] = 0.45
        expected_json["licencias"][0]["c_real_fon"] = 23
        expected_json["licencias"][0]["taxa_fixa"] = 23
        expected_json["licencias"][0]["taxa_uso"] = 23
        expected_json["licencias"][0]["iva"] = 23
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, gid)
        self.assertEqual(1, len(actual.licencias))
        self.assertEqual(lic_gid, actual.licencias[0].gid)
        self.assertEqual(lic_nro, actual.licencias[0].lic_nro)
        self.assertEqual("Não aprovada", actual.licencias[0].estado)
        self.assertEqual("1999-09-09", actual.licencias[0].d_emissao.isoformat())
        self.assertEqual("1999-08-07", actual.licencias[0].d_validade.isoformat())
        self.assertEqual(23.45, float(actual.licencias[0].c_soli_tot))
        self.assertEqual(0.45, float(actual.licencias[0].c_soli_int))
        self.assertEqual(23, float(actual.licencias[0].c_soli_fon))
        self.assertEqual(999, float(actual.licencias[0].c_licencia))
        self.assertEqual(23.45, float(actual.licencias[0].c_real_tot))
        self.assertEqual(0.45, float(actual.licencias[0].c_real_int))
        self.assertEqual(23, float(actual.licencias[0].c_real_fon))

    def test_update_exploracao_update_licencia_validation_fails(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        lic_gid = expected.licencias[0].gid
        tipo_agua = expected.licencias[0].tipo_agua
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["licencias"][0]["tipo_agua"] = None
        expected_json["licencias"][0]["estado"] = "Licenciada"
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, exploracaos_update, self.request)
        actual = get_exploracao_by_pk(self.create_new_session(), gid)
        self.assertEqual(1, len(actual.licencias))
        self.assertEqual(lic_gid, actual.licencias[0].gid)
        self.assertEqual(tipo_agua, actual.licencias[0].tipo_agua)

    def test_update_exploracao_delete_licencia(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        lic_gid = expected.licencias[0].gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["licencias"] = [expected_json["licencias"][0]]
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, gid)
        lic_count = (
            self.request.db.query(Licencia).filter(Licencia.gid == lic_gid).count()
        )
        self.assertEqual(1, len(actual.licencias))
        self.assertEqual(1, lic_count)


if __name__ == "__main__":
    unittest.main()
