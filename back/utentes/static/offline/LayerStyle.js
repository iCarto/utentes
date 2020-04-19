Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.LayerStyle = {
    doPointToLayerEstacoes: function(feature, latlng) {
        return L.marker(
            latlng,
            Backbone.SIXHIARA.LayerStyle.doStyleEstacoes(feature)
        ).bindLabel(feature.properties.cod_estac, {
            noHide: true,
            offset: [2, -26],
            className: "sixhiara-leaflet-label-estacoes",
            opacity: 1,
            zoomAnimation: true,
            // direction: 'auto',
        });
    },
    doStyleEstacoes: function(feature) {
        var tip_estac = feature.properties.tip_estac;
        switch (tip_estac) {
            case "Hidrométrica":
                return {
                    icon: Backbone.SIXHIARA.LayerStyle.hidroIcon,
                    clickable: false,
                };
                break;
            case "Pluviométrica":
                return {
                    icon: Backbone.SIXHIARA.LayerStyle.pluvioIcon,
                    clickable: false,
                };
                break;
        }
    },
    hidroIcon: L.icon({
        iconUrl: "/static/offline/legend/Hidrometrica.png",
        iconSize: [20.0, 20.0],
    }),
    pluvioIcon: L.icon({
        iconUrl: "/static/offline/legend/Pluviometrica.png",
        iconSize: [20.0, 20.0],
    }),

    doPointToLayerBarragens: function(feature, latlng) {
        return L.marker(latlng, Backbone.SIXHIARA.LayerStyle.doStyleBarragens(feature));
    },
    doStyleBarragens: function(feature) {
        var tip_barra = feature.properties.tip_barra;
        switch (tip_barra) {
            case "Barragem":
                return {
                    icon: Backbone.SIXHIARA.LayerStyle.barragemIcon,
                    clickable: false,
                };
                break;
            case "Represa":
                return {
                    icon: Backbone.SIXHIARA.LayerStyle.represaIcon,
                    clickable: false,
                };
                break;
        }
    },
    barragemIcon: L.icon({
        iconUrl: "/static/offline/legend/Barragem.png",
        iconSize: [20.0, 20.0],
    }),
    represaIcon: L.icon({
        iconUrl: "/static/offline/legend/Represa.png",
        iconSize: [20.0, 20.0],
    }),

    doPointToLayerFontes: function(feature, latlng) {
        let commonStyle = {
            weight: 0,
            opacity: 0,
            fillOpacity: 1.0,
            clickable: false,
        };
        let customStyle = Backbone.SIXHIARA.LayerStyle.doStyleFontesCustom(feature);

        return L.circleMarker(latlng, Object.assign({}, customStyle, commonStyle));
    },

    doStyleFontesCustom: function doStyleFontesCustom(feature) {
        switch (feature.properties.red_monit) {
            case "Velho-Sustituído":
                return {
                    radius: 3,
                    fillColor: "#1f78b4",
                    color: "#1f78b4",
                };
            case "Base e qualidade":
                return {
                    radius: 6,
                    fillColor: "#a51215",
                    color: "#a51215",
                };
            case "Base":
                return {
                    radius: 6,
                    fillColor: "#4c9322",
                    color: "#4c9322",
                };
            case "NO":
            default:
                return {
                    radius: 3,
                    fillColor: "#1f78b4",
                    color: "#1f78b4",
                };
        }
    },

    marker_EntidadesPopulacao: new L.icon({
        iconUrl: "/static/offline/legend/EntidadesPopulacao.png",
        iconSize: [16, 16],
        iconAnchor: [8, 8],
    }),
    doPointToLayerEntidadespopulacao: function(feature, latlng) {
        return L.marker(latlng, {
            icon: Backbone.SIXHIARA.LayerStyle.marker_EntidadesPopulacao,
            clickable: false,
        }).bindLabel(feature.properties.nome, {
            noHide: true,
            offset: [-0, -16],
            className: "sixhiara-leaflet-label-entidadespopulacao",
            opacity: 1,
            zoomAnimation: true,
            // direction: 'auto',
        });
    },

    doStylealbufeiras: function(feature) {
        return {
            weight: 0.52,
            color: "#304b8a",
            fillColor: "#304b8a",
            opacity: 1.0,
            fillOpacity: 1.0,
            clickable: false,
        };
    },

    doStylelagos: function(feature) {
        return {
            weight: 0.52,
            color: "#00537d",
            fillColor: "#00537d",
            opacity: 1.0,
            fillOpacity: 1.0,
            clickable: false,
        };
    },

    doStyleestradas: function(feature) {
        switch (feature.properties.tipo) {
            case "Primária":
                return {
                    color: "#770514",
                    weight: 1.6,
                    opacity: "1.0",
                    clickable: false,
                    fillColor: "#fff",
                };
            case "Secundária":
                return {
                    color: "#11370f",
                    weight: 1,
                    opacity: "0.8",
                    clickable: false,
                };
            case "Vicinhal":
                return {
                    color: "#5f4b0f",
                    weight: 0.5,
                    opacity: "1.0",
                    clickable: false,
                };
        }
    },

    doStylerios: function(feature) {
        return {
            weight: 0.6,
            color: "#6598da",
            opacity: 1.0,
            clickable: false,
        };
    },

    doStylearas: function(feature) {
        return {
            weight: 1,
            color: "#05328c",
            opacity: 1.0,
            fillOpacity: 0,
        };
    },
    onEachFeaturearas: function(feature, layer) {
        return L.marker(layer.getBounds().getCenter(), {
            icon: L.divIcon({
                className: "sixhiara-leaflet-label-aras",
                html: feature.properties.nome,
            }),
        }).addTo(map);
    },

    doStylebacias: function(feature) {
        return {
            weight: 0.6,
            fillColor: "#ffffff",
            dashArray: "5, 5, 1, 5",
            color: "#05328c",
            opacity: 1,
            fillOpacity: 1,
        };
    },

    doStylebaciasrepresentacion: function(feature) {
        var ret = {
            weight: 0.52,
            fillColor: "#000000",
            color: "#FFFFFF",
            opacity: 1,
            fillOpacity: 0.2,
            clickable: false,
        };
        switch (feature.properties.nome) {
            case "Zambeze":
            case "Montepuez":
            case "Monapo":
            case "Melela":
            case "Govuro":
                ret.fillColor = "#1e3ca0";
                break;
            case "Save":
            case "Pungue":
            case "Messalo":
            case "Mecuburi":
            case "Ligonha":
            case "Licungo":
            case "Incomati":
                ret.fillColor = "#0a46aa";
                break;
            case "Resto de bacias":
                ret.fillColor = "#0044CE";
                break;
            case "Raraga":
            case "Raraga":
            case "Meluli":
            case "Megaruma":
            case "Inharrime":
                ret.fillColor = "#7d7d7d";
                break;
            case "Lurio":
            case "Rovuma":
            case "Lualua":
            case "Limpopo":
            case "Buzi":
                ret.fillColor = "#1e78b4";
                break;
            case "Gorongozi":
                ret.fillColor = "#05328c";
        }
        return ret;
    },

    doStyleprovincias: function(feature) {
        return {
            weight: 1.2,
            color: "#000000",
            fillColor: "#F6F6F6",
            dashArray: "5, 5, 1, 5",
            opacity: 0.4,
            fillOpacity: 1,
            clickable: false,
        };
    },

    doStylepaises: function(feature) {
        return {
            weight: 0.52,
            color: "#000000",
            fillColor: "#D8D8D8",
            opacity: 1.0,
            fillOpacity: 1,
            clickable: false,
        };
    },

    doStyleoceanos: function(feature) {
        return {
            weight: 0.26,
            color: "#BEE8FF",
            fillColor: "#BEE8FF",
            dashArray: null,
            lineCap: null,
            lineJoin: null,
            opacity: 1.0,
            fillOpacity: 1.0,
            clickable: false,
        };
    },
};
