from sqlalchemy import func, select
from sqlalchemy.orm import Session

from utentes.models.constants import K_LICENSED
from utentes.models.exploracao import Exploracao
from utentes.models.fonte import Fonte
from utentes.models.licencia import Licencia
from utentes.tests.fixtures.create_actividade import abastecemento
from utentes.tests.fixtures.create_licencia import create_test_licencia
from utentes.tests.fixtures.create_utente import create_test_utente
from utentes.tests.utils import domain_generator
from utentes.tests.utils.exp_id_generator import ExpIdGenerator
from utentes.tests.utils.gid_generator import GIDGenerator


def get_test_exploracao_from_db(db: Session) -> Exploracao:
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
        .filter(Exploracao.estado_lic == K_LICENSED, Exploracao.c_estimado.isnot(None))
        .filter(at_lest_one_source > 0)
        .filter(only_one_license == 1)
        .order_by(Exploracao.exp_id)
        .first()
    )


def get_test_exploracao_with_geom_from_db(db: Session) -> Exploracao:
    return db.query(Exploracao).filter(Exploracao.the_geom.isnot(None)).first()


def create_test_exploracao(actividade=None, **kwargs) -> Exploracao:
    exp = Exploracao()
    exp.gid = GIDGenerator.next_exploracao()
    exp.exp_id = ExpIdGenerator.from_serial(exp.gid)
    exp.exp_name = f"Exploracao {exp.gid}"
    exp.estado_lic = K_LICENSED
    hydro_location = domain_generator.hydro_location()
    exp.loc_divisao = hydro_location.loc_divisao
    exp.loc_bacia = hydro_location.loc_bacia
    exp.loc_subaci = hydro_location.loc_subaci
    adm_location = domain_generator.adm_location()
    exp.loc_provin = adm_location.loc_provin
    exp.loc_distri = adm_location.loc_distri
    exp.loc_posto = adm_location.loc_posto
    exp.loc_nucleo = adm_location.loc_nucleo
    if actividade:
        exp.actividade = actividade
    else:
        exp.actividade = abastecemento()
    exp.utente_rel = create_test_utente()
    exp.licencias.append(create_test_licencia(exp.exp_id))

    exp.sexo_gerente = "Outros"

    for k, v in kwargs.items():
        setattr(exp, k, v)
    return exp
