Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.Renovacao = Backbone.Model.extend({
    dateFields: [
        "d_soli",
        "d_ultima_entrega_doc",
        "d_emissao_sub_old",
        "d_emissao_sub",
        "d_emissao_sup_old",
        "d_emissao_sup",
        "d_validade_sub_old",
        "d_validade_sub",
        "d_validade_sup_old",
        "d_validade_sup",
    ],

    urlRoot: Backbone.SIXHIARA.Config.apiRenovacoes,

    setLicState: function(state) {
        this.set("estado", state);
    },
});
