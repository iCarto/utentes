Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.SelectBaciaView = Backbone.UILib.BaseView.extend({
    initialize: function(options) {
        Backbone.UILib.BaseView.prototype.initialize.call(this);

        var domains = options.domains;
        var divisoes = domains.byCategory("divisao");
        var bacias = domains.byCategory("bacia");
        var subacias = domains.byCategory("subacia");

        var selectDivisao = new Backbone.UILib.SelectView({
            el: this.$("#loc_divisao"),
            collection: divisoes,
        });
        this.addView(selectDivisao);

        var selectBacias = new Backbone.UILib.SelectView({
            el: this.$("#loc_bacia"),
            collection: bacias.byParent(this.model.get("loc_divisao")),
        });
        selectBacias.listenTo(this.model, "change:loc_divisao", function(model) {
            this.update(bacias.where({parent: model.get("loc_divisao")}));
        });
        this.addView(selectBacias);

        var selectSubacias = new Backbone.UILib.SelectView({
            el: this.$("#loc_subaci"),
            collection: subacias.byParent(this.model.get("loc_bacia")),
        });
        selectSubacias.listenTo(this.model, "change:loc_bacia", function(model) {
            this.update(subacias.where({parent: model.get("loc_bacia")}));
        });
        this.addView(selectSubacias);
    },
});
