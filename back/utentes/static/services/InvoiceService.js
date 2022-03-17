SIRHA.Services.InvoiceService = {
    monthFactor: function(billing_period) {
        return formatter().diffMonthIncludeUpper(billing_period[1], billing_period[0]);
    },
};
