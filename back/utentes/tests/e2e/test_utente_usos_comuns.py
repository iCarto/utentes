import time
import unittest

from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.select import Select
from selenium.webdriver.support.ui import WebDriverWait

from utentes.tests.e2e import config
from utentes.tests.e2e.base import BaseE2ETest, login


class TestUtentesUsosComuns(BaseE2ETest):
    """
    Test the creation of "Utentes de usos comúns" from "Adicionar" and move it to
    license process once it is created
    """

    def test_create_utente_usos_comuns(self):
        login(self.browser, {"name": "test_admin", "passwd": "test_admin"})
        self.browser.get(f"{config.HOST_BASE}/adicionar_utente_usos_comuns")
        self.fill_ficha()
        # wait = WebDriverWait(self.browser, 60)
        # # it will wait for 250 seconds an element to come into view,
        # # you can change the #value
        # wait.until(EC.element_to_be_clickable((By.LINK_TEXT, "ADICIONAR"))).click()
        # time.sleep(2)
        # wait.until(
        #     EC.element_to_be_clickable(
        #         (By.LINK_TEXT, "Exploração (Utente de usos comuns)")
        #     )
        # ).click()
        time.sleep(2)

    def fill_ficha(self):
        time.sleep(1)
        select_utente = Select(
            self.browser.find_element_by_xpath("//select[@id='select-utente']")
        )
        select_utente.select_by_index(1)
        time.sleep(1)
        self.browser.find_element_by_link_text("Seguinte").click()

        self.fill_input_text("exp_name", "Test Create Utente Usos Comuns")
        Select(
            self.browser.find_element_by_xpath("//select[@id='actividade']")
        ).select_by_visible_text("Abastecimento")

        Select(
            self.browser.find_element_by_xpath(
                "//*[@id='info']//select[@id='loc_provin']"
            )
        ).select_by_index(1)
        Select(
            self.browser.find_element_by_xpath(
                "//*[@id='info']//select[@id='loc_distri']"
            )
        ).select_by_index(1)
        Select(
            self.browser.find_element_by_xpath(
                "//*[@id='info']//select[@id='loc_posto']"
            )
        ).select_by_index(1)
        Select(
            self.browser.find_element_by_xpath("//select[@id='loc_divisao']")
        ).select_by_index(1)
        Select(
            self.browser.find_element_by_xpath("//select[@id='loc_bacia']")
        ).select_by_index(1)
        self.browser.find_element_by_link_text("Seguinte").click()
        time.sleep(1)

        self.browser.find_element_by_css_selector(
            "#licencia-subterranea input[type='checkbox']"
        ).click()
        self.browser.find_element_by_css_selector(
            "#licencia-subterranea #c_soli_int"
        ).send_keys("123,45")
        time.sleep(1)

        self.click_element("save-button")
        time.sleep(1)


if __name__ == "__main__":
    unittest.main()
