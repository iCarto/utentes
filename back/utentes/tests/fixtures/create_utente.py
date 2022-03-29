from utentes.models.utente import Utente
from utentes.tests.utils.gid_generator import GIDGenerator


def create_test_utente():
    utente = Utente()
    utente.gid = GIDGenerator.next_utente()
    utente.nome = f"Utente {utente.gid}"
    utente.bi_di_pas = "012345678901I"
    utente.nuit = "012345678"
    utente.telefone = "827821780/873081514"
    utente.email = "utente@test.com"
    utente.sexo_gerente = "Outros"
    return utente
