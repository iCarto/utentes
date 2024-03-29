Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ViewTecnico = Backbone.SIXHIARA.View1.extend({
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

        <div id="toolbar" class="row">
            <div id="leftside-toolbar" class="col-xs-6"></div>
            <div id="rightside-toolbar" class="col-xs-6">
                <div id="bt-toolbar">
                    <div class="btn-group btn-group-justified" role="group">
                        <div class="btn-group" role="group">
                            <button id="file-modal" class="btn btn-default" role="button">Documentação</button>
                        </div>
                        <div class="btn-group" role="group">
                            <a id="bt-ficha" class="btn btn-default" role="button" href="/exploracao-show.html?id=<%- id %>">Ficha</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="renovacao-block" class="row panel-equal-height">
           <div class="col-xs-6">
              <div class="panel">
                 <div class="row">
                    <div class="col-xs-12">
                       <table class="table table-bordered table-checks">
                          <thead>
                             <tr>
                                <th>Tipo de documento</th>
                                <th>Pronto</th>
                             </tr>
                          </thead>
                          <tbody>
                             <tr>
                                <td>Análise da documentação</td>
                                <td><input id="anali_doc" class="uilib-enability uilib-disable-role-observador" type="checkbox" <%- renovacao.anali_doc ? 'checked=""' : '' %> required></td>
                             </tr>
                             <tr>
                                <td>Solicitação da visitoria</td>
                                <td><input id="soli_visit" class="uilib-enability uilib-disable-role-observador" type="checkbox" <%- renovacao.soli_visit ? 'checked=""' : '' %> required></td>
                             </tr>
                             <tr>
                                <td>Parecer da Divisão</td>
                                <td><input id="parecer_divisao" class="uilib-enability uilib-disable-role-observador" type="checkbox" <%- renovacao.parecer_divisao ? 'checked=""' : '' %> required></td>
                             </tr>
                             <tr>
                                <td>Parecer técnico</td>
                                <td><input id="p_tec" class="uilib-enability uilib-disable-role-observador" type="checkbox" <%- renovacao.p_tec ? 'checked=""' : '' %> required></td>
                             </tr>
                          </tbody>
                       </table>
                    </div>
                 </div>
              </div>
           </div>
           <div class="col-xs-6 panel-observacio">
              <div class="panel">
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
                          <button id="bt-ok" type="button" class="btn btn-default btn-sm uilib-enability uilib-hide-role-observador">Completa</button>
                          <button id="bt-no" type="button" class="btn btn-primary btn-sm uilib-enability uilib-hide-role-observador">Incompleta</button>
                          <button id="bt-noaprobada" type="button" class="btn btn-primary btn-sm uilib-enability uilib-hide-role-observador">Não aprovada</button>
                          <button id="bt-defacto" type="button" class="btn btn-danger btn-sm uilib-enability uilib-hide-role-observador">Utente de facto</button>
                       </div>
                    </label>
                    <textarea id="observacio" class="form-control widget uilib-enability uilib-disable-role-observador"></textarea>
                 </div>
              </div>
           </div>
        </div>
        <div class="form-group">
           <label for="observacio_ant">Observações anteriores</label>
           <textarea class="form-control widget" id="observacio_ant" rows="7" disabled>
              <% for (var i=0; i<renovacao.obser.length - 1; i+=1) {
                 if (renovacao.obser[i]['text']) {
                    print('O ' + formatter().formatDate(renovacao.obser[i]['create_at']) + ', ' + renovacao.obser[i]['author'] + ', escreveu: ' + renovacao.obser[i]['text'] + '&#13;&#10;&#13;&#10;');
                 }
              }
              %>
           </textarea>
        </div>

        <div id="map-process"">
        </div>
    `),

    init: function() {
        Backbone.SIXHIARA.View1.prototype.init.call(this);

        const currentBasin = this.model.get("loc_bacia");
        if (SIRHA.FEATURES.BASINS_WITH_WEAP_MODEL.includes(currentBasin)) {
            this.addView(
                new Backbone.SIXHIARA.ViewWeapExportButton({model: this.model}).init()
            );
        }

        var self = this;

        document
            .querySelectorAll('table input[type="checkbox"]')
            .forEach(function(input) {
                input.addEventListener("change", self.enableBts.bind(self), false);
            });

        this.enableBts();

        document
            .querySelectorAll('table input[type="checkbox"]')
            .forEach(function(input) {
                input.addEventListener("change", self.autosave.bind(self), false);
            });
    },

    enableBts: function() {
        if (this.model.isValid()) {
            SIRHA.Utils.DOM.enableBt("bt-defacto");
            document.getElementById("parecer_divisao").disabled = false;
            document.getElementById("p_tec").disabled = false;
            var enableChb = SIRHA.Utils.DOM.allRequiredInputAreChecked(
                'table input[type="checkbox"]'
            );
            SIRHA.Utils.DOM.enableBtIf(
                enableChb,
                "bt-ok",
                SIRHA.ESTADO_RENOVACAO.PENDING_EMIT_LICENSE
            );
        } else {
            SIRHA.Utils.DOM.disableBt("bt-defacto");
            document.getElementById("parecer_divisao").disabled = true;
            document.getElementById("p_tec").disabled = true;
            SIRHA.Utils.DOM.disableBt(
                "bt-ok",
                "Deve rechear correctamente a 'Ficha' dantes de completar"
            );
        }

        this._subviews.forEach(v => v.enableBts());
    },

    fillExploracao: function(e, autosave) {
        var self = this;
        var exploracao = this.model;
        var renovacao = exploracao.get("renovacao");
        var nextState = wfr.whichNextState(renovacao.get("estado"), e);
        if (e && e.target && e.target.id === "bt-ok") {
            nextState = SIRHA.ESTADO_RENOVACAO.PENDING_EMIT_LICENSE;
        }

        if (autosave) {
            this.dofillRenovacao(e, autosave);
        } else {
            bootbox.confirm(
                `A exploração vai mudar o seu estado a: <br> <strong>${nextState}</strong>`,
                function(result) {
                    if (result) {
                        self.dofillRenovacao(e, autosave);
                    }
                }
            );
        }
    },

    dofillRenovacao: function(e, autosave) {
        this.updateLastCommentSetNewStateCreateNewComment(e, autosave);
        this.fillRenovacaoFromForm();
        this.saveToBackend(autosave);
    },
});
