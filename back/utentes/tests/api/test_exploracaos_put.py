import unittest

from pyramid.httpexceptions import HTTPBadRequest

from utentes.api.exploracaos import exploracaos_update
from utentes.models.actividade import Actividade, ActividadesAgriculturaRega
from utentes.models.constants import (
    K_SANEAMENTO,
    K_AGRICULTURA,
    K_SUBTERRANEA,
    K_SUPERFICIAL,
)
from utentes.models.exploracao import Exploracao
from utentes.models.fonte import Fonte
from utentes.models.licencia import Licencia
from utentes.models.utente import Utente
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
        actual = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
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
        actual = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
        # SELECT st_area(st_transform(ST_GeomFromText(
        # 'MULTIPOLYGON(((40.3566078671374 -12.8577371684984, 40.3773594643965
        # -12.8576290475983, 40.3774400124151 -12.8723906015176, 40.3566872025163
        # -12.8724988506617, 40.3566078671374 -12.8577371684984)))', 4326 ),
        # 32737));
        self.assertAlmostEqual(367.77, float(actual.area), 2)

    def test_update_exploracao_delete_the_geom(self):
        expected = (
            self.request.db.query(Exploracao)
            .filter(Exploracao.the_geom.isnot(None))
            .all()[0]
        )
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["geometry_edited"] = True
        expected_json["geometry"] = None
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
        self.assertIsNone(actual.the_geom)
        self.assertIsNone(actual.area)

    def test_update_exploracao_validation_fails(self):
        expected = self.request.db.query(Exploracao).all()[0]
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        exp_name = expected_json["exp_name"]
        expected_json["exp_name"] = None
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, exploracaos_update, self.request)
        s = self.create_new_session()
        actual = s.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        self.assertEqual(exp_name, actual.exp_name)


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
        actual = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
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
        s = self.create_new_session()
        actual = s.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
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
        actual = self.request.db.query(Fonte).filter(Fonte.gid == gid_fonte).all()[0]
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
        expected = self.request.db.query(Exploracao).all()[0]
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        tipo_agua = expected_json["fontes"][0]["tipo_agua"]
        expected_json["fontes"][0]["tipo_agua"] = None
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, exploracaos_update, self.request)
        s = self.create_new_session()
        actual = s.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        self.assertEqual(tipo_agua, actual.fontes[0].tipo_agua)

    def test_update_exploracao_delete_fonte(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["fontes"] = []
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
        self.assertEqual(0, len(actual.fontes))


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
                "estado": "Irregular",
                "d_emissao": "2020-2-2",
                "d_validade": "2010-10-10",
                "c_licencia": 10,
                "iva": 12.75,
                "consumo_tipo": "Fixo",
            }
        )
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
        self.assertEqual(2, len(actual.licencias))

    def test_update_exploracao_create_licencia_validation_fails(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["licencias"].append({"tipo_agua": "Superficial", "estado": None})
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, exploracaos_update, self.request)
        s = self.create_new_session()
        actual = s.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
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
        actual = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
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
        s = self.create_new_session()
        actual = s.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
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
        actual = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
        lic_count = (
            self.request.db.query(Licencia).filter(Licencia.gid == lic_gid).count()
        )
        self.assertEqual(1, len(actual.licencias))
        self.assertEqual(1, lic_count)


