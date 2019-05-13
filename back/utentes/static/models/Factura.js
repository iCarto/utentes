Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.Factura = Backbone.Model.extend({

    defaults: {
        'id':         null,
        'ano': null,
        'mes':   null,
        'observacio':     [],
        'fact_estado':    null,
        'fact_tipo':     null,
        'pago_lic':      null,
        'c_licencia_sup':   null,
        'c_licencia_sub': null,
        'consumo_tipo_sup': null,
        'consumo_fact_sup': null,
        'taxa_fixa_sup': null,
        'taxa_uso_sup': null,
        'pago_mes_sup': null,
        'pago_iva_sup': null,
        'iva_sup': null,
        'consumo_tipo_sub': null,
        'consumo_fact_sub': null,
        'taxa_fixa_sub': null,
        'taxa_uso_sub': null,
        'pago_mes_sub': null,
        'pago_iva_sub': null,
        'iva_sub': null,
        'iva': null,
        'juros': null,
        'pago_mes': null,
        'pago_iva': null,
        'fact_id':     null,
        'recibo_id':     null,
        'fact_date':     null,
        'recibo_date':     null,
    },

});
