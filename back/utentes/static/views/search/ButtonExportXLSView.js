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

    getData: function(collection, sheet) {
        var self = this;
        var data = [];
        data.push(
            SIXHIARA.xlsFieldsToExport[sheet].map(function(e) {
                return e.header;
            })
        );
        collection.forEach(function(item) {
            var dataRow = SIXHIARA.xlsFieldsToExport[sheet].map(function(field) {
                return self.getInnerValue(item.toJSON(), field.value);
            });
            data.push(dataRow);
        });
        return data;
    },

    exportXLS: function(evt) {
        var dateXLS = moment().format("YYYYMMDD");

        var file = dateXLS + "_Exploracoes.xlsx";
        if (!file) return;

        var exploracaos = this.options.listView.collection.sortBy(function(exp) {
            return exp.get("utente").get("nome");
        });

        var dataExploracaos = this.getData(exploracaos, "exploracaos");

        var wb = new Workbook();
        var wsExploracaos = this.sheet_from_array_of_arrays(dataExploracaos);
        this.setColumnsWidthFromHeaderRow(wsExploracaos, dataExploracaos);

        /* add ranges to worksheet */
        /* ws['!merges'] = ranges; */

        /* add worksheet to workbook */
        var ws_name = dateXLS + " Explorações";

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
                ws[cell_ref] = cell;
            }
        }
        if (range.s.c < 10000000) ws["!ref"] = XLSX.utils.encode_range(range);
        return ws;
    },
});
