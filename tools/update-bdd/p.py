#!/usr/bin/env python3
import logging
import os
import sys
from collections import OrderedDict
from pathlib import Path

import pandas as pd
import pyexcel
from ietl.spreadsheet_metadata import BookMetadata, SheetMetadata


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# pandas does no read directly ods. https://stackoverflow.com/questions/17834995/


def sanitize_path(p, strict=True):
    """
    If the path doesn’t exist and strict is True, FileNotFoundError is raised
    """
    return Path(p).resolve(strict=strict)


def orgpath_with_name(orgpath, name):
    return orgpath.with_name(name)


def save_file_to_other_format(infile, outfile):
    """
    Al hacer esta conversión elimina el estilo, borrar filtros, desagrupa filas
    y columnas, ...
    Además parece hacer conversiones automáticas de tipo 15/12/2020 -> 2020-12-15
    y también con los números, por lo que hay que tener cuidado y pasar los
    chequeos antes de la conversión
    """
    pyexcel.save_book_as(file_name=os.fspath(infile), dest_file_name=os.fspath(outfile))


def check_header(book, metadata):
    for s in metadata.sheets_metadata():
        print (s.sheetname)
        sheet = book[s.sheetname]
        header_row = s.header_row()
        expected_header = set(s.fieldnames())
        actual_header = set(sheet[header_row])
        not_existing_fields = expected_header.difference(actual_header)
        not_expected_fields = actual_header.difference(expected_header)
        if not_existing_fields or not_expected_fields:
            msg = f"""
            Problema con el header: {s.sheetname}
            Campos no existentes: {not_existing_fields}
            Campos no esperados {not_expected_fields}
            """
            raise Exception(msg)


def convert_file(xls_file, metadata_file):
    """
    Al contrario que pyexcel.save_book_as(file_name=, dest_file_name), cuando
    se usa pyexcel.save_book_as(bookdict=, dest_file_name=) las fechas no son
    convertidas. Será por el tema de como se recuperan los objectos python
    """
    infile = sanitize_path(xls_file)
    outfile = orgpath_with_name(infile, "working.ods")
    logger.info("Convertir %s a %s", infile, outfile)

    # Workaround for this bug: https://github.com/pyexcel/pyexcel/issues/165
    save_file_to_other_format(infile, "/tmp/foo.xlsx")
    book = pyexcel.get_book_dict(
        file_name=os.fspath("/tmp/foo.xlsx"), skip_empty_rows=True
    )

    metadata = BookMetadata(metadata_file)
    # check_header(book, metadata)

    new_book = OrderedDict((s, book.get(s, [])) for s in metadata.sheetnames)
    for s in metadata.sheetnames:
        header_row = metadata.header_row(s)
        new_book[s] = new_book[s][header_row:]

    for sheetname in new_book:
        end_column = metadata.sheet_metadata(sheetname).end_column()
        if end_column:
            for irow in range(len(new_book[sheetname])):
                print (new_book[sheetname][irow])
                print (end_column)
                new_book[sheetname][irow] = new_book[sheetname][irow][:end_column]

    pyexcel.save_book_as(bookdict=new_book, dest_file_name=os.fspath(outfile))


if __name__ == "__main__":
    if len(sys.argv) != 3:
        raise Exception("Número de parámetros incorrecto")
    xls_file = sys.argv[1]
    metadata_file = sys.argv[2]
    convert_file(xls_file, metadata_file)
