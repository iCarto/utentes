Backbone.SIXHIARA.LicenseModalView = Backbone.UILib.ModalView.extend({
    customConfiguration: function() {
        var estadosLicencia = this.options.domains.byCategory("licencia_estado");

        new Backbone.UILib.SelectView({
            el: this.$("#estado"),
            collection: estadosLicencia,
            cloneCollection: true,
        }).render();

        var self = this;
        this.$("#info-estado-licencia").on("click", function() {
            new Backbone.SIXHIARA.ModalTooltipEstadoLicenciaView({
                collection: estadosLicencia,
                actual_state: self.model.get("estado"),
            }).show();
        });

        // Workaround. Si se clona el modelo de licencia licencia.exploracao no se copia
        //al clon y monthFactor falla
        if (
            this.options.exploracao.get("estado_lic") ===
            SIRHA.ESTADO.PENDING_TECH_DECISION
        ) {
            this.widgetModel.initializePayments(this.options.exploracao);
            document
                .querySelector(".modal #fact_tipo")
                .addEventListener("change", function(e) {
                    self.widgetModel.payments.set("fact_tipo", e.target.value);
                    self.widgetModel.trigger("change:iva");
                });
        }
    },

    fillFactTipo: function(factTipoValue) {
        // fact_tipo is in the `exploracao` and not in the `license`
        // Las licencias de usos comuns no tienen #fact_tipo
        // Igual se podrían ocultar con uilib-enability
        let factTipoWidget = this.$("#fact_tipo");
        if (factTipoWidget.length) {
            factTipoWidget[0].value = factTipoValue;
        }
    },

    okButtonClicked: function() {
        Backbone.UILib.ModalView.prototype.okButtonClicked.call(this);

        // See #1685
        this.options.exploracao.setLicState(this.model.get("estado"));
        const factTipoValue = this.widgetModel.payments?.get("fact_tipo");
        if (factTipoValue) {
            this.options.exploracao.set("fact_tipo", factTipoValue);
            document.querySelector("span.js_fact_tipo").textContent = factTipoValue;
        }
    },
});
