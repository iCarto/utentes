$(document).ready(function() {
    document.body.classList.add("wait");
});

var users = new Backbone.SIXHIARA.UserCollection();
var domains = new Backbone.UILib.DomainCollection();

var fetchPromises = function fetchPromises(id) {
    var jqxhr = _.invoke([domains, users], "fetch", {parse: true});
    return _.invoke(jqxhr, "promise");
};

Promise.all(fetchPromises())
    .then(function() {
        whenAllDataIsFetched();
    })
    .catch(function(error) {
        console.log(error);
    })
    .finally(function() {
        document.body.classList.remove("wait");
    });

var whenAllDataIsFetched = function whenAllDataIsFetched() {
    var table = new Backbone.SIXHIARA.EditableTableView({
        el: document.getElementById("section-users"),
        newRowBtSelector: "#newRow",
        modalSelectorTpl: "#user-edit",
        tableSelector: "table",
        collection: users,
        rowTemplate:
            '</td><td><%- username %></td><td><%- usergroup %></td><td><%- divisao || "" %></td><td class="edit uilib-enability uilib-show-role-administrador uilib-show-role-tecnico"><i class="fas fa-edit"></i></td><td class="delete uilib-enability uilib-show-role-administrador uilib-show-role-tecnico"><i class="fas fa-trash-alt"></i></td>',
        collectionModel: Backbone.SIXHIARA.User,
        domains: domains,
        deleteFromServer: true,
    });
};