class ExploracaoUpdateUtenteTests(DBIntegrationTest):
    def get_test_utente(self):
        return self.request.db.query(Utente).all()[0]

    @unittest.skip(
        """ Falla porque upsert_utente no actualiza el body cuando ya existe la utente
    hay que revisar si se hizó así por algún motivo
    """
    )
    def test_update_exploracao_update_utente_values(self):
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
        print(expected_json["utente"])
        exploracaos_update(self.request)
        actual = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
        print(actual.utente_rel.__json__(self.request))
        self.assertEqual("new nuit", actual.utente_rel.nuit)
        self.assertEqual("Outro", actual.utente_rel.uten_tipo)
        self.assertEqual("new reg_comerc", actual.utente_rel.reg_comerc)
        self.assertEqual("new reg_zona", actual.utente_rel.reg_zona)
        self.assertEqual("Niassa", actual.utente_rel.loc_provin)
        self.assertEqual("Lago", actual.utente_rel.loc_distri)
        self.assertEqual("Cobue", actual.utente_rel.loc_posto)
        self.assertEqual("new loc_nucleo", actual.utente_rel.loc_nucleo)
        self.assertEqual("new observacio", actual.utente_rel.observacio)

    def test_update_exploracao_update_utente_validation_fails(self):
        exp = get_test_exploracao_from_db(self.request.db)
        gid = exp.gid
        self.request.matchdict.update({"id": gid})
        expected = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
        expected_json = from_exploracao(self.request, expected)
        expected_json["utente"]["nome"] = None
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, exploracaos_update, self.request)
        s = self.create_new_session()
        actual = s.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        self.assertEqual(expected.utente_rel.nome, actual.utente_rel.nome)

    @unittest.skip("Probablemente relacionado con upsert_utente")
    def test_update_exploracao_rename_utente(self):
        """Tests that the utente that owns the exp can be renamed from the exploracao.

        And a new utente is not created.
        """
        exp = get_test_exploracao_from_db(self.request.db)
        gid = exp.gid
        self.request.matchdict.update({"id": gid})
        expected = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
        expected_utente_gid = expected.utente
        expected_json = from_exploracao(self.request, expected)
        expected_json["utente"]["nome"] = "foo - bar"
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
        self.assertEqual(expected_utente_gid, actual.utente)
        self.assertEqual("foo - bar", actual.utente_rel.nome)
        u = (
            self.request.db.query(Utente)
            .filter(Utente.gid == expected_utente_gid)
            .all()[0]
        )
        self.assertEqual("foo - bar", u.nome)

    def test_update_exploracao_rename_utente_validation_fails(self):
        exp = get_test_exploracao_from_db(self.request.db)
        gid = exp.gid
        self.request.matchdict.update({"id": gid})
        expected = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
        expected_json = from_exploracao(self.request, expected)
        expected_json["utente"]["nome"] = "foo - bar"
        expected_json["c_soli"] = "a text here should produce an error"
        self.request.json_body = expected_json
        self.assertRaises(HTTPBadRequest, exploracaos_update, self.request)

    def test_update_exploracao_change_utente(self):
        exp = get_test_exploracao_from_db(self.request.db)
        gid = exp.gid
        utente = self.get_test_utente()

        self.request.matchdict.update({"id": gid})
        expected = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
        expected_json = from_exploracao(self.request, expected)
        expected_json["utente"]["id"] = utente.gid
        expected_json["utente"]["nome"] = utente.nome
        expected_json["utente"]["nuit"] = utente.nuit
        expected_json["utente"]["uten_tipo"] = utente.uten_tipo
        expected_json["utente"]["reg_comerc"] = utente.reg_comerc
        expected_json["utente"]["reg_zona"] = utente.reg_zona
        expected_json["utente"]["loc_provin"] = utente.loc_provin
        expected_json["utente"]["loc_distri"] = utente.loc_distri
        expected_json["utente"]["loc_posto"] = utente.loc_posto
        expected_json["utente"]["loc_nucleo"] = utente.loc_nucleo
        expected_json["utente"]["observacio"] = utente.observacio
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
        self.assertEqual(utente.nome, actual.utente_rel.nome)

    def test_update_exploracao_new_utente(self):
        exp = get_test_exploracao_from_db(self.request.db)
        gid = exp.gid

        self.request.matchdict.update({"id": gid})
        exp_json = from_exploracao(self.request, exp)
        exp_json["utente"]["id"] = None
        exp_json["utente"]["nome"] = "test nome"
        self.request.json_body = exp_json
        exploracaos_update(self.request)
        actual = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
        self.assertEqual("test nome", actual.utente_rel.nome)


class ExploracaoUpdateActividadeTests(DBIntegrationTest):
    def test_update_exploracao_update_actividade_values(self):
        expected = get_test_exploracao_from_db(self.request.db)
        gid = expected.gid
        self.request.matchdict.update({"id": gid})
        expected_json = from_exploracao(self.request, expected)
        expected_json["actividade"]["c_estimado"] = 101.11
        self.request.json_body = expected_json
        exploracaos_update(self.request)
        actual = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
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
        s = self.create_new_session()
        actual = s.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
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
        actual = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
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
        actual = (
            self.request.db.query(Exploracao).filter(Exploracao.gid == gid).all()[0]
        )
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
        actual = (
            self.request.db.query(Exploracao)
            .filter(Exploracao.gid == expected.gid)
            .first()
        )

        cultivos = actual.actividade.cultivos
        self.assertEqual(old_len + 1, len(cultivos))
        self.assertEqual(cultivos[-1].c_estimado, 5)
        self.assertEqual(cultivos[-1].eficiencia, 55)


if __name__ == "__main__":
    unittest.main()
