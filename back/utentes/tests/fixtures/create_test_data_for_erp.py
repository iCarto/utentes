from utentes.erp.model import ExploracaosERP
from utentes.models.exploracao import Exploracao
from utentes.tests.utils.gid_generator import GIDGenerator


def create_test_exploracao_erp(exp: Exploracao) -> ExploracaosERP:
    exp_erp = ExploracaosERP()
    exp_erp.id = GIDGenerator.next_erp_client()
    exp_erp.exploracao_gid = exp.gid
    exp_erp.update_link_id(exp)
    return exp_erp
