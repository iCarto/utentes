var MyWorkflowRenovacao = {
    // Customized copy of MyWorkflow for the license renovacao process

    SINGLE_USER: 'SINGLE_USER',
    USER_COOKIE_KEY: 'utentes_stub_user',

    getUser: function() {
        var user = document.cookie.replace(/(?:(?:^|.*;\s*)utentes_stub_user\s*\=\s*([^;]*).*$)|^.*$/, '$1');
        return user;
    },

    getMainRole: function() {
        // Usar además del ROL el ARA o tener un ROL_SINGLE_USER
        // En todo caso los ROLES deberian ser una clase aparte
        var role = document.cookie.replace(/(?:(?:^|.*;\s*)utentes_stub_role\s*\=\s*([^;]*).*$)|^.*$/, '$1');
        role = decodeURIComponent(role);
        if (![ROL_ADMIN, ROL_OBSERVADOR, ROL_UNIDAD_DELEGACION, ROL_ADMINISTRATIVO, ROL_FINANCIERO, ROL_DIRECCION, ROL_TECNICO, ROL_JURIDICO].includes(role)) {
            throw Error('Not valid role');
        }
        return role;
    },

    getRoles: function(safeRoleFormat) {
        safeRoleFormat = safeRoleFormat || 'safe';
        switch (safeRoleFormat) {
            case 'safe':
                return this.getAllRolesSafe();
            case 'not-safe':
                return this.getAllRolesNotSafe();
            default:
                throw Error('This should never happen');
        }
    },

    /*
    Un usuario debería poder tener varios roles. Por razones históricas se ha
    asumido una relación 1:1 en la mayoría del código, llamadas a getMainRole
    Pero hay que ir refactorizando para usar una relación 1:n
    O mejor todavía pasar aun sistema basado en permisos y no en roles

    Todo esto del rol del usuario habría que cachearlo y no generarlo cada vez
    que se haga la petición
    */
    getAllRolesSafe: function() {
        var roles = [this.getMainRoleSafe()];

        if (this.getUser() === this.SINGLE_USER) {
            roles.push(ROL_SINGLE_SAFE);
        }
        if (roles.includes(this.getMainRoleSafe(ROL_UNIDAD_DELEGACION))) {
            roles.push(this.getMainRoleSafe(ROL_OBSERVADOR));
        }
        return roles;
    },

    getAllRolesNotSafe: function() {
        var roles = [this.getMainRole()];
        if (this.getUser() === this.SINGLE_USER) {
            roles.push(ROL_SINGLE_SAFE);
        }
        if (roles.includes(ROL_UNIDAD_DELEGACION)) {
            roles.push(ROL_OBSERVADOR);
        }
        return roles;
    },

    getMainRoleSafe: function(role) {
        if (!role){
            var role = this.getMainRole();
        }
        switch (role) {
        case ROL_ADMIN:
            return 'administrador';
        case ROL_OBSERVADOR:
            return 'observador';
        case ROL_ADMINISTRATIVO:
            return 'administrativo';
        case ROL_FINANCIERO:
            return 'financieiro';
        case ROL_DIRECCION:
            return 'direccao';
        case ROL_TECNICO:
            return 'tecnico';
        case ROL_UNIDAD_DELEGACION:
            return 'unidade';
        case ROL_JURIDICO:
            return 'juridico';
        }
    },

    isAdmin: function(role) {
        if(!role) {
            role = wfr.getMainRole();
        }
        return role === ROL_ADMIN;
    },

    isDirector: function(role) {
        if(!role) {
            role = wfr.getMainRole();
        }
        return role === ROL_DIRECCION;
    },

    isObservador: function(role) {
        if(!role) {
            role = wfr.getMainRole();
        }
        return role === ROL_OBSERVADOR;
    },

    hasRoleObservador: function(roles) {
        if(!roles) {
            var roles = this.getRoles('not-safe');
        }
        return roles.includes(ROL_OBSERVADOR);
    },

    init: function() {
    },

    renderView: function(exp) {
        var oldExpId = this.activeView && this.activeView.model && this.activeView.model.get('exp_id');
        oldExpId && exp && exp.trigger('leaflet', {
            'type': 'mouseleave',
            'exp_id': oldExpId,
        });
        this.activeView && this.activeView.remove && this.activeView.remove();
        var viewClass = this.whichView(exp);
        this.activeView = new viewClass({
            model: exp,
        });
        document.getElementById('insert-data').appendChild(this.activeView.render().el);
        this.activeView.init && this.activeView.init();
        exp && exp.trigger('leaflet', {
            'type': 'mouseover',
            'exp_id': exp.get('exp_id'),
            'notscroll': true,
        });
        wfr.disabledWidgets('#insert-data');
    },

    whichView: function(exp, next) {
        var LIC_ST = Backbone.SIXHIARA.EstadoRenovacao;

        if (!exp) {
            return Backbone.SIXHIARA.ViewNoData;
        }

        var state = this.getCurrentState(exp);
        var role = this.getMainRole();

        switch (state) {
        case LIC_ST.NOT_EXISTS:
            break;
        case LIC_ST.PENDING_RENOV_LICENSE:
            return Backbone.SIXHIARA.ViewSecretaria0;
        case LIC_ST.INCOMPLETE_DA:
            return Backbone.SIXHIARA.ViewSecretaria0;
        case LIC_ST.INCOMPLETE_DIR:
            return Backbone.SIXHIARA.ViewSecretaria1;
        case LIC_ST.INCOMPLETE_DJ:
            if (this.isNotCompleteForFirstDJState(exp)) {
                return Backbone.SIXHIARA.ViewJuridico2;
            }

            if (role === ROL_JURIDICO || role === ROL_ADMIN || role === ROL_OBSERVADOR) {
                return Backbone.SIXHIARA.ViewJuridico1;
            };
            if (role === ROL_TECNICO || role == ROL_UNIDAD_DELEGACION) {
                return Backbone.SIXHIARA.ViewJuridicoNotEditable;
            };
        case LIC_ST.PENDING_REVIEW_DIR:
            return Backbone.SIXHIARA.ViewSecretaria1;
        case LIC_ST.PENDING_REVIEW_DJ:
            if (role === ROL_JURIDICO || role === ROL_ADMIN || role === ROL_OBSERVADOR) {
                return Backbone.SIXHIARA.ViewJuridico1;
            };
            if (role === ROL_TECNICO || role == ROL_UNIDAD_DELEGACION) {
                return Backbone.SIXHIARA.ViewJuridicoNotEditable;
            };
        case LIC_ST.INCOMPLETE_DT:
        case LIC_ST.PENDING_FIELD_VISIT:
        case LIC_ST.PENDING_TECH_DECISION:
            /*
             admin, tecnico, unidad. Hay que ponerlo. Si no, si por ejemplo jurídico
             pudiera ver este estado se le estaría renderizando esto.
            */
            return Backbone.SIXHIARA.ViewTecnico;
        case LIC_ST.PENDING_EMIT_LICENSE:
            // admin, juridico
            return Backbone.SIXHIARA.ViewJuridico2;
        case LIC_ST.PENDING_DADOS_LICENSE:
            // admin, secretaria
            return Backbone.SIXHIARA.ViewJuridicoDados;
        case LIC_ST.PENDING_DIR_SIGN:
            // admin, secretaria
            return Backbone.SIXHIARA.ViewSecretaria2;
        default:
            return Backbone.SIXHIARA.UpsView;;
        }
        return Backbone.SIXHIARA.UpsView;
    },

    isNotCompleteForFirstDJState: function(exp) {
        return exp.get('renovacao').get('obser').filter(function(o){
                return o.state === Backbone.SIXHIARA.EstadoRenovacao.PENDING_EMIT_LICENSE;
            }).length > 0
    },

    isNeedAskForEnteredDocumentationDate(exp, data) {
        var LIC_ST = Backbone.SIXHIARA.EstadoRenovacao;
        var estado = exp.get('renovacao').get("estado");
        var nextState = this.whichNextState(estado, data)

        if (data.target.id == 'bt-ok') {
            if (estado == LIC_ST.INCOMPLETE_DA) {
                    return true
            }
            if (estado == LIC_ST.INCOMPLETE_DJ &&
                nextState == LIC_ST.PENDING_TECH_DECISION &&
                !this.isNotCompleteForFirstDJState(exp)) {
                    return true;
            }
        }
        return false
    },

    hasNextStateSameRole: function(exp, estados){
        var role = wfr.getMainRole();
        var estado = exp.get('renovacao').get("estado");
        var nextState = wfr.whichNextState(estado)
        var filtered = estados.filter(function(s) {
            return s.key.indexOf(nextState) !== -1;
        });
        return filtered.length && filtered[0].roles.indexOf(role) !== -1

    },

    getCurrentState: function(exp) {
        return exp.get('renovacao').get("estado") || Backbone.SIXHIARA.EstadoRenovacao.NOT_EXISTS;
    },

    whichNextState: function(currentState, data, exp) {
        // Igual en lugar de currentState se le puede pasar la explotación
        var LIC_ST = Backbone.SIXHIARA.EstadoRenovacao;
        if (!data) {
            return currentState;
        }

        switch (currentState) {
        case LIC_ST.NOT_EXISTS:
            return this.nextStateAfterNoExiste(data);
        case LIC_ST.PENDING_RENOV_LICENSE:
            return this.nextStateAfterNoExiste(data);
        case LIC_ST.INCOMPLETE_DA:
            return this.nextStateAfterNoExiste(data);
        case LIC_ST.INCOMPLETE_DIR:
            return this.nextStateAfterPteRevDir(data);
        case LIC_ST.PENDING_DADOS_LICENSE:
            return this.nextStateAfterPteDadosLic(data);
        case LIC_ST.INCOMPLETE_DJ:
            return this.nextStateAfterPteRevJuri(data);
        case LIC_ST.INCOMPLETE_DT:
            return this.nextStateAfterVisitaCampo(data);
        case LIC_ST.PENDING_REVIEW_DIR:
            return this.nextStateAfterPteRevDir(data);
        case LIC_ST.PENDING_REVIEW_DJ:
            return this.nextStateAfterPteRevJuri(data);
        case LIC_ST.PENDING_FIELD_VISIT:
            return this.nextStateAfterVisitaCampo(data);
        case LIC_ST.PENDING_TECH_DECISION:
            return this.nextStateAfterPteRevDT(data);
        case LIC_ST.PENDING_EMIT_LICENSE:
            return this.nextStatePteEmiJuri(data);
        case LIC_ST.PENDING_DIR_SIGN:
            return this.nextStatePteFirmaDir(data);
        default:
            throw 'Error';
        }
    },

    nextStateAfterNoExiste: function(data) {
        var LIC_ST = Backbone.SIXHIARA.EstadoRenovacao;
        var nextState = undefined;
        if (data.target.id === 'bt-ok') {
            nextState = LIC_ST.PENDING_REVIEW_DIR;
        }
        if (data.target.id === 'bt-no') {
            nextState = LIC_ST.INCOMPLETE_DA;
        }
        return nextState;
    },

    nextStateAfterPteRevDir: function(data) {
        var LIC_ST = Backbone.SIXHIARA.EstadoRenovacao;
        var nextState = undefined;
        if (data.target.id === 'bt-ok') {
            nextState = LIC_ST.PENDING_REVIEW_DJ;
        }

        if (data.target.id === 'bt-no') {
            nextState = LIC_ST.INCOMPLETE_DIR;
        }
        return nextState;
    },

    nextStateAfterPteRevJuri: function(data) {
        var LIC_ST = Backbone.SIXHIARA.EstadoRenovacao;
        var nextState = undefined;
        if (data.target.attributes && data.target.attributes['data-foo']) {
            return this.nextStatePteEmiJuri(data);
        }

        if (data.target.id === 'bt-ok') {
            nextState = LIC_ST.PENDING_TECH_DECISION;
        }

        if (data.target.id === 'bt-no') {
            nextState = LIC_ST.INCOMPLETE_DJ;
        }

        if (data.target.id === 'bt-noaprobada') {
            nextState = LIC_ST.NOT_APPROVED;
        }
        return nextState;
    },

    nextStateAfterVisitaCampo: function(data) {
        var LIC_ST = Backbone.SIXHIARA.EstadoRenovacao;
        var nextState = undefined;
        if (data.target.id === 'bt-ok') {
            nextState = LIC_ST.PENDING_TECH_DECISION;
        }

        if (data.target.id === 'bt-no') {
            nextState = LIC_ST.INCOMPLETE_DT;
        }

        if (data.target.id === 'bt-noaprobada') {
            nextState = LIC_ST.NOT_APPROVED;
        }

        if (data.target.id === 'bt-defacto') {
            nextState = LIC_ST.DE_FACTO;
        }

        return nextState;
    },

    nextStateAfterPteRevDT: function(data) {
        var LIC_ST = Backbone.SIXHIARA.EstadoRenovacao;

        var nextState = undefined;
        if (data.target.id === 'bt-ok') {
            nextState = LIC_ST.PENDING_EMIT_LICENSE;
        }

        if (data.target.id === 'bt-no') {
            nextState = LIC_ST.INCOMPLETE_DT;
        }

        if (data.target.id === 'bt-noaprobada') {
            nextState = LIC_ST.NOT_APPROVED;
        }

        if (data.target.id === 'bt-defacto') {
            nextState = LIC_ST.DE_FACTO;
        }

        return nextState;
    },

    nextStatePteEmiJuri: function(data) {
        var LIC_ST = Backbone.SIXHIARA.EstadoRenovacao;
        var id = data.target.id;

        var nextState = undefined;
        if (data.target.id === 'bt-ok') {
            nextState = LIC_ST.PENDING_DADOS_LICENSE;
        }

        if (data.target.id === 'bt-no') {
            nextState = LIC_ST.INCOMPLETE_DJ;
        }

        if (data.target.id === 'bt-noaprobada') {
            nextState = LIC_ST.NOT_APPROVED;
        }

        if (data.target.id === 'bt-defacto') {
            nextState = LIC_ST.DE_FACTO;
        }
        return nextState;
    },

    nextStatePteFirmaDir: function(data) {
        var LIC_ST = Backbone.SIXHIARA.EstadoRenovacao;

        var nextState = undefined;
        if (data.target.id === 'bt-ok') {
            nextState = LIC_ST.LICENSED;
        }

        if (data.target.id === 'bt-noaprobada') {
            nextState = LIC_ST.NOT_APPROVED;
        }
        return nextState;
    },
    nextStateAfterPteDadosLic: function(data) {
        var LIC_ST = Backbone.SIXHIARA.EstadoRenovacao;

        var nextState = undefined;
        if (data.target.id === 'bt-ok') {
            nextState = LIC_ST.PENDING_DIR_SIGN;
        }

        if (data.target.id === 'bt-noaprobada') {
            nextState = LIC_ST.NOT_APPROVED;
        }
        return nextState;
    },

    disabledWidgets: function(selector) {
        var baseElement = document;
        if (selector) {
            baseElement = document.querySelectorAll(selector)[0];
        }

        var elements = baseElement.getElementsByClassName('uilib-enability');
        Array.prototype.forEach.call(elements, function(w) {
            var rolesEnabled = [];
            var rolesDisabled = [];
            var rolesShowed = [];
            var rolesHide = [];
            w.classList.forEach(function(c){
                if (c.startsWith('uilib-enable-role')) {
                    rolesEnabled.push(c.split('role-')[1]);
                }
                if (c.startsWith('uilib-disable-role')) {
                    rolesDisabled.push(c.split('role-')[1]);
                }
                if (c.startsWith('uilib-show-role')) {
                    rolesShowed.push(c.split('role-')[1]);
                }
                if (c.startsWith('uilib-hide-role')) {
                    rolesHide.push(c.split('role-')[1]);
                }
            });
            if (!w.hasAttribute('disabled')) {
                if (rolesEnabled.length && !wfr.user_roles_in(rolesEnabled) ||
                    rolesDisabled.length && wfr.user_roles_in(rolesDisabled)) {
                    w.disabled = true;
                }
            }
            if (rolesShowed.length && !wfr.user_roles_in(rolesShowed) ||
                rolesHide.length && wfr.user_roles_in(rolesHide)) {
                    w.style.display = 'none';
            }
        });
    },

    isFirstState: function(currentState){
        var LIC_ST = Backbone.SIXHIARA.EstadoRenovacao;
        var nextState = this.whichNextState(currentState)
        return nextState == LIC_ST.PENDING_RENOV_LICENSE ||
               nextState == LIC_ST.INCOMPLETE_DA;
    },

    user_roles_in: function(roles, safeRoleFormat) {
        /* roles is an array of roles.
           safeRoleFormat defines if the `roles` array contains the roles in
           'safe' format mode or in 'not-safe' mode
        */

        var userRoles = this.getRoles(safeRoleFormat);
        return _.intersection(userRoles, roles).length > 0;
    },

    user_roles_not_in: function(roles, safeRoleFormat) {
        return !this.user_roles_in(roles, safeRoleFormat);
    },

    canDraw: function() {
        return [ROL_TECNICO, ROL_ADMIN].includes(this.getMainRole());
    }
};

window['wfr'] = Object.create(MyWorkflowRenovacao);
$(document).ready(function() {
    wfr.disabledWidgets('menu');
});
