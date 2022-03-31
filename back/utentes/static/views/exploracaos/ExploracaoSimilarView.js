Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ExploracaoSimilarView = Backbone.View.extend({
    tagName: "a",

    templateTooltip: _.template(
        `
        <div class="tooltip-row"><span class="tooltip-label">Número de exploração</span>: <span class="tooltip-value"><%=exp_id%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Nome da exploração</span>: <span class="tooltip-value"><%=exp_name%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Estado</span>: <span class="tooltip-value"><%=estado_lic%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Tipo de actividade</span>: <span class="tooltip-value"><%=actividade%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Provincia</span>: <span class="tooltip-value"><%=loc_provin%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Distrito</span>: <span class="tooltip-value"><%=loc_distri%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Posto administrativo</span>: <span class="tooltip-value"><%=loc_posto%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Bairro</span>: <span class="tooltip-value"><%=loc_nucleo%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Divisão</span>: <span class="tooltip-value"><%=loc_divisao%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Bacia</span>: <span class="tooltip-value"><%=loc_bacia%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Subacia</span>: <span class="tooltip-value"><%=loc_subaci%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Tipo de água</span>: <span class="tooltip-value"><%=tipo_agua%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Caudal licenciado</span>: <span class="tooltip-value"><%=c_licencia%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Caudal real</span>: <span class="tooltip-value"><%=c_real%></span></div>
        <div class="tooltip-row"><span class="tooltip-label">Semelhança</span>: <span class="tooltip-value"><%=similarity%></span></div>
        `
    ),

    render: function () {
        this.$el.empty();
        var textContent = this.model.get("exp_name");
        if (this.model.get("estado_lic")) {
            textContent += " (" + this.model.get("estado_lic") + ")";
        }
        if (this.model.get("similarity") === 1) {
            if (this.model.get("actividade")) {
                textContent += " - " + this.model.get("actividade");
            }
            this.$el.addClass("alert-danger");
            this.$el.css({
                "font-weight": "bold",
            });
        }
        this.$el.html(textContent);
        this.$el.attr("href", Backbone.SIXHIARA.Config.urlShow + this.model.get("gid"));
        this.$el.attr("target", "_blank");
        var tooltipText = this.templateTooltip({
            exp_id: this.model.get("exp_id"),
            exp_name: this.model.get("exp_name"),
            estado_lic: this.model.get("estado_lic"),
            actividade: this.model.get("actividade"),
            loc_provin: this.model.get("loc_provin"),
            loc_distri: this.model.get("loc_distri"),
            loc_posto: this.model.get("loc_posto"),
            loc_nucleo: this.model.get("loc_nucleo"),
            loc_divisao: this.model.get("loc_divisao"),
            loc_bacia: this.model.get("loc_bacia"),
            loc_subaci: this.model.get("loc_subaci"),
            tipo_agua: this.model.get("tipo_agua"),
            c_licencia: this.model.get("c_licencia"),
            c_real: this.model.get("c_real"),
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
