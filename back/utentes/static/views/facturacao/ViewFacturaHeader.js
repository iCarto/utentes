Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ViewFacturaHeader = Backbone.View.extend({

    tagName: 'h5',

    template: _.template(`
        <span><%- fact_name %></span> <span>(<%- fact_estado %>)</span>
    `),

    initialize: function (options) {
        this.options = options || {};
        this.setListeners();
    },

    render: function() {
        this.el.className = this.getHeaderClassname();
        var json ={
            fact_name: this.model.get('fact_id') ? this.model.get('fact_id') : this.model.get('mes') + '/' + this.model.get('ano'),
            fact_estado: this.model.get('fact_estado')
        }
        this.$el.empty();
        this.$el.html(this.template(json));
        return this;
    },

    setListeners: function() {
        this.listenTo(this.model, 'change:fact_estado change:fact_id', this.render)
    },

    updateModel: function(newModel) {
        this.model = newModel;
        this.setListeners();
        this.render();
    },

    getHeaderClassname: function(){
        var fact_estado = this.model.get('fact_estado');
        if(fact_estado === window.SIRHA.ESTADO_FACT.PENDING_M3) {
            return 'text-label-pdt-consumo';
        }else if(fact_estado === window.SIRHA.ESTADO_FACT.PENDING_INVOICE){
            return 'text-label-pdt-factura';
        }else if(fact_estado === window.SIRHA.ESTADO_FACT.PENDING_PAY){
            return 'text-label-pdt-pagamento';
        }else if(fact_estado === window.SIRHA.ESTADO_FACT.PAID){
            return 'text-label-pagada';
        }
    }

});