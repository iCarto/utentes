Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ExploracaoSimilarList = Backbone.View.extend({
    template: _.template(
        `<div class='alert'>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <p>Os dados da exploração coincidem com outras que já foram criadas:</p>
            <ul id="content" style="padding:10px;"></ul>
        </div>`
    ),

    initialize: function (options) {
        this.options = options || {};
        this.createListeners();
        _.bindAll(this, "onClose", "onLoad");
    },

    createListeners: function () {
        var self = this;
        this.listenTo(this.collection, "sync", () => {
            self.render();
            self.onLoad();
        });
        this.listenTo(this.collection, "reset", this.render);
    },

    render: function () {
        var self = this;
        this.$el.find(".close").off("click");
        $('[data-toggle="tooltip"]').tooltip("hide");
        this.$el.empty();
        if (this.collection.length) {
            this.$el.html(this.template());
            var container = document.createDocumentFragment();
            this.collection.forEach(function (exploracaoSimilar) {
                container.appendChild(self.renderSuggestion(exploracaoSimilar));
            });
            if (this.hasExactSuggestion()) {
                this.$el.find(".alert").addClass("alert-danger");
                this.$el.find(".close").hide();
            } else {
                this.$el.find(".alert").addClass("alert-warning alert-dismissible");
                this.$el.find(".close").show();
                this.$el.find(".close").on("click", () => {
                    self.onClose();
                });
            }
            this.$el.find("#content").append(container);
        }
        return this;
    },

    renderSuggestion: function (exploracaoSimilar) {
        console.log(
            "similarity",
            exploracaoSimilar.get("exp_name"),
            exploracaoSimilar.get("similarity")
        );
        var li = document.createElement("li");
        var exploracaoSimilarView = new Backbone.SIXHIARA.ExploracaoSimilarView({
            model: exploracaoSimilar,
        });
        li.appendChild(exploracaoSimilarView.render().el);
        return li;
    },

    search: function (data) {
        this.collection.fetch({data});
    },

    onLoad: function () {
        if (this.options && this.options.onLoad) {
            this.options.onLoad();
        }
    },

    onClose: function () {
        this.collection.reset();
        if (this.options && this.options.onClose) {
            this.options.onClose();
        }
    },

    hasSuggestions: function () {
        return this.collection.length;
    },

    hasExactSuggestion: function () {
        return this.hasSuggestions() && this.collection.at(0).get("similarity") === 1;
    },

    isShown: function () {
        return this.$el.children().length;
    },
});
