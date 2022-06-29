Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.Licencia = Backbone.Model.extend({
    dateFields: ["d_emissao", "d_validade"],

    defaults: {
        id: null,
        lic_nro: null,
        tipo_agua: null,
        tipo_lic: null,
        n_licen_a: null,
        estado: null,
        d_emissao: null,
        d_validade: null,
        c_soli_tot: null,
        c_soli_int: null,
        c_soli_fon: null,
        c_licencia: null,
        c_real_tot: null,
        c_real_int: null,
        c_real_fon: null,
        taxa_fixa: null,
        taxa_uso: null,
        pago_mes: null,
        iva: null,
        pago_iva: null,
        consumo_tipo: null,
        consumo_fact: null,
        lic_time_info: null,
        lic_time_enough: false,
        lic_time_warning: false,
        lic_time_over: false,
    },

    initialize: function() {
        this.on(
            "change:c_soli_int change:c_soli_fon",
            function(model, value, options) {
                // TODO: set c_soli_tot, taking into account null values
                this.set("c_soli_tot", this.getSoliTot());
            },
            this
        );
        this.on(
            "change:c_real_int change:c_real_fon",
            function(model, value, options) {
                // TODO: set c_real_tot, taking into account null values
                this.set("c_real_tot", this.getRealTot());
            },
            this
        );
    },

    initializePayments: function(exploracao) {
        // Este cálculo de pagos, sólo tiene sentido para el paso de la concesión de
        // licencias, en que el técnico prepara los datos para la proforma. Por eso
        // se usa el consumo licenciado y no el facturado.
        if (this.payments) {
            return;
        }
        this.payments = new SIRHA.Services.PaymentsCalculationService({
            org_model: this,
            fact_tipo: exploracao.get("fact_tipo"),
        });

        this.payments.setLicFields(
            "taxa_fixa",
            "taxa_uso",
            "c_licencia",
            "iva",
            "pago_mes",
            "pago_iva"
        );
    },

    getSoliTot: function() {
        return this.get("c_soli_int") + this.get("c_soli_fon");
    },

    getRealTot: function() {
        return this.get("c_real_int") + this.get("c_real_fon");
    },

    impliesValidateActivity: function() {
        return !SIRHA.ESTADO.CATEGORY_VALIDATE_ACTIVIY.includes(this.get("estado"));
    },

    isLicensed: function() {
        return this.get("estado") === SIRHA.ESTADO.LICENSED;
    },

    isInvoizable: function() {
        return SIRHA.ESTADO.CATEGORY_INVOIZABLE.includes(this.get("estado"));
    },

    getSafeTipoAgua: function() {
        return this.get("tipo_agua")
            .substring(0, 3)
            .toLowerCase();
    },
});

Backbone.SIXHIARA.Licencia.create = function(exploracao, attrs) {
    const lic = new Backbone.SIXHIARA.Licencia(attrs);

    if (lic.get("taxa_uso") === null && lic.get("tipo_agua") === "Subterrânea") {
        lic.set("taxa_uso", 0.6, {silent: true});
    }

    if (lic.get("iva") === null) {
        lic.set("iva", window.SIXHIARA.IVA, {silent: true});
    }

    if (!lic.get("lic_nro")) {
        lic.set(
            "lic_nro",
            SIRHA.Services.IdService.calculateNewLicNro(
                exploracao.get("exp_id"),
                lic.get("tipo_agua")
            ),
            {silent: true}
        );
    }

    return lic;
};
