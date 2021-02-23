import time

from selenium.webdriver.support.select import Select


class PageHelper(object):
    def __init__(self, browser):
        self.browser = browser

    def click_element(self, input_id, seconds_to_wait=0.5):
        time.sleep(seconds_to_wait)
        self.browser.find_element_by_id(input_id).click()

    def select_option_by_index(
        self, input_id, index, second_to_wait_before=0.5, second_to_wait_after=0.5
    ):
        time.sleep(second_to_wait_before)
        widget = Select(
            self.browser.find_element_by_xpath(f"//select[@id='{input_id}']")
        )
        widget.select_by_index(index)
        time.sleep(second_to_wait_after)

    def fill_input_text(self, input_id, text, clear=True, seconds_to_wait=0.5):
        # Esperamos un tiempo concreto para simular los tiempos que tarda de
        # verdad un usuario en poder hacer click. Y poder ver como evoluciona la
        # pantalla
        time.sleep(seconds_to_wait)
        element = self.browser.find_element_by_id(input_id)
        if clear:
            element.clear()
        element.send_keys(text)

    def select_option_by_visible_text(
        self, input_id, text, second_to_wait_before=0.5, second_to_wait_after=0.5
    ):
        time.sleep(second_to_wait_before)
        widget = Select(
            self.browser.find_element_by_xpath(f"//select[@id='{input_id}']")
        )
        widget.select_by_visible_text(text)
        time.sleep(second_to_wait_after)
