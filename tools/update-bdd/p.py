#!/usr/bin/env python3
import logging
import os
import sys
from collections import OrderedDict
from pathlib import Path

import pandas as pd
import pyexcel

import json

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# pandas does no read directly ods. https://stackoverflow.com/questions/17834995/
"""
records = pe.iget_records(file_name="your_file.xls")
for record in records:
    print("%s is aged at %d" % (record['Name'], record['Age']))
pe.free_resources()
"""
"""
Otro par de detalles que no me di cuenta en el correo anterior.


"""
"""
pestañas: Utentes, Fontes, Cultivos
"""


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
    pyexcel.save_book_as(
        file_name=os.fspath(infile), dest_file_name=os.fspath(outfile))


SHEETS = ['Utentes', 'Cultivos', 'Reses', 'Fontes']

SHEET_INFO = {
    'Utentes': {
        'header': 3 - 1
    },
    'Cultivos': {
        'header': 3 - 1
    },
    'Reses': {
        'header': 3 - 1
    },
    'Fontes': {
        'header': 3 - 1
    }
}

class BookMetadata:
    """
    Debería haber la posibilidad de usar un json o clases y convertir entre
    ellas
    start_column, end_column. Deberían admitir número, texto (header), o callable que determine cuando parar
    start_row, end_row
        La numeración empieza en 0 y se define el primero o el último que debe ser incluido
    """
    def __init__(self, file):
        f = open(file)
        self.d = json.load(f)
        f.close()
        
    def fieldnames(self, sheetname):
        sheet = [s for s in self.d if s['sheetname'] == sheetname][0]
        return [f['name'] for f in sheet['fields'] if not f.get('ignore')]
        
    def header_row(self, sheetname):
        sheet = [s for s in self.d if s['sheetname'] == sheetname][0]
        return sheet['header']
        
    def end_column(self, sheetname):
        sheet = [s for s in self.d if s['sheetname'] == sheetname][0]
        return sheet.get('end_column')

        
    def sheet_metadata(self, sheetname):
        sheet = [s for s in self.d if s['sheetname'] == sheetname][0]
        return SheetMetadata(self, sheetname)
    
    def sheets_metadata(self):
        return [SheetMetadata(self, s['sheetname']) for s in self.d if not s.get('ignore')]

    @property
    def sheetnames(self):
        return [s['sheetname'] for s in self.d]
        
    


class SheetMetadata:
    def __init__(self, book, sheetname):
        self.book = book
        self.sheetname = sheetname
    
    def fieldnames(self):
        return self.book.fieldnames(self.sheetname)
        
    def header_row(self):
        return self.book.header_row(self.sheetname)
        
    def end_column(self):
        return self.book.end_column(self.sheetname)

        
    

def check_header(book, metadata):
    for s in metadata.sheets_metadata():
        print(s.sheetname)
        sheet = book[s.sheetname]
        header_row = s.header_row()
        expected_header = set(s.fieldnames())
        actual_header = set(sheet[header_row])
        not_existing_fields = expected_header.difference(actual_header)
        not_expected_fields = actual_header.difference(expected_header)
        if not_existing_fields or not_expected_fields:
            msg = f'''
            Problema con el header: {s.sheetname}
            Campos no existentes: {not_existing_fields}
            Campos no esperados {not_expected_fields}
            '''
            raise Exception(msg)
        


    
    
def convert_file(xls_file, metadata_file):
    """
    Al contrario que pyexcel.save_book_as(file_name=, dest_file_name), cuando
    se usa pyexcel.save_book_as(bookdict=, dest_file_name=) las fechas no son
    convertidas. Será por el tema de como se recuperan los objectos python
    """
    infile = sanitize_path(xls_file)
    outfile = orgpath_with_name(infile, 'working.ods')
    logger.info('Convertir %s a %s', infile, outfile)

    # Workaround for this bug: https://github.com/pyexcel/pyexcel/issues/165
    save_file_to_other_format(infile, '/tmp/foo.xlsx')
    book = pyexcel.get_book_dict(file_name=os.fspath('/tmp/foo.xlsx'), skip_empty_rows=True)
    
    metadata = BookMetadata(metadata_file)
    # check_header(book, metadata)

    new_book = OrderedDict((s, book.get(s, [])) for s in SHEETS)
    for s in SHEETS:
        new_book[s] = new_book[s][SHEET_INFO[s]['header']:]
        
    for sheetname in new_book:
        end_column = metadata.sheet_metadata(sheetname).end_column()
        if end_column:
            for irow in range(len(new_book[sheetname])):
                print(new_book[sheetname][irow])
                print(end_column)
                new_book[sheetname][irow] = new_book[sheetname][irow][:end_column]
                

    pyexcel.save_book_as(bookdict=new_book, dest_file_name=os.fspath(outfile))


if __name__ == '__main__':
    if len(sys.argv) != 3:
        raise Exception('Número de parámetros incorrecto')
    xls_file = sys.argv[1]
    metadata_file = sys.argv[2]
    convert_file(xls_file, metadata_file)
