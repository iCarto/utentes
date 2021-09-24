/*
DEPRECATED ON September/2021. Drop it if it's not used in six months
*/
Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.FacturacaoFactEstado = Backbone.UILib.Domain.extend({
    urlRoot: "/api/domains/facturacao_fact_estado",

    defaults: {
        category: "facturacao_fact_estado",
        alias: "",
        text: "",
        order: 0,
        parent: "",
    },
});
