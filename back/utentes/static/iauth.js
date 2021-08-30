/*
iCarto Authentication and Authorization

* Esta funcionalidad no contempla ahora mismo algunas situaciones de interés:

* Herencia de roles
* Orden de aplicación de roles (si hay permisos contradictorios)
* Usar permisos en lugar de usar roles para la autorización final
* Todo este tema de permisos/roles habría que cachearlo y no generarlo cada vez
    que se haga la petición
*
*/

var IAuth = {
    getUser: function() {
        var user = document.cookie.replace(
            /(?:(?:^|.*;\s*)utentes_stub_user\s*\=\s*([^;]*).*$)|^.*$/,
            "$1"
        );
        return user;
    },

    getGroup: function() {
        var group = document.cookie.replace(
            /(?:(?:^|.*;\s*)utentes_stub_group\s*\=\s*([^;]*).*$)|^.*$/,
            "$1"
        );
        return decodeURIComponent(group);
    },

    getMainRole: function() {
        let group = iAuth.getGroup();
        if (!Object.values(SIRHA.GROUP).includes(group)) {
            throw Error("Not valid group");
        }
        return SIRHA.GROUPS_TO_ROLES[group][0];
    },

    getDivisao: function() {
        var divisao = document.cookie.replace(
            /(?:(?:^|.*;\s*)utentes_stub_divisao\s*\=\s*([^;]*).*$)|^.*$/,
            "$1"
        );
        divisao = decodeURIComponent(divisao);
        return divisao;
    },

    getRoles: function(safeRoleFormat) {
        safeRoleFormat = safeRoleFormat || "safe";
        switch (safeRoleFormat) {
            case "safe":
                return this.getAllRolesSafe();
            case "not-safe":
                return this.getAllRolesNotSafe();
            default:
                throw Error("This should never happen");
        }
    },

    getAllRolesSafe: function() {
        var notSafeRoles = iAuth.getAllRolesNotSafe();
        return this.asSafeRoles(notSafeRoles);
    },

    getAllRolesNotSafe: function() {
        var roles = window.SIRHA.GROUPS_TO_ROLES[this.getGroup()];
        return roles;
    },

    ensureIsSafeRole: function(role) {
        switch (role) {
            case SIRHA.ROLE.ADMIN:
                return "administrador";
            case SIRHA.ROLE.OBSERVADOR:
                return "observador";
            case SIRHA.ROLE.ADMINISTRATIVO:
                return "administrativo";
            case SIRHA.ROLE.FINANCIERO:
                return "financieiro";
            case SIRHA.ROLE.DIRECCION:
                return "direccao";
            case SIRHA.ROLE.TECNICO:
                return "tecnico";
            case SIRHA.ROLE.BASIN_DIVISION:
                return "divisao";
            case SIRHA.ROLE.JURIDICO:
                return "juridico";
                throw Error("Not valid role");
        }
    },

    asSafeRoles: function(roles) {
        roles = roles || [];
        roles = _.isArray(roles) ? roles : [roles];
        return roles.map(r => this.ensureIsSafeRole(r));
    },

    isAdmin: function(role) {
        if (!role) {
            role = iAuth.getMainRole();
        }
        return role === SIRHA.ROLE.ADMIN;
    },

    isObservador: function(role) {
        if (!role) {
            role = iAuth.getMainRole();
        }
        return role === SIRHA.ROLE.OBSERVADOR;
    },

    isDivisao: function(role) {
        if (!role) {
            role = iAuth.getMainRole();
        }
        return role === SIRHA.ROLE.BASIN_DIVISION;
    },

    hasRoleObservador: function(roles) {
        if (!roles) {
            var roles = this.getRoles("not-safe");
        }
        return roles.includes(SIRHA.ROLE.OBSERVADOR);
    },

    hasRoleTecnico: function(roles) {
        if (!roles) {
            var roles = this.getRoles("not-safe");
        }
        return roles.includes(SIRHA.ROLE.TECNICO);
    },

    disabledWidgets: function(selector, roles_only_read) {
        roles_only_read = roles_only_read || [];

        var baseElement = document;
        if (selector) {
            baseElement = document.querySelectorAll(selector)[0];
        }

        var elements = baseElement.getElementsByClassName("uilib-enability");
        Array.prototype.forEach.call(elements, function(w) {
            var rolesEnabled = [];
            var rolesDisabled = roles_only_read;
            var rolesShowed = [];
            var rolesHide = [];
            w.classList.forEach(function(c) {
                if (c.startsWith("uilib-enable-role")) {
                    rolesEnabled.push(c.split("role-")[1]);
                }
                if (c.startsWith("uilib-disable-role")) {
                    rolesDisabled.push(c.split("role-")[1]);
                }
                if (c.startsWith("uilib-show-role")) {
                    rolesShowed.push(c.split("role-")[1]);
                }
                if (c.startsWith("uilib-hide-role")) {
                    rolesHide.push(c.split("role-")[1]);
                }
            });
            if (!w.hasAttribute("disabled")) {
                if (
                    (rolesEnabled.length && !iAuth.user_roles_in(rolesEnabled)) ||
                    (rolesDisabled.length && iAuth.user_roles_in(rolesDisabled))
                ) {
                    w.disabled = true;
                }
            }
            if (
                (rolesShowed.length && !iAuth.user_roles_in(rolesShowed)) ||
                (rolesHide.length && iAuth.user_roles_in(rolesHide))
            ) {
                w.style.display = "none";
            }
        });
    },

    user_roles_in: function(roles, safeRoleFormat) {
        /* roles is an array of roles.
           safeRoleFormat defines if the `roles` array contains the roles in
           'safe' format mode or in 'not-safe' mode
        */
        roles = roles || [];
        var userRoles = this.getRoles(safeRoleFormat);
        // return _.intersection(userRoles, roles).length > 0;
        var intersection = [userRoles, roles].reduce((a, c) =>
            a.filter(i => c.includes(i))
        );
        return intersection.length > 0;
    },

    user_roles_not_in: function(roles, safeRoleFormat) {
        return !this.user_roles_in(roles, safeRoleFormat);
    },

    canDraw: function() {
        return this.user_roles_in([SIRHA.ROLE.TECNICO, SIRHA.ROLE.ADMIN], "not-safe");
    },
};

window.iAuth = Object.create(IAuth);

// https://stackoverflow.com/questions/9899372/
if (document.readyState !== "loading") {
    iAuth.disabledWidgets("menu");
} else {
    document.addEventListener("DOMContentLoaded", function() {
        document.removeEventListener("DOMContentLoaded", this);
        iAuth.disabledWidgets("menu");
    });
}
