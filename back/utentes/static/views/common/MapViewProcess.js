Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.MapViewProcess = Backbone.View.extend({
    initialize: function(options) {
        var options = options || {};
        var self = this;

        options.mapOptions = options.mapOptions || {};
        options.offline = {layers: allLayers};
        this.map = Backbone.SIXHIARA.mapConfig(this.el.id, options);

        this.geoJSONLayer = L.geoJson(undefined, {
            style: this.map.SIRHASExploracaoStyle,
        }).addTo(this.map);

        this.renderData();
    },

    renderData: function() {
        this.geoJSONLayer.clearLayers();
        if (this.model.hasGeometry()) {
            this.geoJSONLayer.addData(this.model.toGeoJSON());
        }

        FitToBounds.fitToLayers(this.map, this.geoJSONLayer, 0.1, 16);
    },
});
