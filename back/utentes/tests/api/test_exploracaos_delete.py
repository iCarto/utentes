import unittest

from utentes.api.exploracaos import exploracaos_delete
from utentes.models.actividade import Actividade
from utentes.models.exploracao import Exploracao
from utentes.models.fonte import Fonte
from utentes.models.licencia import Licencia
from utentes.models.utente import Utente
from utentes.tests.api import DBIntegrationTest
from utentes.tests.fixtures.create_exploracao import get_test_exploracao_from_db


class ExploracaosDeleteTests(DBIntegrationTest):
    def test_delete_get_exploracaos_id(self):
        exp = get_test_exploracao_from_db(self.request.db)
        gid = exp.gid
        gid_utente = exp.utente_rel.gid
        self.request.matchdict.update({"id": gid})
        exploracaos_delete(self.request)
        query = self.request.db.query
        self.assertIsNone(
            query(Exploracao).filter(Exploracao.gid == gid).first(),
            "Should not be any Exploracao with that gid",
        )
        self.assertIsNone(
            query(Licencia).filter(Licencia.exploracao == gid).first(),
            "Should not be any Licencia with that gid",
        )
        self.assertIsNone(
            query(Fonte).filter(Fonte.exploracao == gid).first(),
            "Should not be any Fonte with that gid",
        )
        self.assertIsNone(
            query(Actividade).filter(Actividade.exploracao == gid).first(),
            "Should not be any Actividade with that gid",
        )

        self.assertIsNotNone(
            query(Utente).filter(Utente.gid == gid_utente).first(),
            "Should be one Utente with that gid",
        )


if __name__ == "__main__":
    unittest.main()
