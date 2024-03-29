var where = new Backbone.SIXHIARA.Where();
_.extend(
    Backbone.SIXHIARA.ExploracaoCollection.prototype,
    SIRHA.Utils.genderCollectionComparator
);
var exploracaos = new Backbone.SIXHIARA.ExploracaoCollection();
var exploracaosFiltered = new Backbone.SIXHIARA.ExploracaoCollection();
var domains = new Backbone.UILib.DomainCollection();
var estados = new Backbone.SIXHIARA.EstadoCollection();
var listView, numberOfResultsView, filtersView;

exploracaos.url = Backbone.SIXHIARA.Config.apiRequerimentos;

var domainsFetched = function(collection, response, options) {
    filtersView = new Backbone.SIXHIARA.FiltersView({
        el: $("#filters"),
        model: where,
        domains: domains,
        states: estados,
    }).render();

    if (filtersView && exploracaos.length) {
        filtersView.setDataFilterFromExploracaos(exploracaos);
    }

    exploracaos.listenTo(where, "change", function(model, options) {
        if (!model) return;
        var keys = _.keys(model.changed);

        if (keys.length === 1 && keys.indexOf("mapBounds") !== -1) {
            exploracaosFiltered = exploracaos.filterBy(where);
            listView.listenTo(exploracaosFiltered, "leaflet", myLeafletEvent);
            listView.update(exploracaosFiltered);
        } else {
            // Reset geo filter if the user use any other filter
            where.set("mapBounds", null, {silent: true});
            exploracaosFiltered = exploracaos.filterBy(where);
            listView.listenTo(exploracaosFiltered, "leaflet", myLeafletEvent);
            listView.update(exploracaosFiltered);
        }
        numberOfResultsView.update(_.size(exploracaosFiltered));
        renderNextExpOnFilterChange(wf, exploracaosFiltered);
    });
};

var exploracaosFetched = function() {
    exploracaosFiltered = new Backbone.SIXHIARA.ExploracaoCollection(
        exploracaos.models
    );

    if (filtersView && exploracaos.length) {
        filtersView.setDataFilterFromExploracaos(exploracaos);
    }

    listView = new Backbone.UILib.ListView({
        el: $("#project_list"),
        collection: exploracaosFiltered,
        subviewTemplate: _.template($("#exploracao-li-tmpl").html()),
    });

    numberOfResultsView = new Backbone.SIXHIARA.NumberOfResultsView({
        el: $("#projects-header .results"),
        totalResults: _.size(exploracaos),
    });

    new Backbone.SIXHIARA.ButtonExportXLSView({
        el: $("#projects-header .export-buttons"),
        listView: listView,
    }).render();

    new Backbone.SIXHIARA.ButtonExportSHPView({
        el: $("#projects-header .export-buttons"),
        listView: listView,
    }).render();

    listView.listenTo(exploracaosFiltered, "leaflet", myLeafletEvent);
    listView.update(exploracaosFiltered);

    if (exploracaosFiltered.length > 0) {
        wf.renderView(exploracaosFiltered.at(0));
        $("#process-container");
    }

    exploracaos.on("show-next-exp", function(model) {
        var state = model.get("estado_lic");
        onShowNextExp(
            model,
            state,
            estados,
            exploracaos,
            exploracaosFiltered,
            where,
            wf,
            listView
        );
    });
};

estados.fetch({
    success: function() {
        estados = estados.forPendentesView();
        var params = $.param({
            states: estados.pluck("text"),
        });
        exploracaos.fetch({
            parse: true,
            success: exploracaosFetched,
            data: params,
        });
        domains.fetch({
            success: domainsFetched,
        });
    },
});

document.getElementById("projects").addEventListener("click", e => {
    if (e.target.tagName.toLowerCase() === "a") {
        var exp_id = e.target.parentNode.parentNode.id.replace("exp_id-", "");
        var exp = exploracaos.findWhere({exp_id: exp_id});
        wf.renderView(exp);
        $("#process-container");
    }
    return false;
});
