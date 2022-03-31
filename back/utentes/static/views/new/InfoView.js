Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.InfoView = Backbone.View.extend({
    initialize: function (options) {
        this.options = options || {};

        var dateId = "d_soli";
        var dateWidget = document.getElementById(dateId);
        dateWidget.addEventListener("input", function (e) {
            var dateWidget = e.target;
            var validDate = formatter().validDateFormat(dateWidget.value);
            if (validDate) {
                dateWidget.setCustomValidity("");
            } else {
                dateWidget.setCustomValidity("A data deve ter o formato correcto");
            }
        });
    },
});
