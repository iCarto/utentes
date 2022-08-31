Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.MapViewProcess = Backbone.View.extend({
    initialize: function() {
        const options = {offline: {layers: allLayers}};
        const map = Backbone.SIXHIARA.mapConfig(this.el.id, options);
        if (this.model.hasGeometry()) {
            const geoJSONLayer = L.geoJson(this.model.toGeoJSON(), {
                style: map.SIRHASExploracaoStyle,
            }).addTo(map);
            FitToBounds.fitToLayers(map, geoJSONLayer, 0.1, 16);
        }
    },
});
