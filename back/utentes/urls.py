from pyramid.config import Configurator


def includeme(config: Configurator):
    config.include(add_routes_views)
    config.include(add_routes_api)
    config.add_route("api_cartography", "/api/cartography/{layer}")
    # utilities for manual testing
    config.add_route("api_test_fact_substract_month", "/api/test/fact_substract_month")


def add_routes_views(config: Configurator):  # noqa: WPS213
    config.add_route("index", "/")
    config.add_route("login", "/login")
    config.add_route("logout", "/logout")
    config.add_route("user", "/utilizador")
    config.add_route("user_id", "/utilizador/{id}")
    config.add_route("users", "/utilizadores")
    config.add_route("adicionar_ficha", "/adicionar_ficha")
    config.add_route("adicionar_usos_comuns", "/adicionar_utente_usos_comuns")
    config.add_route("adicionar_utente_facto", "/adicionar_utente_facto")
    config.add_route("exploracao-search", "exploracao-search.html")
    config.add_route("exploracao-show", "exploracao-show.html")
    config.add_route("facturacao", "facturacao.html")
    config.add_route("renovacao", "renovacao.html")
    config.add_route("requerimento-new", "requerimento-new.html")
    config.add_route("requerimento-pendente", "requerimento-pendente.html")
    config.add_route("utentes", "utentes.html")
    config.add_route("facturacao-stats", "facturacao-stats.html")


def add_routes_api(config: Configurator):  # noqa: WPS213
    config.add_route("api_exploracaos", "/api/exploracaos")
    config.add_route("api_exploracaos_find", "/api/exploracaos/find")
    config.add_route("api_exploracaos_id", "/api/exploracaos/{id}")

    config.add_route("api_fontes_exploracao", "/api/fontes/{exploracao}")

    # exploracao_id*/departamento?/divisao? conforms the subpath part of the url
    # GET    /api/documentos/exploracao_id*/departamento?/divisao?
    #     Return info and routes to files for an exploracao, departamento or divisao
    # POST   /api/documentos/exploracao_id*/departamento?/divisao?
    #     Creates a new documento
    # GET    /api/exploracaos/{id}/documentos/{departamento}/{filename}
    #     Return individual documento
    # DELETE /api/exploracaos/{id}/documentos/{departamento}/{filename}
    #     Delete documento
    config.add_route(
        "api_exploracao_documentacao_files", "/api/documentos/files/*subpath"
    )
    config.add_route(
        "api_exploracao_documentacao_path", "/api/documentos/path/*subpath"
    )
    config.add_route("api_exploracao_documentacao_zip", "/api/zip/*subpath")
    config.add_route("api_exploracao_documentacao", "/api/documentos/*subpath")
    config.add_route("api_exploracao_file", "/api/file/*subpath")

    config.add_route("api_utentes", "/api/utentes")
    config.add_route("api_utentes_find", "/api/utentes/find")
    config.add_route("api_utentes_id", "/api/utentes/{id}")

    config.add_route("api_cultivos", "/api/cultivos")
    config.add_route("api_cultivos_id", "/api/cultivos/{id}")

    config.add_route("api_tanques_piscicolas", "/api/tanques_piscicolas")
    config.add_route("api_tanques_piscicolas_id", "/api/tanques_piscicolas/{id}")

    config.add_route("api_domains", "/api/domains")
    config.add_route("api_domains_licencia_estado", "/api/domains/licencia_estado")

    config.add_route(
        "api_domains_licencia_estado_renovacao",
        "/api/domains/licencia_estado_renovacao",
    )

    config.add_route("api_requerimento", "/api/requerimento")
    config.add_route("api_requerimento_id", "/api/requerimento/{id}")
    config.add_route("api_requerimento_get_datos_ara", "/api/get_datos_ara")

    # api_facturacao_stats debe estar sobre otras rutas para que funcione correctamente
    config.add_route("api_facturacao_stats", "/api/facturacao/stats")
    config.add_route("api_invoices_by_exploracao", "/api/invoices")
    config.add_route("api_facturacao", "/api/facturacao")
    config.add_route("api_facturacao_id", "/api/facturacao/{id}")
    config.add_route("api_facturacao_exploracao_id", "/api/facturacao_exploracao/{id}")
    config.add_route(
        "api_facturacao_new_fact_id", "/api/facturacao/{id}/emitir_factura"
    )
    config.add_route(
        "api_facturacao_new_recibo_id", "/api/facturacao/{id}/emitir_recibo"
    )

    config.add_route("api_renovacao", "/api/renovacao")
    config.add_route("api_renovacao_id", "/api/renovacao/{id}")
    config.add_route("api_renovacao_historico_id", "/api/renovacao_historico/{id}")

    config.add_route("nuevo_ciclo_facturacion", "/api/nuevo_ciclo_facturacion")

    config.add_route("api_new_exp_id", "/api/new_exp_id")

    config.add_route("api_users", "/api/users")
    config.add_route("api_users_id", "/api/users/{id}")

    config.add_route("api_transform_coordinates", "/api/transform")

    config.add_route("api_weap_demand", "/api/weap/demand")

    config.add_route("api_erp_clients", "/api/erp/clients")
    config.add_route("api_erp_invoices", "/api/erp/invoices")
