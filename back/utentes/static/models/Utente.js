Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.Utente = Backbone.Model.extend({
    dateFields: ["bi_d_emis"],

    defaults: {
        id: null,
        nome: null,
        uten_tipo: null,
        nuit: null,
        uten_gere: null,
        sexo_gerente: null,
        uten_memb: null,
        uten_mulh: null,
        contacto: null,
        email: null,
        telefone: null,
        bi_di_pas: null,
        bi_d_emis: null,
        bi_l_emis: null,
        loc_provin: null,
        loc_distri: null,
        loc_posto: null,
        loc_nucleo: null,
        loc_endere: null,
        reg_comerc: null,
        reg_zona: null,
        observacio: null,
    },

    validate: function(attrs, options) {
        var messages = [];
        validator(UTENTE_SCHEMA)
            .validate(this.attributes)
            .forEach(function(msg) {
                messages.push(msg);
            });
        if (messages.length > 0) return messages;
    },
});
