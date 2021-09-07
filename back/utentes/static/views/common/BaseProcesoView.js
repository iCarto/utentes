Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.BaseProcesoView = Backbone.UILib.BaseView.extend({
    /*
    El método `init` en realidad está por no  usar jquery. Si se hace en render todavía no están en el
    DOM los elementos y no se puede usar document ¿?. Con jquery en cambio se quedan
    binded para después al usar this.$
    */
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
