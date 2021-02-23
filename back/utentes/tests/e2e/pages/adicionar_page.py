import time

from selenium.webdriver.support.select import Select

from utentes.tests.e2e import config
from utentes.tests.e2e.pages.page_helper import PageHelper


class AdicionarPage(object):
    def __init__(self, browser):
        self.browser = browser
        self.page_helper = PageHelper(browser)

    def save(self):
        self.page_helper.click_element("save-button")
        time.sleep(2)

    def select_existent_utente(self):
        self.page_helper.select_option_by_index("select-utente", 1)

    def next_wizard_page(self):
        self.browser.find_element_by_link_text("Seguinte").click()
        time.sleep(0.5)

    def fill_info_block(self, exp_name: str):
        if exp_name:
            self.page_helper.fill_input_text("exp_name", exp_name)

        self.page_helper.select_option_by_visible_text("actividade", "Abastecimento")

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
        self.page_helper.select_option_by_index("loc_divisao", 1)
        self.page_helper.select_option_by_index("loc_bacia", 1)

    def fill_license_block(self):
        self.browser.find_element_by_css_selector(
            "#licencia-subterranea input[type='checkbox']"
        ).click()
        self.browser.find_element_by_css_selector(
            "#licencia-subterranea #c_soli_int"
        ).send_keys("123,45")


def go(browser) -> AdicionarPage:
    browser.get(f"{config.HOST_BASE}/adicionar_utente_usos_comuns")
    time.sleep(1)
    return AdicionarPage(browser)
