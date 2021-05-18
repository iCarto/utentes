from utentes.models.constants import K_LICENSED, K_SANEAMENTO, K_SUBTERRANEA
from utentes.services.id_service import calculate_lic_nro, calculate_new_exp_id
from utentes.tests.e2e.testing_database import create_exp_piscicola


def build_json(request):
    estado_lic = K_LICENSED
    expected = {
        "exp_id": calculate_new_exp_id(request, estado_lic),
        "exp_name": "new name",
        "d_soli": "2001-01-01",
        "observacio": "new observ",
        "loc_provin": "Niassa",
        "loc_distri": "Lago",
        "loc_posto": "Cobue",
        "loc_nucleo": "new loc_nucleo",
        "loc_endere": "new enderezo",
        "loc_unidad": "UGBC",
        "loc_bacia": "Megaruma",
        "loc_subaci": "Megaruma",
        "loc_rio": "Megaruma",
        "c_soli": 19.02,
        "c_licencia": 29,
        "c_real": 92,
        "c_estimado": 42.23,
        "estado_lic": estado_lic,
        "sexo_gerente": "Outros",
    }
    expected["utente"] = {
        "nome": "nome",
        "nuit": "nuit",
        "uten_tipo": "Sociedade",
        "reg_comerc": "reg_comerc",
        "reg_zona": "reg_zona",
        "loc_provin": "Niassa",
        "loc_distri": "Lago",
        "loc_posto": "Cobue",
        "loc_nucleo": "loc_nucleo",
        "sexo_gerente": "Outros",
    }
    expected["actividade"] = {
        "tipo": K_SANEAMENTO,
        "c_estimado": 3,
        "habitantes": 120000,
    }
    expected["licencias"] = [
        {
            "lic_nro": calculate_lic_nro(expected["exp_id"], K_SUBTERRANEA),
            "tipo_agua": K_SUBTERRANEA,
            "estado": "Licenciada",
            "d_emissao": "2020-2-2",
            "d_validade": "2010-10-10",
            "c_soli_tot": 4.3,
            "c_soli_int": 2.3,
            "c_soli_fon": 2,
            "c_licencia": 10,
            "c_real_tot": 4.3,
            "c_real_int": 2.3,
            "c_real_fon": 2,
            "iva": 12.75,
            "consumo_tipo": "Fixo",
        }
    ]
    expected["fontes"] = [
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
            "observacio": "observacio",
        }
    ]
    return expected


def create_tanque_test(request, commit=False):
    e_test = create_exp_piscicola(request)
    actv = e_test.actividade
    # actv = self.request.db.query(ActividadesPiscicultura).all()[0]
    # query = "SELECT exp_id from utentes.exploracaos WHERE gid = " + str(
    #     actv.exploracao
    # )
    # exp = list(self.request.db.execute(query))

    actv_json = actv.__json__(request)
    actv_json["exp_id"] = e_test.exp_id
    tanques = [
        f.__json__(request)["properties"]
        for f in actv_json.get("tanques_piscicolas", {}).get("features", [])
    ]
    tanques.append(
        {
            "estado": "Operacional",
            "esp_culti": "Peixe gato",
            "tipo": "Gaiola",
            "actividade": actv.gid,
        }
    )
    actv_json["tanques_piscicolas"] = tanques
    actv.update_from_json(actv_json)
    request.db.add(actv)
    if commit:
        request.db.commit()
    return actv.tanques_piscicolas[-1]
