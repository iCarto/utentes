if (window.SIRHA.getARA() === 'DPMAIP') {
    SIXHIARA = window.SIXHIARA || {
        center: [-12.5, 39.0],
        southWest: [-23, 31],
        northEast: [-9, 48],
        search: {
          zoom: 8,
        },
    };
}

if (window.SIRHA.getARA() === 'ARAN') {
    SIXHIARA = window.SIXHIARA || {
        center: [-13, 38.5050],
        southWest: [-23, 31],
        northEast: [-9, 43],
        search: {
          zoom: 8,
        },
    };
}

if (window.SIRHA.getARA() === 'ARAS') {
    SIXHIARA = window.SIXHIARA || {
        center: [-22.6, 33.8],
        southWest: [-29, 22],
        northEast: [-8, 48],
        search: {
          zoom: 7,
        },
    };
}

if (window.SIRHA.getARA() === 'ARAZ') {
    SIXHIARA = window.SIXHIARA || {
        center: [-16, 34.63],
        southWest: [-28.3, -6.76],
        northEast: [3, 77],
        search: {
          zoom: 7,
        },
    };
}

window.SIXHIARA.xlsFieldsToExport = {};
if (window.SIRHA.getARA() === 'DPMAIP') {
    window.SIXHIARA.xlsFieldsToExport.exploracaos = [
        {'header': 'Nome utente', 'value': 'utente.nome'},
        {'header': 'Nuit', 'value': 'utente.nuit'},
        {'header': 'Tipo de utente', 'value': 'utente.uten_tipo'},
        {'header': 'Nro de membros', 'value': 'utente.uten_memb'},
        {'header': 'Nro de mulheres', 'value': 'utente.uten_mulh'},
        {'header': 'Nro registro comercial', 'value': 'utente.reg_comerc'},
        {'header': 'Registrado em', 'value': 'utente.reg_zona'},
        {'header': 'Provincia', 'value': 'utente.loc_provin'},
        {'header': 'Distrito', 'value': 'utente.loc_distri'},
        {'header': 'Posto administrativo', 'value': 'utente.loc_posto'},
        {'header': 'Bairro', 'value': 'utente.loc_nucleo'},
        {'header': 'Endereço', 'value': 'utente.loc_endere'},
        {'header': 'Observações', 'value': 'utente.observacio'},
        {'header': 'Nro da exploração', 'value': 'exp_id'},
        {'header': 'Nome da exploração', 'value': 'exp_name'},
        {'header': 'Consumo mensal licença Total', 'value': 'c_licencia'},
        {'header': 'Consumo mensal solicitado Total', 'value': 'c_soli'},
        {'header': 'Área de exploração (ha)', 'value': 'actividade.area_pisc'},
        {'header': 'Ano inicio da atividade', 'value': 'actividade.ano_i_ati'},
        {'header': 'Nro de tanques/gaiolas', 'value': 'actividade.n_tanques'},
        {'header': 'Volume total tanques/gaiolas (reservas)', 'value': 'actividade.vol_tot_t'},
        {'header': 'Nro de alevinos povoados', 'value': 'actividade.n_ale_pov'},
        {'header': 'Produção Anual (kg)', 'value': 'actividade.produc_pi'},
        {'header': 'Processamento do peixe', 'value': 'actividade.tipo_proc'},
        {'header': 'Tratamento da água que entra nos tanques', 'value': 'actividade.trat_t_en'},
        {'header': 'Tratamento da água que sai dos tanques', 'value': 'actividade.trat_a_sa'},
        {'header': 'As gaiolas estão submersas em', 'value': 'actividade.gaio_subm'},
        {'header': 'A exploraçaõ tem problemas', 'value': 'actividade.problemas'},
        {'header': 'Principais problemas', 'value': 'actividade.prob_prin'},
    ];

    window.SIXHIARA.xlsFieldsToExport.tanques = [
        {'header':'Nome utente', 'value': 'utente'},
        {'header':'Nro da exploração', 'value':'exp_id'},
        {'header':'Id Tanque', 'value':'tanque_id'},
        {'header':'Tipo ', 'value':'tipo'},
        {'header':'Comprimento (m)', 'value':'cumprimen'},
        {'header':'Largura (m)', 'value':'largura'},
        {'header':'Profundidade (m)', 'value':'profundid'},
        {'header':'Área (m2)', 'value':'area'},
        {'header':'Área GPS (m2)', 'value':'area_gps'},
        {'header':'Volume (m3)', 'value':'volume'},
        {'header':'Estado', 'value':'estado'},
        {'header':'Espécie cultivada', 'value':'esp_culti'},
        {'header':'Espécie cultivada (outros)', 'value':'esp_cul_o'},
        {'header':'Tipo de alimentação', 'value':'tipo_alim'},
        {'header':'Tipo de alimenção (outros)', 'value':'tipo_al_o'},
        {'header':'Nro de alevinos povoados', 'value':'n_ale_pov'},
        {'header':'Proveniência dos alevinos', 'value':'prov_alev'},
        {'header':'Proveniência dos alevinos (outros)', 'value':'prov_al_o'},
        {'header':'Venda (Kg)', 'value':'venda'},
        {'header':'Consumo', 'value':'consumo'},
        {'header':'Produção anual (Kg)', 'value':'pro_anual'},
        {'header':'Peso médio final dos peixes (g)', 'value':'peso_med'},
        {'header':'Fertilização da água', 'value':'fert_agua'},
    ];


    window.SIXHIARA.shpFieldsToExport = [
        { 'header': 'exp_id', 'value': 'exp_id' },
        { 'header': 'exp_name', 'value': 'exp_name' },
        { 'header': 'loc_provin', 'value': 'loc_provin' },
        { 'header': 'loc_distri', 'value': 'loc_distri' },
        { 'header': 'loc_posto', 'value': 'loc_posto' },
        { 'header': 'loc_nucleo', 'value': 'loc_nucleo' },
        { 'header': 'loc_endere', 'value': 'loc_endere' },
        { 'header': 'loc_bacia', 'value': 'loc_bacia' },
        { 'header': 'loc_subaci', 'value': 'loc_subaci' },
        { 'header': 'loc_rio', 'value': 'loc_rio' },
        { 'header': 'utente', 'value': 'utente.nome' },
        { 'header': 'uten_nuit', 'value': 'utente.nuit' },
        { 'header': 'con_l_to', 'value': 'c_licencia' },
        { 'header': 'tipo_subt',
        'value': function (exp) {
            var lic = exp.licencias.filter( lic => lic.tipo_agua == 'Subterrânea' );
            return lic.length > 0;
        }
        },
        { 'header': 'con_l_sb',
        'value': function (exp) {
            var lic = exp.licencias.filter( lic => lic.tipo_agua == 'Subterrânea' );
            return (lic[0] && lic[0].c_licencia) || null;
        }
        },
        { 'header': 'tipo_supe',
        'value': function (exp) {
            var lic = exp.licencias.filter( lic => lic.tipo_agua == 'Superficial' );
            return lic.length > 0;
        }
        },
        { 'header': 'con_l_su',
        'value': function (exp) {
            var lic = exp.licencias.filter( lic => lic.tipo_agua == 'Superficial' );
            return (lic[0] && lic[0].c_licencia) || null;
        }
        },
        { 'header': 'observacio', 'value': 'observacio' },
        {'header': 'area_pisc', 'value': 'actividade.area_pisc'},
        {'header': 'ano_i_ati', 'value': 'actividade.ano_i_ati'},
        {'header': 'n_tanques', 'value': 'actividade.n_tanques'},
        {'header': 'vol_tot_t', 'value': 'actividade.vol_tot_t'},
        {'header': 'n_ale_pov', 'value': 'actividade.n_ale_pov'},
        {'header': 'produc_pi', 'value': 'actividade.produc_pi'},
        {'header': 'tipo_proc', 'value': 'actividade.tipo_proc'},
        {'header': 'asis_aber', 'value': 'actividade.asis_aber'},
        {'header': 'asis_moni', 'value': 'actividade.asis_moni'},
        {'header': 'trat_t_en', 'value': 'actividade.trat_t_en'},
        {'header': 'trat_a_sa', 'value': 'actividade.trat_a_sa'},
        {'header': 'gaio_subm', 'value': 'actividade.gaio_subm'},
        {'header': 'problemas', 'value': 'actividade.problemas'},
        {'header': 'prob_prin', 'value': 'actividade.prob_prin'},
    ]
} else {
    SIXHIARA = window.SIXHIARA || {
        center:[-13, 38.5050],
        southWest:[-23, 31],
        northEast:[-9, 43],
        search: {
          zoom: 8,
        },
    };

    window.SIXHIARA.xlsFieldsToExport.exploracaos = [
        {'header': 'Nome utente', 'value': 'utente.nome'},
        {'header': 'Nuit', 'value': 'utente.nuit'},
        {'header': 'Tipo de utente', 'value': 'utente.uten_tipo'},
        {'header': 'Nro registo comercial', 'value': 'utente.reg_comerc'},
        {
            'header': 'Tipo de água',
            'value': function (exp) {
                var licSubterranea = exp.licencias.filter( lic => lic.tipo_agua == 'Subterrânea' ).length;
                var licSuperficial = exp.licencias.filter( lic => lic.tipo_agua == 'Superficial' ).length;
                if(licSubterranea && licSuperficial) {
                    return 'Ambas';
                } else if(licSubterranea) {
                    return 'Subterrânea';
                } else if(licSuperficial) {
                    return 'Superficial';
                } else {
                    return '';
                }
            }
        },
        { 
            'header': 'Estado lic. subterrânea',
            'value': function (exp) {
                var lic = exp.licencias.filter( lic => lic.tipo_agua == 'Subterrânea' );
                return (lic[0] && lic[0].estado) || null;
            }
        },
        { 
            'header': 'Tipo lic. subterrânea',
            'value': function (exp) {
                var lic = exp.licencias.filter( lic => lic.tipo_agua == 'Subterrânea' );
                return (lic[0] && lic[0].tipo_lic) || null;
            }
        },
        { 
            'header': 'Estado lic. superficial',
            'value': function (exp) {
                var lic = exp.licencias.filter( lic => lic.tipo_agua == 'Superficial' );
                return (lic[0] && lic[0].estado) || null;
            }
        },
        { 
            'header': 'Tipo lic. superficial',
            'value': function (exp) {
                var lic = exp.licencias.filter( lic => lic.tipo_agua == 'Superficial' );
                return (lic[0] && lic[0].tipo_lic) || null;
            }
        },
        { 
            'header': 'Ano',
            'value': function (exp) {
                return exp.exp_id.split('/')[2];
            }
        },
        {'header': 'Registado em', 'value': 'utente.reg_zona'},
        {'header': 'Unidade', 'value': 'loc_unidad'},
        {'header': 'Provincia', 'value': 'utente.loc_provin'},
        {'header': 'Distrito', 'value': 'utente.loc_distri'},
        {'header': 'Posto', 'value': 'utente.loc_posto'},
        {'header': 'Bairro', 'value': 'utente.loc_nucleo'},
        {'header': 'Endereço', 'value': 'utente.loc_endere'},
        {'header': 'Observações', 'value': 'utente.observacio'},
        {'header': 'Id Exp', 'value': 'exp_id'},
        {'header': 'Nome da exploração', 'value': 'exp_name'},
        {'header': 'Actividade', 'value': 'actividade.tipo'},
        {'header': 'Consumo licenciado', 'value': 'c_licencia'},
        {'header': 'Consumo solicitado', 'value': 'c_soli'},
        {'header': 'Consumo real', 'value': 'c_real'},
        {'header': 'Consumo estimado', 'value': 'c_estimado'},
        {'header': 'Valor com IVA (MZN/mês)',
         'value': function(exp) {
             return exp.licencias.reduce(
                 (accumulator, lic) => accumulator + lic.pago_iva,
             0);
         }},
    ];

    window.SIXHIARA.shpFieldsToExport = [
        { 'header': 'exp_id', 'value': 'exp_id' },
        { 'header': 'exp_name', 'value': 'exp_name' },
        { 'header': 'd_soli', 'value': 'd_soli' },
        { 'header': 'loc_provin', 'value': 'loc_provin' },
        { 'header': 'loc_distri', 'value': 'loc_distri' },
        { 'header': 'loc_posto', 'value': 'loc_posto' },
        { 'header': 'loc_nucleo', 'value': 'loc_nucleo' },
        { 'header': 'loc_endere', 'value': 'loc_endere' },
        { 'header': 'loc_bacia', 'value': 'loc_bacia' },
        { 'header': 'loc_subaci', 'value': 'loc_subaci' },
        { 'header': 'loc_rio', 'value': 'loc_rio' },
        { 'header': 'utente', 'value': 'utente.nome' },
        { 'header': 'uten_nuit', 'value': 'utente.nuit' },
        { 'header': 'abastecem',
        'value': function (exp) { return exp.actividade ? exp.actividade.tipo === 'Abastecimento' : false; }
        },
        { 'header': 'saneament',
        'value': function (exp) { return exp.actividade ? exp.actividade.tipo === 'Saneamento' : false; }
        },
        { 'header': 'agricultu',
        'value': function (exp) { return exp.actividade ? exp.actividade.tipo === 'Agricultura de Regadio' : false; }
        },
        { 'header': 'pecuaria',
        'value': function (exp) { return exp.actividade ? exp.actividade.tipo === 'Pecuária' : false;}
        },
        { 'header': 'piscicult',
        'value': function (exp) { return exp.actividade ? exp.actividade.tipo === 'Piscicultura' : false;}
        },
        { 'header': 'industria',
        'value': function (exp) { return exp.actividade ? exp.actividade.tipo === 'Indústria' : false;}
        },
        { 'header': 'pro_energ',
        'value': function (exp) { return exp.actividade ? exp.actividade.tipo === 'Producção de energia' : false; }
        },
        { 'header': 'con_l_to', 'value': 'c_licencia' },
        { 'header': 'tipo_subt',
        'value': function (exp) {
            var lic = exp.licencias.filter( lic => lic.tipo_agua == 'Subterrânea' );
            return lic.length > 0;
        }
        },
        { 'header': 'con_l_sb',
        'value': function (exp) {
            var lic = exp.licencias.filter( lic => lic.tipo_agua == 'Subterrânea' );
            return (lic[0] && lic[0].c_licencia) || null;
        }
        },
        { 'header': 'est_l_sb',
        'value': function (exp) {
            var lic = exp.licencias.filter( lic => lic.tipo_agua == 'Subterrânea' );
            return (lic[0] && lic[0].estado) || null;
        }
        },
        { 'header': 'tipo_supe',
        'value': function (exp) {
            var lic = exp.licencias.filter( lic => lic.tipo_agua == 'Superficial' );
            return lic.length > 0;
        }
        },
        { 'header': 'con_l_su',
        'value': function (exp) {
            var lic = exp.licencias.filter( lic => lic.tipo_agua == 'Superficial' );
            return (lic[0] && lic[0].c_licencia) || null;
        }
        },
        { 'header': 'est_l_su',
        'value': function (exp) {
            var lic = exp.licencias.filter( lic => lic.tipo_agua == 'Superficial' );
            return (lic[0] && lic[0].estado) || null;
        }
        },
        { 'header': 'pagamento',
        'value': function (exp) {
            var pagamento = 'No';
            if (_.isNull(exp.pagos)){
                pagamento = null;
            } else if (exp.pagos === true) {
                pagamento = 'Si';
            }
            return pagamento;
        }
        },
        { 'header': 'observacio', 'value': 'observacio' },
    ]
}
