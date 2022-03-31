Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.UtenteView = Backbone.View.extend({
    initialize: function (options) {
        this.options = options || {};

        this.sexoGerente = {
            valueInProcess: this.model.get("sexo_gerente"),
            previousValueInUtente: this.model.get("utente").get("sexo_gerente"),
            widget: document.getElementById("sexo_gerente"),
            warningWidget: document.getElementById("form-sexo_gerente-warning-message"),
            utenteModel: this.model.get("utente"),
        };

        this.render();

        new Backbone.UILib.WidgetsView({
            el: this.el,
            model: this.model.get("utente"),
        }).render();

        let self = this;
        if (this.sexoGerente.valueInProcess) {
            this.sexoGerente.widget.value = this.sexoGerente.valueInProcess;
            this.model
                .get("utente")
                .set("sexo_gerente", this.sexoGerente.valueInProcess, {silent: true});
            this.sexoGerente.widget.addEventListener("change", function (e) {
                if (self.sexoGerente.valueInProcess !== e.target.value) {
                    self.sexoGerente.warningWidget.classList.remove("hidden");
                    self.sexoGerente.warningWidget.innerHTML = `<strong>Atenção! </strong> O <strong>Sexo do Gerente/Presidente</strong> mudou. O DA atribuiu "<strong>${self.sexoGerente.valueInProcess}</strong>" e você selecionou "<strong>${e.target.value}</strong>".`;
                } else {
                    self.sexoGerente.warningWidget.classList.add("hidden");
                    self.sexoGerente.warningWidget.innerHTML = "";
                }
                self.selectUtenteView.checkGenderField(false);
            });
        }
    },

    render: function () {
        this.renderSelectUtente();
    },

    renderSelectUtente: function () {
        this.selectUtenteView = new Backbone.SIXHIARA.SelectUtenteView({
            el: $("#utente"),
            collection: this.collection,
            sexoGerente: this.sexoGerente,
        });
        this.selectUtenteView.render();
    },

    selectUtente: function (utente) {
        if (this.selectUtenteView) {
            this.selectUtenteView.selectUtente(utente);
        }
    },
});
