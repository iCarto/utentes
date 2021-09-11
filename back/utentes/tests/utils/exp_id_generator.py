from typing import Union

from utentes.services.settings_service import get_ara
from utentes.tests.utils.exceptions import NotExpectedTestingError


class ExpIdGenerator(object):
    def __init__(self) -> None:
        raise NotExpectedTestingError("This class should not be instantiated")

    @classmethod
    def from_serial(cls, serial: Union[int, str]) -> str:
        serial = str(serial).zfill(3)
        ara = f"{get_ara()}-IP"
        year = "2020"
        code_for_state = "CL"
        return f"{serial}/{ara}/{year}/{code_for_state}"
