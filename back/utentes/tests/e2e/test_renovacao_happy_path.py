import time
import unittest

from utentes.tests.e2e import config
from utentes.tests.e2e.base import BaseE2ETest, login
from utentes.tests.e2e.testing_database import validate_exp


class TestRenovacaoHappyPath(BaseE2ETest):
    def test_renovacao_happy_path(self):
        try:
            self._test_renovacao_happy_path()
        except Exception:
            logs = self.browser.get_log("browser")

            print(logs)
            # Logs logs = getDriver().manage().logs();
            # LogEntries logEntries = logs.get(LogType.BROWSER);
            # List<LogEntry> errorLogs = logEntries.filter(Level.SEVERE);

            # if (errorLogs.size() != 0) {
            #     for (LogEntry logEntry: logEntries) {
            #         System.out.println("Found error in logs: " + logEntry.getMessage() );
            #     }
            #     fail(errorLogs.size() + " Console error found");
            # }
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
        self.click_element("bt-imprimir-licencia")
        time.sleep(5)
        # validate_print_license_exists(self)

        self.click_ok_and_accept_modals_in_process()

        self.click_ok_and_accept_modals_in_process()
        time.sleep(1)
        validate_exp(self)
        time.sleep(3)


if __name__ == "__main__":
    unittest.main()
