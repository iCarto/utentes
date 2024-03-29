var MyWorkflow = {
    renderView: function(exp) {
        var oldExpId =
            this.activeView &&
            this.activeView.model &&
            this.activeView.model.get("exp_id");
        oldExpId &&
            exp &&
            exp.trigger("leaflet", {
                type: "mouseleave",
                exp_id: oldExpId,
            });
        this.activeView && this.activeView.remove && this.activeView.remove();
        var viewClass = this.whichView(exp);
        this.activeView = new viewClass({
            model: exp,
        });
        this.activeView.fetchIfNeeded().then(() => {
            document
                .getElementById("insert-data")
                .appendChild(this.activeView.render().el);
            this.activeView.init && this.activeView.init();
            exp &&
                exp.trigger("leaflet", {
                    type: "mouseover",
                    exp_id: exp.get("exp_id"),
                    notscroll: true,
                });
            iAuth.disabledWidgets("#insert-data");
        });
    },

    whichView: function(exp, next) {
        if (!exp) {
            return Backbone.SIXHIARA.ViewProcesoNoData;
        }

        let state = this.getCurrentState(exp);
        let view = undefined;

        if (SIRHA.ESTADO.CATEGORY_INVOIZABLE.includes(state)) {
            view = Backbone.SIXHIARA.ViewFacturacao;
        } else {
            view = this.whichLicensingView(state, exp);
        }

        return view || Backbone.SIXHIARA.ViewProcesoError;
    },

    whichLicensingView: function(state, exp) {
        switch (state) {
            case SIRHA.ESTADO.INCOMPLETE_DA:
                return Backbone.SIXHIARA.ViewDocIncompletaAdm;
            case SIRHA.ESTADO.INCOMPLETE_DIR:
                return Backbone.SIXHIARA.ViewSecretaria1;
            case SIRHA.ESTADO.INCOMPLETE_DJ:
                if (this.isNotCompleteForFirstDJState(exp)) {
                    return Backbone.SIXHIARA.ViewJuridico2;
                }
                return Backbone.SIXHIARA.ViewJuridico1;
            case SIRHA.ESTADO.INCOMPLETE_DF:
                return Backbone.SIXHIARA.ViewProcesoError;
            case SIRHA.ESTADO.PENDING_REVIEW_DIR:
                return Backbone.SIXHIARA.ViewSecretaria1;
            case SIRHA.ESTADO.PENDING_REVIEW_DJ:
                return Backbone.SIXHIARA.ViewJuridico1;
            case SIRHA.ESTADO.INCOMPLETE_DT:
            case SIRHA.ESTADO.PENDING_FIELD_VISIT:
            case SIRHA.ESTADO.PENDING_TECH_DECISION:
                return Backbone.SIXHIARA.ViewTecnico1;
            case SIRHA.ESTADO.PENDING_EMIT_LICENSE:
                return Backbone.SIXHIARA.ViewJuridico2;
            case SIRHA.ESTADO.PENDING_DIR_SIGN:
                return Backbone.SIXHIARA.ViewSecretaria2;
        }
    },

    isNotCompleteForFirstDJState: function(exp) {
        return (
            exp.get("req_obs").filter(function(o) {
                return o.state === SIRHA.ESTADO.PENDING_EMIT_LICENSE;
            }).length > 0
        );
    },

    isNeedAskForEnteredDocumentationDate(exp, data) {
        var estado_lic = exp.get("estado_lic");
        var nextState = this.whichNextState(estado_lic, data);

        if (data.target.id == "bt-ok") {
            if (estado_lic == SIRHA.ESTADO.INCOMPLETE_DA) {
                return true;
            }
            if (
                estado_lic == SIRHA.ESTADO.INCOMPLETE_DJ &&
                nextState == SIRHA.ESTADO.PENDING_FIELD_VISIT &&
                !this.isNotCompleteForFirstDJState(exp)
            ) {
                return true;
            }
        }
        return false;
    },

    getCurrentState: function(exp) {
        // var lics = exp.get('licencias');
        // var state1 = (lics.at(0) && lics.at(0).get('estado')) || SIRHA.ESTADO.NOT_EXISTS;
        // var state2 = (lics.at(1) && lics.at(1).get('estado')) || SIRHA.ESTADO.NOT_EXISTS;
        //
        // state1 = state1 !== SIRHA.ESTADO.NOT_EXISTS ? state1 : state2;

        return exp.get("estado_lic") || SIRHA.ESTADO.NOT_EXISTS;
    },

    whichNextState: function(currentState, data, exp) {
        if (!data) {
            return currentState;
        }

        switch (currentState) {
            case SIRHA.ESTADO.NOT_EXISTS:
                return this.nextStateAfterNoExiste(data);
            case SIRHA.ESTADO.INCOMPLETE_DA:
                return this.nextStateAfterNoExiste(data);
            case SIRHA.ESTADO.INCOMPLETE_DIR:
                return this.nextStateAfterPteRevDir(data);
            case SIRHA.ESTADO.INCOMPLETE_DJ:
                return this.nextStateAfterPteRevJuri(data);
            case SIRHA.ESTADO.INCOMPLETE_DT:
                return this.nextStateAfterVisitaCampo(data);
            case SIRHA.ESTADO.INCOMPLETE_DF:
                throw "Error";
            case SIRHA.ESTADO.PENDING_REVIEW_DIR:
                return this.nextStateAfterPteRevDir(data);
            case SIRHA.ESTADO.PENDING_REVIEW_DJ:
                return this.nextStateAfterPteRevJuri(data);
            case SIRHA.ESTADO.PENDING_FIELD_VISIT:
                return this.nextStateAfterVisitaCampo(data);
            case SIRHA.ESTADO.PENDING_TECH_DECISION:
                return this.nextStateAfterPteRevDT(data);
            case SIRHA.ESTADO.PENDING_EMIT_LICENSE:
                return this.nextStatePteEmiJuri(data);
            case SIRHA.ESTADO.PENDING_DIR_SIGN:
                return this.nextStatePteFirmaDir(data);
            default:
                throw "Error";
        }
    },

    nextStateAfterNoExiste: function(data) {
        var nextState = undefined;
        if (data.target.id === "bt-ok") {
            nextState = SIRHA.ESTADO.PENDING_REVIEW_DIR;
        }

        if (data.target.id === "bt-no") {
            nextState = SIRHA.ESTADO.INCOMPLETE_DA;
        }
        return nextState;
    },

    nextStateAfterPteRevDir: function(data) {
        var nextState = undefined;
        if (data.target.id === "bt-ok") {
            nextState = SIRHA.ESTADO.PENDING_REVIEW_DJ;
        }

        if (data.target.id === "bt-no") {
            nextState = SIRHA.ESTADO.INCOMPLETE_DIR;
        }
        return nextState;
    },

    nextStateAfterPteRevJuri: function(data) {
        var nextState = undefined;
        if (data.target.attributes && data.target.attributes["data-foo"]) {
            return this.nextStatePteEmiJuri(data);
        }

        if (data.target.id === "bt-ok") {
            nextState = SIRHA.ESTADO.PENDING_FIELD_VISIT;
        }

        if (data.target.id === "bt-no") {
            nextState = SIRHA.ESTADO.INCOMPLETE_DJ;
        }

        if (data.target.id === "bt-noaprobada") {
            nextState = SIRHA.ESTADO.NOT_APPROVED;
        }
        return nextState;
    },

    nextStateAfterVisitaCampo: function(data) {
        var nextState = undefined;
        if (data.target.id === "bt-ok") {
            nextState = SIRHA.ESTADO.PENDING_TECH_DECISION;
        }

        if (data.target.id === "bt-no") {
            nextState = SIRHA.ESTADO.INCOMPLETE_DT;
        }

        if (data.target.id === "bt-noaprobada") {
            nextState = SIRHA.ESTADO.NOT_APPROVED;
        }

        if (data.target.id === "bt-defacto") {
            nextState = SIRHA.ESTADO.DE_FACTO;
        }

        return nextState;
    },

    nextStateAfterPteRevDT: function(data) {
        var nextState = undefined;
        if (data.target.id === "bt-ok") {
            nextState = SIRHA.ESTADO.PENDING_EMIT_LICENSE;
        }

        if (data.target.id === "bt-no") {
            nextState = SIRHA.ESTADO.INCOMPLETE_DT;
        }

        if (data.target.id === "bt-noaprobada") {
            nextState = SIRHA.ESTADO.NOT_APPROVED;
        }

        if (data.target.id === "bt-defacto") {
            nextState = SIRHA.ESTADO.DE_FACTO;
        }

        return nextState;
    },

    nextStatePteEmiJuri: function(data) {
        var nextState = undefined;
        if (data.target.id === "bt-ok") {
            nextState = SIRHA.ESTADO.PENDING_DIR_SIGN;
        }

        if (data.target.id === "bt-no") {
            nextState = SIRHA.ESTADO.INCOMPLETE_DJ;
        }

        if (data.target.id === "bt-noaprobada") {
            nextState = SIRHA.ESTADO.NOT_APPROVED;
        }

        if (data.target.id === "bt-defacto") {
            nextState = SIRHA.ESTADO.DE_FACTO;
        }
        return nextState;
    },

    nextStatePteFirmaDir: function(data) {
        var nextState = undefined;
        if (data.target.id === "bt-ok") {
            nextState = SIRHA.ESTADO.LICENSED;
        }

        if (data.target.id === "bt-noaprobada") {
            nextState = SIRHA.ESTADO.NOT_APPROVED;
        }
        return nextState;
    },

    isFacturacaoNewStateValid: function(currentState, nextState) {
        switch (currentState) {
            case window.SIRHA.ESTADO_FACT.PENDING_CONSUMPTION:
                return nextState == window.SIRHA.ESTADO_FACT.PENDING_INVOICE;
            case window.SIRHA.ESTADO_FACT.PENDING_INVOICE:
                return nextState == window.SIRHA.ESTADO_FACT.PENDING_PAYMENT;
            case window.SIRHA.ESTADO_FACT.PENDING_PAYMENT:
                return nextState == window.SIRHA.ESTADO_FACT.PAID;
            case window.SIRHA.ESTADO_FACT.PAID:
                return false;
            default:
                throw false;
        }
    },

    whichFacturacaoNextState: function(currentState) {
        switch (currentState) {
            case window.SIRHA.ESTADO_FACT.PENDING_CONSUMPTION:
                return window.SIRHA.ESTADO_FACT.PENDING_INVOICE;
            case window.SIRHA.ESTADO_FACT.PENDING_INVOICE:
                return window.SIRHA.ESTADO_FACT.PENDING_PAYMENT;
            case window.SIRHA.ESTADO_FACT.PENDING_PAYMENT:
                return window.SIRHA.ESTADO_FACT.PAID;
            default:
                throw "Error";
        }
    },
};

window["wf"] = Object.create(MyWorkflow);
