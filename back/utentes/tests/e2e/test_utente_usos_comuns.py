import logging
import time
import unittest
from urllib.parse import urlparse

from utentes.tests.e2e.base import BaseE2ETest, login
from utentes.tests.e2e.pages import adicionar_page
from utentes.tests.e2e.pages.exploracao_page import ExploracaoPage
from utentes.tests.e2e.testing_database import delete_exp_by_name


log = logging.getLogger(__name__)


EXP_NAME = "Nueva Exp para pruebas"


class TestUtentesUsosComuns(BaseE2ETest):
    """Tests the creation of "Utentes de usos comúns" from "Adicionar".

    Creates the Exploracao, checks that a field can be edited, and then moves the new
    exp to the license process.
    """

    def tearDown(self):
        delete_exp_by_name(self.testing_database.db_session, EXP_NAME)
        super().tearDown()

    def test_create_utente_usos_comuns(self):
        try:
            self._test_create_utente_usos_comuns()
        except Exception:
            logs = self.browser.get_log("browser")
            log.error(logs)
            raise

    def _test_create_utente_usos_comuns(self):
        login(self.browser, {"name": "test_admin", "passwd": "test_admin"})

        self._can_create_utente()
        self._can_edit_utente()
        self._can_move_utente_to_issue_process()

    def _can_create_utente(self):
        page = adicionar_page.go(self.browser)

        page.select_existent_utente()
        page.next_wizard_page()
        page.fill_info_block(EXP_NAME)
        page.next_wizard_page()

        page.fill_license_block()
        page.save()

        self.assertEqual(
            urlparse(self.browser.current_url).path, "/exploracao-show.html"
        )

    def _can_edit_utente(self):
        exploracao_page = ExploracaoPage(self.browser)
        exploracao_page.fill_info_comment("Observación de prueba")
        exploracao_page.save(reload=True)
        self.assertEqual(
            self.browser.find_element_by_css_selector("span#observacio").text,
            "Observación de prueba",
        )

    def _can_move_utente_to_issue_process(self):
        self.click_element("licenciar-button")
        time.sleep(1)
        self.fill_date_input_text("d_ultima_entrega_doc")
        self.click_element("okButton")
        time.sleep(1)
        self.browse_to("requerimento-pendente.html")

        self.click_exp_id_link_on_list(EXP_NAME)
        self.assertIn(
            EXP_NAME,
            self.browser.find_element_by_css_selector("#insert-data h4 > span").text,
        )


if __name__ == "__main__":
    unittest.main()
