#!/usr/bin/env python36

import argparse
import os
import sys

from ietl import calculate_encoding, common_checks


class Main:
    def __init__(self, args):
        self.args = args
        # file = os.path.abspath(args.shp)
        # self.args.file = file

    def execute(self):
        shp = os.path.abspath(args.shp)
        common_checks.ensure_file_exists(shp, ".shp")
        calculate_encoding.main(shp)

        base_spreadsheet = os.path.abspath(args.base_spreadsheet)
        common_checks.ensure_file_exists(base_spreadsheet)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Help processing utentes data.")
    parser.add_argument("base_spreadsheet", help="hoja de cálculo de datos")
    parser.add_argument(
        "database", help="nombre de la base de datos sobre la que se trabajará"
    )
    parser.add_argument("metadata_file", help="Ruta al fichero de metadata")
    # parser.add_argument('ara', help="Código del ara", choices=['ARAN', 'ARAS', 'ARAZ'])
    parser.add_argument(
        "last_exp_gid",
        type=int,
        help=" El gid de la última explotación antes de arrancar este proceso cuando se estén mezclando con existentes.",
    )
    parser.add_argument("-s", "--shp", required=True, help="exploracaos shp")
    args = parser.parse_args()
    m = Main(args)
    m.execute()
