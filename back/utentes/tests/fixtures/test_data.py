from utentes.models.constants import (
    FLAT_FEE,
    K_LICENSED,
    K_SANEAMENTO,
    K_SUBTERRANEA,
    K_SUPERFICIAL,
)
from utentes.services.id_service import calculate_lic_nro, calculate_new_exp_id
from utentes.tests.utils import domain_generator


def default_real_license():
    return {
        "lic_nro": "001/ARAS-IP/2008/CL/Sup",
        "tipo_agua": "Superficial",
        "tipo_lic": "Licença",
        "n_licen_a": "001/ARAS/2008",
        "estado": "Licenciada",
        "d_emissao": "2008-01-10",
        "d_validade": "2013-01-10",
        "c_soli_tot": 3456.0,
        "c_soli_int": 3456.0,
        "c_soli_fon": 0,
        "c_licencia": 5375.0,
        "c_real_tot": 1791.67,
        "c_real_int": None,
        "c_real_fon": 1791.67,
        "taxa_fixa": 0,
        "taxa_uso": 0,
        "pago_mes": 0,
        "iva": 12.75,
        "pago_iva": 0,
        "consumo_tipo": "Fixo",
        "consumo_fact": 0,
    }


def default_real_exploracao():
    expected = {
        "exp_id": "001/ARAS-IP/2008/CL",
        "exp_name": "Explotación de Prueba",
        "d_soli": "2018-05-25",
        "d_ultima_entrega_doc": "2018-05-25",
        "fact_tipo": "Mensal",
        "pago_lic": False,
        "area": 0.2522,
        "geometry_edited": True,
        "geometry": {
            "type": "MultiPolygon",
            "coordinates": [
                [
                    [
                        [32.8641980350837, -24.3721701497034],
                        [32.8641980350836, -24.3717187379572],
                        [32.8646908537666, -24.3717187379575],
                        [32.8646908537666, -24.3721701497036],
                        [32.8641980350837, -24.3721701497034],
                    ]
                ]
            ],
        },
        "estado_lic": "Licenciada",
        "observacio": "adf",
        "loc_provin": "Gaza",
        "loc_distri": "Guija",
        "loc_posto": "Mubangoene",
        "loc_nucleo": "Chinhacanine",
        "loc_endere": (
            "Localização na Albufeira de Macarretane (Jusante) e  na montante da"
            " estacão E-607"
        ),
        "loc_divisao": "DGBL",
        "loc_bacia": "Limpopo",
        "loc_subaci": None,
        "cadastro_uni": "L047",
        "loc_rio": "Limpopo",
        "c_soli": 3456.0,
        "c_licencia": 5375.0,
        "c_real": 1791.67,
        "c_estimado": 1280.75,
        "sexo_gerente": "Outros",
        "actividade": {
            "tipo": "Agricultura de Regadio",
            "c_estimado": 1280.75,
            "n_cul_tot": 1,
            "area_pot": 3.0,
            "area_irri": 1.0,
            "area_medi": 2.0,
            "cultivos": [
                {
                    "cult_id": "001/ARAS-IP/2008/CL/001",
                    "c_estimado": 1280.75,
                    "cultivo": "Frutícola",
                    "rega": "Gota a gota",
                    "eficiencia": 0.85,
                    "area": 2.0,
                    "observacio": None,
                }
            ],
        },
        "licencias": [default_real_license()],
    }

    expected["fontes"] = [
        {
            "tipo_agua": K_SUPERFICIAL,
            "tipo_fonte": "Rio",
            "red_monit": "NO",
            "lat_lon": "-24,371944 / 32,864444",
            "d_dado": "2007-05-09",
            "c_real": 1791.67,
            "sist_med": "Volumétrica",
        }
    ]
    return expected


def default_exploracao(request):
    estado_lic = K_LICENSED
    hydro_location = domain_generator.hydro_location(loc_bacia="Megaruma")
    adm_location = domain_generator.adm_location(loc_posto="Cóbue")
    expected = {
        "exp_id": calculate_new_exp_id(request, estado_lic),
        "exp_name": "new name",
        "d_soli": "2001-01-01",
        "observacio": "new observ",
        "loc_provin": adm_location.loc_provin,
        "loc_distri": adm_location.loc_distri,
        "loc_posto": adm_location.loc_posto,
        "loc_nucleo": "new loc_nucleo",
        "loc_endere": "new enderezo",
        "loc_divisao": hydro_location.loc_divisao,
        "loc_bacia": hydro_location.loc_bacia,
        "loc_subaci": hydro_location.loc_subaci,
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
        "loc_provin": adm_location.loc_provin,
        "loc_distri": adm_location.loc_distri,
        "loc_posto": adm_location.loc_posto,
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
            "estado": K_LICENSED,
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
            "consumo_tipo": FLAT_FEE,
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
