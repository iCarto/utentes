Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ViewFactura = Backbone.View.extend({
    className: "view-facturacao",

    id: "edit-facturacao-modal",
    template: _.template(`
    <div class="row panel-equal-height">
        <div class="col-xs-6">
            <div id="lic-sub" class="panel panel-info panel-disabled">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>Licença subterrânea</strong></h3>
                </div>
                <div class="panel-body row">
                    <div class="form-group col-xs-12">
                        <label for="consumo_tipo_sub"><strong>Tipo de consumo</strong></label>
                        <select class="form-control widget" id="consumo_tipo_sub" disabled >
                            <option>Fixo</option>
                            <option>Variável</option>
                        </select>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="c_licencia_sub">Consumo licenciado&nbsp;<i class="units">(m<sup>3</sup>/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="c_licencia_sub" pattern="[0-9]{1,8}([,][0-9]{1,2})?" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="consumo_fact_sub">Consumo facturado&nbsp;<i class="units">(m<sup>3</sup>/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="consumo_fact_sub" pattern="[0-9]{1,8}([,][0-9]{1,2})?" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="taxa_fixa_sub">Taxa fixa&nbsp;<i class="units">(MT/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="taxa_fixa_sub" pattern="[0-9]{1,8}([,][0-9]{1,2})?" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="taxa_uso_sub">Taxa de uso&nbsp;<i class="units">(MT/m<sup>3</sup>)</i></label>
                        <input type="text" class="form-control widget-number" id="taxa_uso_sub" pattern="[0-9]{1,8}([,][0-9]{1,2})?" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="pago_mes_sub">Valor pago&nbsp;<i class="units js-change-mes">(MT/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="pago_mes_sub" pattern="[0-9]{1,8}([,][0-9]{1,2})?" disabled>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xs-6">
            <div id="lic-sup" class="panel panel-info panel-disabled">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>Licença superficial</strong></h3>
                </div>
                <div class="panel-body row">
                    <div class="form-group col-xs-12">
                        <label for="consumo_tipo_sup"><strong>Tipo de consumo</strong></label>
                        <select class="form-control widget" id="consumo_tipo_sup" disabled>
                            <option>Fixo</option>
                            <option>Variável</option>
                        </select>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="c_licencia_sup">Consumo licenciado&nbsp;<i class="units">(m<sup>3</sup>/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="c_licencia_sup" pattern="[0-9]{1,8}([,][0-9]{1,2})?" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="consumo_fact_sup">Consumo facturado&nbsp;<i class="units">(m<sup>3</sup>/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="consumo_fact_sup" pattern="[0-9]{1,8}([,][0-9]{1,2})?" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="taxa_fixa_sup">Taxa fixa&nbsp;<i class="units">(MT/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="taxa_fixa_sup" pattern="[0-9]{1,8}([,][0-9]{1,2})?" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="taxa_uso_sup">Taxa de uso&nbsp;<i class="units">(MT/m<sup>3</sup>)</i></label>
                        <input type="text" class="form-control widget-number" id="taxa_uso_sup" pattern="[0-9]{1,8}([,][0-9]{1,2})?" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="pago_mes_sup">Valor pago&nbsp;<i class="units js-change-mes">(MT/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="pago_mes_sup" pattern="[0-9]{1,8}([,][0-9]{1,2})?" disabled>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row panel-equal-height">
        <div class="col-xs-6">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>Facturação</strong></h3>
                </div>
                <div class="panel-body row">
                    <div class="form-group col-xs-3" style="padding: 0px 5px;">
                        <label for="iva">IVA&nbsp;<i class="units">(%)</i></label>
                        <input type="text"
                               class="form-control widget-number"
                               id="iva"
                               pattern="[0-9]{1,8}([,][0-9]{1,2})?"
                               style="padding: 6px 6px;"
                               disabled
                        >
                    </div>

                    <div class="form-group col-xs-3" style="padding: 0px 5px;">
                        <label for="juros">Multa&nbsp;<i class="units">(%)</i></label>
                        <input type="text"
                               class="form-control widget-number"
                               id="juros"
                               pattern="[0-9]{1,8}([,][0-9]{1,2})?"
                               style="padding: 6px 6px;"
                               disabled
                        >
                    </div>

                    <div class="form-group col-xs-6" style="padding: 0px 5px;">
                        <label for="pago_iva">Valor <i class="units js-change-mes">(MT/mês)</i></label>
                        <input type="text"
                               class="form-control widget-number"
                               id="pago_iva"
                               pattern="[0-9]{1,8}([,][0-9]{1,2})?"
                               disabled
                        >
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xs-6 panel-observacio">
            <div class="form-group">
                <label for="observacio">
                    <div style="display:inline-block; width: 24%">
                        Observações
                    </div>
                    <div id="js-btns-next">
                        <!-- TODO. Los "siguientes estados" disponibles no deberían estar harcodeados en el html
                        o bien, todos los botones deberían ser generados en otra parte, o de los dominios se deberían decidir que botones
                        se pueden usar en el modo combo o algo así
                        -->
                        <button id="bt-diferida" type="button" class="btn btn-default btn-sm">Diferida</button>
                        <button id="bt-factura" type="button" class="btn btn-sm btn-primary">Factura</button>
                        <button id="bt-recibo" type="button" class="btn btn-sm btn-primary">Recibo</button>
                    </div>
                </label>
                <textarea id="observacio" class="form-control"><%- observacio.slice(-1)[0].text %></textarea>
            </div>
        </div>

    </div>
    `),

    events: {
        "click #bt-diferida": "_changeStateToPdteFactura",
        "click #bt-factura": "_printFactura",
        "click #bt-recibo": "_printRecibo",
    },

    alwaysDisabledWidgets: ["c_licencia_sup", "c_licencia_sup"],
    alwaysDisabledAndAutoWidgets: ["pago_mes_sup", "pago_mes_sub", "pago_iva"],
    conditionallyDisabledWidgets: [
        "consumo_tipo_sup",
        "consumo_tipo_sub",
        "consumo_fact_sup",
        "consumo_fact_sub",
        "taxa_fixa_sup",
        "taxa_fixa_sub",
        "taxa_uso_sup",
        "taxa_uso_sub",
        "iva",
        "juros",
    ],

    initialize: function(options) {
        this.options = options || {};
        this.options.tiposLicencia = this.options.exploracao
            .get("licencias")
            .filter(l => l.isInvoizable())
            .map(l => l.getSafeTipoAgua());
        this._setListeners();
    },

    _setListeners: function() {
        this.listenTo(
            this.model,
            "change:iva change:juros change:observacio change:taxa_fixa_sub change:taxa_uso_sub change:consumo_fact_sub change:taxa_fixa_sup change:taxa_uso_sup change:consumo_fact_sup",
            this._modelChanged
        );
        this.listenTo(this.model, "change:fact_estado", this._estadoChanged);
    },

    _initFactPeriod: function() {
        let text = undefined;
        switch (this.model.get("fact_tipo")) {
            case "Mensal":
                text = "mês";
                break;
            case "Trimestral":
                text = "trimestre";
                break;
            case "Anual":
                text = "ano";
                break;
        }
        let changeMesWidgets = document.getElementsByClassName("js-change-mes");
        for (e of changeMesWidgets) {
            e.innerText = `(MT/${text})`;
        }
    },

    _modelChanged: function() {
        this._enableBts();
    },

    _estadoChanged: function() {
        this.updateWidgets();
    },

    render: function() {
        var json = this.model.toJSON();
        this.$el.html(this.template(json));
        this.widgetsView && this.widgetsView.remove();
        this.widgetsView = new Backbone.UILib.WidgetsView({
            el: this.$el,
            model: this.model,
            auto: [
                {
                    id: "pago_mes_sup",
                    formatter: x => formatter().formatNumber(x, "0[.]00"),
                },
                {
                    id: "pago_mes_sub",
                    formatter: x => formatter().formatNumber(x, "0[.]00"),
                },
                {
                    id: "pago_iva",
                    formatter: x => formatter().formatNumber(x, "0[.]00"),
                },
            ],
        }).render();
        return this;
    },

    updateModel: function(newModel) {
        this.model = newModel;
        this.render();
        this.updateWidgets();
        this._setListeners();
    },

    updateWidgets: function() {
        const self = this;
        this._defineWidgetsToBeUsed(); // sets this.widgets
        this.widgets.forEach(function(w) {
            var input = this.$("#edit-facturacao-modal #" + w);
            input.prop("disabled", false);
            input.prop("required", true);
            input.on("input", self._enableBts.bind(self));
        });
        this.$("#observacio").on("input", this._observacioUpdated.bind(self));
        this._enableBts();
        iAuth.disabledWidgets();
        this._initFactPeriod();
    },

    _observacioUpdated: function(evt) {
        var currentComment = this.model.get("observacio").slice(-1)[0];
        Object.assign(currentComment, {
            created_at: new Date(),
            autor: iAuth.getUser(),
            text: evt.currentTarget.value,
            state: this.model.get("fact_estado"),
        });
        this.model.trigger("change", this.model);
    },

    _updateToState: function(state) {
        if (wf.isFacturacaoNewStateValid(this.model.get("fact_estado"), state)) {
            this._createNewObseracio();
            this.model.set("fact_estado", state);
        }
    },

    _createNewObseracio: function() {
        this.model.get("observacio").push({
            created_at: null,
            autor: null,
            text: null,
            state: null,
        });
        this.$("#observacio").val("");
    },

    _changeStateToPdteFactura: function() {
        var self = this;
        bootbox.confirm(
            `A factura vai mudar o seu estado a: <br> <strong>${window.SIRHA.ESTADO_FACT.PENDING_INVOICE}</strong>`,
            function(result) {
                if (result) {
                    self._updateToState(window.SIRHA.ESTADO_FACT.PENDING_INVOICE);
                }
            }
        );
    },

    _printFactura: function(e) {
        e.preventDefault();
        e.stopPropagation();
        var self = this;
        const invoiceData = this.options.exploracao.toJSON();
        invoiceData.factura = this.model.toJSON();
        SIRHA.Services.PrintService.factura(invoiceData)
            .then(function(data) {
                self.model.set("fact_id", data.numFactura);
                self.model.set("fact_date", data.dateFactura_);
                var nextState = window.SIRHA.ESTADO_FACT.PENDING_PAYMENT;
                if (nextState !== self.model.get("fact_estado")) {
                    self._updateToState(nextState);
                }
            })
            .catch(function(error) {
                console.log(error);
                bootbox.alert({
                    title: "Erro ao imprimir factura",
                    message: error,
                });
            });
    },

    _printRecibo: function(e) {
        e.preventDefault();
        e.stopPropagation();
        var self = this;
        const invoiceData = this.options.exploracao.toJSON();
        invoiceData.factura = this.model.toJSON();
        SIRHA.Services.PrintService.recibo(invoiceData)
            .then(function(data) {
                self.model.set("recibo_id", data.numRecibo);
                self.model.set("recibo_date", data.dateRecibo_);
                var nextState = window.SIRHA.ESTADO_FACT.PAID;
                if (nextState !== self.model.get("fact_estado")) {
                    self._updateToState(nextState);
                }
            })
            .catch(function(error) {
                console.log(error);
                bootbox.alert({
                    title: "Erro ao imprimir recibo",
                    message: error,
                });
            });
    },

    _defineWidgetsToBeUsed: function() {
        // TODO. En lugar de fijar las variables tiene sentido quitarlos del html diractamente?
        for (let widget of [
            ...this.alwaysDisabledWidgets,
            ...this.alwaysDisabledAndAutoWidgets,
            ...this.conditionallyDisabledWidgets,
        ]) {
            document.querySelector(`#edit-facturacao-modal #${widget}`).disabled = true;
        }

        // _defineWidgetsToBeUsed
        this.widgets = [];
        let licenseWidgets = [];
        let self = this;

        if (
            iAuth.isObservador() ||
            (iAuth.isDivisao() &&
                iAuth.getDivisao() !== this.options.exploracao.get("loc_divisao"))
        ) {
            // un observador o División (diferente a la de la explotación) no puede editar ningún campo
            return;
        } else if (
            iAuth.hasRoleTecnico() ||
            (iAuth.isDivisao() &&
                iAuth.getDivisao() === this.options.exploracao.get("loc_divisao"))
        ) {
            // DRH o División (en la que se encuentra la explotación)
            if (
                this.model.get("fact_estado") ==
                window.SIRHA.ESTADO_FACT.PENDING_CONSUMPTION
            ) {
                licenseWidgets = [];
                if (this.model.get("consumo_tipo_sub") == "Variável") {
                    licenseWidgets.push("consumo_fact_sub");
                }
                if (this.model.get("consumo_tipo_sup") == "Variável") {
                    licenseWidgets.push("consumo_fact_sup");
                }
            }
        } else if (iAuth.isAdmin()) {
            // Admin
            licenseWidgets = [...this.conditionallyDisabledWidgets];
        } else {
            // DSU-Facturação
            if (
                this.model.get("fact_estado") ==
                window.SIRHA.ESTADO_FACT.PENDING_CONSUMPTION
            ) {
                licenseWidgets = [];
            } else {
                licenseWidgets = [...this.conditionallyDisabledWidgets];
            }
        }

        // pero nadie puede editar los tipos de consumo a menos que se trate de la última factura, por tanto, si no es el caso, los eliminamos de la lista
        if (this.model.id != this.options.exploracao.get("facturacao").at(0).id) {
            if (licenseWidgets.includes("consumo_tipo_sup")) {
                licenseWidgets.splice(licenseWidgets.indexOf("consumo_tipo_sup"), 1);
            }
            if (licenseWidgets.includes("consumo_tipo_sub")) {
                licenseWidgets.splice(licenseWidgets.indexOf("consumo_tipo_sub"), 1);
            }
        }

        this.options.tiposLicencia.forEach(function(tipo) {
            this.$("#lic-" + tipo).removeClass("panel-disabled");
            licenseWidgets.forEach(function(w) {
                if (w.endsWith(tipo) || ["iva", "juros"].includes(w)) {
                    self.widgets.push(w);
                }
            });
        });
    },

    _enableBts: function() {
        const enable = this._widgetsAreValid();
        this._enableBtsBasedOnRolesAndState(enable);
    },

    _widgetsAreValid: function() {
        const enable = this.widgets.every(function(w) {
            var input = this.$("#edit-facturacao-modal #" + w)[0];
            var e = input.value === 0 || input.value.trim();
            e = e && input.validity.valid;
            return e;
        });
        return enable;
    },

    _enableBtsBasedOnRolesAndState(enable) {
        this.$("#bt-diferida").hide();
        this.$("#bt-factura").hide();
        this.$("#bt-recibo").hide();

        if (
            iAuth.isObservador() ||
            (iAuth.isDivisao() &&
                iAuth.getDivisao() !== this.options.exploracao.get("loc_divisao"))
        ) {
            // Observador y división diferente a la de la explotación no visualizan ni pueden pulsar nigún botón.
            return;
        } else if (
            iAuth.hasRoleTecnico() ||
            (iAuth.isDivisao() &&
                iAuth.getDivisao() === this.options.exploracao.get("loc_divisao"))
        ) {
            // DRH y división en la que se encuentra la explotación
            if (
                this.model.get("fact_estado") ==
                window.SIRHA.ESTADO_FACT.PENDING_CONSUMPTION
            ) {
                this.$("#bt-diferida")
                    .attr("disabled", !enable)
                    .show();
            }
            return;
        } else if (iAuth.isAdmin()) {
            // Admin
            if (
                this.model.get("fact_estado") ==
                window.SIRHA.ESTADO_FACT.PENDING_CONSUMPTION
            ) {
                this.$("#bt-diferida")
                    .attr("disabled", !enable)
                    .show();
            } else {
                this.$("#bt-diferida").hide();
                this.$("#bt-factura")
                    .attr("disabled", !enable)
                    .show();
                this.$("#bt-recibo")
                    .attr("disabled", !this._isReciboBtnEnabled() || !enable)
                    .show();
            }
        } else {
            // DSU-Facturação
            if (
                this.model.get("fact_estado") !==
                window.SIRHA.ESTADO_FACT.PENDING_CONSUMPTION
            ) {
                this.$("#bt-diferida").hide();
                this.$("#bt-factura")
                    .attr("disabled", !enable)
                    .show();
                this.$("#bt-recibo")
                    .attr("disabled", !this._isReciboBtnEnabled() || !enable)
                    .show();
            }
        }
    },

    _isReciboBtnEnabled() {
        return (
            this.model.get("fact_estado") != window.SIRHA.ESTADO_FACT.PENDING_INVOICE
        );
    },
});
