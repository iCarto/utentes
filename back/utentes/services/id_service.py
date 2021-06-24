import datetime
import re

from utentes.models.constants import K_DE_FACTO, K_LICENSED, K_USOS_COMUNS
from utentes.services import settings_service


_EXP_ID_LENGTH = 19


def code_for_state(state, separator="/"):
    code = {K_DE_FACTO: "UF", K_USOS_COMUNS: "SL"}.get(state, "CL")
    return separator + code


def calculate_new_exp_id(request, state=K_LICENSED):
    if not state:
        state = K_LICENSED

    exp_id_tokens = {
        "seq_id": None,
        "ara": settings_service.get_ara(request),
        "year": str(datetime.date.today().year),
        "code": code_for_state(state),
    }

    sql = r"""
    SELECT left(exp_id, 3)::int + 1
    FROM utentes.exploracaos
    WHERE
        upper(ara) = :ara
        AND substring(exp_id from '\d{3}/.*/(\d{4})') = :year
        AND right(exp_id, 3) = :code
    ORDER BY 1 DESC
    LIMIT 1;
    """
    seq_id_start_number = [1]
    query_result = request.db.execute(sql, exp_id_tokens).first() or seq_id_start_number
    exp_id_tokens["seq_id"] = query_result[0]

    return "{seq_id:03d}/{ara}-IP/{year}{code}".format(**exp_id_tokens)


def is_valid_exp_id(exp_id):
    return _is_valid_exp_id(exp_id, settings_service.get_ara())


def _is_valid_exp_id(exp_id, ara):
    exp_id_format_regexp = r"^\d{3}/" + ara + r"-IP/\d{4}/(UF|SL|CL)$"  # noqa: WPS336
    return exp_id and re.match(exp_id_format_regexp, exp_id)


def is_not_valid_exp_id(exp_id):
    return not is_valid_exp_id(exp_id)


def _extract_exp_id_from_code(code: str) -> str:
    """Return the exp_id part of a code."""
    return code[:_EXP_ID_LENGTH]


def replace_exp_id_in_code(code: str, code_replacement: str) -> str:
    """Replace the `exp_id` part in a code.

    Given a code like cult_id, or another exp_id replaces the first len(exp_id)
    characters of the code with the exp_id part of the new code.

    See unittests por examples
    """
    new_exp_id = _extract_exp_id_from_code(code_replacement)
    not_exp_id_part = code[_EXP_ID_LENGTH:]
    return new_exp_id + not_exp_id_part


def calculate_lic_nro(exp_id: str, _tipo_agua: str) -> str:
    """Return the correct license number.

    Given a valid `exp_id, ` and `tipo_agua` in any acceptable form like
    'Superficial', 'SUP', 'suP', ... returns the correct license number.

    It is safe to call it even to replace the already valid `lic_nro`.
    """
    tipo_agua = _tipo_agua[:3].capitalize()
    return f"{exp_id}/{tipo_agua}"


def is_valid_lic_nro(lic_nro):
    lic_nro = lic_nro or ""  # convert to empty string when none
    is_valid_tipo_agua = lic_nro[-4:] in {"/Sub", "/Sup"}
    return is_valid_exp_id(lic_nro[:-4]) and is_valid_tipo_agua


def is_not_valid_lic_nro(lic_nro):
    return not is_valid_lic_nro(lic_nro)


def next_child_seq(childs, id_name):
    id_sequence = [
        int(getattr(seq, id_name).split("/")[4])
        for seq in childs
        if getattr(seq, id_name)
    ]
    if not id_sequence:
        return 1

    return max(id_sequence) + 1


def calculate_new_child_id(childs, id_name, exp_id):
    next_seq = next_child_seq(childs, id_name)
    return "{0}/{1:03d}".format(exp_id, next_seq)
