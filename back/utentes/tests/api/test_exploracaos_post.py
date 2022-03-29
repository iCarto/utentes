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
from utentes.tests.fixtures.test_data import default_exploracao


class ExploracaoCreateTests(DBIntegrationTest):
    def setUp(self):
        super().setUp()
        self.request.json_body = default_exploracao(self.request)

    def tearDown(self):
        self._clean_up()
        super().tearDown()

    def test_create_exploracao(self):
        self.delete_exp_id(self.request.json_body["exp_id"])
        self.e = exploracaos_create(self.request)
        self.actual = self._get_actual()
        utente = self.request.db.query(Utente).filter(Utente.nome == "nome").first()
        licencia = self.actual.licencias[0]
        fonte = self.actual.fontes[0]
        self.assertEqual("new name", self.actual.exp_name)
        self.assertEqual("2001-01-01", self.actual.d_soli.isoformat())
        self.assertEqual("new observ", self.actual.observacio)
        self.assert_adm_location(self.actual)
        self.assertEqual("new loc_nucleo", self.actual.loc_nucleo)
        self.assertEqual("new enderezo", self.actual.loc_endere)
        self.assertEqual("DGBM", self.actual.loc_divisao)
        self.assertEqual("Megaruma", self.actual.loc_bacia)
        self.assertEqual("Megaruma", self.actual.loc_subaci)
        self.assertEqual("Megaruma", self.actual.loc_rio)
        self.assertEqual(19.02, float(self.actual.c_soli))
        self.assertEqual(29, float(self.actual.c_licencia))
        self.assertEqual(92, float(self.actual.c_real))
        self.assertEqual(42.23, float(self.actual.c_estimado))
        self.assertEqual(utente, self.actual.utente_rel)
        self.assertEqual("nome", utente.nome)
        self.assertEqual("nuit", utente.nuit)
        self.assertEqual("Sociedade", utente.uten_tipo)
        self.assertEqual("reg_comerc", utente.reg_comerc)
        self.assertEqual("reg_zona", utente.reg_zona)
        self.assert_adm_location(utente)
        self.assertEqual("loc_nucleo", utente.loc_nucleo)
        self.assertEqual(K_SANEAMENTO, self.actual.actividade.tipo)
        self.assertEqual(3, self.actual.actividade.c_estimado)
        self.assertEqual(120000, self.actual.actividade.habitantes)
        self.assertEqual(f"{self.actual.exp_id}/Sub", licencia.lic_nro)
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

    def test_create_exploracao_validation_fails(self):
        self.request.json_body["exp_name"] = None
        self.assertRaises(HTTPBadRequest, exploracaos_create, self.request)

    def test_create_exploracao_validation_fails_due_void_licenses_array(self):
        self.request.json_body["licencias"] = []
        self.assertRaises(HTTPBadRequest, exploracaos_create, self.request)

    def test_create_exploracao_actividade_rega_without_cultivos(self):
        self.request.json_body["actividade"] = {
            "tipo": K_AGRICULTURA,
            "c_estimado": 5,
            "cultivos": [],
        }
        self.e = exploracaos_create(self.request)
        self.actual = self._get_actual()
        self.assertEqual(K_AGRICULTURA, self.actual.actividade.tipo)
        self.assertEqual(0, len(self.actual.actividade.cultivos))

    def test_create_abastecemento(self):
        self.request.json_body["actividade"] = {
            "tipo": K_ABASTECIMENTO,
            "c_estimado": 1,
            "habitantes": 2,
            "dotacao": 3,
        }
        self.e = exploracaos_create(self.request)
        self.assertEqual(K_ABASTECIMENTO, self._get_actual().actividade.tipo)

    def test_create_agricultura(self):

        self.request.json_body = default_exploracao(self.request)
        self.request.json_body["actividade"] = {
            "tipo": K_AGRICULTURA,
            "cultivos": [],
            "c_estimado": 1,
        }
        self.e = exploracaos_create(self.request)

        self.assertEqual(K_AGRICULTURA, self._get_actual().actividade.tipo)

    def test_create_industria(self):
        self.request.json_body = default_exploracao(self.request)
        self.request.json_body["actividade"] = {"tipo": K_INDUSTRIA, "c_estimado": 1}
        self.e = exploracaos_create(self.request)
        self.assertEqual(K_INDUSTRIA, self._get_actual().actividade.tipo)

    def test_create_pecuaria(self):
        self.request.json_body = default_exploracao(self.request)
        self.request.json_body["actividade"] = {
            "tipo": K_PECUARIA,
            "reses": [],
            "c_estimado": 1,
        }
        self.e = exploracaos_create(self.request)

        self.assertEqual(K_PECUARIA, self._get_actual().actividade.tipo)

    def test_create_piscicultura(self):
        self.request.json_body = default_exploracao(self.request)
        self.request.json_body["actividade"] = {"tipo": K_PISCICULTURA, "c_estimado": 1}
        self.e = exploracaos_create(self.request)
        self.assertEqual(K_PISCICULTURA, self._get_actual().actividade.tipo)

    def test_create_energia(self):
        self.request.json_body = default_exploracao(self.request)
        self.request.json_body["actividade"] = {"tipo": K_ENERGIA, "c_estimado": 1}
        self.e = exploracaos_create(self.request)
        self.assertEqual(K_ENERGIA, self._get_actual().actividade.tipo)

    def test_create_saneamiento(self):
        self.request.json_body = default_exploracao(self.request)
        self.request.json_body["actividade"] = {"tipo": K_SANEAMENTO, "c_estimado": 1}
        self.e = exploracaos_create(self.request)
        self.assertEqual(K_SANEAMENTO, self._get_actual().actividade.tipo)

    def _get_actual(self):
        self.actual = (
            self.request.db.query(Exploracao)
            .filter(Exploracao.exp_id == self.e.exp_id)
            .first()
        )
        return self.actual

    def _clean_up(self):
        if getattr(self, "e", None):
            self.request.db.delete(self.e)
        if getattr(self, "actual", None):
            self.request.db.delete(self.actual)
        self.request.db.commit()


if __name__ == "__main__":
    unittest.main()
