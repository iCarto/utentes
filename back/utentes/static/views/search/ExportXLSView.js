function Workbook() {
    if (!(this instanceof Workbook)) return new Workbook();
    this.SheetNames = [];
    this.Sheets = {};
}

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
});
