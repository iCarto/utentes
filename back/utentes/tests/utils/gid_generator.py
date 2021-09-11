from utentes.tests.utils.exceptions import NotExpectedTestingError


class GIDGenerator(object):
    licencia_gid = 0
    utente_gid = 0
    actividade_gid = 0
    exploracao_gid = 0
    erp_client_id = 0
    facturacao_gid = 0

    def __init__(self) -> None:
        raise NotExpectedTestingError("This class should not be instantiated")

    @classmethod
    def next_licencia(cls):
        cls.licencia_gid += 1
        return cls.licencia_gid

    @classmethod
    def next_utente(cls):
        cls.utente_gid += 1
        return cls.utente_gid

    @classmethod
    def next_actividade(cls):
        cls.actividade_gid += 1
        return cls.actividade_gid

    @classmethod
    def next_exploracao(cls):
        cls.exploracao_gid += 1
        return cls.exploracao_gid

    @classmethod
    def next_erp_client(cls):
        cls.erp_client_id += 1
        return cls.erp_client_id

    @classmethod
    def next_facturacao(cls):
        cls.facturacao_gid += 1
        return cls.facturacao_gid
