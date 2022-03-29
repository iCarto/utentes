from utentes.models.base import Base
from utentes.models.exploracao import Exploracao


def from_exploracao(request, exp: Exploracao):
    expected_json = simple_geojson(request, exp)
    expected_json["fontes"] = [f.__json__(request) for f in expected_json["fontes"]]
    expected_json["licencias"] = [
        f.__json__(request) for f in expected_json["licencias"]
    ]
    expected_json["actividade"] = expected_json["actividade"].__json__(request)
    if expected_json["actividade"].get("cultivos"):
        cultivos = []
        for cult in expected_json["actividade"]["cultivos"]["features"]:
            cultivo = simple_geojson(request, cult)
            cultivos.append(cultivo)
        expected_json["actividade"]["cultivos"] = cultivos

    if expected_json["actividade"].get("reses"):
        expected_json["actividade"]["reses"] = [
            f.__json__(request) for f in expected_json["actividade"]["reses"]
        ]
    if expected_json["actividade"].get("tanques_piscicolas"):
        expected_json["actividade"]["tanques_piscicolas"] = [
            f.__json__(request)
            for f in expected_json["actividade"]["tanques_piscicolas"]
        ]
    return expected_json


def simple_geojson(request, entity: Base):
    expected_json = entity.__json__(request)
    expected_json.update(expected_json.pop("properties"))
    return expected_json
