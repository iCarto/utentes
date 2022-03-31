Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.UtenteSimilarCollection = Backbone.Collection.extend({
    model: Backbone.SIXHIARA.UtenteSimilar,
    url: Backbone.SIXHIARA.Config.apiUtentesFind,
});
