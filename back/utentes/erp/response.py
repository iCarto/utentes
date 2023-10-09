from enum import Enum
from typing import Dict, List

from pyramid.request import Request

from utentes.services import csv_writer, spreadsheet_writer
from utentes.services.pyramid_response import csv_response, spreadsheet_response


class FileType(Enum):
    csv = 0
    xlsx = 1


def file_response(
    request: Request, data: Dict[str, List[Dict]], filename: str, file_type: FileType
):
    # It's granted that response will call close on `tmp` so the file will be deleted
    if file_type == FileType.csv:
        tmp = csv_writer.write_tmp_file_from_records(data)
        return csv_response(request, tmp, f"{filename}.csv")

    tmp = spreadsheet_writer.write_tmp_file_from_records(data)
    return spreadsheet_response(request, tmp, f"{filename}.xlsx")
