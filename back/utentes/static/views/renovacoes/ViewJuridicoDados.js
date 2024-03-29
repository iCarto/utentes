Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ViewJuridicoDados = Backbone.SIXHIARA.View1.extend({
    events: {
        "click #bt-imprimir-licencia": "printLicense",
    },

    templateHistorico: _.template(`
        <% for (var i=0; i < renovacao.length ; i+=1) {
            print('<li><strong>' + renovacao[i].tipo_agua + '</strong>. </li>')
            print('<ul><li>Data de validade: ' + formatter().formatDate(renovacao[i].d_validade) + '</li><li>Data de emissão: ' + formatter().formatDate(renovacao[i].d_emissao) + '</li><li>Consumo facturado: ' + renovacao[i].c_licencia + '</li><li>Tipo de Licença: ' + renovacao[i].tipo_lic + '</li></ul>')
        }
        %>
    `),

    template: _.template(`

        <h4 style="margin-top: 30px; margin-bottom: 0px">
           <%- (renovacao.d_ultima_entrega_doc ? formatter().formatDate(renovacao.d_ultima_entrega_doc) + ' - ' : '') %><span style="color:#00a2da"><%- exp_id + ' '%> <%- exp_name %></span> <span style="color: grey"><%= ' (' + (actividade && actividade.tipo || 'Não declarada ') + ') ' %></span>
           <div class="licencias">
              <%- Backbone.SIXHIARA.formatter.formatTipoLicencias(licencias)[0] %> / <%- Backbone.SIXHIARA.formatter.formatTipoLicencias(licencias)[1] %>
           </div>
        </h4>
        <div id="time-renovacao-info" class="info-pill
        <%- renovacao.lic_time_over ? 'label-danger' : (renovacao.lic_time_warning ? 'label-warning' : renovacao.lic_time_enough ? 'label-success' : 'label-default') %>"> <%- renovacao.lic_time_info || 'Sem informação' %>
        </div>

        <div class="row">
          <div class="col-xs-12">
            <div id="billing_info_change">
            </div>
          </div>
        </div>

        <div id="toolbar" class="row">
            <div id="leftside-toolbar" class="col-xs-4"></div>
            <div id="rightside-toolbar" class="col-xs-8">
                <div id="bt-toolbar">
                    <div class="btn-group btn-group-justified" role="group">
                        <div class="btn-group" role="group">
                            <button id="file-modal" class="btn btn-default" role="button">Documentação</button>
                        </div>
                        <div class="btn-group" role="group">
                            <a id="bt-ficha" class="btn btn-default" role="button" href="/exploracao-show.html?id=<%- id %>">Ficha</a>
                        </div>
                        <div class="btn-group uilib-enability uilib-hide-role-observador" role="group">
                            <button id="bt-imprimir-licencia" class="btn btn-default" type="button" class="btn btn-default">Imprimir&nbsp;(licença)</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="renovacao-block" class="row panel-equal-height">
           <div class="col-xs-8">
              <div class="row">
                 <div class="col-xs-6">
                    <div id="lic-sub-old" class="panel panel-info panel-disabled">
                       <div class="panel-heading">
                          <h3 class="panel-title"><strong>Licença subterrânea</strong></h3>
                       </div>
                       <div class="panel-body">
                          <div class="form-group">
                             <label for="tipo_lic_sub_old">Tipo de licença</label>
                             <select class="form-control widget-text" id="tipo_lic_sub_old" value="<%- renovacao.tipo_lic_sub_old %>" disabled>
                                 <option></option>
                                 <option>Concessão</option>
                                 <option>Licença</option>
                                 <option>Autorização</option>
                             </select>
                          </div>
                          <div class="form-group">
                             <label for="d_emissao_sub_old">Data de emissão</label>
                             <input type="text" class="form-control widget-date" id="d_emissao_sub_old" pattern="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$" value="<%- formatter().formatDate(renovacao.d_emissao_sub_old) %>" disabled>
                          </div>
                          <div class="form-group">
                             <label for="d_validade_sub_old">Data de validade</label>
                             <input type="text" class="form-control widget-date" id="d_validade_sub_old" pattern="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$" value="<%- formatter().formatDate(renovacao.d_validade_sub_old) %>" disabled>
                          </div>
                          <div class="form-group">
                             <label for="c_licencia_sub_old">Consumo licenciado</label>
                             <input type="text" class="form-control widget-number" id="c_licencia_sub_old" pattern="[0-9]{1,8}([,][0-9]{1,2})?" value="<%- formatter().formatNumber(renovacao.c_licencia_sub_old, '0[.]00') %>" disabled>
                          </div>
                       </div>
                    </div>
                 </div>
                 <div class="col-xs-6">
                    <div id="lic-sup-old" class="panel panel-info panel-disabled">
                       <div class="panel-heading">
                          <h3 class="panel-title"><strong>Licença superficial</strong></h3>
                       </div>
                       <div class="panel-body">
                          <div class="form-group">
                             <label for="tipo_lic_sup_old">Tipo de licença</label>
                             <select class="form-control widget-text" id="tipo_lic_sup_old" value="<%- renovacao.tipo_lic_sup_old %>" disabled>
                                 <option></option>
                                 <option>Concessão</option>
                                 <option>Licença</option>
                                 <option>Autorização</option>
                             </select>
                          </div>
                          <div class="form-group">
                             <label for="d_emissao_sup_old">Data de emissão</label>
                             <input type="text" class="form-control widget-date" id="d_emissao_sup_old" pattern="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$" value="<%- formatter().formatDate(renovacao.d_emissao_sup_old) %>" disabled="">
                          </div>
                          <div class="form-group">
                             <label for="d_validade_sup_old">Data de validade</label>
                             <input type="text" class="form-control widget-date" id="d_validade_sup_old" pattern="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$" value="<%- formatter().formatDate(renovacao.d_validade_sup_old) %>" disabled="">
                          </div>
                          <div class="form-group">
                             <label for="c_licencia_sup_old">Consumo licenciado</label>
                             <input type="text" class="form-control widget-number" id="c_licencia_sup_old" pattern="[0-9]{1,8}([,][0-9]{1,2})?" value="<%- formatter().formatNumber(renovacao.c_licencia_sup_old, '0[.]00') %>" disabled="">
                          </div>
                       </div>
                    </div>
                 </div>
              </div>
              <div class="row">
                 <div class="col-xs-6">
                    <div id="lic-sub" class="panel panel-info panel-disabled">
                       <div class="panel-heading">
                          <h3 class="panel-title"><strong>Renovação Licença</strong></h3>
                       </div>
                       <div class="panel-body">
                          <div class="form-group">
                             <label for="tipo_lic_sub">Tipo de licença</label>
                             <select class="form-control widget-text" id="tipo_lic_sub" value="<%- renovacao.tipo_lic_sub %>" disabled>
                                 <option></option>
                                 <option>Concessão</option>
                                 <option>Licença</option>
                                 <option>Autorização</option>
                             </select>
                          </div>
                          <div class="form-group">
                             <label for="d_emissao_sub">Data de emissão</label>
                             <input type="text" class="form-control widget-date" id="d_emissao_sub" pattern="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$" value="<%- formatter().formatDate(renovacao.d_emissao_sub) %>" disabled="">
                          </div>
                          <div class="form-group">
                             <label for="d_validade_sub">Data de validade</label>
                             <input type="text" class="form-control widget-date" id="d_validade_sub" pattern="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$" value="<%- formatter().formatDate(renovacao.d_validade_sub) %>" disabled="">
                          </div>
                          <div class="form-group">
                             <label for="c_licencia_sub">Consumo licenciado</label>
                             <input type="text" class="form-control widget-number" id="c_licencia_sub" pattern="[0-9]{1,8}([,][0-9]{1,2})?" value="<%- formatter().formatNumber(renovacao.c_licencia_sub, '0[.]00') %>" disabled="">
                          </div>
                       </div>
                    </div>
                 </div>
                 <div class="col-xs-6">
                    <div id="lic-sup" class="panel panel-info panel-disabled">
                       <div class="panel-heading">
                          <h3 class="panel-title"><strong>Renovação Licença</strong></h3>
                       </div>
                       <div class="panel-body">
                          <div class="form-group">
                             <label for="tipo_lic_sup">Tipo de licença</label>
                             <select class="form-control widget-text" id="tipo_lic_sup" value="<%- renovacao.tipo_lic_sup %>" disabled>
                                 <option></option>
                                 <option>Concessão</option>
                                 <option>Licença</option>
                                 <option>Autorização</option>
                             </select>
                          </div>
                          <div class="form-group">
                             <label for="d_emissao_sup">Data de emissão</label>
                             <input type="text" class="form-control widget-date" id="d_emissao_sup" pattern="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$" value="<%- formatter().formatDate(renovacao.d_emissao_sup) %>" disabled="">
                          </div>
                          <div class="form-group">
                             <label for="d_validade_sup">Data de validade</label>
                             <input type="text" class="form-control widget-date" id="d_validade_sup" pattern="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$" value="<%- formatter().formatDate(renovacao.d_validade_sup) %>" disabled="">
                          </div>
                          <div class="form-group">
                             <label for="c_licencia_sup">Consumo licenciado</label>
                             <input type="text" class="form-control widget-number" id="c_licencia_sup" pattern="[0-9]{1,8}([,][0-9]{1,2})?" value="<%- formatter().formatNumber(renovacao.c_licencia_sup, '0[.]00') %>" disabled="">
                          </div>
                       </div>
                    </div>
                 </div>
              </div>
           </div>
           <div class="col-xs-4 panel-observacio">
              <div class="panel">
                 <div class="form-group">
                    <input class="hidden" id="lic_imp" type="checkbox" <%- renovacao.lic_imp ? 'checked=""' : '' %> required>
                    <label for="observacio">
                       <div style="display:inline-block; width: 29%">
                          Observações
                       </div>
                       <div id="js-btns-next">
                          <!-- TODO. Los "siguientes estados" disponibles no deberían estar harcodeados en el html
                             o bien, todos los botones deberían ser generados en otra parte, o de los dominios se deberían decidir que botones
                             se pueden usar en el modo combo o algo así
                             -->
                          <button id="bt-ok" type="button" class="btn btn-default btn-sm uilib-enability uilib-hide-role-observador" disabled>Completa</button>
                          <button id="bt-noaprobada" type="button" class="btn btn-primary btn-sm uilib-enability uilib-hide-role-observador" style="padding-left:7px; padding-right: 7px;">Não aprovada</button>
                       </div>
                    </label>
                    <textarea id="observacio" class="form-control widget uilib-enability uilib-disable-role-observador" rows="8"></textarea>
                 </div>
              </div>
           </div>
        </div>

    `),

    init: function() {
        Backbone.SIXHIARA.View1.prototype.init.call(this);
        var self = this;

        document
            .getElementById("lic_imp")
            .addEventListener("change", self.autosave.bind(self), false);
        document
            .getElementById("lic_imp")
            .addEventListener("change", self.enableBts.bind(self), false);

        this.widgetsToBeUsed();
        this.enabledWidgets();
        this.fillSelects();
        this.enableBts();
        this.changeBillingType();

        document.querySelectorAll(".widget-date").forEach(function(el) {
            el.addEventListener("input", function() {
                if (this.value && self.isValidDate(this.value)) {
                    self.model.get("renovacao").set(this.id, self.parseDate(this.id));
                    self.autosave(self);
                }
            });
        });

        var json = self.model.toJSON();
        var historico = new Backbone.SIXHIARA.HistoricoLicencias(this.model);
        historico.fetch({
            wait: true,
            success: function(model, resp, options) {
                var data = [];
                json.licencias.forEach(function(lic) {
                    var prefix = lic.tipo_agua.substring(0, 3).toLowerCase();
                    resp.forEach(function(h) {
                        data.push({
                            tipo_agua: lic.tipo_agua,
                            d_emissao: h["d_emissao_" + prefix + "_old"],
                            d_validade: h["d_validade_" + prefix + "_old"],
                            c_licencia: h["c_licencia_" + prefix + "_old"],
                            tipo_lic: h["tipo_lic_" + prefix + "_old"],
                        });
                    });
                });
                self.$el.find("#historico").append(
                    self.templateHistorico({
                        renovacao: data,
                    })
                );
            },
            error: function() {
                bootbox.alert("Erro ao carregar dados históricos da licença.");
                return;
            },
        });
    },

    widgetsToBeUsed: function() {
        this.widgets = [];
        if (iAuth.isObservador()) {
            return;
        }
        this.model.get("licencias").forEach(function(lic) {
            var tipo = lic.getSafeTipoAgua();
            document
                .getElementById("lic-" + tipo + "-old")
                .classList.remove("panel-disabled");
            document.getElementById("lic-" + tipo).classList.remove("panel-disabled");
            [
                "tipo_lic_sub_old",
                "d_emissao_sub_old",
                "d_validade_sub_old",
                "c_licencia_sub_old",
                "tipo_lic_sup_old",
                "d_emissao_sup_old",
                "d_validade_sup_old",
                "c_licencia_sup_old",
                "tipo_lic_sub",
                "d_emissao_sub",
                "d_validade_sub",
                "c_licencia_sub",
                "tipo_lic_sup",
                "d_emissao_sup",
                "d_validade_sup",
                "c_licencia_sup",
            ].forEach(function(w) {
                if (w.endsWith(tipo)) {
                    this.widgets.push(w);
                }
            }, this);
        }, this);
    },

    enabledWidgets: function() {
        var self = this;
        self.widgets.forEach(function(w) {
            var field = document.querySelectorAll("#myid #" + w)[0];
            field.disabled = false;
            field.required = true;
            if (w.startsWith("d_")) {
                field.placeholder = "dd/mm/yyyy";
                field.addEventListener("input", function() {
                    if (self.isValidDate(this.value)) {
                        self.model
                            .get("renovacao")
                            .set(this.id, self.parseDate(this.id));
                        self.autosave(self);
                        self.enableBts(self);
                    }
                });
                // Use this function to fill default value for selects
                // If previous type of Licença was Consessao it will be filled as it was
            } else if (field.nodeName == "SELECT") {
                var tipo_lic_old = self.model.get("renovacao").get(field.id);
                for (var i = 0; i < field.options.length; i++) {
                    if (field.options[i].text == tipo_lic_old) {
                        field.options[i].selected = "selected";
                    }
                }
                field.addEventListener("change", self.enableBts.bind(self), false);
                field.addEventListener("change", self.autosave.bind(self), false);
            } else {
                field.addEventListener("input", function() {
                    if (formatter().unformatNumber(this.value)) {
                        self.autosave(self);
                        self.enableBts(self);
                    }
                });
            }
        });
    },

    fillSelects: function() {
        var self = this;
        self.widgets.forEach(function(w) {
            if (w.includes("tipo_lic")) {
                var renovacao = self.model.get("renovacao");
                var field = document.querySelectorAll("#myid #" + w)[0],
                    field_old = document.querySelectorAll("#myid #" + w + "_old")[0];
                for (var i = 0; i < field.options.length; i++) {
                    var foo = renovacao.get(w) || renovacao.get(w + "_old");
                    if (field.options[i].text == foo) {
                        field.options[i].selected = "selected";
                        field_old.options[i].selected = "selected";
                    }
                }
            }
        });
    },

    enableBts: function() {
        // Con el autosave, el botón de imprimir se activa al momento de cambiar algo en el formulario
        // pero en el modelo los cambios no se aplican hasta el autosave/fillRenovacao y eso tarda
        // el tiempo del timer. Si un usuario pulsa muy rápido imprimir, los cambios no estarán guardados
        document.getElementById("bt-ok").disabled = true;
        document.getElementById("bt-imprimir-licencia").disabled = true;
        var lic_imp = document.getElementById("lic_imp").checked;
        var enable = this.widgets.every(function(w) {
            var input = document.querySelectorAll("#myid #" + w)[0];
            var e = input.value === 0 || input.value.trim();
            e = e && input.validity.valid;
            return e;
        });

        if (enable) {
            document.getElementById("bt-imprimir-licencia").disabled = !enable;
        }
        if (enable && lic_imp) {
            document.getElementById("bt-ok").disabled = !enable;
        }
        return enable;
    },

    changeBillingType: function() {
        self = this;
        var expSizeBillingAlert = new Backbone.SIXHIARA.ExpSizeBillingAlert({
            el: $("#billing_info_change"),
            model: self,
            evaluated_value: "c_licencia_sub",
            evaluated_value2: "c_licencia_sup",
            route: self.model.attributes.renovacao,
        });
    },

    fillRenovacaoFromForm: function() {
        var renovacao = this.model.get("renovacao");
        this.widgets.forEach(function(w) {
            var field = document.querySelectorAll("#myid #" + w)[0];
            value = field.value;
            if (value) {
                renovacao.set(w, value);
                if (field.id.startsWith("d_")) {
                    renovacao.set(w, formatter().unformatDate(value));
                }
                if (field.id.startsWith("c_")) {
                    renovacao.set(w, formatter().unformatNumber(value));
                }
            }
        });
    },

    doFillRenovacao: function(e, autosave) {
        var renovacao = this.model.get("renovacao");

        renovacao.set("lic_imp", document.getElementById("lic_imp").checked);

        this.updateLastCommentSetNewStateCreateNewComment(e, autosave);
        this.fillRenovacaoFromForm();
        this.saveToBackend(autosave);
    },

    printLicense: function(e) {
        e.preventDefault();
        e.stopPropagation();

        const exploracaoForPrint = this.model.cloneExploracao();
        const renovacao = exploracaoForPrint.get("renovacao");

        exploracaoForPrint.get("licencias").forEach(lic => {
            lic.initializePayments(exploracaoForPrint);
            const prefix = lic.getSafeTipoAgua();
            lic.set({
                d_emissao: renovacao.get("d_emissao_" + prefix),
                d_validade: renovacao.get("d_validade_" + prefix),
                c_licencia: renovacao.get("c_licencia_" + prefix),
                tipo_lic: renovacao.get("tipo_lic_" + prefix),
            });
        });

        SIRHA.Services.PrintService.licenses(exploracaoForPrint)
            .then(function() {
                var lic_imp = document.getElementById("lic_imp");
                lic_imp.checked = true;
                lic_imp.dispatchEvent(new Event("change"));
            })
            .catch(function(error) {
                bootbox.alert({
                    title: "Erro ao imprimir licença",
                    message: error,
                });
            });

        if (this.model.anyLicWithFlatFeeConsuption()) {
            SIRHA.Services.PrintService.proforma(exploracaoForPrint).catch(function(
                error
            ) {
                bootbox.alert({
                    title: "Erro ao imprimir",
                    message: error,
                });
            });
        }
    },
});
