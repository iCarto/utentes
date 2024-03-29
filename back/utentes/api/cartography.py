from pyramid.view import view_config

from utentes.constants import perms as perm
from utentes.models import cartography
from utentes.models.base import notfound_exception
from utentes.models.constants import THREE_DAYS_IN_SECONDS
from utentes.models.exploracao import ExploracaoGeom


@view_config(
    route_name="api_cartography",
    permission=perm.PERM_GET,
    request_method="GET",
    renderer="json",
    http_cache=THREE_DAYS_IN_SECONDS,
)
def api_cartography(request):
    layer = request.matchdict["layer"]
    model = {
        "estacoes": cartography.Estacoes,
        "barragens": cartography.Barragens,
        "fontes": cartography.Fontes,
        "entidadespopulacao": cartography.EntidadesPopulacao,
        "albufeiras": cartography.Albufeiras,
        "lagos": cartography.Lagos,
        "estradas": cartography.Estradas,
        "rios": cartography.Rios,
        "aras": cartography.ARAS,
        "bacias": cartography.Bacias,
        "baciasrepresentacion": cartography.BaciasRepresentacion,
        "provincias": cartography.Provincias,
        "paises": cartography.Paises,
        "oceanos": cartography.Oceanos,
        "exploracaos": ExploracaoGeom,
        "divisoes": cartography.Divisoes,
        "subacias": cartography.Subacias,
    }.get(layer)
    if not model:
        raise notfound_exception(
            {"error": "El recurso no existe en el servidor", "layer": layer}
        )

    result = {"type": "FeatureCollection"}
    if layer == "exploracaos":
        gid = request.GET.get("gid")
        base_geom = request.db.query(model).filter(model.gid == gid).one().the_geom
        if base_geom is None:
            return []

        result["features"] = (
            request.db.query(model)
            .filter(model.the_geom.isnot(None))
            .filter(model.gid != gid)
            .filter(model.the_geom.ST_DWithin(base_geom, 20000))
            .all()
        )
    else:
        result["features"] = (
            request.db.query(model).filter(model.geom.isnot(None)).all()
        )
    return result
