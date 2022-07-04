function Workbook() {
    if (!(this instanceof Workbook)) return new Workbook();
    this.SheetNames = [];
    this.Sheets = {};
}

Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ButtonExportXLSDivisoesView = Backbone.View.extend({
    /* http://sheetjs.com/demos/Export2Excel.js */

    events: {
        "click #export-button-xls-divisoes": "exportXLS",
    },

    initialize: function(options) {
        this.options = options || {};
        this.options.where.on("change", function(e) {
            // This code is used to activate and deactivate export-button-xls-divisoes button each time the filters are update.
            var divisao = document.getElementById("loc_divisao").value;
            var filtros = document.getElementsByClassName("form-control widget");
            var filtrosValue = [];
            for (var i = 0; i < filtros.length; i++) {
                filtrosValue.push(filtros[i].value);
            }
            var filtrosNoDivisao = filtrosValue
                .filter(item => item !== divisao)
                .filter(Boolean); // Erase empty values created in first filter
            if (!divisao || filtrosNoDivisao.length) {
                document.getElementById("export-button-xls-divisoes").disabled = true;
                document.getElementById("export-button-xls-divisoes").title =
                    "Para exportar o XLS de Facturação deve ter seleccionada uma Divisão. \n Verifique não ter usado nenhum outro filtro";
            } else {
                document.getElementById("export-button-xls-divisoes").disabled = false;
            }
        });
    },

    render: function() {
        this.$el.append(
            $(
                '<button id="export-button-xls-divisoes" type="button" class="btn btn-default btn-xs">XLS Divisões</button>'
            )
        );
        //CÓDIGO REPETIFO, PTE CAMBIAR
        document.getElementById("export-button-xls-divisoes").disabled = true;
        document.getElementById("export-button-xls-divisoes").title =
            "Para exportar o XLS de Facturação deve ter seleccionada uma Divisão. \n Verifique também não ter usado nenhum outro filtro";
    },

    getInnerValue: function(obj, key) {
        if (typeof key === "function") {
            return key(obj);
        }
        return key.split(".").reduce(function(o, x) {
            return typeof o == "undefined" || o === null ? o : o[x];
        }, obj);
    },

    getData: function(collection, sheet) {
        var self = this;
        var data = [];
        data.push(
            SIXHIARA.xlsFieldsToExportDivisoes[sheet].map(function(e) {
                return e.header;
            })
        );
        collection.forEach(function(item) {
            var dataRow = SIXHIARA.xlsFieldsToExportDivisoes[sheet].map(function(
                field
            ) {
                return self.getInnerValue(item.toJSON(), field.value);
            });
            data.push(dataRow);
        });
        return data;
    },

    exportXLS: function(evt) {
        var date = new Date();
        var dateXLS =
            String(date.getFullYear()) + String(date.getMonth() + 1).padStart(2, "0");
        var divisao = document.getElementById("loc_divisao").value;

        var file = dateXLS + "_Facturacao_" + divisao + ".xlsx";
        if (!file) return;

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

        var dataExploracaos = this.getData(exploracaosFactDivisoes, "exploracaos");

        var wb = new Workbook();
        var wsExploracaos = this.sheet_from_array_of_arrays(dataExploracaos);
        this.setColumnsWidthFromHeaderRow(wsExploracaos, dataExploracaos);

        /* add ranges to worksheet */
        /* ws['!merges'] = ranges; */

        /* add worksheet to workbook */
        var ws_name = dateXLS + "_" + divisao + "_Consumos.xlsx";

        wb.SheetNames.push(ws_name);
        wb.Sheets[ws_name] = wsExploracaos;

        var wbout = XLSX.write(wb, {bookType: "xlsx", bookSST: false, type: "binary"});
        saveAs(new Blob([this.s2ab(wbout)], {type: "application/octet-stream"}), file);
    },

    sheet_from_array_of_arrays: function(data, opts) {
        var ws = {};
        var range = {s: {c: 10000000, r: 10000000}, e: {c: 0, r: 0}};
        for (var R = 0; R != data.length; ++R) {
            for (var C = 0; C != data[R].length; ++C) {
                if (range.s.r > R) range.s.r = R;
                if (range.s.c > C) range.s.c = C;
                if (range.e.r < R) range.e.r = R;
                if (range.e.c < C) range.e.c = C;
                var cell = {v: data[R][C]};
                if (cell.v == null) continue;
                var cell_ref = XLSX.utils.encode_cell({c: C, r: R});

                if (typeof cell.v === "number") cell.t = "n";
                else if (typeof cell.v === "boolean") cell.t = "b";
                else if (cell.v instanceof Date) {
                    cell.t = "n";
                    cell.z = XLSX.SSF._table[14];
                    cell.v = this.datenum(cell.v);
                } else cell.t = "s";
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
                ws[cell_ref] = cell;
            }
        }
        if (range.s.c < 10000000) ws["!ref"] = XLSX.utils.encode_range(range);
        return ws;
    },

    setColumnsWidthFromHeaderRow(ws, data) {
        var wscols = data[0].map(headerCell => {
            return {wch: Math.max(headerCell.length, 11)};
        });
        ws["!cols"] = wscols;
    },

    datenum: function(v, date1904) {
        if (date1904) v += 1462;
        var epoch = Date.parse(v);
        return (epoch - new Date(Date.UTC(1899, 11, 30))) / (24 * 60 * 60 * 1000);
    },

    s2ab: function(s) {
        var buf = new ArrayBuffer(s.length);
        var view = new Uint8Array(buf);
        for (var i = 0; i != s.length; ++i) view[i] = s.charCodeAt(i) & 0xff;
        return buf;
    },
});
