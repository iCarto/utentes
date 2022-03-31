Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.UtenteSimilar = Backbone.SIXHIARA.Utente.extend({
    defaults: function () {
        return _.extend({}, Backbone.SIXHIARA.Utente.prototype.defaults, {
            similarity: null,
            similarity_field: null,
        });
    },
});
