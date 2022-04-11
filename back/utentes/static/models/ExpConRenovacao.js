Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ExpConRenovacao = Backbone.SIXHIARA.Exploracao.extend({
    urlRoot: Backbone.SIXHIARA.Config.apiRenovacoes,

    containsEstado: function(where) {
        // Workaround. refs 1507#change-10870
        if (!where.attributes.estado) {
            return true;
        }
        let state = this.get("renovacao").get("estado");
        return where.attributes.estado === state;
    },

    setLicenseTimeInfoRenovacoes: function() {
        var renovacao = this.get("renovacao");
        if (
            renovacao.get("estado") == SIRHA.ESTADO_RENOVACAO.INCOMPLETE_DA ||
            renovacao.get("estado") == SIRHA.ESTADO_RENOVACAO.INCOMPLETE_DJ
        ) {
            this.setDocPendenteUtenteRenovacao();
            return;
        }
        if (renovacao.get("d_ultima_entrega_doc")) {
            var licenseDate = renovacao.get("d_ultima_entrega_doc");
            var now = moment();
            licenseDate = moment(licenseDate);
            var times = Backbone.SIXHIARA.tiemposRenovacion;
            var remainDays = times.limit - now.diff(licenseDate, "days");
            var remainDaysStr =
                remainDays == 1 ? remainDays + " dia" : remainDays + " dias";

            if (remainDays > 0 && remainDays < times.warning) {
                renovacao.set("lic_time_warning", true);
            } else if (remainDays <= 0) {
                remainDaysStr = "Prazo esgotado";
                renovacao.set("lic_time_over", true);
            } else if (remainDays >= times.warning) {
                renovacao.set("lic_time_enough", true);
            }

            var message;
            if (remainDaysStr) {
                if (
                    remainDaysStr == "Prazo esgotado" ||
                    remainDaysStr == "Licença caducada"
                ) {
                    message = remainDaysStr;
                } else {
                    message =
                        "Ficam " +
                        remainDaysStr +
                        " para o fim do prazo de renovação da licença";
                }
            } else {
                message = "Sem informação";
            }
            renovacao.set("lic_time_info", message);
        }
    },

    setDocPendenteUtenteRenovacao: function() {
        this.get("renovacao").set("lic_time_info", "Pendente do utente", {
            silent: true,
        });
        this.get("renovacao").set("lic_time_enough", false, {silent: true});
        this.get("renovacao").set("lic_time_warning", false, {silent: true});
        this.get("renovacao").set("lic_time_over", false, {silent: true});
    },
});
