import datetime
import unittest

from utentes.lib.utils.dates import (
    diff_month,
    diff_month_include_upper,
    quarter_ordinal,
)


d2010_10 = datetime.date(2010, 10, 1)
d2010_09 = datetime.date(2010, 9, 1)
d2009_10 = datetime.date(2009, 10, 1)
d2009_11 = datetime.date(2009, 11, 1)
d2009_08 = datetime.date(2009, 8, 1)
d2020_02 = datetime.date(2020, 2, 1)
d2020_12 = datetime.date(2020, 12, 1)
d2020_01 = datetime.date(2020, 1, 1)


class DatesTest(unittest.TestCase):
    def test_diff_month(self):

        self.assertEqual(diff_month(d2010_10, d2010_09), 1)
        self.assertEqual(diff_month(d2010_09, d2010_10), 1)
        self.assertEqual(diff_month(d2010_10, d2009_10), 12)
        self.assertEqual(diff_month(d2010_10, d2009_11), 11)
        self.assertEqual(diff_month(d2010_10, d2009_08), 14)

        self.assertEqual(diff_month(d2020_02, d2020_02), 0)
        self.assertEqual(diff_month(d2020_12, d2020_01), 11)
        self.assertEqual(diff_month(d2020_01, d2020_12), 11)

    def test_diff_month_include_upper(self):
        self.assertEqual(diff_month_include_upper(d2010_10, d2010_09), 2)
        self.assertEqual(diff_month_include_upper(d2010_09, d2010_10), 2)
        self.assertEqual(diff_month_include_upper(d2010_10, d2009_10), 13)
        self.assertEqual(diff_month_include_upper(d2010_10, d2009_11), 12)
        self.assertEqual(diff_month_include_upper(d2010_10, d2009_08), 15)

        self.assertEqual(diff_month_include_upper(d2020_02, d2020_02), 1)
        self.assertEqual(diff_month_include_upper(d2020_12, d2020_01), 12)
        self.assertEqual(diff_month_include_upper(d2020_01, d2020_12), 12)

    def test_quarter_ordinal(self):
        for month in range(1, 4):
            self.assertEqual(quarter_ordinal(datetime.date(2022, month, 5)), 1)

        for month in range(4, 7):
            self.assertEqual(quarter_ordinal(datetime.date(2022, month, 5)), 2)

        for month in range(7, 10):
            self.assertEqual(quarter_ordinal(datetime.date(2022, month, 5)), 3)

        for month in range(10, 13):
            self.assertEqual(quarter_ordinal(datetime.date(2022, month, 5)), 4)


if __name__ == "__main__":
    unittest.main()
