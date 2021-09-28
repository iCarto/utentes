import unittest

from pyramid.httpexceptions import HTTPBadRequest

from utentes.api.exploracaos import exploracaos_update
from utentes.models.utente import Utente
from utentes.repos.exploracao_repo import get_exploracao_by_pk
from utentes.tests.api import DBIntegrationTest
from utentes.tests.fixtures.build_json import from_exploracao
from utentes.tests.fixtures.create_exploracao import get_test_exploracao_from_db


class ExploracaoUpdateUtenteTests(DBIntegrationTest):
    @unittest.skip(
        "Falla porque upsert_utente no actualiza el body cuando ya existe la utente hay que revisar si se hizó así por algún motivo"
    )
    def test_update_utente_values(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["utente"]["nuit"] = "new nuit"
        expected_json["utente"]["uten_tipo"] = "Outro"
        expected_json["utente"]["reg_comerc"] = "new reg_comerc"
        expected_json["utente"]["reg_zona"] = "new reg_zona"
        expected_json["utente"]["loc_provin"] = "Niassa"
        expected_json["utente"]["loc_distri"] = "Lago"
        expected_json["utente"]["loc_posto"] = "Cobue"
        expected_json["utente"]["loc_nucleo"] = "new loc_nucleo"
        expected_json["utente"]["observacio"] = "new observacio"
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, gid)
        self.assertEqual("new nuit", actual.utente_rel.nuit)
        self.assertEqual("Outro", actual.utente_rel.uten_tipo)
        self.assertEqual("new reg_comerc", actual.utente_rel.reg_comerc)
        self.assertEqual("new reg_zona", actual.utente_rel.reg_zona)
        self.assertEqual("Niassa", actual.utente_rel.loc_provin)
        self.assertEqual("Lago", actual.utente_rel.loc_distri)
        self.assertEqual("Cobue", actual.utente_rel.loc_posto)
        self.assertEqual("new loc_nucleo", actual.utente_rel.loc_nucleo)
        self.assertEqual("new observacio", actual.utente_rel.observacio)

    def test_update_utente_validation_fails(self):
        exp = get_test_exploracao_from_db(self.request.db)
        gid = exp.gid
        self.request.matchdict.update({"id": gid})
        expected = get_exploracao_by_pk(self.request.db, gid)
        expected_json = from_exploracao(self.request, expected)
        expected_json["utente"]["nome"] = None
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, exploracaos_update, self.request)
        actual = get_exploracao_by_pk(self.create_new_session(), gid)
        self.assertEqual(expected.utente_rel.nome, actual.utente_rel.nome)

    @unittest.skip("Probablemente relacionado con upsert_utente")
    def test_rename_utente(self):
        """Tests that the utente that owns the exp can be renamed from the exploracao.

        And a new utente is not created.
        """
        exp = get_test_exploracao_from_db(self.request.db)
        gid = exp.gid
        self.request.matchdict.update({"id": gid})
        expected = get_exploracao_by_pk(self.request.db, gid)
        expected_utente_gid = expected.utente
        expected_json = from_exploracao(self.request, expected)
        expected_json["utente"]["nome"] = "foo - bar"
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, gid)
        self.assertEqual(expected_utente_gid, actual.utente)
        self.assertEqual("foo - bar", actual.utente_rel.nome)
        u = (
            self.request.db.query(Utente)
            .filter(Utente.gid == expected_utente_gid)
            .all()[0]
        )
        self.assertEqual("foo - bar", u.nome)

    def test_rename_utente_validation_fails(self):
        exp = get_test_exploracao_from_db(self.request.db)
        gid = exp.gid
        self.request.matchdict.update({"id": gid})
        expected = get_exploracao_by_pk(self.request.db, gid)
        expected_json = from_exploracao(self.request, expected)
        expected_json["utente"]["nome"] = "foo - bar"
        expected_json["c_soli"] = "a text here should produce an error"
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, exploracaos_update, self.request)

    def test_change_utente(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        expected_json = from_exploracao(self.request, expected)
        utente = self.request.db.query(Utente).first()
        expected_json["utente"].update(
            {
                "id": utente.gid,
                "nome": utente.nome,
                "nuit": utente.nuit,
                "uten_tipo": utente.uten_tipo,
                "reg_comerc": utente.reg_comerc,
                "reg_zona": utente.reg_zona,
                "loc_provin": utente.loc_provin,
                "loc_distri": utente.loc_distri,
                "loc_posto": utente.loc_posto,
                "loc_nucleo": utente.loc_nucleo,
                "observacio": utente.observacio,
            }
        )
        self.request.matchdict.update({"id": gid})
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, gid)
        self.assertEqual(utente.nome, actual.utente_rel.nome)

    def test_new_utente(self):
        exp = get_test_exploracao_from_db(self.request.db)
        gid = exp.gid

        self.request.matchdict.update({"id": gid})
        exp_json = from_exploracao(self.request, exp)
        exp_json["utente"].update({"id": None, "nome": "test nome"})
        self.request.json_body = exp_json
        exploracaos_update(self.request)
        actual = get_exploracao_by_pk(self.request.db, gid)
        self.assertEqual("test nome", actual.utente_rel.nome)


if __name__ == "__main__":
    unittest.main()
