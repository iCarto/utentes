Backbone.SIXHIARA = Backbone.SIXHIARA || {};
Backbone.SIXHIARA.ExportXLSView = Backbone.View.extend({
    getInnerValue: function(obj, key) {
        if (typeof key === "function") {
            return key(obj);
        }
        return key.split(".").reduce(function(o, x) {
            return typeof o == "undefined" || o === null ? o : o[x];
        }, obj);
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
                this.formatSheet(R, C, cell);
                ws[cell_ref] = cell;
            }
        }
        if (range.s.c < 10000000) ws["!ref"] = XLSX.utils.encode_range(range);
        return ws;
    },

    buildAndSaveWorkbook: function(data, sheetName) {
        function Workbook() {
            if (!(this instanceof Workbook)) return new Workbook();
            this.SheetNames = [];
            this.Sheets = {};
        }

        var wb = new Workbook();
        var ws = this.sheet_from_array_of_arrays(data);
        this.setColumnsWidthFromHeaderRow(ws, data);
        wb.SheetNames.push(sheetName);
        wb.Sheets[sheetName] = ws;
        var wbout = XLSX.write(wb, {bookType: "xlsx", bookSST: false, type: "binary"});
        saveAs(
            new Blob([this.s2ab(wbout)], {type: "application/octet-stream"}),
            sheetName + ".xlsx"
        );
    },

    getData: function(mapping, collection) {
        var self = this;
        var data = [];
        data.push(
            mapping.map(function(e) {
                return e.header;
            })
        );
        collection.forEach(function(item) {
            var dataRow = mapping.map(function(field) {
                return self.getInnerValue(item.toJSON(), field.value);
            });
            data.push(dataRow);
        });
        return data;
    },
});
