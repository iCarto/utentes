Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.View1 = Backbone.SIXHIARA.BaseProcesoView.extend({
    tagName: "div",

    className: "myclass",

    id: "myid",

    /*
    Esto en realidad está por no  usar jquery. Si se hace en render todavía no están en el
    DOM los elementos y no se puede usar document ¿?. Con jquery en cambio se quedan
    binded para después al usar this.$
    */
    init: function() {
        Backbone.SIXHIARA.BaseProcesoView.prototype.init.call(this);
        var self = this;
        var renovacao = this.model.get("renovacao");

        var currentComment = renovacao.get("obser").slice(-1)[0];
        if (currentComment.text) {
            document.getElementById("observacio").value = currentComment.text;
        }

        document
            .getElementById("observacio")
            .addEventListener("input", self.autosave.bind(self), false);

        var wfr_tmp = Object.create(MyWorkflowRenovacao);
        var currentState = renovacao.get("estado");

        document.querySelectorAll("#js-btns-next > button").forEach(function(bt) {
            var nextBtState = wfr_tmp.whichNextState(currentState, {
                target: {id: bt.id},
            });
            bt.title = nextBtState;
        });

        $('[data-toggle="tooltip"]').tooltip();
        document.getElementById("js-btns-next").addEventListener("click", function(e) {
            if (wfr.isNeedAskForEnteredDocumentationDate(self.model, e)) {
                var ModalUltimaEntregaDoc = Backbone.SIXHIARA.UltimaEntregaDocModalView.extend(
                    {
                        okButtonClicked: function() {
                            var dateId = "d_ultima_entrega_doc";
                            var dateWidget = document.getElementById(dateId);
                            var dateObj = formatter().unformatDate(dateWidget.value);
                            self.model.get("renovacao").set(dateId, dateObj);
                            self.model.save({wait: true});
                            this.$(".modal").modal("hide");
                            self.fillExploracao(e);
                        },
                    }
                );
                var modalView = new ModalUltimaEntregaDoc({
                    model: self.model,
                });
                modalView.show();
            } else {
                self.fillExploracao(e);
            }
        });

        this.tabBarTitle = new Backbone.SIXHIARA.TabBarTitle({
            el: document.querySelector("#leftside-toolbar"),
            model: currentState,
        }).render();

        if (this.model.get("renovacao").get("lic_time_info")) {
            document.getElementById("time-renovacao-info").style.display = "block";
        }

        // MapViewProcess Exploracao geometry and map
        const mapProcessElement = document.getElementById("map-process");
        if (mapProcessElement) {
            new Backbone.SIXHIARA.MapViewProcess({
                el: mapProcessElement,
                model: this.model,
            });
        }
    },

    updateUltimaEntregaDoc: function(date, date2) {
        var d_soli = this.model.get("renovacao").get("d_soli");
        var d_ultima = this.model.get("renovacao").get("d_ultima_entrega_doc");
        if (d_ultima < d_soli) {
            this.model.get("renovacao").set("d_ultima_entrega_doc", d_soli);
        }
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
        var renovacao = this.model.get("renovacao");

        if (!renovacao.get("d_ultima_entrega_doc")) {
            renovacao.set("d_ultima_entrega_doc", new Date());
        }

        // which is earlier
        if (renovacao.get("d_soli") && renovacao.get("d_ultima_entrega_doc")) {
            this.updateUltimaEntregaDoc();
        }

        this.updateLastCommentSetNewStateCreateNewComment(e, autosave);
        this.fillRenovacaoFromForm();
        this.saveToBackend(autosave);
    },

    fillRenovacaoFromForm: function() {
        var renovacao = this.model.get("renovacao");
        document
            .querySelectorAll('table input[type="checkbox"]')
            .forEach(function(input) {
                renovacao.set(input.id, input.checked);
            });
    },

    updateLastCommentSetNewStateCreateNewComment: function(e, autosave) {
        var renovacao = this.model.get("renovacao");

        var currentComment = renovacao.get("obser").slice(-1)[0];

        var nextState = wfr.whichNextState(renovacao.get("estado"), e);
        Object.assign(currentComment, {
            create_at: new Date(),
            author: iAuth.getUser(),
            text: document.getElementById("observacio").value,
            state: nextState,
        });

        if (!autosave) {
            renovacao.get("obser").push({
                create_at: null,
                author: null,
                text: null,
                state: null,
            });
        }
        renovacao.setLicState(nextState);
    },

    saveToBackend: function(autosave) {
        var exploracao = this.model;
        var self = this;
        exploracao.urlRoot = Backbone.SIXHIARA.Config.apiRenovacoes;
        exploracao.save(null, {
            patch: true,
            validate: false,
            wait: true,
            success: function(model, response, options) {
                self.onSuccessfulSave(model, response, options, autosave);
            },
            error: function() {
                bootbox.alert(
                    '<span style="color: red;">Produziu-se um erro. Informe ao administrador.</strong>'
                );
            },
        });
    },

    remove: function() {
        this.tabBarTitle.remove();
        Backbone.SIXHIARA.BaseProcesoView.prototype.remove.call(this);
    },

    parseDate: function(dateId) {
        var dateWidget = document.getElementById(dateId);
        var dateObj = formatter().unformatDate(dateWidget.value);
        return dateObj;
    },

    isValidDate: function(date) {
        if (
            this.isValidFormatDate(date) &&
            moment(date, "DD/MM/YYYY").isValid() &&
            this.isAfterNow(date)
        ) {
            return true;
        }
        return false;
    },

    isValidFormatDate: function(date) {
        return /^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$/.test(
            date
        );
    },

    isAfterNow: function(value) {
        var sTokens = value.split("/");
        var date = new Date(sTokens[2], sTokens[1] - 1, sTokens[0], 1, 1, 1);
        return date > new Date();
    },

    setRenovacaoTimeInfo: function(exploracao, model) {
        var exploracaoModel = new Backbone.SIXHIARA.ExpConRenovacao(model.attributes);
        var renovacao = exploracaoModel.get("renovacao");
        exploracao.set("lic_time_info", renovacao.get("lic_time_info"));
        exploracao.set("lic_time_enough", renovacao.get("lic_time_enough"));
        exploracao.set("lic_time_warning", renovacao.get("lic_time_warning"));
        exploracao.set("lic_time_over", renovacao.get("lic_time_over"));
    },

    onSuccessfulSave: function(model, response, options, autosave) {
        if (autosave) {
            console.log("autosaving");
            return;
        }
        var old_exp_id = model.previousAttributes().exp_id;
        var new_exp_id = model.get("exp_id");
        var exp_name = model.get("exp_name");
        var msg = `A exploração&nbsp;<strong>${new_exp_id} - ${exp_name}</strong>&nbsp;tem sido gravada correctamente.`;
        if (old_exp_id !== new_exp_id) {
            msg = `A exploração alterou seu "número de exploração" a de&nbsp;<strong>${old_exp_id}</strong>&nbsp;a&nbsp;<strong>${new_exp_id}</strong> e tem sido gravada correctamente.`;
        }
        bootbox.alert(msg, function() {
            model.trigger("show-next-exp", model);
        });
    },
});
