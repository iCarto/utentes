Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ExpSizeBillingAlert = Backbone.View.extend({
    template: _.template(
        '<div class="alert alert-warning alert-system-middle-message ">' +
            '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
            "<%- infoMessage %>" +
            "</div>"
    ),

    initialize: function(options) {
        const evaluated_value = options.evaluated_value;
        const evaluated_value2 = options.evaluated_value2;
        // evaluated_value2 is only used for renewal processes
        route = options.route;
        route.on(
            "change:" + evaluated_value + " change:" + evaluated_value2,
            this.changeBillingType,
            this
        );
    },

    changeBillingType: function() {
        this.$el.removeClass("invisible");
        this.$el.addClass("visible");
        this.showAlert(
            this,
            "AVISO IMPORTANTE: você acaba de editar o consumo licenciado. Quando este valor é modificado, o sistema SIRHA actualiza automáticamente os campos TIPO DE FACTURAÇAO (Mensal/Anual/Trimestral) e TIPO DE CONSUMO (Fixo/Variável) com base no novo manual de procedimentos de facturação. \nPode editar novamente estes campos de forma manual se quiser aplicar outros critérios."
        );
    },

    showAlert: function(model, message) {
        $("#billing_info_change").html("");
        $("#billing_info_change").append(
            this.template({
                infoMessage: message,
            })
        );
    },
});
