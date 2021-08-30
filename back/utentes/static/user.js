$(document).ready(function() {
    document.body.classList.add("wait");
});

var user = new Backbone.SIXHIARA.User();
var domains = new Backbone.UILib.DomainCollection();

var fetchPromises = function fetchPromises(id) {
    var jqxhr = _.invoke([domains, user], "fetch", {parse: true});
    return _.invoke(jqxhr, "promise");
};

var id = document.getElementById("userid").innerHTML;
user.set("id", id);

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
    new Backbone.UILib.SelectView({
        el: document.getElementById("usergroup"),
        collection: domains.byCategory("groups"),
        useAlias: false,
    }).render();
    document.getElementById("usergroup").disabled = true;

    if (iAuth.isDivisao()) {
        new Backbone.UILib.SelectView({
            el: document.getElementById("divisao"),
            collection: new Backbone.Collection(
                new Backbone.Model({text: user.get("divisao")})
            ),
        }).render();
        document.getElementById("divisao").disabled = true;
        document.getElementById("divisao-form").classList.remove("hidden");
    }

    new Backbone.UILib.WidgetsView({
        el: document.getElementById("perfil_usuario"),
        model: user,
    }).render();

    new Backbone.UILib.PasswordView({
        el: document.getElementById("password-view"),
        model: user,
        required: false,
    }).render();

    document.getElementById("okButton").addEventListener("click", function() {
        user.save(null, {
            wait: true,
            success: function() {
                alert("Senha mudada correctamente");
            },
            error: function(xhr, textStatus) {
                if (
                    textStatus &&
                    textStatus.responseJSON &&
                    textStatus.responseJSON.error
                ) {
                    if (Array.isArray(textStatus.responseJSON.error)) {
                        alert(textStatus.responseJSON.error.join("\n"));
                    } else {
                        alert(textStatus.responseJSON.error);
                    }
                } else {
                    alert(textStatus.statusText);
                }
            },
        });
    });
};
