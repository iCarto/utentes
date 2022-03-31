Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.UtenteSimilarView = Backbone.View.extend({
    tagName: "a",

    templateTooltip: _.template(
        `
        <div class="tooltip-row"><span class="tooltip-label">Nome utente</span>: <span class="tooltip-value"><%=nome%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">NUIT</span>: <span class="tooltip-value"><%=nuit%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Tipo</span>: <span class="tooltip-value"><%=uten_tipo%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Nome do Gerente/Presidente</span>: <span class="tooltip-value"><%=uten_gere%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Sexo do Gerente/Presidente</span>: <span class="tooltip-value"><%=sexo_gerente%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Telefone</span>: <span class="tooltip-value"><%=telefone%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Email</span>: <span class="tooltip-value"><%=email%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Semelhança</span>: <span class="tooltip-value"><%=similarity%></span></div>
        `
    ),

    initialize: function (options) {
        this.options = options || {};
    },

    render: function () {
        var self = this;
        this.$el.empty();
        var textContent = this.model.get("nome");
        if (this.model.get("nuit")) {
            textContent += " (NUIT: " + this.model.get("nuit") + ")";
        }
        if (this.model.get("similarity") === 1) {
            this.$el.addClass("alert-danger");
            this.$el.css({
                "font-weight": "bold",
            });
        }
        this.$el.on("click", () => {
            this.$el.tooltip("hide");
            if (self.options && self.options.onSelect) {
                self.options.onSelect(this.model);
            }
        });
        this.$el.html(textContent);
        this.$el.attr("href", "#");
        var tooltipText = this.templateTooltip({
            nome: this.model.get("nome"),
            nuit: this.model.get("nuit"),
            uten_tipo: this.model.get("uten_tipo"),
            uten_gere: this.model.get("uten_gere"),
            sexo_gerente: this.model.get("sexo_gerente"),
            telefone: this.model.get("telefone"),
            email: this.model.get("email"),
            similarity:
                Math.trunc(this.model.get("similarity") * 100) +
                "% (" +
                this.model.get("similarity_field") +
                ")",
        });

        this.$el.attr("title", tooltipText);
        this.$el.attr(
            "data-template",
            "<div class='tooltip tooltip-label-value' role='tooltip'><div class='arrow'></div><div class='tooltip-inner'></div></div>"
        );
        this.$el.attr("data-toggle", "tooltip");
        this.$el.attr("data-placement", "right");
        this.$el.attr("data-html", "true");
        this.$el.tooltip({container: "body"});
        return this;
    },
});
