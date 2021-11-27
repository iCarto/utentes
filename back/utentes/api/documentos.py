import os
import tempfile
import zipfile

from pyramid.response import FileIter, FileResponse, Response
from pyramid.view import view_config
from sqlalchemy import func
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound
from sqlalchemy.sql import label

from users import user_groups
from utentes.api.error_msgs import error_msgs
from utentes.constants import perms as perm
from utentes.models.base import badrequest_exception
from utentes.models.documento import Documento
from utentes.models.domain import Domain
from utentes.models.exploracao import Exploracao


@view_config(
    route_name="api_exploracao_documentacao",
    request_method="GET",
    permission=perm.PERM_GET,
    renderer="json",
)
def exploracao_documentacao(request):
    subpath = request.matchdict.get("subpath", None)
    path_info = parse_subpath(subpath)
    if path_info["exploracao_id"] is not None:
        return {
            "id": path_info["departamento"],
            "name": path_info["departamento"],
            "type": "folder",
            "url": request.route_url(
                "api_exploracao_documentacao", subpath=format_subpath(path_info)
            ),
            "zip_url": request.route_url(
                "api_exploracao_documentacao_zip", subpath=format_subpath(path_info)
            ),
            "files": request.route_url(
                "api_exploracao_documentacao_files", subpath=format_subpath(path_info)
            ),
            "path": request.route_url(
                "api_exploracao_documentacao_path", subpath=format_subpath(path_info)
            ),
            "permissions": get_folder_permissions(
                request, path_info["departamento"], path_info["divisao"]
            ),
        }

    raise badrequest_exception({"error": error_msgs["no_document"], "name": path_info})


@view_config(
    route_name="api_exploracao_documentacao_path",
    request_method="GET",
    permission=perm.PERM_GET,
    renderer="json",
)
def exploracao_documentacao_path(request):
    subpath = request.matchdict.get("subpath", None)

    path = []
    for folder_level, folder_name in enumerate(subpath):
        folder_id = folder_name
        if folder_level == 0:
            folder_name = (
                request.db.query(Exploracao.exp_id)
                .filter(Exploracao.gid == folder_name)
                .one()[0]
            )
        path.append(
            get_folder_path(request, folder_id, folder_name, folder_level + 1, subpath)
        )
    return path


def get_folder_path(request, folder_id, folder_name, folder_level, subpath):
    return {
        "id": folder_id,
        "name": folder_name,
        "type": "folder",
        "url": request.route_url(
            "api_exploracao_documentacao", subpath=subpath[0:folder_level]
        ),
        "files": request.route_url(
            "api_exploracao_documentacao_files", subpath=subpath[0:folder_level]
        ),
        "path": request.route_url(
            "api_exploracao_documentacao_path", subpath=subpath[0:folder_level]
        ),
    }


@view_config(
    route_name="api_exploracao_documentacao_files",
    request_method="GET",
    permission=perm.PERM_GET,
    renderer="json",
)
def exploracao_documentacao_files(request):
    subpath = request.matchdict.get("subpath", None)
    path_info = parse_subpath(subpath)
    if path_info["departamento"] is None:
        return exploracao_get_exploracao_folders(request, path_info["exploracao_id"])
    else:
        if path_info["divisao"] is None:
            departamento = path_info["departamento"]
            if departamento != user_groups.BASIN_DIVISION:
                return exploracao_get_departamento_files(
                    request,
                    path_info["exploracao_id"],
                    path_info["departamento"],
                    path_info["divisao"],
                )
            else:
                return exploracao_get_divisao_delegacion_folders(
                    request, path_info["exploracao_id"], departamento
                )
        else:
            return exploracao_get_divisao_files(
                request,
                path_info["exploracao_id"],
                path_info["departamento"],
                path_info["divisao"],
            )


