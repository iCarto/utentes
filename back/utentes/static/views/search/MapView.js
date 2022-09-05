Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.MapView = Backbone.View.extend({
    initialize: function(options) {
        var options = options || {};
        var self = this;

        options.mapOptions = options.mapOptions || {};
        options.offline = {layers: allLayers};
        this.map = Backbone.SIXHIARA.mapConfig(this.el.id, options);

        // Calculate polygon centers and use getLatLng and setLatLng methods to create latlng field and enable MarkerCluster plugin to cluster polygons
        L.Polygon.addInitHook(function() {
            this._latlng = this._bounds.getCenter();
        });
        L.Polygon.include({
            getLatLng: function() {
                return this._latlng;
            },
            setLatLng: function() {},
        });

        this.geoJSONLayer = L.geoJson(this.collection.toGeoJSON(), {
            style: this.map.SIRHASExploracaoStyle,
            onEachFeature: function(feature, layer) {
                if (feature.properties) {
                    var exp_id = feature.properties.exp_id;
                    var exp = self.collection.filter({exp_id: exp_id})[0];
                    layer.bindPopup(
                        "<strong>" +
                            "Exploração: " +
                            "</strong>" +
                            feature.properties.exp_id +
                            "<br/>" +
                            "<strong>" +
                            "Nome: " +
                            "</strong>" +
                            feature.properties.exp_name +
                            "<p/>" +
                            "<div align='center'>" +
                            '<a href="' +
                            exp.urlShow() +
                            '">' +
                            "FICHA" +
                            "</a>" +
                            "<p/>"
                    );
                }
                layer.on({
                    mouseover: function(e) {
                        var layer = e.target;
                        var exp_id = layer.feature.properties.exp_id;
                        self.collection.trigger("leaflet", {
                            type: "mouseover",
                            exp_id: exp_id,
                        });

                        layer.setStyle({
                            opacity: 1,
                            fillOpacity: 0.4,
                        });

                        layer.bringToFront();
                    },
                    mouseout: function(e) {
                        self.geoJSONLayer.resetStyle(e.target);
                        self.collection.trigger("leaflet", {
                            type: "mouseout",
                            exp_id: exp_id,
                        });
                    },
                });
            },
        });

        this.mapEvents();

        //Exploraçoes cluster display by MarkerCluster
        this.markers = L.markerClusterGroup({
            showCoverageOnHover: true,
            zoomToBoundsOnClick: true,
            disableClusteringAtZoom: 12,
        });
    },

    update: function(newCollection) {
        this.collection = newCollection;
        this.updateLayer();
        this.updateMapView();
    },

    updateLayer: function() {
        this.geoJSONLayer.clearLayers();
        this.markers.clearLayers();
        var geojson = this.collection.toGeoJSON();
        if (geojson.features.length > 0) {
            this.geoJSONLayer.addData(geojson);
        }
        //Insert data in cluster markers and add to the map
        this.markers.addLayer(this.geoJSONLayer).addTo(this.map);
    },

    updateMapView: function() {
        if (this.geoJSONLayer.getLayers().length > 0) {
            FitToBounds.fitToLayers(this.map, this.geoJSONLayer, 0.04, 16);
        } else {
            this.map.resetView();
        }
    },

    mapEvents: function() {
        var self = this;
        this.map.on("dragend", function(e) {
            // user or programatic event? https://github.com/Leaflet/Leaflet/issues/2267
            if (e.hard) return;
            where.set("mapBounds", self.map.getBounds());
        });
    },
});
