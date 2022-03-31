Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ExploracaoSimilarCollection = Backbone.Collection.extend({
    model: Backbone.SIXHIARA.ExploracaoSimilar,
    url: Backbone.SIXHIARA.Config.apiExploracaosFind,
});
