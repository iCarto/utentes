Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ViewSecretaria2 = Backbone.SIXHIARA.View1.extend({
    template: _.template(`

        <h4 style="margin-top: 30px; margin-bottom: 0px">
           <%- (renovacao.d_ultima_entrega_doc ? formatter().formatDate(renovacao.d_ultima_entrega_doc) + ' - ' : '') %><span style="color:#00a2da"><%- exp_id + ' '%> <%- exp_name %></span> <span style="color: grey"><%= ' (' + (actividade && actividade.tipo || 'Não declarada ') + ') ' %></span>
           <div class="licencias">
              <%- Backbone.SIXHIARA.formatter.formatTipoLicencias(licencias)[0] %> /
              <%- Backbone.SIXHIARA.formatter.formatTipoLicencias(licencias)[1] %>
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

        <div id="renovacao-block" class="form-group">
           <label for="observacio" style="width: 100%; margin-bottom: 0px">
              <div style="display:inline-block; width: 29%">
                 Observações
              </div>
              <div id="js-btns-next">
                 <!-- TODO. Los "siguientes estados" disponibles no deberían estar harcodeados en el html
                    o bien, todos los botones deberían ser generados en otra parte, o de los dominios se deberían decidir que botones
                    se pueden usar en el modo combo o algo así
                    -->
                 <button id="bt-ok" type="button" class="btn btn-default uilib-enability uilib-hide-role-observador">Licença assinada<small>&nbsp;(Director)</small></button>
                 <button id="bt-noaprobada" type="button" class="btn btn-primary uilib-enability uilib-hide-role-observador">Não aprovada<small>&nbsp;(Director)</small></button>
              </div>
           </label>
           <textarea id="observacio" class="form-control widget uilib-enability uilib-disable-role-observador" rows="7"></textarea>
        </div>
        <div class="form-group" style="margin-top: 20px">
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
        this.enableBts();
    },

    enableBts: function() {
        var enable = true;
        document.getElementById("bt-ok").disabled = !enable;
    },

    updateRenovacaoConsumoFact: function(model) {
        var renovacao = this.model.get("renovacao");
        model.get("licencias").forEach(function(lic) {
            var tipo = lic.getSafeTipoAgua();
            var last_consumo = lic.get("consumo_fact");
            renovacao.set("consumo_fact_" + tipo + "_old", last_consumo);
        });
    },

    fillExploracaoFromRenovacao: function() {
        var renovacao = this.model.get("renovacao");
        this.model.get("licencias").forEach(function(lic) {
            var tipo = lic.getSafeTipoAgua();
            lic.set("tipo_lic", renovacao.get("tipo_lic_" + tipo));
            lic.set("d_emissao", renovacao.get("d_emissao_" + tipo));
            lic.set("d_validade", renovacao.get("d_validade_" + tipo));
            lic.set("c_licencia", renovacao.get("c_licencia_" + tipo));
            lic.set("estado", renovacao.get("estado"));
        });
        this.model.set("estado_lic", renovacao.get("estado"));
        this.model.set("d_soli", renovacao.get("d_soli"));
        this.model.set("d_ultima_entrega_doc", renovacao.get("d_ultima_entrega_doc"));
    },

    fillExploracao: function(e, autosave) {
        var self = this;
        var renovacao = this.model.get("renovacao");

        var nextState = wfr.whichNextState(renovacao.get("estado"), e);

        if (autosave) {
            this.doFillRenovacao(e, autosave);
        } else {
            bootbox.confirm(
                `A exploração vai mudar o seu estado a: <br> <strong>${nextState}</strong>`,
                function(result) {
                    if (result) {
                        self.doFillRenovacao(e, autosave);
                    }
                }
            );
        }
    },

    doFillRenovacao: function(e, autosave) {
        this.updateLastCommentSetNewStateCreateNewComment(e, autosave);

        var exploracao = this.model;
        this.updateRenovacaoConsumoFact(exploracao);

        // Pass Renovacao data to Exploracao
        this.fillExploracaoFromRenovacao();

        this.saveToBackend(autosave);
    },
});
