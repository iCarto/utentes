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
                        <select class="form-control" id="consumo_tipo_sub" disabled >
                            <option>Fixo</option>
                            <option>Variável</option>
                        </select>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="c_licencia_sub">Consumo licenciado&nbsp;<i class="units">(m<sup>3</sup>/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="c_licencia_sub" pattern="[0-9]{1,8}([,][0-9]{1,2})?" value="<%- formatter().formatNumber(c_licencia_sub, '0[.]00') %>" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="consumo_fact_sub">Consumo facturado&nbsp;<i class="units">(m<sup>3</sup>/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="consumo_fact_sub" pattern="[0-9]{1,8}([,][0-9]{1,2})?" value="<%- formatter().formatNumber(consumo_fact_sub, '0[.]00') %>" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="taxa_fixa_sub">Taxa fixa&nbsp;<i class="units">(MT/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="taxa_fixa_sub" pattern="[0-9]{1,8}([,][0-9]{1,2})?" value="<%- formatter().formatNumber(taxa_fixa_sub, '0[.]00') %>" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="taxa_uso_sub">Taxa de uso&nbsp;<i class="units">(MT/m<sup>3</sup>)</i></label>
                        <input type="text" class="form-control widget-number" id="taxa_uso_sub" pattern="[0-9]{1,8}([,][0-9]{1,2})?" value="<%- formatter().formatNumber(taxa_uso_sub, '0[.]00') %>" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="pago_mes_sub">Valor pago&nbsp;<i class="units js-change-mes">(MT/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="pago_mes_sub" pattern="[0-9]{1,8}([,][0-9]{1,2})?" value="<%- formatter().formatNumber(pago_mes_sub, '0[.]00') %>" disabled>
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
                        <select class="form-control" id="consumo_tipo_sup" disabled>
                            <option>Fixo</option>
                            <option>Variável</option>
                        </select>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="c_licencia_sup">Consumo licenciado&nbsp;<i class="units">(m<sup>3</sup>/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="c_licencia_sup" pattern="[0-9]{1,8}([,][0-9]{1,2})?" value="<%- formatter().formatNumber(c_licencia_sup, '0[.]00') %>" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="consumo_fact_sup">Consumo facturado&nbsp;<i class="units">(m<sup>3</sup>/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="consumo_fact_sup" pattern="[0-9]{1,8}([,][0-9]{1,2})?" value="<%- formatter().formatNumber(consumo_fact_sup, '0[.]00') %>" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="taxa_fixa_sup">Taxa fixa&nbsp;<i class="units">(MT/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="taxa_fixa_sup" pattern="[0-9]{1,8}([,][0-9]{1,2})?" value="<%- formatter().formatNumber(taxa_fixa_sup, '0[.]00') %>" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="taxa_uso_sup">Taxa de uso&nbsp;<i class="units">(MT/m<sup>3</sup>)</i></label>
                        <input type="text" class="form-control widget-number" id="taxa_uso_sup" pattern="[0-9]{1,8}([,][0-9]{1,2})?" value="<%- formatter().formatNumber(taxa_uso_sup, '0[.]00') %>" disabled>
                    </div>

                    <div class="form-group col-xs-12">
                        <label for="pago_mes_sup">Valor pago&nbsp;<i class="units js-change-mes">(MT/mês)</i></label>
                        <input type="text" class="form-control widget-number" id="pago_mes_sup" pattern="[0-9]{1,8}([,][0-9]{1,2})?" disabled value="<%- formatter().formatNumber(pago_mes_sup, '0[.]00') %>" disabled>
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
                               value="<%- formatter().formatNumber(iva, '0[.]00') %>"
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
                               value="<%- formatter().formatNumber(juros, '0[.]00') %>"
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
                               value="<%- formatter().formatNumber(pago_iva, '0[.]00') %>"
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
                <textarea id="observacio" class="form-control widget"><%- observacio.slice(-1)[0].text %></textarea>
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
        this._updatePagoIva();
        this._enableBts();
        this._initFactPeriod();
    },

    _updatePagoIva: function() {
        this._updatePagoMesLicencia("sup");
        this._updatePagoMesLicencia("sub");
        var pago_mes_sup =
            formatter().unformatNumber(document.getElementById("pago_mes_sup").value) ||
            0;
        var pago_mes_sub =
            formatter().unformatNumber(document.getElementById("pago_mes_sub").value) ||
            0;

        var juros =
            formatter().unformatNumber(document.getElementById("juros").value) || 0;
        var iva = formatter().unformatNumber(document.getElementById("iva").value) || 0;
        var pago_iva =
            (pago_mes_sup + pago_mes_sub) * (1 + iva / 100) * (1 + juros / 100);
        this.model.set({pago_iva: pago_iva});
        document.getElementById("pago_iva").value = formatter().formatNumber(
            pago_iva,
            "0[.]00"
        );
    },

    _updatePagoMesLicencia: function(lic) {
        var taxa_fixa = formatter().unformatNumber(
            document.getElementById("taxa_fixa_" + lic).value
        );
        var taxa_uso = formatter().unformatNumber(
            document.getElementById("taxa_uso_" + lic).value
        );
        var consumo_fact = formatter().unformatNumber(
            document.getElementById("consumo_fact_" + lic).value
        );
        var pago_mes = (taxa_fixa + taxa_uso * consumo_fact) * this._monthFactor();
        var iva = formatter().unformatNumber(document.getElementById("iva").value) || 0;
        var pago_mes_iva = pago_mes * (1 + iva / 100);
        this.model.set("pago_mes_" + lic, pago_mes);
        this.model.set("pago_iva_" + lic, pago_mes_iva);
        this.model.set("iva_" + lic, iva);
        document.getElementById("pago_mes_" + lic).value = formatter().formatNumber(
            pago_mes,
            "0[.]00"
        );
    },

    _estadoChanged: function() {
        this.updateWidgets();
    },

    render: function() {
        var json = this.model.toJSON();
        this.$el.html(this.template(json));
        return this;
    },

    updateModel: function(newModel) {
        this.model = newModel;
        this.render();
        this.updateWidgets();
        this._setListeners();
    },

    updateWidgets: function() {
        this._defineWidgetsToBeUsed();
        this._enableBts();
        iAuth.disabledWidgets();
        this._setWidgetsValue();
        this._initFactPeriod();
    },

    _setWidgetsValue: function() {
        this.$("#consumo_tipo_sub").val(this.model.get("consumo_tipo_sub"));
        this.$("#consumo_tipo_sup").val(this.model.get("consumo_tipo_sup"));
    },

    _facturaUpdated: function(evt) {
        var target = evt.currentTarget;
        if (target.validity.valid) {
            var modifiedAttributes = {};
            var trigger = false;
            if (target.nodeName == "INPUT") {
                modifiedAttributes[target.id] = formatter().unformatNumber(
                    target.value
                );
            } else if (target.nodeName == "SELECT") {
                modifiedAttributes[target.id] = target.value;
            }
            this.model.set(modifiedAttributes);
        }
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

    _monthFactor: function() {
        let months = this._monthFactorForLastInvoice();
        if (this._validMonthFactor(months)) {
            return months;
        }

        months = this._monthFactorForDateEmissao();
        if (this._validMonthFactor()) {
            return months;
        }

        months = this._monthFactorForCreatedAt();
        if (this._validMonthFactor(months)) {
            return months;
        }

        return this._monthFactorForDefault();
    },

    _validMonthFactor: function(months) {
        if (months > 0 && months <= this._monthFactorForDefault()) {
            return true;
        }
        return false;
    },

    _monthFactorForLastInvoice: function() {
        let invoices = this.options.exploracao.get("facturacao").sortBy("created_at");
        let thisId = this.model.id;
        let thisIdx = invoices.findIndex(i => i.id === thisId);
        if (thisIdx <= 0) {
            return undefined;
        }
        let thatInvoice = invoices[thisIdx - 1];
        return this._diffMonths(
            this.model.get("created_at"),
            thatInvoice.get("created_at")
        );
    },

    _monthFactorForDateEmissao: function() {
        let lics = this.options.exploracao.get("licencias");
        let d_emissaos = lics.pluck("d_emissao");
        let d_emissao = _.find(d_emissaos, d => d);
        if (!d_emissao) {
            return undefined;
        }
        let months = this._diffMonths(this.model.get("created_at"), d_emissao);
    },

    _monthFactorForCreatedAt: function() {
        let created_at = this.options.exploracao.get("created_at");
        return this._diffMonths(this.model.get("created_at"), created_at);
    },

    _monthFactorForDefault: function() {
        switch (this.model.get("fact_tipo")) {
            case "Mensal":
                return 1;
            case "Trimestral":
                return 3;
            case "Anual":
                return 12;
        }
    },

    _diffMonths: function(biggerDate, date) {
        let thisCreatedAt = moment(biggerDate);
        let thatCreatedAt = moment(date);
        // We only care about year and month
        // let months = thisCreatedAt.diff(thatCreatedAt, "months");
        let months =
            (thisCreatedAt.year() - thatCreatedAt.year()) * 12 +
            (thisCreatedAt.month() - thatCreatedAt.month());
        if (months <= 0) {
            console.log("No debería pasar nunca");
        }
        return months;
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
            // un observador o División (de una división  que no le corresponde) no
            // puede editar ningún campo
            return;
        } else if (
            iAuth.hasRoleTecnico() ||
            (iAuth.isDivisao() &&
                iAuth.getDivisao() === this.options.exploracao.get("loc_divisao"))
        ) {
            // Un técnico o División (de la división que le corresponde) puede editar el
            // consumo para subterraneas, variables
            if (
                this.model.get("fact_estado") ==
                    window.SIRHA.ESTADO_FACT.PENDING_CONSUMPTION &&
                this.options.tiposLicencia.includes("sub") &&
                this.model.get("consumo_tipo_sub") == "Variável"
            ) {
                licenseWidgets = ["consumo_fact_sub"];
            }
        } else {
            // Administrador y DSU-F
            if (
                this.model.get("fact_estado") ==
                window.SIRHA.ESTADO_FACT.PENDING_CONSUMPTION
            ) {
                if (
                    this.options.tiposLicencia.includes("sup") &&
                    this.model.get("consumo_tipo_sup") == "Variável"
                ) {
                    licenseWidgets = ["consumo_fact_sup"];
                } else {
                    licenseWidgets = [];
                }
            } else {
                licenseWidgets = [
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
                ];
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
                if (w.endsWith(tipo)) {
                    self.widgets.push(w);
                }
            });
        });

        // _enabledWidgets

        this.widgets.forEach(function(w) {
            var input = this.$("#edit-facturacao-modal #" + w);
            input.prop("disabled", false);
            input.prop("required", true);
            input.on("input", self._facturaUpdated.bind(self));
            input.on("input", self._enableBts.bind(self));
        });
        this.$("#observacio").on("input", this._observacioUpdated.bind(self));
    },

    _enableBts: function() {
        var enable = this.widgets.every(function(w) {
            var input = this.$("#edit-facturacao-modal #" + w)[0];
            var e = input.value === 0 || input.value.trim();
            e = e && input.validity.valid;
            return e;
        });

        this.$("#bt-diferida").hide();
        this.$("#bt-factura").hide();
        this.$("#bt-recibo").hide();

        if (
            iAuth.isObservador() ||
            (iAuth.isDivisao() &&
                iAuth.getDivisao() !== this.options.exploracao.get("loc_divisao"))
        ) {
            return;
        }

        if (
            iAuth.hasRoleTecnico() ||
            (iAuth.isDivisao() &&
                iAuth.getDivisao() === this.options.exploracao.get("loc_divisao"))
        ) {
            if (
                this.model.get("fact_estado") ==
                    window.SIRHA.ESTADO_FACT.PENDING_CONSUMPTION &&
                this.options.tiposLicencia.includes("sub") &&
                this.model.get("consumo_tipo_sub") == "Variável"
            ) {
                this.$("#bt-diferida")
                    .attr("disabled", !enable)
                    .show();
            }
            return;
        }

        // Administrador y DSU-F
        if (
            this.model.get("fact_estado") ==
                window.SIRHA.ESTADO_FACT.PENDING_CONSUMPTION &&
            this.options.tiposLicencia.includes("sup") &&
            this.model.get("consumo_tipo_sup") == "Variável"
        ) {
            this.$("#bt-diferida")
                .attr("disabled", !enable)
                .show();
            return;
        }

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
    },

    _isReciboBtnEnabled() {
        return (
            this.model.get("fact_estado") != window.SIRHA.ESTADO_FACT.PENDING_INVOICE
        );
    },
});
