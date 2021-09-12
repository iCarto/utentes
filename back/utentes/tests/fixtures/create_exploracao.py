from sqlalchemy import func, select
from sqlalchemy.orm import Session

from utentes.models.constants import (
    K_LICENSED,
    K_PISCICULTURA,
    K_SANEAMENTO,
    K_SUBTERRANEA,
)
from utentes.models.exploracao import Exploracao
from utentes.models.fonte import Fonte
from utentes.models.licencia import Licencia
from utentes.services.id_service import calculate_lic_nro, calculate_new_exp_id
from utentes.tests.e2e.testing_database import create_exp, get_data
from utentes.tests.utils import domain_generator


def piscicola(request):
    data = get_data()
    data["actividade"] = {"tipo": K_PISCICULTURA}
    return create_exp(request, data)


def build_json(request):
    estado_lic = K_LICENSED
    hydro_location = domain_generator.hydro_location(loc_bacia="Megaruma")
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


def get_test_exploracao_from_db(db: Session):
    # Explotación licenciada con al menos una fuente y una sóla licencia
    at_lest_one_source = (
        select([func.count(Exploracao.fontes)])
        .where(Exploracao.gid == Fonte.exploracao)
        .as_scalar()
    )
    only_one_license = (
        select([func.count(Exploracao.licencias)])
        .where(Exploracao.gid == Licencia.exploracao)
        .as_scalar()
    )
    return (
        db.query(Exploracao)
        .filter(Exploracao.estado_lic == K_LICENSED, Exploracao.c_estimado != None)
        .filter(at_lest_one_source > 0)
        .filter(only_one_license == 1)
        .order_by(Exploracao.exp_id)
        .all()[0]
    )
