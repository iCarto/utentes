Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ExploracaoSimilar = Backbone.Model.extend({
    defaults: {
        gid: null,
        exp_id: null,
        exp_name: null,
        estado_lic: null,
        actividade: null,
        loc_provin: null,
        loc_distri: null,
        loc_posto: null,
        loc_nucleo: null,
        loc_divisao: null,
        loc_bacia: null,
        loc_subaci: null,
        tipo_agua: null,
        c_licencia: null,
        c_real: null,
        similarity: null,
        similarity_field: null,
    },

    idAttribute: "gid",
});
