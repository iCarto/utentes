import unittest

from utentes.lib.schema_validator.validator import IsArrayNotVoid, Validator


class ValidatorTest(unittest.TestCase):
    def test_is_array_not_void(self):
        check = IsArrayNotVoid()
        self.assertTrue(check.fails(None))
        self.assertTrue(check.fails([]))
        self.assertTrue(check.fails("test"))
        self.assertFalse(check.fails([1, 2]))

    def test_validate(self):
        validator = Validator(
            [
                {
                    "fieldname": "id",
                    "message": "id no puede estar vacio",
                    "rules": ["NOT_NULL"],
                },
                {
                    "fieldname": "consumo",
                    "message": "consumo numerico menor de 8",
                    "rules": ["IS_NUMERIC", "INT_LESS_THAN_8"],
                },
            ]
        )
        model = {"id": 1, "consumo": 54}
        self.assertFalse(validator.validate(model))

        model = {"id": 1, "consumo": 123456789}
        self.assertEqual(validator.validate(model)[0], "consumo numerico menor de 8")

    def test_validate_dict_rule(self):
        validator = Validator(
            [{"fieldname": "num", "message": "is always 2", "rules": ["IS_ALWAYS_2"]}]
        )
        validator.add_rule("IS_ALWAYS_2", {"fails": lambda x: x != 2})
        self.assertFalse(validator.validate({"num": 2}))
        self.assertEqual(validator.validate({"num": 1})[0], "is always 2")


if __name__ == "__main__":
    unittest.main()
