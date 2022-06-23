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

        this.listenTo(this.widgetModel, "change:pago_mes", function() {
            var value = this.widgetModel.get("pago_mes");
            var widget = this.$(".modal").find("#pago_mes");
            widget.val(formatter().formatNumber(value));
        });
        this.listenTo(this.widgetModel, "change:pago_iva", function() {
            var value = this.widgetModel.get("pago_iva");
            var widget = this.$(".modal").find("#pago_iva");
            widget.val(formatter().formatNumber(value));
        });
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
    },
});
