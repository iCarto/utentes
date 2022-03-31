var domains = new Backbone.UILib.DomainCollection();
var domainsFetched = function (collection, response, options) {
    new Backbone.UILib.SelectView({
        el: $("#sexo_gerente"),
        collection: domains.byCategory("sexo"),
    }).render();
};
domains.fetch({
    success: domainsFetched,
});

var fileModalView = new Backbone.SIXHIARA.FileModalView({
    uploadInmediate: false,
    components: ["upload"],
});

function init() {
    document.querySelectorAll('form input[type="checkbox"]').forEach(function (input) {
        input.addEventListener("change", enableBts);
    });
    document.getElementById("exp_name").addEventListener("input", enableBts);
    document.getElementById("sexo_gerente").addEventListener("change", enableBts);
    document.getElementById("d_soli").addEventListener("input", enableBts);

    document.getElementById("js-btns-next").addEventListener("click", function (e) {
        fillExploracao(e);
    });

    var wf_tmp = Object.create(MyWorkflow);
    var NOT_EXISTS = SIRHA.ESTADO.NOT_EXISTS;
    var nextStateOk = wf_tmp.whichNextState(NOT_EXISTS, {target: {id: "bt-ok"}});
    var nextStateNo = wf_tmp.whichNextState(NOT_EXISTS, {target: {id: "bt-no"}});
    document.getElementById("bt-ok").title = nextStateOk;
    document.getElementById("bt-no").title = nextStateNo;

    enableBts();

    $('[data-toggle="tooltip"]').tooltip();
}

    }
}

function enableBts() {
    var exp_name = document.getElementById("exp_name");
    var sexo_gerente = document.getElementById("sexo_gerente");

    var dateWidget = document.getElementById("d_soli");
    var dateObj = formatter().unformatDate(dateWidget.value);
    var validDate =
        dateObj &&
        formatter().validDateFormat(dateWidget.value) &&
        !formatter().isFuture(dateObj);
    if (validDate) {
        dateWidget.setCustomValidity("");
    } else {
        dateWidget.setCustomValidity(
            "A data não tem o formato correcto ou não tem um valor válido"
        );
    }

    var enableBtNo =
        exp_name.value && exp_name.value.length > 3 && sexo_gerente.value && validDate;

    document.getElementById("bt-no").disabled = !enableBtNo;

    var enable =
        enableBtNo &&
        Array.from(document.querySelectorAll('form input[type="checkbox"]')).every(
            input => {
                if (input.required) {
                    return input.checked;
                }
                return true;
            }
        );

    document.getElementById("bt-ok").disabled = !enable;

}

function fillExploracao(e, autosave) {
    var exploracao = new Backbone.SIXHIARA.Exploracao({
        estado_lic: SIRHA.ESTADO.NOT_EXISTS,
    });

    exploracao.set("exp_name", document.getElementById("exp_name").value);
    exploracao.set("sexo_gerente", document.getElementById("sexo_gerente").value);

    var nextState = wf.whichNextState(exploracao.get("estado_lic"), e);
    var currentComment = exploracao.get("req_obs").slice(-1)[0];
    Object.assign(currentComment, {
        create_at: formatter().now(),
        author: iAuth.getUser(),
        text: document.getElementById("observacio").value,
        state: nextState,
    });
    if (!autosave) {
        exploracao.get("req_obs").push({
            create_at: null,
            author: null,
            text: null,
            state: null,
        });
    }

    exploracao.setLicState(nextState);

    if (
        exploracao.get("estado_lic") == SIRHA.ESTADO.INCOMPLETE_DA ||
        exploracao.get("estado_lic") == SIRHA.ESTADO.INCOMPLETE_DJ
    ) {
        exploracao.setDocPendenteUtente();
    }

    document.querySelectorAll('form input[type="checkbox"]').forEach(function (input) {
        exploracao.set(input.id, input.checked);
    });

    var dateId = "d_soli";
    var dateWidget = document.getElementById(dateId);
    var dateObj = formatter().unformatDate(dateWidget.value);
    exploracao.set(dateId, dateObj);
    exploracao.set("d_ultima_entrega_doc", dateObj);

    exploracao.urlRoot = Backbone.SIXHIARA.Config.apiRequerimentos;
    bootbox.confirm(
        `Vai criar-se uma nova exploração com estado: <br> <strong>${nextState}</strong>`,
        function (result) {
            if (!result) {
                return;
            }
            exploracao.save(null, {
                patch: true,
                validate: false,
                wait: true,
                success: function (model) {
                    if (fileModalView.hasPendingFiles()) {
                        fileModalView.handlePendingFiles(model);
                    } else {
                        bootbox.alert(
                            `A exploração&nbsp;<strong>${model.get(
                                "exp_id"
                            )} - ${model.get(
                                "exp_name"
                            )}</strong>&nbsp;tem sido criada correctamente.`,
                            function () {
                                window.location = Backbone.SIXHIARA.Config.urlPendentes;
                            }
                        );
                    }
                },
                error: function () {
                    bootbox.alert(
                        '<span style="color: red;">Produziu-se um erro. Informe ao administrador.</strong>'
                    );
                },
            });
        }
    );
}

init();
