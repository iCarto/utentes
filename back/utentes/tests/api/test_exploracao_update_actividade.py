import unittest

from pyramid.httpexceptions import HTTPBadRequest

from utentes.api.exploracaos import exploracaos_update
from utentes.models.actividade import Actividade
from utentes.models.constants import K_AGRICULTURA, K_SANEAMENTO
from utentes.models.exploracao import Exploracao
from utentes.repos.exploracao_repo import get_exploracao_by_pk
from utentes.tests.api import DBIntegrationTest
from utentes.tests.fixtures.build_json import from_exploracao
from utentes.tests.fixtures.create_exploracao import get_test_exploracao_from_db


class ExploracaoUpdateActividadeTests(DBIntegrationTest):
    def test_update_exploracao_update_actividade_values(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["actividade"]["c_estimado"] = 101.11
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, gid)
        self.assertEqual(101.11, float(actual.actividade.c_estimado))

    def test_update_exploracao_update_actividade_validation_fails(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["utente"]["observacio"] = " foo - bar "
        expected_json["observacio"] = " foo - bar "
        expected_json["licencias"][0]["estado"] = "Licenciada"
        expected_json["actividade"]["c_estimado"] = "TEXT"
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, exploracaos_update, self.request)
        actual = get_exploracao_by_pk(self.create_new_session(), gid)
        self.assertEqual(expected.utente_rel.observacio, actual.utente_rel.observacio)
        self.assertNotEqual(" foo - bar ", actual.utente_rel.observacio)
        self.assertEqual(expected.observacio, actual.observacio)
        self.assertNotEqual(" foo - bar ", actual.observacio)

    def test_update_exploracao_update_actividade_not_run_activity_validations(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["observacio"] = " foo - bar "
        expected_json["licencias"][0]["estado"] = "Não aprovada"
        expected_json["actividade"]["c_estimado"] = None
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, gid)
        self.assertEqual("Não aprovada", actual.licencias[0].estado)
        self.assertIsNone(actual.actividade.c_estimado)
        self.assertEqual(" foo - bar ", actual.observacio)

    def test_update_exploracao_change_actividade(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        gid_actividade = expected.actividade.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        # change from industria to saneamento
        expected_json["actividade"] = {
            "id": None,
            "tipo": K_SANEAMENTO,
            "c_estimado": 23,
            "habitantes": 42,
        }
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, gid)
        count_actividade = (
            self.request.db.query(Actividade)
            .filter(Actividade.gid == gid_actividade)
            .count()
        )
        self.assertEqual(0, count_actividade)  # was deleted
        self.assertEqual(K_SANEAMENTO, actual.actividade.tipo)
        self.assertEqual(23, actual.actividade.c_estimado)
        self.assertEqual(42, actual.actividade.habitantes)

    def test_update_exploracao_create_cultivo(self):
        expected = (
            self.request.db.query(Exploracao)
            .join(Exploracao.actividade)
            .filter(Exploracao.actividade.has(tipo=K_AGRICULTURA))
        ).first()

        old_len = len(expected.actividade.cultivos)
        self.request.matchdict.update({"id": expected.gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["actividade"]["cultivos"].append(
            {
                "cultivo": "Verduras",
                "c_estimado": 5,
                "rega": "Gravidade",
                "eficiencia": 55,
                "area": 1,
            }
        )
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, expected.gid)
        cultivos = actual.actividade.cultivos
        self.assertEqual(old_len + 1, len(cultivos))
        self.assertEqual(cultivos[-1].c_estimado, 5)
        self.assertEqual(cultivos[-1].eficiencia, 55)


if __name__ == "__main__":
    unittest.main()
