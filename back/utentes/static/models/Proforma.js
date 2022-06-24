Backbone.SIXHIARA.Proforma = class {
    constructor(exploracaoModel, ara) {
        const exploracao = exploracaoModel.toJSON();

        const juros = 0;
        const payments = new SIRHA.Services.PaymentsCalculationService({
            fact_tipo: exploracao.fact_tipo,
        });
        const pagoIvaTotal = payments.pagoIvaTotal(
            exploracaoModel.getLicencia("sub").get("pago_iva"),
            exploracaoModel.getLicencia("sup").get("pago_iva"),
            juros
        );

        const data = {
            exp_id: exploracao.exp_id,
            periodoFactura: formatter().defaultEmpty(),
            numFactura: exploracao.exp_id,
            dateFactura: formatter().formatDate(new Date()),
            ara: {
                name: ara.name,
                nuit: ara.nuit,
                endereco: ara.endereco,
                logoUrl: `static/print-templates/images/${window.SIRHA.getARA()}_factura.png`,
            },
            factura: {
                fact_tipo: exploracao.fact_tipo,
                juros: juros,
                pago_iva: formatter().formatNumber(pagoIvaTotal, "0[.]00"),
            },
            utente: {
                nome: exploracao.utente.nome,
                loc_posto: exploracao.utente.loc_posto,
                contacto: exploracao.utente.contacto,
                nuit: exploracao.utente.nuit,
                loc_nucleo: exploracao.utente.loc_nucleo,
                telefone: exploracao.utente.telefone,
            },
            actividade: {
                tipo: exploracao.actividade.tipo,
            },
            licencias: exploracao.licencias.map(lic => ({
                tipo_agua: lic.tipo_agua,
                consumo_fact: lic.c_licencia,
                taxa_fixa: lic.taxa_fixa,
                taxa_uso: lic.taxa_uso,
                pago_mes: lic.pago_mes,
                iva: lic.iva,
                pago_iva: formatter().formatNumber(lic.pago_iva, "0[.]00"),
            })),
        };

        const template = "Factura_Proforma";
        data.urlTemplate = Backbone.SIXHIARA.tipoTemplates[template];
        data.nameFile = `${template}_${data.exp_id}.docx`;
        this.data = data;
    }
};
