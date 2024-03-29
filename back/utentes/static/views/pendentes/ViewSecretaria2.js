Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ViewSecretaria2 = Backbone.SIXHIARA.View1.extend({
    template: _.template(`

<h4 style="margin-top: 30px; margin-bottom: 0px">
    <%- formatter().formatDate(d_ultima_entrega_doc) + ' - ' %><span style="color:#00a2da"><%- exp_id + ' '%> <%- exp_name %></span> <span style="color: grey"><%= ' (' + (actividade && actividade.tipo || 'Não declarada') + '). ' %></span>
    <div class="licencias">
        <%- Backbone.SIXHIARA.formatter.formatTipoLicencias(licencias)[0] %> /
        <%- Backbone.SIXHIARA.formatter.formatTipoLicencias(licencias)[1] %>
    </div>
</h4>

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

      <div class="form-group">
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
<% for (var i=0; i<req_obs.length - 1; i+=1) {
if (req_obs[i]['text']) {
print('O ' + formatter().formatDate(req_obs[i]['create_at']) + ', ' + req_obs[i]['author'] + ', escreveu: ' + req_obs[i]['text'] + '&#13;&#10;&#13;&#10;');
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
});