def exploracao_get_exploracao_folders(request, exploracao_id):
    departamentos_json_array = init_departamentos_json_array(request, exploracao_id)
    res = (
        request.db.query(
            Documento.departamento,
            label("num_files", func.count(Documento.gid)),
            label("last_created_at", func.max(Documento.created_at)),
        )
        .filter(Documento.exploracao == exploracao_id)
        .group_by(Documento.departamento)
        .order_by(Documento.departamento)
    )
    for row in res:
        departamento = next(
            (
                departamento_json
                for departamento_json in departamentos_json_array
                if departamento_json["name"] == row[0]
            ),
            None,
        )
        if departamento:
            departamento["size"] = row[1]
            departamento["date"] = row[2]
    return departamentos_json_array


def init_departamentos_json_array(request, exploracao_id):
    departamentos = [
        user_groups.ADMINISTRATIVO,
        user_groups.FINANCIERO,
        user_groups.JURIDICO,
        user_groups.TECNICO,
        user_groups.BASIN_DIVISION,
    ]

    departamentos_json_array = []
    for departamento in departamentos:
        departamentos_json_array.append(
            {
                "id": departamento,
                "type": "folder",
                "name": departamento,
                "url": request.route_url(
                    "api_exploracao_documentacao", subpath=[exploracao_id, departamento]
                ),
                "path": request.route_url(
                    "api_exploracao_documentacao_path",
                    subpath=[exploracao_id, departamento],
                ),
                "files": request.route_url(
                    "api_exploracao_documentacao_files",
                    subpath=[exploracao_id, departamento],
                ),
            }
        )
    return departamentos_json_array


def exploracao_get_divisao_delegacion_folders(request, exploracao_id, departamento):
    divisao_json_array = init_divisao_json_array(request, exploracao_id)
    res = (
        request.db.query(
            Documento.divisao,
            label("num_files", func.count(Documento.gid)),
            label("last_created_at", func.max(Documento.created_at)),
        )
        .filter(
            Documento.exploracao == exploracao_id,
            Documento.departamento == departamento,
        )
        .group_by(Documento.divisao)
        .order_by(Documento.divisao)
        .all()
    )
    for row in res:
        divisao = next(
            (
                divisao_json
                for divisao_json in divisao_json_array
                if divisao_json["name"] == row[0]
            ),
            None,
        )
        if divisao:
            divisao["size"] = row[1]
            divisao["date"] = row[2]
    return divisao_json_array


def init_divisao_json_array(request, exploracao_id):
    divisoes = (
        request.db.query(Domain)
        .filter(Domain.category == "divisao", Domain.key != None)
        .all()
    )

    divisao_json_array = []
    for divisao in divisoes:
        subpath = [exploracao_id, user_groups.BASIN_DIVISION, divisao.key]

        divisao_json_array.append(
            {
                "id": divisao.key,
                "type": "folder",
                "name": divisao.key,
                "url": request.route_url(
                    "api_exploracao_documentacao", subpath=subpath
                ),
                "path": request.route_url(
                    "api_exploracao_documentacao_path", subpath=subpath
                ),
                "files": request.route_url(
                    "api_exploracao_documentacao_files", subpath=subpath
                ),
            }
        )
    return divisao_json_array


def exploracao_get_departamento_files(request, exploracao_id, departamento, divisao):
    files = (
        request.db.query(Documento)
        .filter(
            Documento.exploracao == exploracao_id,
            Documento.departamento == departamento,
        )
        .order_by(Documento.name)
        .all()
    )
    jsonFiles = []
    for file in files:
        jsonFile = file.__json__(request)
        jsonFile["permissions"] = get_file_permissions(request, departamento, divisao)
        jsonFiles.append(jsonFile)
    return jsonFiles


def exploracao_get_divisao_files(request, exploracao_id, departamento, divisao):
    files = (
        request.db.query(Documento)
        .filter(
            Documento.exploracao == exploracao_id,
            Documento.departamento == departamento,
            Documento.divisao == divisao,
        )
        .order_by(Documento.name)
        .all()
    )
    jsonFiles = []
    for file in files:
        jsonFile = file.__json__(request)
        jsonFile["permissions"] = get_file_permissions(request, departamento, divisao)
        jsonFiles.append(jsonFile)
    return jsonFiles


