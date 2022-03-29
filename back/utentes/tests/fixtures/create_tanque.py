from utentes.models.tanques_piscicolas import ActividadesTanquesPiscicolas


def create_test_tanque():
    tanque = ActividadesTanquesPiscicolas()
    tanque.estado = "Operacional"
    tanque.esp_culti = "Peixe gato"
    tanque.tipo = "Gaiola"
    return tanque
