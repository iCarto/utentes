from utentes.tests.fixtures.create_exploracao import piscicola


def from_file(request, commit=False):
    e_test = piscicola(request)
    actv = e_test.actividade

    actv_json = actv.__json__(request)
    actv_json["exp_id"] = e_test.exp_id
    tanques = [
        f.__json__(request)["properties"]
        for f in actv_json.get("tanques_piscicolas", {}).get("features", [])
    ]
    tanques.append(
        {
            "estado": "Operacional",
            "esp_culti": "Peixe gato",
            "tipo": "Gaiola",
            "actividade": actv.gid,
        }
    )
    actv_json["tanques_piscicolas"] = tanques
    actv.update_from_json(actv_json)
    request.db.add(actv)
    if commit:
        request.db.commit()
    return actv.tanques_piscicolas[-1]
