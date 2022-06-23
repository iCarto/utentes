Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.Factura = Backbone.Model.extend({
    dateFields: ["fact_date", "recibo_date"],
    defaults: {
        id: null,
        ano: null,
        mes: null,
        observacio: [],
        fact_estado: null,
        fact_tipo: null,
        pago_lic: null,
        c_licencia_sup: null,
        c_licencia_sub: null,
        consumo_tipo_sup: null,
        consumo_fact_sup: null,
        taxa_fixa_sup: null,
        taxa_uso_sup: null,
        pago_mes_sup: null,
        pago_iva_sup: null,
        consumo_tipo_sub: null,
        consumo_fact_sub: null,
        taxa_fixa_sub: null,
        taxa_uso_sub: null,
        pago_mes_sub: null,
        pago_iva_sub: null,
        iva: null,
        juros: null,
        pago_iva: null,
        fact_id: null,
        recibo_id: null,
        fact_date: null,
        recibo_date: null,
    },

    initialize: function() {
        this.subPayments = new SIRHA.Services.PaymentsCalculationService({
            org_model: this,
        });

        this.subPayments.setLicFields(
            "taxa_fixa_sub",
            "taxa_uso_sub",
            "consumo_fact_sub",
            "iva",
            "pago_mes_sub",
            "pago_iva_sub"
        );
        this.subPayments.setTotalFields(
            "pago_iva_sup",
            "pago_iva_sub",
            "juros",
            "pago_iva"
        );

        this.supPayments = new SIRHA.Services.PaymentsCalculationService({
            entity: this,
        });

        this.supPayments.setLicFields(
            "taxa_fixa_sup",
            "taxa_uso_sup",
            "consumo_fact_sup",
            "iva",
            "pago_mes_sup",
            "pago_iva_sup"
        );

        // Use this.supPayments.setTotalFields() is not needed. With sub is enough
    },

    monthFactor: function() {
        /*
        Returns the number of months that this invoice is billing
        */
        let billing_period = this.get("periodo_fact");
        return formatter().diffMonthIncludeUpper(billing_period[1], billing_period[0]);
    },
});
