import logging
import time
import unittest

from utentes.tests.e2e import config
from utentes.tests.e2e.base import BaseE2ETest, login
from utentes.tests.e2e.testing_database import validate_exp


log = logging.getLogger(__name__)


class TestRenovacaoHappyPath(BaseE2ETest):
    def test_renovacao_happy_path(self):
        try:
            self._test_renovacao_happy_path()
        except Exception:
            logs = self.browser.get_log("browser")
            log.error(logs)
            # https://advancedweb.hu/detecting-errors-in-the-browser-with-selenium/
            # Logs logs = getDriver().manage().logs();
            # LogEntries logEntries = logs.get(LogType.BROWSER);
            # List<LogEntry> errorLogs = logEntries.filter(Level.SEVERE);

            # if (errorLogs.size() != 0) {
            #     for (LogEntry logEntry: logEntries) {
            #         System.out.println("Found error in logs: " + logEntry.getMessage() );
            #     }
            #     fail(errorLogs.size() + " Console error found");
            # }

            # Estos logs de javascript sólo se muestran si se produce una exceción,
            # habría que conseguir chequearlos y mostrarlos siempre por si se están
            # produciendo errores en el js que no se ven si no.
            raise

    def _test_renovacao_happy_path(self):
        login(self.browser, {"name": "test_admin", "passwd": "test_admin"})
        self.browser.get(f"{config.HOST_BASE}/renovacao.html")

        self.click_exp_id_link_on_list(self.testing_database.exp_id)

        self.fill_date_input_text("d_soli", -5)
        self.click_enabled_checkboxes_within_table()
        self.click_ok_and_accept_modals_in_process()

        self.click_ok_and_accept_modals_in_process()

        self.click_enabled_checkboxes_within_table()
        self.click_ok_and_accept_modals_in_process()

        self.click_enabled_checkboxes_within_table()
        self.click_ok_and_accept_modals_in_process()

        self.click_enabled_checkboxes_within_table()
        self.click_ok_and_accept_modals_in_process()

        self.fill_date_input_text("d_emissao_sup")
        self.fill_date_input_text("d_validade_sup", 365 * 3)
        self.fill_input_text("c_licencia_sup", "1000")
        self.click_element("bt-imprimir-licencia", 1)
        time.sleep(5)
        # validate_print_license_exists(self)

        self.click_ok_and_accept_modals_in_process()

        self.click_ok_and_accept_modals_in_process()
        time.sleep(1)
        validate_exp(self)
        time.sleep(3)


if __name__ == "__main__":
    unittest.main()


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
