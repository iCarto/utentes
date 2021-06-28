from utentes.models.actividade import (
    ActividadesAbastecemento,
    ActividadesAgriculturaRega,
)
from utentes.models.constants import K_ABASTECIMENTO, K_AGRICULTURA
from utentes.tests.utils.gid_generator import GIDGenerator


def abastecemento():
    actividade = ActividadesAbastecemento()
    actividade.gid = GIDGenerator.next_actividade()
    actividade.tipo = K_ABASTECIMENTO
    actividade.c_estimado = 0
    actividade.habitantes = 0
    actividade.dotacao = 20
    return actividade


def agricultura():
    actividade = ActividadesAgriculturaRega()
    actividade.gid = GIDGenerator.next_actividade()
    actividade.tipo = K_AGRICULTURA
    actividade.c_estimado = 1280.75
    actividade.n_cul_tot = 1
    actividade.area_pot = 3.0
    actividade.area_irri = 1.0
    actividade.area_medi = 2.0
    return actividade
