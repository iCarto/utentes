Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.BaseProcesoView = Backbone.UILib.BaseView.extend({
    init: function() {
        Backbone.UILib.BaseView.prototype.initialize.call(this);
        new Backbone.SIXHIARA.FileModalView({
            model: this.model,
        });
    },

    render: function() {
        var json = this.model.toJSON();
        this.$el.html(this.template(json));
        Backbone.UILib.BaseView.prototype.render.call(this);
        return this;
    },

    autosave: function() {
        // http://codetunnel.io/how-to-implement-autosave-in-your-web-app/
        var self = this;
        var autosaveInfo = document.getElementById("autosave-info");
        autosaveInfo.innerHTML = "Modificações pendentes.";
        autosaveInfo.style.color = "red";
        if (this.timeoutId) {
            clearTimeout(this.timeoutId);
        }
        if (this.autosaveInputTimeOutId) {
            clearTimeout(this.autosaveInputTimeOutId);
        }
        this.timeoutId = setTimeout(function() {
            self.fillExploracao(null, true);
            autosaveInfo.innerHTML = "Modificações gravadas";
            autosaveInfo.style.color = "green";
            self.autosaveInputTimeOutId = setTimeout(function() {
                autosaveInfo.innerHTML = "";
            }, 1000);
        }, 750);
    },
});
