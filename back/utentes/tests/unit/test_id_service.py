import unittest

from utentes.services.id_service import is_valid_exp_id, replace_exp_id_in_code


class IDServiceTest(unittest.TestCase):
    def test_is_valid_exp_id(self):
        self.assertTrue(is_valid_exp_id("001/ARAS-IP/2019/CL", "ARAS"))
        self.assertFalse(is_valid_exp_id("001-ARAS-IP/2019/CL", "ARAS"))
        self.assertFalse(is_valid_exp_id(r"001/ARAS-IP/2019\CL", "ARAS"))
        self.assertTrue(is_valid_exp_id("001/ARAS-IP/2019/CL", "ARAS"))

    def test_replace_exp_id_in_code(self):
        self.assertEqual(
            replace_exp_id_in_code("001/ARAS-IP/2020/CL", "002/ARAS-IP/2020/CL"),
            "002/ARAS-IP/2020/CL",
        )
        self.assertEqual(
            replace_exp_id_in_code("001/ARAS-IP/2020/CL/Sub", "002/ARAS-IP/2020/CL"),
            "002/ARAS-IP/2020/CL/Sub",
        )
        self.assertEqual(
            replace_exp_id_in_code(
                "001/ARAS-IP/2020/CL/123", "002/ARAS-IP/2020/CL/555"
            ),
            "002/ARAS-IP/2020/CL/123",
        )


if __name__ == "__main__":
    unittest.main()
