Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ViewFacturacao = Backbone.SIXHIARA.BaseProcesoView.extend({
    id: "view-facturacao",
    className: "myclass",
    template: _.template(`

    <h4 style="margin-top: 25px; margin-bottom: 0px">
        <span style="color:#00a2da"><%- exp_id + ' '%> <%- exp_name %></span> <span style="color: grey"><%= ' (' + (actividade && actividade.tipo || 'Não declarada') + ') ' %></span>
        <div class="licencias">
            <%- Backbone.SIXHIARA.formatter.formatTipoLicencias(licencias)[0] %> / <%- Backbone.SIXHIARA.formatter.formatTipoLicencias(licencias)[1] %>
            </div>
    </h4>

    <div id="toolbar" class="row" style="margin-bottom: 15px; margin-top: 15px">
        <div id="leftside-toolbar" class="col-xs-4">
            <div id="factura-header"></div>
        </div>
        <div id="rightside-toolbar" class="col-xs-8">
            <div id="bt-toolbar">
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
        </div>
    </div>

    <form id="view-facturacao-common-widgets" class="form-horizontal" style="margin-top: 10px">
        <fieldset class="uilib-enability uilib-enable-role-financieiro uilib-enable-role-administrador">
            <div class="row">

                <div class="col-xs-4">
                    <div class="form-group">
                        <label for="fact_tipo" class="control-label col-xs-7" style="text-align: left">Tipo de facturação</label>
                        <div class="col-xs-5">
                            <select id="fact_tipo" class="form-control widget" style="padding: 3px 3px; height: 25px" required>
                                <option value="Mensal">Mensal</option>
                                <option value="Trimestral">Trimestral</option>
                                <option value="Anual">Anual</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="col-xs-4">
                    <div class="form-group">
                        <label for="pago_lic" class="control-label col-xs-9" style="text-align: left">Pagamento emissão licença</label>
                        <div class="col-xs-3">
                            <select id="pago_lic" class="form-control widget-boolean" style="padding: 3px 5px; height: 25px" required>
                                <option value="true">Sim</option>
                                <option value="false">Não</option>
                            </select>
                        </div>
                    </div>
                </div>

            </div>
        </fieldset>
    </form>

    <div class="row panel-equal-height">

        <div id="facturacao-historico-view" class="col-xs-4" style="border-right: 1px solid #337ab7">
        </div>

        <div id="factura-view" class="col-xs-8">
        </div>

    </div>
    `),

    fetchIfNeeded: function() {
        if (this.model.fullLoaded) {
            return Promise.resolve();
        }

        document.body.classList.add("wait");

        let invoices = this.model.get("facturacao");
        let expPromise = invoices.fetch({
            parse: true,
            data: $.param({
                exploracao: this.model.id,
            }),
        });

        return expPromise.then(() => {
            this.model.fullLoaded = true;
            document.body.classList.remove("wait");
        });
    },

    render: function() {
        if (this.model.get("facturacao").isEmpty()) {
            this.$el.html(
                `<div style="margin-bottom: 10px; margin-top: 10px" class="alert alert-info">Não existem facturas para esta exploração</div>`
            );
            return this;
        }

        Backbone.SIXHIARA.BaseProcesoView.prototype.render.call(this);

        this.facturacaoHistoricoView = new Backbone.SIXHIARA.ViewFacturacaoHistorico({
            model: this.model.get("facturacao"),
        });

        this.facturaSelected = this.model.get("facturacao").at(0).id;
        this.facturaView = new Backbone.SIXHIARA.ViewFactura({
            model: this.model.get("facturacao").findWhere({id: this.facturaSelected}),
            exploracao: this.model,
        });
        this.facturaHeader = new Backbone.SIXHIARA.ViewFacturaHeader({
            model: this.model.get("facturacao").findWhere({id: this.facturaSelected}),
        });

        this.listenTo(this.model.get("facturacao"), "change", this.facturacaoUpdated);

        this.renderFacturacaoHistorico();
        this.renderFactura();

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
        if (this.model.get("facturacao").isEmpty()) {
            return;
        }
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
        let widgetsView = new Backbone.UILib.WidgetsView({
            el: document.getElementById("view-facturacao-common-widgets"),
            model: this.model,
        });
        this.addView(widgetsView.render());
        this.listenTo(
            this.model,
            "change:pago_lic change:fact_tipo",
            this.facturacaoUpdated
        );
    },

    facturacaoUpdated: function(changedModel) {
        this.autosave(this.model);
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
