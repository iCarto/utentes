from utentes.models.constants import K_LICENSED, K_SUBTERRANEA
from utentes.models.licencia import Licencia
from utentes.services.id_service import calculate_lic_nro
from utentes.tests.utils.gid_generator import GIDGenerator


def create_test_licencia(exp_id, **kwargs):
    licencia = Licencia()
    licencia.gid = GIDGenerator.next_licencia()
    licencia.tipo_agua = K_SUBTERRANEA
    licencia.c_licencia = 2

    licencia.estado = K_LICENSED  # Utente de facto UF
    for k, v in kwargs.items():
        setattr(licencia, k, v)
    licencia.lic_nro = calculate_lic_nro(exp_id, licencia.tipo_agua)
    # licencia.exploracao =
    return licencia
