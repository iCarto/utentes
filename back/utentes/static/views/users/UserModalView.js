Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.UserModalView = Backbone.UILib.ModalView.extend({
    customConfiguration: function() {
        var self = this;
        var domains = new Backbone.UILib.DomainCollection();
        domains.fetch({
            success: function(collection, response, options) {
                new Backbone.UILib.SelectView({
                    el: self.$("#usergroup"),
                    collection: self.options.domains.byCategory("groups"),
                }).render();

                new Backbone.UILib.SelectView({
                    el: self.$("#divisao"),
                    collection: collection.byCategory("divisao"),
                }).render();

                if (self.isGroupBasinDivision(self.model.get("usergroup"))) {
                    self.$("#divisao-form").removeClass("hidden");
                }

                new Backbone.UILib.PasswordView({
                    el: document.getElementById("password-view"),
                    model: self.model,
                    required: !self.options.editing,
                }).render();

                document.getElementById("usergroup").addEventListener(
                    "change",
                    function(e) {
                        document.getElementById("divisao").selectedIndex = 0;
                        self.model.set("divisao", null);
                        var selectedGroup = this.options[this.options.selectedIndex]
                            .text;
                        if (self.isGroupBasinDivision(selectedGroup)) {
                            self.$("#divisao-form").removeClass("hidden");
                        } else {
                            self.$("#divisao-form").addClass("hidden");
                        }
                    },
                    this
                );

                document.getElementById("divisao").addEventListener(
                    "change",
                    function(e) {
                        self.checkIfDivisaoWidgetIsValid();
                    },
                    this
                );

                self.fillSelects();
            },
            error: function() {
                bootbox.alert(
                    '<span style="color: red;">Produziu-se um erro. Informe ao administrador.</strong>'
                );
            },
        });
    },

    isGroupBasinDivision: function(group) {
        return group === window.SIRHA.GROUP.BASIN_DIVISION;
    },

    okButtonClicked: function() {
        if (this.isSomeWidgetInvalid()) return;
        if (this.options.editing) {
            var widgets = this.$(".modal").find(
                ".widget, .widget-number, .widget-date, .widget-boolean, .widget-external"
            );
            var widgetsId = _.map(widgets, function(w) {
                return w.id;
            });
            var attrs = this.widgetModel.pick(widgetsId);
            this.model.set(attrs);
        } else {
            this.collection.add(this.model);
        }

        if (this.options.deleteFromServer) {
            this.model.save(null, {
                wait: true,
                success: function() {
                    console.log("Ok");
                },
                error: function(xhr, textStatus) {
                    if (
                        textStatus &&
                        textStatus.responseJSON &&
                        textStatus.responseJSON.error
                    ) {
                        if (Array.isArray(textStatus.responseJSON.error)) {
                            alert(textStatus.responseJSON.error.join("\n"));
                        } else {
                            alert(textStatus.responseJSON.error);
                        }
                    } else {
                        alert(textStatus.statusText);
                    }
                },
            });
        }
        this.$(".modal").modal("hide");
    },

    fillSelects: function() {
        var self = this;
        this.$("select.widget").each(function(index, widget) {
            $(widget)
                .find("option:selected")
                .removeAttr("selected");
            $(widget.options).each(function(index, option) {
                if (self.model.get(widget.id) === option.text) {
                    $(option).attr("selected", "selected");
                }
            });
        });
    },

    isSomeWidgetInvalid: function() {
        this.checkIfDivisaoWidgetIsValid();
        return Backbone.UILib.ModalView.prototype.isSomeWidgetInvalid.call(this);
    },

    checkIfDivisaoWidgetIsValid: function() {
        var divisaoSelect = document.getElementById("divisao");
        var divisaoSelectHelpBlock = document.getElementById("helpBlock_divisao");

        if (this.$("#divisao").is(":visible") && !this.$("#divisao").val()) {
            var errorMsg =
                'O campo "Divisão" é obrigatório para o tipo de usuário "Divisão"';
            divisaoSelect.setCustomValidity(errorMsg);
            divisaoSelectHelpBlock.innerHTML = errorMsg;
            divisaoSelectHelpBlock.style.display = "block";
        } else {
            divisaoSelect.setCustomValidity("");
            divisaoSelectHelpBlock.innerHTML = "";
            divisaoSelectHelpBlock.style.display = "none";
        }
    },
});
