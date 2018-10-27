Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ViewJuridico2 = Backbone.SIXHIARA.View1.extend({

    events: {
        "click #bt-imprimir-licencia" : "printLicense"
    },

    template: _.template(`
        <div id="bt-toolbar" class="row">
  <div class="col-xs-12">
    <div class="btn-group btn-group-justified" role="group">
        <div class="btn-group" role="group">
            <button id="file-modal" class="btn btn-default" role="button">Documentaçao</button>
        </div>
        <div class="btn-group" role="group">
            <a id="bt-ficha" class="btn btn-default" role="button" href="/exploracao-show.html?id=<%- id %>">Ficha</a>
        </div>
        <div class="btn-group" role="group">
            <button id="bt-imprimir-licencia" type="button" class="btn btn-default">Imprimir&nbsp;(licença)</button>
        </div>
    </div>
  </div>
</div>

<h4 style="margin-bottom: 20px;">
<%- formatter().formatDate(created_at) + ' - ' %><span style="color:#00a2da"><%- exp_id + ' '%> <%- exp_name %></span> <span style="color: grey"><%= ' (' + (actividade && actividade.tipo || 'Não declarada') + '). ' %></span>
<div class="licencias">
    <%- Backbone.SIXHIARA.formatter.formatTipoLicencias(licencias)[0] %> / <%- Backbone.SIXHIARA.formatter.formatTipoLicencias(licencias)[1] %>
</div>
</h4>


<div class="row panel-equal-height">
  <div class="col-xs-6">
<div class="panel">
    <div class="row">
      <div class="col-xs-12">
        <table class="table table-bordered table-checks">
          <thead>
            <tr><th>Tipo de Documento</th><th>Pronto</th></tr>
          </thead>
          <tbody>
            <tr>
              <td>Documentação legal</td>
              <td><input id="doc_legal" type="checkbox" checked required disabled></td>
            </tr>
            <tr>
              <td>Parecer Técnico</td>
              <td><input id="p_juri" type="checkbox" <%- p_juri ? 'checked=""' : '' %> required></td>
            </tr>
            <tr>
              <td>Parecer de instituições relevantes</td>
              <td><input id="p_rel" type="checkbox" <%- p_rel ? 'checked=""' : '' %> required></td>
            </tr>
            <% for (var i=0; i<licencias.length; i+=1) { %>
                <%- licencias[i].printed %>
                <tr class="printed-licenses-checkboxes">
                  <td>Licença <%= licencias[i].tipo_agua %> impressa</td>
                  <td><input id="license<%= licencias[i].lic_nro.substring(licencias[i].lic_nro.length, licencias[i].lic_nro.length -3) %>" type="checkbox" <%- licencias[i].printed ? 'checked=""' : '' %> required disabled></td>
                </tr>
            <% } %>

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
          <div style="display:inline-block; width: 18%">
          Observações
          </div>
          <div id="js-btns-next">
            <!-- TODO. Los "siguientes estados" disponibles no deberían estar harcodeados en el html
            o bien, todos los botones deberían ser generados en otra parte, o de los dominios se deberían decidir que botones
            se pueden usar en el modo combo o algo así
            -->
            <button id="bt-ok" type="button" class="btn btn-default btn-sm" style="padding-left:7px; padding-right: 7px;" disabled>Completa</button>
            <button id="bt-no" type="button" class="btn btn-primary btn-sm" style="padding-left:7px; padding-right: 7px;">Incompleta</button>
            <button id="bt-noaprobada" type="button" class="btn btn-primary btn-sm" style="padding-left:7px; padding-right: 7px;">Não aprovada</button>
            <button id="bt-defacto" type="button" class="btn btn-danger btn-sm" style="padding-left:7px; padding-right: 7px;">Utente de facto</button>
          </div>
        </label>
        <textarea id="observacio" class="form-control widget"></textarea>
      </div>
</div>
    </div>
</div>
 <div class="form-group">
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

    `),


    init: function() {
        Backbone.SIXHIARA.View1.prototype.init.call(this);

        document.getElementById('bt-ok').setAttribute('data-foo', 'juridico2');

        var self = this;

        document.querySelectorAll('table input[type="checkbox"]').forEach(function(input){
            input.addEventListener('change', self.enableBts.bind(self), false);
        });

        // Para gestionar los dos estados de doc incompleta
        var wf_tmp = Object.create(MyWorkflow);
        var currentState = this.model.get('estado_lic');
        document.getElementById('bt-ok').setAttribute('data-foo', 'juridico2');
        var nextBtState = wf_tmp.whichNextState(currentState, {target:{id: 'bt-ok',
        attributes: {'data-foo': 'juridico2'}}});
        document.getElementById('bt-ok').title = nextBtState;

        this.enableBts();
        document.querySelectorAll('table input[type="checkbox"]').forEach(function(input){
            input.addEventListener('change', self.autosave.bind(self), false);
        });

        var defaultDepartamento = wf.isAdmin() ? 'root' : wf.getRole();
        var defaultUrlBase = Backbone.SIXHIARA.Config.apiExploracaos + '/' + this.model.get('id') + '/documentos'
        var fileModalView = new Backbone.DMS.FileModalView({
            openElementId: '#file-modal',
            title: 'Arquivo Electr&oacute;nico',
            urlBase: defaultUrlBase,
            id: defaultDepartamento
        });

    },

    enableBts: function() {
        var enable = Array.from(
            document.querySelectorAll('table input[type="checkbox"]')
        ).every(input => {
            if (input.required) {
                return input.checked;
            }
            return true;
        });

        document.getElementById('bt-ok').disabled = !enable;
    },

    printLicense: function(){
        // It has to print one document for each kind of tipo licencia (Subterránea / Superficial)
        // We iterate through licenses:
        this.model.get('licencias').forEach(function(licencia, index){
            this.newPrinter(index);
        }, this);
    },

    newPrinter: function(i){
        var json = this.model.toJSON();

        if (!json.licencias[i].tipo_lic) {
            bootbox.alert("A exploração tem que ter uma tipo de licença.");
            return;
        }
        // Create a copy of the main object since both types of licenses share fields
        var data = JSON.parse(JSON.stringify(json, function(key, value) {
            if(value === null) {
                return "";
            }
            return value;
        }));

        data.licencia = data.licencias[i];

        // We filter fontes by tipo_agua (Subterrânea / Superficial)
        data.fontes = data.fontes.filter(function(fonte){
            return fonte.tipo_agua == data.licencia.tipo_agua;
        });

        var licenseSortName = /(\d{4}\/)(\w{3})/.exec(data.licencia.lic_nro)[2];

        data.licencia.d_emissao = formatter().formatDate(data.licencia.d_emissao) || "";
        data.licencia.d_validade = formatter().formatDate(data.licencia.d_validade)  || "";
        data.urlTemplate = Backbone.SIXHIARA.tipoTemplates[data.licencia.tipo_lic];
        data.licencia.duration = Backbone.SIXHIARA.duracionLicencias[data.licencia.tipo_lic];
        data.nameFile = data.licencia.tipo_lic.concat("_")
                                              .concat(data.licencia.lic_nro)
                                              .concat("_")
                                              .concat(data.exp_name)
                                              .concat('.docx');
        var self = this;
        var saveLicencia = new Backbone.SIXHIARA.LicenseSaveIsPrinted({id: data.licencia.id});
        var datosAra = new Backbone.SIXHIARA.AraGetData();
        saveLicencia.fetch({
            success: function(model, resp, options) {
                if (resp) {
                    datosAra.fetch({
                        success: function(model, resp, options) {
                            data.ara = resp
                            data.ara.logoUrl = Backbone.SIXHIARA.araLogos[SIRHA.ARA];
                            var docxGenerator = new Backbone.SIXHIARA.DocxGeneratorView({
                                model: self.model,
                                data: data
                            });
                            $("#license".concat(licenseSortName)).attr('checked', true).trigger("change");
                            var e = new Event('change');
                            document.getElementById("license".concat(licenseSortName)).dispatchEvent(e);
                            self.enableBts();
                        },
                        error: function(){
                            bootbox.alert(`Erro ao gerar impressão de licença ${data.licencia.lic_nro}.`);
                            return;
                        }
                    })
                }
            },
            error: function(){
                bootbox.alert(`Erro ao gerar impressão de licença ${data.licencia.lic_nro}.`);
                return;
            }
        });
    },
});
