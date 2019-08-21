Backbone.SIXHIARA = Backbone.SIXHIARA || {};

Backbone.SIXHIARA.Config = {
    urlSearch: "/exploracao-search.html",
    urlShow: "/exploracao-show.html?id=",
    urlUtentes: "/utentes.html",
    urlPendentes: "/requerimento-pendente.html",
    urlOfflineData: "/static/offline/data/",
    urlOfflineDataLeged: "/static/offline/legend/Cidadesevilas.png",
    apiDomains: "/api/domains",
    apiExploracaos: "/api/exploracaos",
    apiRequerimentos: "/api/requerimento",
    apiFacturacaoExploracao: "/api/facturacao_exploracao",
    apiFacturacao: "/api/facturacao",
    apiRenovacoes: "/api/renovacao",
    apiHistoricoRenovacoes: "/api/renovacao_historico",
    apiUtentes: "/api/utentes",
    apiCultivos: "/api/cultivos",
    apiTanquesPiscicolas: "/api/tanques_piscicolas",
    apiDocumentos: "/api/documentos",
    api_transform_coordinates: "/api/transform",
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

$(document).ready(function() {
    $("#nav-settings").on("click", function(e) {
        e.preventDefault();
        var configModalView = new Backbone.SIXHIARA.ConfigModalView({
            model: new Backbone.Model(),
        });
        configModalView.show();
    });
});

Backbone.UILib.DomainCollection = Backbone.UILib.DomainCollection.extend({
    url: Backbone.SIXHIARA.Config.apiDomains,
});

var role_domains_collection = new Backbone.UILib.DomainCollection([
    {
        category: "groups",
        text: null,
        order: 0,
    },
    {
        category: "groups",
        text: SIRHA.ROLE.ADMIN,
        order: 1,
    },
    {
        category: "groups",
        text: SIRHA.ROLE.ADMINISTRATIVO,
        order: 2,
    },
    {
        category: "groups",
        text: SIRHA.ROLE.DIRECCION,
        order: 3,
    },
    {
        category: "groups",
        text: SIRHA.ROLE.FINANCIERO,
        order: 4,
    },
    {
        category: "groups",
        text: SIRHA.ROLE.JURIDICO,
        order: 5,
    },
    {
        category: "groups",
        text: SIRHA.ROLE.TECNICO,
        order: 6,
    },
    {
        category: "groups",
        text: SIRHA.ROLE.OBSERVADOR,
        order: 7,
    },
    {
        category: "groups",
        text: SIRHA.ROLE.UNIDAD,
        order: 7,
    },
]);

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
    Licença: "static/print-templates/Modelo_Licenca_Autorizacion_SIRHA.docx",
    Autorização: "static/print-templates/Modelo_Licenca_Autorizacion_SIRHA.docx",
    Concessão: "static/print-templates/Modelo_Concesao_SIRHA.docx",
    Factura: "static/print-templates/Modelo_Factura_SIRHAS_desarrollo.docx",
    Recibo: "static/print-templates/Modelo_Recibo_SIRHAZ.docx",
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
                label: '<i class="fa fa-times"></i> Cancelar',
            },
            confirm: {
                label: '<i class="fa fa-check"></i> Aceitar',
            },
        },
    });
