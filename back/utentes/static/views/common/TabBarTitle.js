Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.TabBarTitle = Backbone.View.extend({
    initialize: function(options) {
        this.options = options || {};
    },

    render: function() {
        fragment = document.createDocumentFragment();
        this.div = document.createElement("div");
        var a = document.createElement("a");
        a.textContent = this.model;
        this.div.appendChild(a);
        this.div.id = "state-toolbar";
        this.div.style.textAlign = "left";
        fragment.appendChild(this.div);
        this.el.appendChild(fragment);
        return this;
    },

    remove: function() {
        this.div.remove();
    },
});
