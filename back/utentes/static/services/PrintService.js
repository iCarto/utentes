/* global formatter, moment */

// ***=loc_divisao*** - ***=cbase.divisoes.nome***
SIRHA.Services.PrintService = (function(formatter) {
    function removeNull(data) {
        // Create a copy of the main object since both types of licenses share fields
        // In adition, remove its nulls to avoid problems during the template generation
        return JSON.parse(
            JSON.stringify(data, function(key, value) {
                if (value === null) {
                    return "";
                }
                if (value === true) {
                    return "Sim";
                }
                if (value === false) {
                    return "Não";
                }
                return value;
            })
        );
    }

    function isValidForPrint(exploracao, lic) {
        if (lic && !lic.get("tipo_lic")) {
            return "A exploração tem que ter uma tipo de licença.";
        }
        if (lic && !_.isNumber(lic.get("c_licencia"))) {
            return "A exploração tem que ter consumo licenciado";
        }
        const locDivisao = exploracao.get
            ? exploracao.get("loc_divisao")
            : exploracao.loc_divisao;
        if (!locDivisao) {
            return "A exploração tem que ter uma Divisão de Gestão.";
        }
    }

    function fillData(_model, dataARA, tipoAgua, fontes) {
        var json = _model.toJSON();
        if (fontes) {
            json.fontes = fontes;
        }

        var data = removeNull(json);

        // We filter fontes by tipo_agua (Subterrânea / Superficial)
        data.fontes = data.fontes.filter(function(fonte) {
            return fonte.tipo_agua == tipoAgua;
        });

        data.licencia = data.licencias.filter(lic => lic.tipo_agua === tipoAgua)[0];

        data.licencia.d_emissao = formatter.formatDate(data.licencia.d_emissao) || "";
        data.licencia.d_validade = formatter.formatDate(data.licencia.d_validade) || "";

        data.urlTemplate = Backbone.SIXHIARA.tipoTemplates[data.licencia.tipo_lic];
        data.licencia.duration =
            Backbone.SIXHIARA.duracionLicencias[data.licencia.tipo_lic];

        data.nameFile = data.licencia.tipo_lic
            .concat("_")
            .concat(data.licencia.lic_nro)
            .concat("_")
            .concat(data.exp_name)
            .concat(".docx");

        data.ara = dataARA;
        data.divisao_long_name = data.ara.divisoes.reduce(
            (mem, u) =>
                u.nome.split(" ")[0] === data.loc_divisao ? mem + u.nome : mem,
            ""
        );

        data.ara.logoUrl =
            "static/print-templates/images/" + window.SIRHA.getARA() + "_cabecera.png";
        data.ara.portadaUrl =
            "static/print-templates/images/" + window.SIRHA.getARA() + "_portada.png";
        return data;
    }

    function licenses(_model) {
        return fetch(`/api/fontes/${_model.get("id")}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then(fontes => {
                const licsTipoAgua = _model.get("licencias").pluck("tipo_agua");
                const printedLics = licsTipoAgua.map(tipoAgua =>
                    license(_model, tipoAgua, fontes)
                );
                return Promise.all(printedLics);
            });
    }

    function license(_model, tipoAgua, fontes) {
        const lic = _model.get("licencias").findWhere({tipo_agua: tipoAgua});
        const errorMsg = isValidForPrint(_model, lic);
        if (errorMsg) {
            return Promise.reject(errorMsg);
        }

        return _getDatosARA().then(function(dataARA) {
            var data = fillData(_model, dataARA, tipoAgua, fontes);

            new Backbone.SIXHIARA.DocxGeneratorView({
                data: data,
            });
            return data;
        });
    }

    function proforma(_model) {
        const errorMsg = isValidForPrint(_model);
        if (errorMsg) {
            return Promise.reject(errorMsg);
        }

        return _getDatosARA().then(function(dataARA) {
            let data = new Backbone.SIXHIARA.Proforma(_model, dataARA).data;
            new Backbone.SIXHIARA.DocxGeneratorView({
                data: data,
            });
            return data;
        });
    }

    function factura(invoiceData) {
        return billing(invoiceData, "Factura");
    }

    function recibo(invoiceData) {
        return billing(invoiceData, "Recibo");
    }

    function _getDatosARA() {
        return fetch("/api/get_datos_ara").then(response => {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.json();
        });
    }

    function billing(invoiceData, template) {
        const errorMsg = isValidForPrint(invoiceData);
        if (errorMsg) {
            return Promise.reject(errorMsg);
        }
        return _getDatosARA()
            .then(function(dataARA) {
                var data = fillBillingData(invoiceData, dataARA, template);
                return data;
            })
            .then(function(data) {
                const id = invoiceData.factura.id;
                const url = `/api/facturacao/${id}/emitir_${template.toLowerCase()}`;
                return fetch(url)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error("Network response was not ok");
                        }
                        return response.json();
                    })
                    .then(function(fact_id) {
                        data[`num${template}`] = fact_id;
                        return data;
                    });
            })
            .then(function(data) {
                new Backbone.SIXHIARA.DocxGeneratorView({
                    data: data,
                });
                return data;
            });
    }

    function fillBillingData(invoiceData, dataARA, template) {
        var data = removeNull(invoiceData);

        data.urlTemplate = Backbone.SIXHIARA.tipoTemplates[template];
        data.nameFile = `${template}_${data.exp_id}_${data.factura.mes}_${data.factura.ano}.docx`;

        data.dateFactura_ = data.factura.fact_date
            ? new Date(data.factura.fact_date)
            : new Date();
        data.dateFactura = formatter.formatDate(data.dateFactura_);

        var dateVencimento = moment(data.dateFactura_).add(1, "M");
        data.vencimento = formatter.formatDate(dateVencimento);

        data.periodoFactura = data.factura.billing_period;
        data.ara = dataARA;
        data.ara.logoUrl =
            "static/print-templates/images/" + window.SIRHA.getARA() + "_factura.png";

        if (template === "Factura") {
            data.licencias.forEach(function(licencia) {
                var tipo = licencia.tipo_agua.substring(0, 3).toLowerCase();
                licencia.consumo_fact = data.factura["consumo_fact_" + tipo];
                licencia.taxa_fixa = data.factura["taxa_fixa_" + tipo];
                licencia.taxa_uso = data.factura["taxa_uso_" + tipo];
                licencia.pago_mes = data.factura["pago_mes_" + tipo];
                licencia.iva = data.factura["iva"];
                licencia.pago_iva = data.factura["pago_iva_" + tipo];
            });
        }
        if (template === "Recibo") {
            data.dateRecibo_ = data.factura.recibo_date
                ? new Date(data.factura.recibo_date)
                : new Date();
            data.dateRecibo = formatter.formatDate(data.dateRecibo_);
        }

        return data;
    }

    const publicAPI = {license, licenses, factura, recibo, proforma};
    return publicAPI;
})(formatter());
