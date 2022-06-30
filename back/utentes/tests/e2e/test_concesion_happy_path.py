import logging
import time
import unittest

from utentes.tests.e2e import config
from utentes.tests.e2e.base import BaseE2ETest, login
from utentes.tests.e2e.pages.adicionar_page import AdicionarPage
from utentes.tests.e2e.testing_database import delete_exp_by_name


log = logging.getLogger(__name__)


EXP_NAME = "Nueva Exp para pruebas"


class TestConcesionHappyPath(BaseE2ETest):
    def tearDown(self):
        delete_exp_by_name(self.testing_database.db_session, EXP_NAME)
        super().tearDown()

    def test_concesion_happy_path(self):
        try:
            self._test_concesion_happy_path()
        except Exception:
            logs = self.browser.get_log("browser")
            log.error(logs)
            raise

    def _test_concesion_happy_path(self):
        login(self.browser, {"name": "test_admin", "passwd": "test_admin"})
        self.browser.get(f"{config.HOST_BASE}/requerimento-new.html")
        self.fill_input_text("exp_name", EXP_NAME)
        self.select_option_by_visible_text("sexo_gerente", "Masculino")
        self.fill_date_input_text("d_soli", -1)
        self.click_required_checkboxes()
        self.click_ok_and_accept_modals_in_process()
        time.sleep(4)
        self.click_exp_id_link_on_list(EXP_NAME)
        self.click_ok_and_accept_modals_in_process()
        self.click_enabled_checkboxes_within_table()
        self.click_ok_and_accept_modals_in_process()

        self.page_helper.click_element("bt-adicionar")
        time.sleep(2)
        page = AdicionarPage(self.browser)
        page.select_existent_utente()
        page.next_wizard_page()
        page.fill_info_block("")
        page.next_wizard_page()
        page.fill_license_block()
        page.save()

        self.browse_to("requerimento-pendente.html")
        self.click_exp_id_link_on_list(EXP_NAME)
        self.assertIn(
            EXP_NAME,
            self.browser.find_element_by_css_selector("#insert-data h4 > span").text,
        )
        self.click_enabled_checkboxes_within_table()
        # self.click_ok_and_accept_modals_in_process()
        # TODO. Part of the process is missing


if __name__ == "__main__":
    unittest.main()
