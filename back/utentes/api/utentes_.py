import json
import logging

from pyramid.view import view_config
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound

from utentes.api.error_msgs import error_msgs
from utentes.constants import perms as perm
from utentes.lib.schema_validator.validator import Validator
from utentes.models.base import badrequest_exception
from utentes.models.documento import delete_exploracao_documentos
from utentes.models.utente import Utente
from utentes.models.utente_schema import UTENTE_SCHEMA


log = logging.getLogger(__name__)


@view_config(
    route_name="api_utentes",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
@view_config(
    route_name="api_utentes_id",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
def utentes_get(request):
    gid = None
    if request.matchdict:
        gid = request.matchdict["id"] or None

    if gid:  # return individual utente
        try:
            return request.db.query(Utente).filter(Utente.gid == gid).one()
        except (MultipleResultsFound, NoResultFound):
            raise badrequest_exception({"error": error_msgs["no_gid"], "gid": gid})
    else:
        return request.db.query(Utente).order_by(Utente.nome).all()


@view_config(
    route_name="api_utentes_id",
    permission=perm.PERM_ADMIN,
    request_method="DELETE",
    renderer="json",
)
def utentes_delete(request):
    gid = request.matchdict["id"]
    if not gid:
        raise badrequest_exception({"error": error_msgs["gid_obligatory"]})
    try:
        u = request.db.query(Utente).filter(Utente.gid == gid).one()
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception({"error": error_msgs["no_gid"], "gid": gid})
    for e in u.exploracaos:
        delete_exploracao_documentos(request, e.gid)
    request.db.delete(u)
    request.db.commit()

    return {"gid": gid}


@view_config(
    route_name="api_utentes_id",
    permission=perm.PERM_UTENTES,
    request_method="PUT",
    renderer="json",
)
def utentes_update(request):
    gid = request.matchdict["id"]
    if not gid:
        raise badrequest_exception({"error": error_msgs["gid_obligatory"]})

    msgs = validate_entities(request.json_body)
    if msgs:
        raise badrequest_exception({"error": msgs})

    try:
        u = request.db.query(Utente).filter(Utente.gid == gid).one()
    except (MultipleResultsFound, NoResultFound):
        raise badrequest_exception({"error": error_msgs["no_gid"], "gid": gid})
    try:
        u.update_from_json(request.json_body)
    except ValueError as ve:
        log.error(ve)
        raise badrequest_exception({"error": error_msgs["body_not_valid"]})

    request.db.add(u)
    request.db.commit()
    return u


@view_config(
    route_name="api_utentes",
    permission=perm.PERM_UTENTES,
    request_method="POST",
    renderer="json",
)
def utentes_create(request):
    try:
        body = request.json_body
    except ValueError as ve:
        log.error(ve)
        raise badrequest_exception({"error": error_msgs["body_not_valid"]})

    nome = body.get("nome")
    msgs = validate_entities(body)
    if msgs:
        raise badrequest_exception({"error": msgs})

    # TODO:320 is this not covered by schema validations?
    if not nome:
        raise badrequest_exception({"error": "nome es um campo obligatorio"})

    e = request.db.query(Utente).filter(Utente.nome == nome).all()

    if e:
        raise badrequest_exception({"error": error_msgs["utente_already_exists"]})

    u = Utente.create_from_json(body)
    request.db.add(u)
    request.db.commit()
    return u


@view_config(
    route_name="api_utentes_find",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
)
def utentes_find(request):

    nome = request.params.get("nome", "")
    nuit = request.params.get("nuit", "")
    telefone = request.params.get("telefone", "")
    email = request.params.get("email", "")
    similarity_grade = 0.3
    sql = """
        select *,
            case
                when nuit = :nuit  THEN 1
                when telefone = :telefone  THEN 1
                when email = :email  THEN 1
                else similarity(unaccent(:nome), unaccent(nome))
            end as similarity,
            case
                when nuit = :nuit  THEN 'NUIT'
                when telefone = :telefone  THEN 'Telefone'
                when email = :email  THEN 'Email'
                else 'Nome do utente'
            end as similarity_field
        from utentes.utentes
            where
                similarity(unaccent(:nome), unaccent(nome))  >= :similarity_grade
                or nuit = :nuit
                or telefone = :telefone
                or email = :email
        order by similarity desc
    """

    result = request.db.execute(
        sql,
        {
            "nome": nome,
            "nuit": nuit,
            "telefone": telefone,
            "email": email,
            "similarity_grade": similarity_grade,
        },
    )

    return [(dict(row.items())) for row in result]


def validate_entities(body):
    return Validator(UTENTE_SCHEMA).validate(body)
