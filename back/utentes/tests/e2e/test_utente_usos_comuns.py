import time
import unittest

from selenium.webdriver.support.select import Select

from utentes.tests.e2e import config
from utentes.tests.e2e.base import BaseE2ETest, login


class TestUtentesUsosComuns(BaseE2ETest):
    """Tests the creation of "Utentes de usos comúns" from "Adicionar".

    Then moves the new exp to the license process.
    """

    def test_create_utente_usos_comuns(self):
        try:
            self._test_create_utente_usos_comuns()
        except Exception:
            # https://advancedweb.hu/detecting-errors-in-the-browser-with-selenium/
            logs = self.browser.get_log("browser")
            print(logs)
            raise

    def fill_ficha(self):
        self.select_option_by_index("select-utente", 1)
        self.browser.find_element_by_link_text("Seguinte").click()

        self.fill_input_text("exp_name", "Test Create Utente Usos Comuns")

        self.select_option_by_visible_text("actividade", "Abastecimento")

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
        self.select_option_by_index("loc_divisao", 1)
        self.select_option_by_index("loc_bacia", 1)
        self.browser.find_element_by_link_text("Seguinte").click()
        time.sleep(1)

        self.browser.find_element_by_css_selector(
            "#licencia-subterranea input[type='checkbox']"
        ).click()
        self.browser.find_element_by_css_selector(
            "#licencia-subterranea #c_soli_int"
        ).send_keys("123,45")
        self.click_element("save-button")

    def _test_create_utente_usos_comuns(self):
        login(self.browser, {"name": "test_admin", "passwd": "test_admin"})
        self.browser.get(f"{config.HOST_BASE}/adicionar_utente_usos_comuns")
        self.fill_ficha()

        time.sleep(2)


# def check_browser_errors(driver):
#     """
#     Checks browser for errors, returns a list of errors
#     :param driver:
#     :return:
#     """
#     try:
#         browserlogs = driver.get_log("browser")
#     except (ValueError, WebDriverException) as e:
#         # Some browsers does not support getting logs
#         LOGGER.debug(
#             "Could not get browser logs for driver %s due to exception: %s", driver, e
#         )
#         return []

#     errors = []
#     for entry in browserlogs:
#         if entry["level"] == "SEVERE":
#             errors.append(entry)
#     return errors


# def tearDown(self):
#     # browser_logs is a list of dicts
#     browser_logs = driver.get_log("browser")
#     errors = [
#         logentry["message"]
#         for logentry in browser_logs
#         if logentry["level"] == "SEVERE"
#     ]
#     if errors:
#         self.fail(f'The following JavaScript errors occurred: {"; ".join(errors)}')


if __name__ == "__main__":
    unittest.main()
