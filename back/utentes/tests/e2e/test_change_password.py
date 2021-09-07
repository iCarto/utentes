import time
import unittest

from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC  # noqa: N812
from selenium.webdriver.support.ui import WebDriverWait

from utentes.tests.e2e import config
from utentes.tests.e2e.base import BaseE2ETest, login


class TestChangePassword(BaseE2ETest):
    def test_change_own_password(self):
        self.testing_database.create_user(
            "foo", "Departamento Recursos Hídricos", None, "oldpassword"
        )
        login(self.browser, {"name": "foo", "passwd": "oldpassword"})
        self._go_to_profile_page()
        self.click_element("mostrar-senha-check")
        self.fill_input_text("password", "newpassword")
        self.click_element("okButton")
        self._assert_alert_text_and_accept(
            "Senha mudada correctamente", second_to_wait_before=1
        )
        self._assert_login_with_new_password("newpassword")

    def test_admin_changes_user_password(self):
        self.testing_database.create_user(
            "foo", "Departamento Recursos Hídricos", None, "oldpassword2"
        )
        login(self.browser, {"name": "test_admin", "passwd": "test_admin"})
        self.browser.get(f"{config.HOST_BASE}/utilizadores")
        td = self.browser.find_element_by_xpath("//td[contains(text(), 'foo')]")
        tr = td.find_element_by_xpath("..")
        tr.find_element_by_class_name("edit").click()
        self.click_element("mostrar-senha-check")
        self.fill_input_text("password", "newpassword2")
        self.click_element("okButton")
        self._assert_login_with_new_password("newpassword2")

    def _go_to_profile_page(self):
        wait = WebDriverWait(self.browser, 60)
        # it will wait for 250 seconds an element to come into view,
        # you can change the #value
        wait.until(EC.element_to_be_clickable((By.ID, "user-info"))).click()
        time.sleep(0.5)
        wait.until(EC.element_to_be_clickable((By.ID, "user-info-link"))).click()
        time.sleep(0.5)

    def _assert_login_with_new_password(self, password):
        login(self.browser, {"name": "foo", "passwd": password})
        wait = WebDriverWait(self.browser, 10)
        wait.until(EC.element_to_be_clickable((By.LINK_TEXT, "LICENÇAS E UF")))
        user_info = self.browser.find_element_by_id("user-info")
        self.assertEqual(user_info.text, "foo")


if __name__ == "__main__":
    unittest.main()
