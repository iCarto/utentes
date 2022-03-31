Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.UtenteSimilarList = Backbone.View.extend({
    template: _.template(
        `<div class='alert'>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <p>Os dados do utente coincidem com outros que já foram criados:</p>
            <ul id="content" style="padding:10px;"></ul>
        </div>`
    ),

    initialize: function (options) {
        this.options = options || {};
        this.createListeners();
        _.bindAll(this, "onClose", "onLoad", "onSelect");
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
            this.collection.forEach(function (utenteSimilar) {
                container.appendChild(self.renderSuggestion(utenteSimilar));
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

    renderSuggestion: function (utenteSimilar) {
        console.log(
            "similarity",
            utenteSimilar.get("nome"),
            utenteSimilar.get("similarity")
        );
        var li = document.createElement("li");
        var utenteSimilarView = new Backbone.SIXHIARA.UtenteSimilarView({
            model: utenteSimilar,
            onSelect: this.onSelect,
        });
        li.appendChild(utenteSimilarView.render().el);
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

    onSelect: function (utenteSimilar) {
        if (this.options && this.options.onSelect) {
            this.options.onSelect(utenteSimilar);
        }
        this.onClose();
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
