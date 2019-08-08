#!/usr/bin/env python3

import os
import sys

import pyexcel
from ietl import calculate_encoding
from ietl.find_file import find_all_by_pattern
from ietl.rewrite_shp2pgsql_output import data as rewrite_shp2pgsql_data_output
from ietl.rewrite_shp2pgsql_output import ddl as rewrite_shp2pgsql_ddl_output
from ietl.shp_info import SHPInfo


all_tipos = set()

xls_to_standard_type = {"texto": "TEXT", "real": "NUMERIC", "entero": "INTEGER"}

shp_to_standard_type = {"str": "TEXT", "float": "NUMERIC", "int": "INTEGER"}


def compare_fields(book, b, shp_path):
    print (b)
    header = book[b][0]
    idx_nombre = header.index("NOMBRE BD")
    idx_tipo = header.index("TIPO DE CAMPO I (Txt, entero, real, fecha, si/no)")

    data = book[b][1:]
    for n_row, row in enumerate(data):
        nombre = row[idx_nombre].strip().lower()
        tipo = row[idx_tipo].strip().lower()
        if (nombre and not tipo) or (not nombre and tipo):
            xls_row_number = n_row + 2
            raise Exception("Sin tipo", b, xls_row_number, nombre, tipo)
        if not nombre and not tipo:
            continue
        shp_info = SHPInfo(shp_path)
        properties = shp_info.meta["schema"]["properties"]
        shp_tipo = properties[nombre].split(":")[0]
        all_tipos.add(tipo)
        if xls_to_standard_type[tipo] != shp_to_standard_type[shp_tipo]:
            raise Exception("Los tipos no coinciden", nombre, tipo, shp_tipo)


def main(mdd_path):
    book = pyexcel.get_book_dict(file_name=os.fspath(mdd_path), skip_empty_rows=True)
    # Encontrar para cada sheetname un fichero llamado FECHA_sheetname.shp coincidiendo mayúsculas, minúsculas y todo. Pensar si tiene sentido ignorar caracteres especiales.
    # No estaría de más poder sacar un listado de todos los .shp en el root_path por esto de comparar con los sheetnames
    # Chequear los nombres de campos y tipos del mdd frente a los de las capas
    # Generar tablas a partir del mdd/capas
    for b in book:
        if b in ["Fontes", "Barragens", "Loc_Prov", "Loc_Dis", "Loc_PosAdm"]:
            continue
        # Convertir a rutas absolutas sin necesidad de iniciar la búsqueda con una ruta relativa
        tablename = b.lower()
        shp_path = find_all_by_pattern(
            "*" + b + ".shp", "./08_BD_Unica/01_BD_Cartografia_Base"
        )[0]

        compare_fields(book, b, shp_path)

        encoding = calculate_encoding.main(shp_path)
        command = "shp2pgsql -p -I -s 32737 -g geom -W {encoding} -N abort {shp_path} cbase.{tablename} >> /tmp/foo.sql".format(
            tablename=tablename, shp_path=shp_path, encoding=encoding
        )
        os.system(command)

        command = "shp2pgsql -a -D -s 32737 -g geom -W {encoding} -N abort {shp_path} cbase.{tablename} >> /tmp/foo_data.sql".format(
            tablename=tablename, shp_path=shp_path, encoding=encoding
        )
        os.system(command)

    rewrite_shp2pgsql_ddl_output("/tmp/foo.sql")
    rewrite_shp2pgsql_data_output("/tmp/foo_data.sql")
    # print(all_tipos)


if __name__ == "__main__":
    mdd_path = sys.argv[1]
    # data_root_path = sys.argv[2]
    main(mdd_path)
