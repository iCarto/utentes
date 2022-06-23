// en realidad no necesitamos un modelo. Sólo algo que haga Mix-in
// de Events
SIRHA.Services.PaymentsCalculationService = Backbone.Model.extend({
    setLicFields: function(
        taxaFixaID,
        taxaUsoID,
        consumoID,
        ivaID,
        pagoMesID,
        pagoIvaID
    ) {
        const org_model = this.get("org_model");
        const self = this;
        this.listenTo(
            org_model,
            `change:${taxaFixaID} change:${taxaUsoID} change:${consumoID} change:${ivaID}`,
            function() {
                const taxa_fixa = org_model.get(taxaFixaID);
                const taxa_uso = org_model.get(taxaUsoID);
                const consumo_fact = org_model.get(consumoID);
                const pago_mes = self.pagoMes(taxa_fixa, taxa_uso, consumo_fact);
                const iva = org_model.get(ivaID);
                const pago_mes_iva = self.applyIVA(pago_mes, iva);

                org_model.set(pagoMesID, pago_mes);
                org_model.set(pagoIvaID, pago_mes_iva);
            }
        );
    },

    setTotalFields: function(pagoIvaSupID, pagoIvaSubID, jurosID, pagoIvaTotalID) {
        const org_model = this.get("org_model");
        const self = this;
        this.listenTo(
            org_model,
            `change:${pagoIvaSupID} change:${pagoIvaSubID} change:${jurosID}`,
            function() {
                const pago_iva_sup = org_model.get(pagoIvaSupID);
                const pago_iva_sub = org_model.get(pagoIvaSubID);
                const juros = org_model.get(jurosID);
                org_model.set(
                    pagoIvaTotalID,
                    self.pagoIvaTotal(pago_iva_sub, pago_iva_sup, juros)
                );
            }
        );
    },

    pagoMes: function(taxa_fixa, taxa_uso, consumo_fact) {
        const org_model = this.get("org_model");
        const month_factor =
            (org_model?.monthFactor && org_model.monthFactor()) || this.monthFactor();
        return (taxa_fixa + taxa_uso * consumo_fact) * month_factor;
    },

    applyIVA: function(pago_mes, iva) {
        return pago_mes * (1 + iva / 100);
    },

    pagoIvaTotal: function(pago_iva_sub, pago_iva_sup, juros) {
        // returns the total of pago_iva with juros applied
        pago_iva_sub = pago_iva_sub || 0;
        pago_iva_sup = pago_iva_sup || 0;
        juros = juros || 0;
        return (pago_iva_sup + pago_iva_sub) * (1 + juros / 100);
    },

    monthFactor: function() {
        switch (this.get("fact_tipo")) {
            case "Trimestral":
                return 3;
            case "Anual":
                return 12;
            case "Mensal":
            default:
                return 1;
        }
    },
});
