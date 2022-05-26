var allLayers = [
    {
        id: "estacoes",
        pointToLayer: Backbone.SIXHIARA.LayerStyle.doPointToLayerEstacoes,
        initialOrder: 0,
        farZoom: 12,
    },
    {
        id: "barragens",
        pointToLayer: Backbone.SIXHIARA.LayerStyle.doPointToLayerBarragens,
        initialOrder: 1,
        farZoom: 12,
    },
    {
        id: "fontes",
        initialOrder: 2,
        farZoom: 13,
        pointToLayer: Backbone.SIXHIARA.LayerStyle.doPointToLayerFontes,
    },
    {
        id: "albufeiras",
        initialOrder: 3,
    },
    {
        id: "lagos",
        initialOrder: 4,
    },
    {
        id: "rios",
        initialOrder: 5,
        farZoom: 9,
    },
    {
        id: "aras",
        onEachFeature: Backbone.SIXHIARA.LayerStyle.onEachFeaturearas,
        initialOrder: 6,
        closeZoom: 11,
    },
    {
        id: "divisoes",
        initialOrder: 7,
    },
    {
        id: "bacias",
        onEachFeature: Backbone.SIXHIARA.LayerStyle.onEachFeaturebacias,
        initialOrder: 8,
        farZoom: 9,
    },
    {
        id: "subacias",
        onEachFeature: Backbone.SIXHIARA.LayerStyle.onEachFeaturesubacias,
        initialOrder: 9,
        farZoom: 10,
    },
    {
        id: "baciasrepresentacion",
        initialOrder: 10,
        closeZoom: 9,
    },
    {
        id: "provincias",
        initialOrder: 11,
    },
    {
        id: "paises",
        onEachFeature: Backbone.SIXHIARA.LayerStyle.onEachFeaturepaises,
        initialOrder: 12,
    },
    {
        id: "oceanos",
        initialOrder: 13,
    },
];