@view_config(
    route_name="api_exploracao_documentacao",
    request_method="POST",
    permission=perm.PERM_CREATE_DOCUMENTO,
    renderer="json",
)
def documento_file_create(request):
    subpath = request.matchdict.get("subpath", None)
    path_info = parse_subpath(subpath)
    return documento_file_upload(request, path_info)


def documento_file_upload(request, path_info):
    input_file = request.POST["file"]
    documento = Documento()
    documento.name = input_file.filename
    documento.size = len(input_file.value)
    documento.exploracao = path_info["exploracao_id"]
    documento.departamento = path_info["departamento"]
    documento.divisao = path_info["divisao"]
    documento.user = request.user.username

    documento.set_path_root(request.registry.settings["media_root"])
    documento.upload_file(input_file.file)

    if request.user.usergroup != user_groups.ADMIN:
        if request.user.usergroup != path_info["departamento"] or (
            path_info["divisao"] is not None
            and request.user.divisao != path_info["divisao"]
        ):
            raise badrequest_exception(
                {"error": error_msgs["no_permission"], "name": documento.name}
            )

    previous_documento = request.db.query(Documento).filter(
        Documento.exploracao == documento.exploracao,
        Documento.departamento == documento.departamento,
        Documento.name == documento.name,
    )
    if path_info["divisao"] is not None:
        previous_documento = previous_documento.filter(
            Documento.divisao == documento.divisao
        )

    if previous_documento.count() > 0:
        raise badrequest_exception(
            {"error": error_msgs["exist_document"], "name": documento.name}
        )

    request.db.add(documento)
    request.db.commit()
    return documento


@view_config(
    route_name="api_exploracao_file",
    request_method="GET",
    permission=perm.PERM_GET,
    renderer="json",
)
def documento_file_read(request):
    subpath = request.matchdict.get("subpath", None)
    file_name = subpath[-1]
    path_info = parse_subpath(subpath[:-1])

    try:
        documento = find_documento(request, file_name, path_info)
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception(
            {"error": error_msgs["no_document"], "name": path_info}
        )
    return FileResponse(documento.get_file_path())


@view_config(
    route_name="api_exploracao_file",
    request_method="DELETE",
    permission=perm.PERM_DELETE_DOCUMENTO,
    renderer="json",
)
def documento_file_delete(request):
    subpath = request.matchdict.get("subpath", None)
    file_name = subpath[-1]
    path_info = parse_subpath(subpath[:-1])

    if request.user.usergroup != user_groups.ADMIN:
        if request.user.usergroup != path_info["departamento"] or (
            path_info["divisao"] is not None
            and request.user.divisao != path_info["divisao"]
        ):
            raise badrequest_exception(
                {"error": error_msgs["no_permission"], "name": file_name}
            )

    try:
        documento = find_documento(request, file_name, path_info)
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception(
            {"error": error_msgs["no_document"], "name": path_info}
        )
    documento.delete_file()
    request.db.delete(documento)
    request.db.commit()


@view_config(
    route_name="api_exploracao_documentacao_zip",
    request_method="GET",
    permission=perm.PERM_GET,
    renderer="json",
)
def exploracao_documentos_zip(request):
    subpath = request.matchdict.get("subpath", None)
    path_info = parse_subpath(subpath)

    exploracao_id = path_info["exploracao_id"]
    filename = f"documentos_{exploracao_id}"

    departamento = path_info["departamento"]
    divisao = path_info["divisao"]
    if departamento is not None:
        if divisao is not None:
            query = request.db.query(Documento).filter(
                Documento.exploracao == exploracao_id,
                Documento.departamento == departamento,
                Documento.divisao == divisao,
            )
        else:
            query = request.db.query(Documento).filter(
                Documento.exploracao == exploracao_id,
                Documento.departamento == departamento,
            )
    else:
        query = request.db.query(Documento).filter(
            Documento.exploracao == exploracao_id
        )

    documentos = query.all()

    tzip = create_zip_file(request, documentos, departamento, divisao)

    response = Response()
    response.content_type = "application/zip"
    response.content_disposition = f'attachment; filename="{filename}.zip"'
    response.app_iter = FileIter(tzip)

    return response


