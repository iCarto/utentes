Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ViewProcesoNoData = Backbone.SIXHIARA.BaseProcesoView.extend({
    className: "myclass",

    template: _.template(`
        <h2>Não há dados que mostrar<h2>
    `),

    init: function() {},
});
