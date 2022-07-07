Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ButtonExportXLSView = Backbone.SIXHIARA.ExportXLSView.extend({
    /* http://sheetjs.com/demos/Export2Excel.js */

    events: {
        "click #export-button-xls": "exportXLS",
    },

    initialize: function(options) {
        Backbone.SIXHIARA.ExportXLSView.prototype.initialize.call(this);

        this.options = options || {};
    },

    render: function() {
        this.$el.append(
            $(
                '<button id="export-button-xls" type="button" class="btn btn-default btn-xs">XLS</button>'
            )
        );
    },

    exportXLS: function(evt) {
        var dateXLS = moment().format("YYYYMMDD");

        var fileName = dateXLS + "_Exploracoes.xlsx";

        var exploracaos = this.options.listView.collection.sortBy(function(exp) {
            return exp.get("utente").get("nome");
        });

        var dataExploracaos = this.getData(
            SIXHIARA.xlsFieldsToExport["exploracaos"],
            exploracaos
        );
        var ws_name = dateXLS + " Explorações";
        this.buildAndSaveWorkbook(dataExploracaos, ws_name, fileName);
    },

    formatSheet: function(R, C, cell) {
        // this piece of code is used to format exported Excel on xlsx-style fork library. In case we would return to xlsx(sheet.js) library in the future this code won't work
        if (R == 0) {
            cell.s = {
                font: {bold: true, color: {rgb: "FFFFFF"}, sz: "11"},
                fill: {fgColor: {rgb: "337AB7"}},
                alignment: {
                    horizontal: "center",
                    vertical: "center",
                    wrapText: true,
                },
                border: {
                    top: {style: "thin"},
                    bottom: {style: "thin"},
                    left: {style: "thin"},
                    right: {style: "thin"},
                },
            };
        }
        if (R !== 0) {
            cell.s = {
                font: {sz: "10"},
                alignment: {
                    horizontal: "center",
                    vertical: "center",
                    wrapText: true,
                },
            };
        }
        if ((C == 0 || C == 5 || C == 11) & (R !== 0)) {
            cell.s = {
                font: {sz: "10"},
                alignment: {
                    horizontal: "bottom",
                    vertical: "center",
                    wrapText: true,
                },
            };
        }
        if ((C == 33) & (R !== 0)) {
            cell.s = {
                font: {sz: "10"},
                alignment: {
                    horizontal: "center",
                    vertical: "center",
                    wrapText: true,
                },
                border: {right: {style: "thin"}},
            };
        }
        // End of xlsx-style library code. Remove or cancel in case we return to xlsx(sheetjs) library
    },
});
