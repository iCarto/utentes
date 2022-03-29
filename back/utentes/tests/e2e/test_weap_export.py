import os
import time
import unittest

from selenium.common.exceptions import NoSuchElementException

from utentes.api.weap import build_filename
from utentes.models.estado_renovacao import PENDING_TECH_DECISION
from utentes.tests.e2e import config
from utentes.tests.e2e.base import BaseE2ETest, login
from utentes.tests.e2e.testing_database import create_renovacao
from utentes.tests.utils import domain_generator


class TestWeapExport(BaseE2ETest):
    def test_renovacao_no_umbeluzi(self):
        adm_location = domain_generator.adm_location(loc_posto="Boane - Sede")
        hydro_location = domain_generator.hydro_location(loc_bacia="Maputo")

        create_renovacao(
            self.testing_database.request,
            state=PENDING_TECH_DECISION,
            other={
                "loc_provin": adm_location.loc_provin,
                "loc_distri": adm_location.loc_distri,
                "loc_posto": adm_location.loc_posto,
                "loc_divisao": hydro_location.loc_divisao,
                "loc_bacia": hydro_location.loc_bacia,
            },
        )
        self._go_to_exp_in("/renovacao.html")
        self.assertRaises(
            NoSuchElementException, self.browser.find_element_by_id, "bt-export-demand"
        )
        self.assertRaises(
            NoSuchElementException,
            self.browser.find_element_by_id,
            "p_tec_disp_hidrica",
        )

    def test_renovacao_umbeluzi(self):
        adm_location = domain_generator.adm_location(loc_posto="Boane - Sede")
        hydro_location = domain_generator.hydro_location(loc_bacia="Umbelúzi")

        create_renovacao(
            self.testing_database.request,
            state=PENDING_TECH_DECISION,
            other={
                "loc_provin": adm_location.loc_provin,
                "loc_distri": adm_location.loc_distri,
                "loc_posto": adm_location.loc_posto,
                "loc_divisao": hydro_location.loc_divisao,
                "loc_bacia": hydro_location.loc_bacia,
            },
        )
        self._go_to_exp_in("/renovacao.html")
        self.click_element("p_tec_disp_hidrica")
        self.click_element("bt-export-demand")

        time.sleep(2)
        filename = os.path.join(
            config.TMP_DIRECTORY, build_filename(self.testing_database.exp_id)
        )
        self.assertTrue(os.path.isfile(filename))

    def _go_to_exp_in(self, route_path):
        login(self.browser, {"name": "test_admin", "passwd": "test_admin"})
        self.browser.get(f"{config.HOST_BASE}{route_path}")
        self.click_exp_id_link_on_list(self.testing_database.exp_id)
        time.sleep(0.5)


if __name__ == "__main__":
    unittest.main()
