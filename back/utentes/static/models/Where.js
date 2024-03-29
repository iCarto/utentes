Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.Where = Backbone.Model.extend({
    defaults: {
        utente: null,
        estado: null,
        tipo_lic: null,
        tipo_agua: null,
        loc_divisao: null,
        loc_provin: null,
        loc_distri: null,
        loc_posto: null,
        actividade: null,
        geometria: null,
        mapBounds: null,
        ano_inicio: null,
        ano_fim: null,
    },

    initialize: function() {
        var changes =
            "change:utente change:estado change:tipo_licencia change:tipo_agua change:loc_divisao change:loc_provin change:loc_distri change:loc_posto change:actividade change:geometria change:ano_inicio change:ano_fim";
        this.on(changes, function(e) {
            this.set("mapBounds", null, {silent: true});
        });
    },

    values: function() {
        // only return those pairs that are not void
        return _.omit(this.toJSON(), function(value, key, object) {
            return _.isEmpty(value);
        });
    },
});