def create_zip_file(request, documentos, departamento, divisao):
    # TODO. To be improved. Un par de cosas a tener en cuenta:
    # * TemporaryFile, SpooledTemporaryFile y StringIO no generan/aseguran que
    # hay un path en disco.
    # FileResponse nececista un path a disco y hacen un open(path, 'r'). Al acabar
    # hace un close.
    # NameTemporaryFile por defecto hace un open(w+b), y ZipFile si le pasamos un
    # path hace un open(w). Es decir abrimos el fichero dos veces. Con el del FileResponse
    # también se abriría de nuevo. En Windows esto no funciona.
    # https://stackoverflow.com/questions/12949077/
    # https://stackoverflow.com/questions/11967720/
    # https://stackoverflow.com/questions/23212435/
    # https://stackoverflow.com/questions/12881294/

    tmp = tempfile.NamedTemporaryFile()
    with zipfile.ZipFile(tmp, "w", compression=zipfile.ZIP_DEFLATED) as zipobj:
        for documento in documentos:
            documento.set_path_root(request.registry.settings["media_root"])
            path_in_disk = documento.get_file_path()
            if os.path.isfile(path_in_disk):
                name = documento.name
                if departamento is None:
                    path_in_zip = os.path.join(
                        documento.departamento,
                        documento.divisao if documento.divisao is not None else "",
                        name,
                    )
                else:
                    if divisao is None:
                        path_in_zip = os.path.join(
                            documento.divisao if documento.divisao is not None else "",
                            name,
                        )
                    else:
                        path_in_zip = os.path.join(name)

                # https://stackoverflow.com/questions/1807063/
                if os.name == "nt":
                    path_in_zip = path_in_zip.encode("cp437")
                zipobj.write(path_in_disk, path_in_zip)
    tmp.seek(0)
    return tmp


def find_documento(request, name, path_info):
    query = request.db.query(Documento).filter(
        Documento.exploracao == path_info["exploracao_id"],
        Documento.departamento == path_info["departamento"],
        Documento.name == name,
    )
    if path_info["divisao"] is not None:
        query = query.filter(Documento.divisao == path_info["divisao"])
    documento = query.one()
    documento.set_path_root(request.registry.settings["media_root"])
    return documento


def parse_subpath(subpath):
    return {
        "exploracao_id": subpath[0] if 0 < len(subpath) else None,
        "departamento": subpath[1] if 1 < len(subpath) else None,
        "divisao": subpath[2] if 2 < len(subpath) else None,
    }


def format_subpath(path_info):
    subpath = []
    subpath.append(path_info["exploracao_id"])
    if path_info["departamento"] is not None:
        subpath.append(path_info["departamento"])
        if path_info["divisao"] is not None:
            subpath.append(path_info["divisao"])
    return subpath


def get_folder_permissions(request, departamento, divisao):
    if departamento is None or (
        departamento == user_groups.BASIN_DIVISION and divisao is None
    ):
        return ["perm_download"]
    if request.user.usergroup == user_groups.ADMIN:
        return ["perm_upload", "perm_download", "perm_delete"]
    if departamento == user_groups.BASIN_DIVISION:
        if request.user.divisao == divisao:
            return ["perm_upload", "perm_download", "perm_delete"]
    elif request.user.usergroup == departamento:
        return ["perm_upload", "perm_download", "perm_delete"]
    return ["perm_download"]


def get_file_permissions(request, departamento, divisao):
    if request.user.usergroup == user_groups.ADMIN:
        return ["perm_download", "perm_delete"]
    if departamento == user_groups.BASIN_DIVISION:
        if request.user.divisao == divisao:
            return ["perm_download", "perm_delete"]
    elif request.user.usergroup == departamento:
        return ["perm_download", "perm_delete"]
    return ["perm_download"]
