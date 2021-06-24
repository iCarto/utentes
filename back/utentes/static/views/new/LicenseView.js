Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.LicenseView = Backbone.UILib.BaseView.extend({
    events: {
        "click input:checkbox": "clickActive",
    },

    initialize: function(options) {
        Backbone.UILib.BaseView.prototype.initialize.call(this);
        this.options = options || {};
        this.tipo_agua = this.options.tipo_agua;

        this.license = this.createLicense();

        this.updateModelView = new Backbone.UILib.WidgetsView({
            el: this.el,
            model: this.license,
        });
        this.addView(this.updateModelView);

        var self = this;
        this.$(this.options.selectorButtonAddFonte).on("click", function(e) {
            self.renderModal(e);
        });
    },

    createLicense: function() {
        return new Backbone.SIXHIARA.Licencia({
            tipo_agua: this.tipo_agua,
            estado: this.model.get("estado_lic"),
            lic_nro: this.model.get("exp_id")
                ? SIRHA.Services.IdService.calculateNewLicNro(
                      this.model.get("exp_id"),
                      this.tipo_agua
                  )
                : null,
            taxa_fixa: null,
            taxa_uso: this.tipo_agua === "Subterrânea" ? 0.6 : null,
            iva: window.SIXHIARA.IVA,
        });
    },

    render: function() {
        Backbone.SIXHIARA.LicenseView.__super__.render.call(this);
        this.disableWidgets();
    },

    clickActive: function(e) {
        var self = this;
        if (e.target.checked) {
            this.model.get("licencias").add(this.license);
            this.enableWidgets();
        } else {
            this.model.get("licencias").remove(this.license);
            var fontes = this.model.get("fontes").where({tipo_agua: this.tipo_agua});
            this.model.get("fontes").remove(fontes);
            this.stopListening(this.license);
            this.license = this.createLicense();
            this.updateModelView.model = this.license;
            this.updateModelView.render();
            this.disableWidgets();
        }
    },

    disableWidgets: function() {
        this.isDisabled = true;
        this.el.classList.add("panel-disabled");
        this.$("label.set-enability").addClass("text-muted");
        this.$(".widget").prop("disabled", this.isDisabled);
        this.$(".widget-number").prop("disabled", this.isDisabled);
        this.$("button").prop("disabled", this.isDisabled);
    },

    enableWidgets: function() {
        this.isDisabled = false;
        this.el.classList.remove("panel-disabled");
        this.$("label.set-enability").removeClass("text-muted");
        this.$(".widget").prop("disabled", this.isDisabled);
        this.$(".widget-number").prop("disabled", this.isDisabled);
        this.$("button").prop("disabled", this.isDisabled);
    },

    renderModal: function(e) {
        e.preventDefault();

        let domains = this.options.domains.reject(
            e =>
                e.get("category") === "fonte_tipo" && e.get("parent") !== this.tipo_agua
        );
        domains = new Backbone.UILib.DomainCollection(domains);
        var modalView = new Backbone.UILib.ModalView({
            modalSelectorTpl: this.options.selectorModalFonte,
            collection: this.model.get("fontes"),
            collectionModel: Backbone.SIXHIARA.Fonte,
            model: new Backbone.SIXHIARA.Fonte({
                tipo_agua: this.tipo_agua,
            }),
            domains: domains,
            creating: true,
            editing: false,
            selectViewWrapper: true,
            domainMap: {tipo_fonte: "fonte_tipo", red_monit: "red_monit"},
        });
        modalView.render();
    },
});
