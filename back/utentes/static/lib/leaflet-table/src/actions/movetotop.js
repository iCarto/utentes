var MoveToTop = L.ToolbarAction.extend({
    options: {
        toolbarIcon: {
            html: '<i class="fas fa-arrow-up"></i>',
            tooltip: "Mover arriba",
        },
    },

    addHooks: function() {
        table.moveToTop();
    },
});
