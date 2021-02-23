import time

from utentes.tests.e2e.pages.page_helper import PageHelper


class ExploracaoPage(object):
    def __init__(self, browser):
        self.browser = browser
        self.page_helper = PageHelper(browser)

    def save(self, reload=False):
        self.page_helper.click_element("save-button")
        time.sleep(1)
        if reload:
            self.browser.get(self.browser.current_url)
            time.sleep(1)

    def fill_info_comment(self, text):
        self.page_helper.click_element("editBlockInfo")
        time.sleep(1)
        element = self.browser.find_element_by_css_selector(".modal #observacio")
        element.clear()
        element.send_keys(text)
        self.page_helper.click_element("okButton")
