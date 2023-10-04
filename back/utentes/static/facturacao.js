var where = new Backbone.SIXHIARA.Where();
_.extend(
    Backbone.SIXHIARA.ExploracaoCollection.prototype,
    SIRHA.Utils.primaveraCollectionComparator
);
var exploracaos = new Backbone.SIXHIARA.ExploracaoCollection();
var exploracaosFiltered = new Backbone.SIXHIARA.ExploracaoCollection();
var domains = new Backbone.UILib.DomainCollection();
var listView, numberOfResultsView, filtersView;

exploracaos.url = Backbone.SIXHIARA.Config.apiFacturacao;

var domainsFetched = function(collection, response, options) {
    var facturable_states = new Backbone.UILib.DomainCollection(
        domains
            .byCategory("licencia_estado")
            .filter(d => SIRHA.ESTADO.CATEGORY_INVOIZABLE.includes(d.get("text")))
    );
    filtersView = new Backbone.SIXHIARA.FiltersView({
        el: $("#filters"),
        model: where,
        domains: domains,
        states: facturable_states,
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

    if (SIRHA.FEATURES.ERP_EXPORT) {
        $("#projects-header .export-buttons").append(
            '<a class="btn btn-default btn-xs" href="/api/erp/clients" role="button">Clientes</a>'
        );
        $("#projects-header .export-buttons").append(
            '<a class="btn btn-default btn-xs" href="/api/erp/invoices" role="button">Facturas</a>'
        );
    }

    listView.listenTo(exploracaosFiltered, "leaflet", myLeafletEvent);
    listView.update(exploracaosFiltered);

    if (exploracaosFiltered.length > 0) {
        wf.renderView(exploracaosFiltered.at(0));
        $("#process-container");
    }

    exploracaos.on("show-next-exp", function(model) {
        var state = model.get("facturacao");
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

exploracaos.fetch({
    parse: true,
    success: exploracaosFetched,
});
domains.fetch({
    success: domainsFetched,
});

document.getElementById("project_list").addEventListener("click", e => {
    if (e.target.tagName.toLowerCase() === "a") {
        var exp_id = e.target.parentNode.parentNode.id.replace("exp_id-", "");
        var exp = exploracaos.findWhere({exp_id: exp_id});
        wf.renderView(exp);
        $("#process-container");
    }
    return false;
});
