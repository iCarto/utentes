$(document).ready(function () {
    $("#wizard-exp").bootstrapWizard({
        withVisible: false,
    });
    document.body.classList.add("wait");
});

var exploracao = new Backbone.SIXHIARA.Exploracao();
var domains = new Backbone.UILib.DomainCollection();
var utentes = new Backbone.SIXHIARA.UtenteCollection();
var newExpId;
var utenteView, buttonSaveView, similarUtentesFoundView, similarExploracaosFoundView;

var fetchPromises = function fetchPromises(id) {
    var jqxhr = _.invoke([domains, utentes], "fetch", {parse: true});

    if (isNaN(id)) {
        var mock = {
            fetch: function () {
                return Promise.resolve().then(() => exploracao.toJSON());
            },
        };
    } else {
        // Se llega a la página desde la de requerimentos
        exploracao.set("id", id, {silent: true});
        var mock = exploracao;
    }
    jqxhr.push(mock.fetch({parse: true}));

    // "utente de usos comuns" o "utente de facto"
    var backendNextState = document.getElementById("next_state").value;
    var newExpIdDeferred = SIRHA.Services.IdService.getNewExpIdFromApi(
        backendNextState
    ).then(function (v) {
        newExpId = v.exp_id;
    });
    jqxhr.push(newExpIdDeferred);

    return _.invoke(jqxhr, "promise");
};

var configureBasedOnId = function configureBasedOnId(id) {
    if (id) {
        document.getElementById("exp_id").readOnly = true;
        document.getElementById("d_soli").readOnly = true;

        var nextState = wf.whichNextState(exploracao.get("estado_lic"), {
            target: {id: "bt-ok"},
        });
        exploracao.set("state_to_set_after_validation", nextState, {
            silent: true,
        });
    } else {
        exploracao.set("exp_id", newExpId, {silent: true});
        document.getElementById("exp_id").placeholder = newExpId;
        var backendNextState = document.getElementById("next_state").value;
        exploracao.set(
            {
                estado_lic: SIRHA.ESTADO.PENDING_FIELD_VISIT,
                state_to_set_after_validation: backendNextState,
            },
            {silent: true}
        );
    }
};

var whenAllDataIsFetched = function whenAllDataIsFetched() {
    configureBasedOnId(id);
    fillComponentsWithDomains();
    doIt();
};

var id = SIRHA.Utils.getIdFromSearchParams();

Promise.all(fetchPromises(id))
    .then(function () {
        whenAllDataIsFetched();
    })
    .catch(function (error) {
        console.log(error);
    })
    .finally(function () {
        document.body.classList.remove("wait");
    });

function doIt() {
    utenteView = new Backbone.SIXHIARA.UtenteView({
        el: document.getElementById("utente"),
        collection: utentes,
        model: exploracao,
    });

    new Backbone.SIXHIARA.InfoView({
        el: document.getElementById("info"),
    });

    // save action
    buttonSaveView = new Backbone.SIXHIARA.ButtonSaveView({
        el: $("#save-button"),
        model: exploracao,
    }).render();

    // page info
    new Backbone.UILib.WidgetsView({
        el: $("#info"),
        model: exploracao,
    }).render();

    // page licencias & fontes: superficial
    var licenseSupView = new Backbone.SIXHIARA.LicenseView({
        el: $("#licencia-superficial"),
        model: exploracao,
        domains: domains,
        tipo_agua: "Superficial",
        selectorButtonAddFonte: "#fonte-superficial",
        selectorModalFonte: "#fonte-superficial-modal",
    }).render();

    // page licencias & fontes: subterranea
    var licenseSubView = new Backbone.SIXHIARA.LicenseView({
        el: $("#licencia-subterranea"),
        model: exploracao,
        domains: domains,
        tipo_agua: "Subterrânea",
        selectorButtonAddFonte: "#fonte-subterranea",
        selectorModalFonte: "#fonte-subterranea-modal",
    }).render();

    // page licencias & fontes: fontes table
    var tableFontesView = new Backbone.SIXHIARA.TableView({
        el: $("#fontes"),
        collection: exploracao.get("fontes"),
        domains: domains,
        rowViewModel: Backbone.SIXHIARA.RowFonteView,
        noDataText: "NON HAI FONTES",
    }).render();
    tableFontesView.listenTo(
        exploracao.get("fontes"),
        "update",
        function (model, collection, options) {
            this.update(exploracao.get("fontes"));
        }
    );

    similarUtentesFoundView = new Backbone.SIXHIARA.UtenteSimilarList({
        el: "#similar-utentes-found",
        collection: new Backbone.SIXHIARA.UtenteSimilarCollection(),
        onLoad: reviewSimilarity.bind(this),
        onSelect: selectUtente.bind(this),
        onClose: reviewSimilarity.bind(this),
    });

    similarExploracaosFoundView = new Backbone.SIXHIARA.ExploracaoSimilarList({
        el: "#similar-exploracaos-found",
        collection: new Backbone.SIXHIARA.ExploracaoSimilarCollection(),
        onLoad: reviewSimilarity.bind(this),
        onClose: reviewSimilarity.bind(this),
    });

    $("#nome").on("keyup", _.debounce(findSimilarUtentes.bind(this), 500));
    $("#nuit").on("keyup", _.debounce(findSimilarUtentes.bind(this), 500));
    $("#telefone").on("keyup", _.debounce(findSimilarUtentes.bind(this), 500));
    $("#email").on("keyup", _.debounce(findSimilarUtentes.bind(this), 500));
    $("#exp_name").on("keyup", _.debounce(findSimilarExploracaos.bind(this), 500));
    $("#exp_id").on("keyup", _.debounce(findSimilarExploracaos.bind(this), 500));
}

