Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.LicenseModalView = Backbone.SIXHIARA.ModalView.extend({

    customConfiguration: function() {

        // connect auxiliary views, which would be removed when the modal is closed
        var estadosLicencia = this.options.domains.byCategory('licencia_estado');

        var selectView = new Backbone.UILib.SelectView({
            el: this.$('#estado'),
            collection: estadosLicencia,
            cloneCollection: true,
        }).render();

        var consumoTipo = this.options.domains.byCategory('facturacao_consumo_tipo');
        new Backbone.UILib.SelectView({
            el: this.$('#consumo_tipo'),
            collection: consumoTipo,
        }).render();

        var self = this;
        this.$('#info-estado-licencia').on('click', function() {
            var tooltipView = new Backbone.SIXHIARA.ModalTooltipEstadoLicenciaView({
                collection: estadosLicencia,
                actual_state: self.model.get('estado'),
            }).show();
        });

        var tiposLicencia = this.options.domains.byCategory('licencia_tipo_lic');
        new Backbone.UILib.SelectView({
            el: this.$('#tipo_lic'),
            collection: tiposLicencia,
        }).render();

        this.listenTo(this.widgetModel, 'change:pago_mes', function() {
            var value = this.widgetModel.get('pago_mes');
            var widget = this.$('.modal').find('#pago_mes');
            widget.val(formatter().formatNumber(value));
        });
        this.listenTo(this.widgetModel, 'change:pago_iva', function() {
            var value = this.widgetModel.get('pago_iva');
            var widget = this.$('.modal').find('#pago_iva');
            widget.val(formatter().formatNumber(value));
        });
    },


    okButtonClicked: function(){
        if(this.isSomeWidgetInvalid()) return;
        var previousState = this.model.get('estado');
        Backbone.SIXHIARA.ModalView.prototype.okButtonClicked.call(this);
        
        // See #1685
        var actualState = this.model.get('estado');
        if (previousState != actualState) {
            this.options.exploracao.setLicState(actualState);
        }
    },

    isSomeWidgetInvalid: function () {
        // we only use Constraint API with input elements, so check only those
        var widgets = this.$('.modal').find('input.widget, input.widget-number, input.widget-date, select.widget');
        var someInvalid = false;
        widgets.each(function (index, widget) {
            if(!widget.validity.valid) {
                someInvalid = true;
            }
        });
        return someInvalid;
    },

});
