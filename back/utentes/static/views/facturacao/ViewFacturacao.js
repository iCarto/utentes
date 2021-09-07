Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ViewFacturacao = Backbone.SIXHIARA.BaseProcesoView.extend({
    id: "view-facturacao",
    template: _.template(`
    <div id="bt-toolbar" class="row" style="margin-bottom: 10px; margin-top: 10px">
        <div class="col-xs-12">
            <div class="btn-group btn-group-justified" role="group">
                <div class="btn-group" role="group">
                    <button id="file-modal" class="btn btn-default" role="button">Documentação</button>
                </div>
                <div class="btn-group" role="group">
                    <a id="bt-ficha" class="btn btn-default" role="button" href="/exploracao-show.html?id=<%- id %>">Ficha</a>
                </div>
                <div class="btn-group uilib-enability uilib-hide-role-observador" role="group">
                    <button id="bt-emision" type="button" class="btn btn-default" disabled>Factura&nbsp;(emissão licença)</button>
                </div>
            </div>
        </div>
    </div>


<h4 style="margin-bottom: 10px;">
    <span style="color:#00a2da"><%- exp_id + ' '%> <%- exp_name %></span> <span style="color: grey"><%= ' (' + (actividade && actividade.tipo || 'Não declarada') + ') ' %></span>
    <div class="licencias">
        <%- Backbone.SIXHIARA.formatter.formatTipoLicencias(licencias)[0] %> / <%- Backbone.SIXHIARA.formatter.formatTipoLicencias(licencias)[1] %>
    </div>
</h4>

    <div class="row form-horizontal" style="margin-top: 10px">

        <div id="factura-header" class="col-xs-4">
        </div>

        <div class="col-xs-4">
            <div class="form-group" style="margin-left: 0px; margin-right: 0px">
                <label for="pago_lic" class="control-label col-xs-9" style="text-align: left">Pagamento emissão licença</label>
                <div class="col-xs-3" style="padding-left: 10px; padding-right: 10px;">
                    <select id="pago_lic" class="form-control" style="padding: 3px 5px;" disabled>
                        <option value="true">Sim</option>
                        <option value="false">Não</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="col-xs-4">
            <div class="form-group" style="margin-left: 0px; margin-right: 0px">
                <label for="fact_tipo" class="control-label col-xs-7" style="text-align: left">Tipo de facturação</label>
                <div class="col-xs-5" style="padding-left: 10px; padding-right: 10px;">
                    <select id="fact_tipo" class="form-control" style="padding: 3px 3px;" disabled>
                        <option value="Mensal">Mensal</option>
                        <option value="Trimestral">Trimestral</option>
                        <option value="Anual">Anual</option>
                    </select>
                </div>
            </div>
        </div>

    </div>

    <div class="row panel-equal-height">

        <div id="facturacao-historico-view" class="col-xs-4" style="border-right: 1px solid #337ab7">
        </div>

        <div id="factura-view" class="col-xs-8">
        </div>

    </div>
    `),

    initialize: function(options) {
        Backbone.SIXHIARA.BaseProcesoView.prototype.initialize.call(this);

        var tiposLicencia = [];
        this.model.get("licencias").forEach(function(lic) {
            var tipo = lic
                .get("tipo_agua")
                .substring(0, 3)
                .toLowerCase();
            tiposLicencia.push(tipo);
        });

        this.facturacaoHistoricoView = new Backbone.SIXHIARA.ViewFacturacaoHistorico({
            model: this.model.get("facturacao"),
        });

        this.facturaSelected = this.model.get("facturacao").at(0).id;
        this.facturaView = new Backbone.SIXHIARA.ViewFactura({
            model: this.model.get("facturacao").findWhere({id: this.facturaSelected}),
            tiposLicencia: tiposLicencia,
            exploracao: this.model,
        });
        this.facturaHeader = new Backbone.SIXHIARA.ViewFacturaHeader({
            model: this.model.get("facturacao").findWhere({id: this.facturaSelected}),
        });

        this.listenTo(this.model, "change:fact_estado", this.estadoUpdated);
        this.listenTo(this.model.get("facturacao"), "change", this.facturacaoUpdated);
    },

    render: function() {
        Backbone.SIXHIARA.BaseProcesoView.prototype.render.call(this);

        this.renderFacturacaoHistorico();
        this.renderFactura();

        var json = this.model.toJSON();
        this.$el.find("#fact_tipo").val(json.fact_tipo);
        this.$el.find("#pago_lic").val(json.pago_lic + "");

        return this;
    },

    renderFacturacaoHistorico: function() {
        this.$el
            .find("#facturacao-historico-view")
            .empty()
            .append(this.facturacaoHistoricoView.render().el);
    },

    renderFactura: function(event) {
        if (event) {
            event.preventDefault();
        }
        this.$el
            .find("#factura-view")
            .empty()
            .append(this.facturaView.render().el);
        this.$el
            .find("#factura-header")
            .empty()
            .append(this.facturaHeader.render().el);
    },

    init: function() {
        Backbone.SIXHIARA.BaseProcesoView.prototype.init.call(this);

        self = this;

        this.facturaView.updateWidgets();
        this.facturacaoHistoricoView.setSelected(this.facturaSelected);
        this.facturacaoHistoricoView.on("factura-selected", function(id) {
            self.facturaSelected = id;
            self.facturaView.updateModel(self.model.get("facturacao").findWhere({id}));
            self.facturaHeader.updateModel(
                self.model.get("facturacao").findWhere({id})
            );
        });

        this.updateWidgets();
    },

    updateWidgets: function() {
        this.defineWidgetsToBeUsed();
        this.enabledWidgets();
    },

    defineWidgetsToBeUsed: function() {
        if (iAuth.hasRoleObservador() || iAuth.hasRoleTecnico()) {
            this.widgets = [];
        } else {
            this.widgets = ["pago_lic", "fact_tipo"];
        }
    },

    enabledWidgets: function() {
        var self = this;
        this.widgets.forEach(function(w) {
            var input = this.$("#view-facturacao #" + w);
            input.prop("disabled", false);
            input.prop("required", true);
            input.on("input", self.facturacaoFormFieldsUpdated.bind(self));
        });
    },

    facturacaoFormFieldsUpdated: function(evt) {
        var target = evt.currentTarget;
        if (target.validity.valid) {
            var modifiedAttributes = {};
            if (target.nodeName == "INPUT") {
                modifiedAttributes[target.id] = formatter().unformatNumber(
                    target.value
                );
            } else if (target.nodeName == "SELECT") {
                modifiedAttributes[target.id] = target.value;
            }
            this.model.set(modifiedAttributes);
            this.facturacaoUpdated(this.model);
        }
    },

    facturacaoUpdated: function(changedModel) {
        this.autosave(this.model);
    },

    estadoUpdated: function() {
        var self = this;
        if (
            iAuth.hasRoleTecnico() &&
            this.model.get("fact_estado") != window.SIRHA.ESTADO_FACT.PENDING_M3
        ) {
            bootbox.alert(
                `A exploração&nbsp;<strong>${this.model.get(
                    "exp_id"
                )} - ${this.model.get(
                    "exp_name"
                )}</strong>&nbsp;não tem mais facturas pendentes de acrescentar consumo.`,
                function() {
                    self.model.trigger("show-next-exp", self.model);
                }
            );
        } else if (this.model.get("fact_estado") == window.SIRHA.ESTADO_FACT.PAID) {
            bootbox.alert(
                `A exploração&nbsp;<strong>${this.model.get(
                    "exp_id"
                )} - ${this.model.get(
                    "exp_name"
                )}</strong>&nbsp;tem todas as facturas pagas.`,
                function() {
                    self.model.trigger("show-next-exp", self.model);
                }
            );
        }
    },

    fillExploracao: function(autosave) {
        this.model.urlRoot = Backbone.SIXHIARA.Config.apiFacturacaoExploracao;
        this.model.save(null, {
            validate: false,
            wait: true,
            parse: true,
            success: function() {
                if (autosave) {
                    console.log("autosaving");
                }
            },
            error: function() {
                bootbox.alert(
                    '<span style="color: red;">Produziu-se um erro. Informe ao administrador.</strong>'
                );
            },
        });
    },
});