function findSimilarUtentes() {
    var nome = $("#nome").val();
    var nuit = $("#nuit").val();
    var telefone = $("#telefone").val();
    var email = $("#email").val();

    var data = {};
    if (nome) {
        data["nome"] = nome;
    }
    if (nuit) {
        data["nuit"] = nuit;
    }
    if (telefone) {
        data["telefone"] = telefone;
    }
    if (email) {
        data["email"] = email;
    }

    if (similarUtentesFoundView && Object.keys(data).length) {
        similarUtentesFoundView.search(data);
    }
}

function selectUtente(utente) {
    if (utenteView) {
        utenteView.selectUtente(utente);
    }
}

function reviewSimilarity() {
    var hasExactUtenteSuggestion =
        similarUtentesFoundView && similarUtentesFoundView.hasExactSuggestion();
    var hasUtenteSuggestions =
        similarUtentesFoundView.hasSuggestions() && similarUtentesFoundView.isShown();
    var hasExactExploracaoSuggestion =
        similarExploracaosFoundView && similarExploracaosFoundView.hasExactSuggestion();
    var hasExploracaoSuggestions =
        similarExploracaosFoundView.hasSuggestions() &&
        similarExploracaosFoundView.isShown();
    if (hasExactUtenteSuggestion) {
        buttonSaveView.disable(
            "Não pode continuar porque na base de dados já há um utente com os mesmos dados."
        );
    } else if (hasUtenteSuggestions) {
        buttonSaveView.disable(
            "Não pode continuar porque na base de dados existem utentes com dados semelhantes.\nFeche a janela de sugestões para poder continuar, somente se tiver certeza de que o utente não existe."
        );
    }
    if (hasExactExploracaoSuggestion) {
        buttonSaveView.disable(
            "Não pode continuar porque na base de dados já há uma exploração com os mesmos dados."
        );
    } else if (hasExploracaoSuggestions) {
        buttonSaveView.disable(
            "Não pode continuar porque na base de dados existem explorações com dados semelhantes.\nFeche a janela de sugestões para poder continuar, somente se tiver certeza de que a exploração não existe."
        );
    }
    if (
        !hasExactUtenteSuggestion &&
        !hasUtenteSuggestions &&
        !hasExactExploracaoSuggestion &&
        !hasExploracaoSuggestions
    ) {
        buttonSaveView.enable();
    }
}

function findSimilarExploracaos() {
    var exp_name = $("#exp_name").val();
    var exp_id = $("#exp_id").val();

    var data = {};
    if (exp_name) {
        data["exp_name"] = exp_name;
    }
    if (exp_id) {
        data["exp_id"] = exp_id;
    }

    if (similarExploracaosFoundView && Object.keys(data).length) {
        similarExploracaosFoundView.search(data);
    }
}

function fillComponentsWithDomains() {
    var actividades = domains.byCategory("actividade");

    // page info: actividade
    new Backbone.UILib.SelectView({
        el: $("#actividade"),
        collection: actividades,
    }).render();
    new Backbone.SIXHIARA.SelectActividadeView({
        el: $("#actividade-select"),
        model: exploracao,
    });

    // page info: localizacao
    new Backbone.SIXHIARA.SelectLocationView({
        domains: domains,
        model: exploracao,
        domainsKeys: ["provincia", "distrito", "posto"],
        el: $("#info"),
    }).render();
    new Backbone.SIXHIARA.SelectBaciaView({
        domains: domains,
        model: exploracao,
        el: $("#info"),
    }).render();

    new Backbone.SIXHIARA.SelectLocationView({
        domains: domains,
        model: exploracao.get("utente"),
        domainsKeys: ["utentes-provincia", "utentes-distrito", "utentes-posto"],
        el: $("#utente"),
    }).render();

    var selectUtenteTipo = new Backbone.UILib.SelectView({
        el: $("#uten_tipo"),
        collection: domains.byCategory("utentes_uten_tipo"),
    }).render();

    var selectSexo = new Backbone.UILib.SelectView({
        el: $("#sexo_gerente"),
        collection: domains.byCategory("sexo"),
    }).render();
}
