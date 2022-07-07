Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ButtonExportXLSDivisoesView = Backbone.SIXHIARA.ExportXLSView.extend({
    /* http://sheetjs.com/demos/Export2Excel.js */

    buttonTitle:
        "Para exportar o XLS de Facturação deve ter seleccionada uma Divisão. \n Verifique não ter usado nenhum outro filtro, nem ter feito zoom no mapa",

    events: {
        "click #export-button-xls-divisoes": "exportXLS",
    },

    initialize: function(options) {
        Backbone.SIXHIARA.ExportXLSView.prototype.initialize.call(this);

        this.options = options || {};
        const self = this;
        this.options.where.on("change", function(e) {
            // This code is used to activate and deactivate export-button-xls-divisoes button each time the filters are update.
            var divisao = self.options.where.get("loc_divisao"); // Divisao Filter value
            var filtros = self.options.where.values(); // Filters dictionary
            if (!divisao || Object.keys(filtros).length > 1) {
                SIRHA.Utils.DOM.disableBt(
                    "export-button-xls-divisoes",
                    this.buttonTitle
                );
            } else {
                SIRHA.Utils.DOM.enableBt("export-button-xls-divisoes", " ");
            }
        });
    },

    render: function() {
        this.$el.append(
            $(
                '<button id="export-button-xls-divisoes" type="button" class="btn btn-default btn-xs">XLS Divisões</button>'
            )
        );
        SIRHA.Utils.DOM.disableBt("export-button-xls-divisoes", this.buttonTitle);
    },

    exportXLS: function(evt) {
        var divisao = this.options.where.get("loc_divisao");
        var dateXLS = moment().format("YYYYMM");

        var fileName = dateXLS + "_Facturacao_" + divisao + ".xlsx";

        var exploracaos = this.options.listView.collection.sortBy(function(exp) {
            return exp.get("utente").get("nome");
        });
        var exploracaosFactDivisoes = exploracaos.filter(e => {
            const condicion1 = SIRHA.ESTADO.CATEGORY_INVOIZABLE.includes(
                e.get("estado_lic")
            );
            const condicion2 = e.get("licencias").any(function(lic) {
                return lic.get("consumo_tipo") === "Variável";
            });
            return condicion1 && condicion2;
        });

        var dataExploracaos = this.getData(
            SIXHIARA.xlsFieldsToExportDivisoes["exploracaos"],
            exploracaosFactDivisoes
        );
        var ws_name = dateXLS + "_" + divisao + "_Consumos";
        this.buildAndSaveWorkbook(dataExploracaos, ws_name, fileName);
    },

    formatSheet: function(R, C, cell) {
        // this piece of code is used to format exported Excel on xlsx-style fork library. In case we would return to xlsx(sheet.js) library in the future this code won't work
        if (R == 0) {
            cell.s = {
                font: {bold: true, color: {rgb: "FFFFFF"}, sz: "11"},
                fill: {fgColor: {rgb: "1A5276"}},
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
        if ((R == 0) & (C == 13 || C == 14 || C == 15)) {
            cell.s = {
                font: {bold: true, color: {rgb: "FFFFFF"}, sz: "11"},
                fill: {fgColor: {rgb: "000000"}},
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
        if ((C == 0 || C == 3 || C == 8) & (R !== 0)) {
            cell.s = {
                font: {sz: "10"},
                alignment: {
                    horizontal: "bottom",
                    vertical: "center",
                    wrapText: true,
                },
            };
        }
        if ((C == 12) & (R !== 0)) {
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
        if ((C == 13 || C == 14 || C == 15) & (R !== 0)) {
            cell.s = {
                font: {bold: true, sz: "10"},
                fill: {fgColor: {rgb: "D6EAF8"}},
                alignment: {
                    horizontal: "center",
                    vertical: "center",
                    wrapText: true,
                },
            };
        }
        // End of xlsx-style library code. Remove or cancel in case we return to xlsx(sheetjs) library
    },
});
