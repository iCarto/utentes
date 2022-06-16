Backbone.UILib.Enability = {
    Expressions: {},
};

Backbone.UILib.Enability.Expressions.proforma = function(widget, context) {
    if (!iAuth.hasRoleTecnico() && !iAuth.isAdmin()) {
        return;
    }

    if (
        context.options.exploracao.get("estado") != SIRHA.ESTADO.PENDING_TECH_DECISION
    ) {
        return;
    }
    widget.disabled = false;
};
