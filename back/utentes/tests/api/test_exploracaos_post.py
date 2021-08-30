import unittest

from pyramid.httpexceptions import HTTPBadRequest

from utentes.api.exploracaos import exploracaos_create
from utentes.models.constants import (
    K_ABASTECIMENTO,
    K_AGRICULTURA,
    K_ENERGIA,
    K_INDUSTRIA,
    K_PECUARIA,
    K_PISCICULTURA,
    K_SANEAMENTO,
    K_SUBTERRANEA,
)
from utentes.models.exploracao import Exploracao
from utentes.models.utente import Utente
from utentes.tests.api import DBIntegrationTest
from utentes.tests.fixtures.create_exploracao import build_json


class ExploracaoCreateTests(DBIntegrationTest):
    def test_create_exploracao(self):
        self.request.json_body = build_json(self.request)
        self.delete_exp_id(self.request.json_body["exp_id"])
        e = exploracaos_create(self.request)
        actual = (
            self.request.db.query(Exploracao)
            .filter(Exploracao.exp_id == e.exp_id)
            .all()[0]
        )
        utente = self.request.db.query(Utente).filter(Utente.nome == "nome").all()[0]
        licencia = actual.licencias[0]
        fonte = actual.fontes[0]
        self.assertEqual("new name", actual.exp_name)
        self.assertEqual("2001-01-01", actual.d_soli.isoformat())
        self.assertEqual("new observ", actual.observacio)
        self.assertEqual("Niassa", actual.loc_provin)
        self.assertEqual("Lago", actual.loc_distri)
        self.assertEqual("Cobue", actual.loc_posto)
        self.assertEqual("new loc_nucleo", actual.loc_nucleo)
        self.assertEqual("new enderezo", actual.loc_endere)
        self.assertEqual("DGBM", actual.loc_divisao)
        self.assertEqual("Megaruma", actual.loc_bacia)
        self.assertEqual("Megaruma", actual.loc_subaci)
        self.assertEqual("Megaruma", actual.loc_rio)
        self.assertEqual(19.02, float(actual.c_soli))
        self.assertEqual(29, float(actual.c_licencia))
        self.assertEqual(92, float(actual.c_real))
        self.assertEqual(42.23, float(actual.c_estimado))
        self.assertEqual(utente, actual.utente_rel)
        self.assertEqual("nome", utente.nome)
        self.assertEqual("nuit", utente.nuit)
        self.assertEqual("Sociedade", utente.uten_tipo)
        self.assertEqual("reg_comerc", utente.reg_comerc)
        self.assertEqual("reg_zona", utente.reg_zona)
        self.assertEqual("Niassa", utente.loc_provin)
        self.assertEqual("Lago", utente.loc_distri)
        self.assertEqual("Cobue", utente.loc_posto)
        self.assertEqual("loc_nucleo", utente.loc_nucleo)
        self.assertEqual(K_SANEAMENTO, actual.actividade.tipo)
        self.assertEqual(3, actual.actividade.c_estimado)
        self.assertEqual(120000, actual.actividade.habitantes)
        self.assertEqual(f"{actual.exp_id}/Sub", licencia.lic_nro)
        self.assertEqual(K_SUBTERRANEA, licencia.tipo_agua)
        self.assertEqual("Licenciada", licencia.estado)
        self.assertEqual("2020-02-02", licencia.d_emissao.isoformat())
        self.assertEqual("2010-10-10", licencia.d_validade.isoformat())
        self.assertEqual(4.3, float(licencia.c_soli_tot))
        self.assertEqual(2.3, float(licencia.c_soli_int))
        self.assertEqual(2, float(licencia.c_soli_fon))
        self.assertEqual(10, float(licencia.c_licencia))
        self.assertEqual(4.3, float(licencia.c_real_tot))
        self.assertEqual(2.3, float(licencia.c_real_int))
        self.assertEqual(2, float(licencia.c_real_fon))
        self.assertEqual(K_SUBTERRANEA, fonte.tipo_agua)
        self.assertEqual("Furo", fonte.tipo_fonte)
        self.assertEqual("23,23 42,21", fonte.lat_lon)
        self.assertEqual("2001-01-01", fonte.d_dado.isoformat())
        self.assertEqual(23.42, float(fonte.c_soli))
        self.assertEqual(42.23, float(fonte.c_max))
        self.assertEqual(4.3, float(fonte.c_real))
        self.assertEqual("Contador", fonte.sist_med)
        self.assertEqual("manual", fonte.metodo_est)
        self.assertEqual("observacio", fonte.observacio)
        self._clean_up(e, actual)

    def test_create_exploracao_validation_fails(self):
        expected_json = build_json(self.request)
        expected_json["exp_name"] = None
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, exploracaos_create, self.request)

    def test_create_exploracao_validation_fails_due_void_licenses_array(self):
        expected_json = build_json(self.request)
        expected_json["licencias"] = []
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, exploracaos_create, self.request)

    def test_create_exploracao_actividade_rega_without_cultivos(self):
        expected_json = build_json(self.request)
        expected_json["actividade"] = {
            "tipo": K_AGRICULTURA,
            "c_estimado": 5,
            "cultivos": [],
        }
        self.request.json_body = expected_json
        self.delete_exp_id(self.request.json_body["exp_id"])
        e = exploracaos_create(self.request)
        actual = (
            self.request.db.query(Exploracao)
            .filter(Exploracao.exp_id == e.exp_id)
            .all()[0]
        )
        self.assertEqual(K_AGRICULTURA, actual.actividade.tipo)
        self.assertEqual(0, len(actual.actividade.cultivos))
        self._clean_up(e, actual)

    def test_all_activities_can_be_created_without_validations_fails(self):
        expected_json = build_json(self.request)
        self.delete_exp_id(expected_json["exp_id"])
        expected_json["actividade"] = {
            "tipo": K_ABASTECIMENTO,
            "c_estimado": 1,
            "habitantes": 2,
            "dotacao": 3,
        }
        self.request.json_body = expected_json
        e = exploracaos_create(self.request)
        actual = (
            self.request.db.query(Exploracao)
            .filter(Exploracao.exp_id == e.exp_id)
            .all()[0]
        )
        self.assertEqual(K_ABASTECIMENTO, actual.actividade.tipo)
        self._clean_up(e, actual)

        expected_json = build_json(self.request)
        expected_json["actividade"] = {
            "tipo": K_AGRICULTURA,
            "cultivos": [],
            "c_estimado": 1,
        }
        self.request.json_body = expected_json
        e = exploracaos_create(self.request)
        actual = (
            self.request.db.query(Exploracao)
            .filter(Exploracao.exp_id == e.exp_id)
            .all()[0]
        )
        self.assertEqual(K_AGRICULTURA, actual.actividade.tipo)
        self._clean_up(e, actual)

        expected_json = build_json(self.request)
        expected_json["actividade"] = {"tipo": K_INDUSTRIA, "c_estimado": 1}
        self.request.json_body = expected_json
        e = exploracaos_create(self.request)
        actual = (
            self.request.db.query(Exploracao)
            .filter(Exploracao.exp_id == e.exp_id)
            .all()[0]
        )
        self.assertEqual(K_INDUSTRIA, actual.actividade.tipo)
        self._clean_up(e, actual)

        expected_json = build_json(self.request)
        expected_json["actividade"] = {
            "tipo": K_PECUARIA,
            "reses": [],
            "c_estimado": 1,
        }
        self.request.json_body = expected_json
        e = exploracaos_create(self.request)
        actual = (
            self.request.db.query(Exploracao)
            .filter(Exploracao.exp_id == e.exp_id)
            .all()[0]
        )
        self.assertEqual(K_PECUARIA, actual.actividade.tipo)
        self._clean_up(e, actual)

        expected_json = build_json(self.request)
        expected_json["actividade"] = {"tipo": K_PISCICULTURA, "c_estimado": 1}
        self.request.json_body = expected_json
        e = exploracaos_create(self.request)
        actual = (
            self.request.db.query(Exploracao)
            .filter(Exploracao.exp_id == e.exp_id)
            .all()[0]
        )
        self.assertEqual(K_PISCICULTURA, actual.actividade.tipo)
        self._clean_up(e, actual)

        expected_json = build_json(self.request)
        expected_json["actividade"] = {"tipo": K_ENERGIA, "c_estimado": 1}
        self.request.json_body = expected_json
        e = exploracaos_create(self.request)
        actual = (
            self.request.db.query(Exploracao)
            .filter(Exploracao.exp_id == e.exp_id)
            .all()[0]
        )
        self.assertEqual(K_ENERGIA, actual.actividade.tipo)
        self._clean_up(e, actual)

        expected_json = build_json(self.request)
        expected_json["actividade"] = {"tipo": K_SANEAMENTO, "c_estimado": 1}
        self.request.json_body = expected_json
        e = exploracaos_create(self.request)
        actual = (
            self.request.db.query(Exploracao)
            .filter(Exploracao.exp_id == e.exp_id)
            .all()[0]
        )
        self.assertEqual(K_SANEAMENTO, actual.actividade.tipo)
        self._clean_up(e, actual)

    def _clean_up(self, e, actual):
        self.request.db.delete(e)
        self.request.db.delete(actual)
        self.request.db.commit()


if __name__ == "__main__":
    unittest.main()
