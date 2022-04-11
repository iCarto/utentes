Backbone.SIXHIARA = Backbone.SIXHIARA || {};

Backbone.SIXHIARA.Config = {
    urlSearch: "/exploracao-search.html",
    urlShow: "/exploracao-show.html?id=",
    urlUtentes: "/utentes.html",
    urlPendentes: "/requerimento-pendente.html",
    urlOfflineData: "/api/cartography/",
    apiDomains: "/api/domains",
    apiExploracaos: "/api/exploracaos",
    apiExploracaosFind: "/api/exploracaos/find",
    apiRequerimentos: "/api/requerimento",
    apiFacturacaoExploracao: "/api/facturacao_exploracao",
    apiFacturacao: "/api/facturacao",
    apiInvoices: "/api/invoices",
    apiRenovacoes: "/api/renovacao",
    apiHistoricoRenovacoes: "/api/renovacao_historico",
    apiUtentes: "/api/utentes",
    apiUtentesFind: "/api/utentes/find",
    apiCultivos: "/api/cultivos",
    apiTanquesPiscicolas: "/api/tanques_piscicolas",
    apiDocumentos: "/api/documentos",
    api_transform_coordinates: "/api/transform",
    apiNewExpId: "/api/new_exp_id",
};

Backbone.SIXHIARA.formatter = formatter();
Backbone.SIXHIARA.formatter.formatTipoLicencias = function(licencias) {
    var licenciasStr = ["-", "-"];
    licencias.forEach(function(lic) {
        var tipo = lic["tipo_agua"];
        if (tipo === "Subterrânea") {
            licenciasStr[0] = tipo;
        }
        if (tipo === "Superficial") {
            licenciasStr[1] = tipo;
        }
    });
    return licenciasStr;
};

Backbone.SIXHIARA.MSG = {
    NO_ACTIVITY: "Actividade non declarada",
};

Backbone.UILib.DomainCollection = Backbone.UILib.DomainCollection.extend({
    url: Backbone.SIXHIARA.Config.apiDomains,
});

Backbone.SIXHIARA.tiemposRenovacion = {
    limit: 90,
    warning: 30,
};

Backbone.SIXHIARA.duracionLicencias = {
    Licença: "5",
    Autorização: "1-2",
    Concessão: "6-50",
};

Backbone.SIXHIARA.tipoTemplates = {
    Licença: "static/print-templates/210906_Modelo_Licenca_Autorizacion_SIRH.docx",
    Autorização: "static/print-templates/210906_Modelo_Licenca_Autorizacion_SIRH.docx",
    Concessão: "static/print-templates/210920_Modelo_Concesao_SIRH.docx",
    Factura: "static/print-templates/Modelo_Factura_SIRH.docx",
    Recibo: "static/print-templates/Modelo_Recibo_SIRH.docx",
};

window.bootbox &&
    bootbox.addLocale("pt-mz", {
        OK: "Aceitar",
        CANCEL: "Cancelar",
        CONFIRM: "Aceitar",
    });
window.bootbox &&
    bootbox.setDefaults({
        locale: "pt-mz",
        closeButton: false,
        backdrop: null,
        buttons: {
            cancel: {
                label: '<i class="fas fa-times"></i> Cancelar',
            },
            confirm: {
                label: '<i class="fas fa-check"></i> Aceitar',
            },
        },
    });

SIRHA.Utils.getIdFromSearchParams = function getIdFromSearchParams() {
    var searchParams = new URLSearchParams(window.location.search);
    var idParam = searchParams.get("id") || "";
    var id = parseInt(idParam);

    // Check if the id is in the database?
    if (String(id).length !== idParam.length) {
        return NaN;
    }
    return id;
};
