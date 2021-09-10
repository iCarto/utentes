window.SIXHIARA = {};

window.SIXHIARA.ESTADOS_PENDENTES = [
    {
        key: SIRHA.ESTADO.NOT_EXISTS,
        roles: [],
    },
    {
        key: SIRHA.ESTADO.USOS_COMUNS,
        roles: [],
    },
    {
        key: SIRHA.ESTADO.NOT_APPROVED,
        roles: [],
    },
    {
        key: SIRHA.ESTADO.IRREGULAR,
        roles: [],
    },
    {
        key: SIRHA.ESTADO.LICENSED,
        roles: [],
    },
    {
        key: SIRHA.ESTADO.UNKNOWN,
        roles: [],
    },
    {
        key: SIRHA.ESTADO.INCOMPLETE_DA,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.ADMINISTRATIVO],
    },
    {
        key: SIRHA.ESTADO.INCOMPLETE_DIR,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.DIRECCION],
    },
    {
        key: SIRHA.ESTADO.INCOMPLETE_DJ,
        roles: [
            SIRHA.ROLE.ADMIN,
            SIRHA.ROLE.OBSERVADOR,
            SIRHA.ROLE.JURIDICO,
            SIRHA.ROLE.TECNICO,
        ],
    },
    {
        key: SIRHA.ESTADO.INCOMPLETE_DT,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.TECNICO],
    },
    {
        key: SIRHA.ESTADO.INCOMPLETE_DF,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.FINANCIERO],
    },
    {
        key: SIRHA.ESTADO.PENDING_REVIEW_DIR,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.DIRECCION],
    },
    {
        key: SIRHA.ESTADO.PENDING_REVIEW_DJ,
        roles: [
            SIRHA.ROLE.ADMIN,
            SIRHA.ROLE.OBSERVADOR,
            SIRHA.ROLE.TECNICO,
            SIRHA.ROLE.JURIDICO,
        ],
    },
    {
        key: SIRHA.ESTADO.PENDING_FIELD_VISIT,
        roles: [
            SIRHA.ROLE.ADMIN,
            SIRHA.ROLE.OBSERVADOR,
            SIRHA.ROLE.TECNICO,
            SIRHA.ROLE.BASIN_DIVISION,
        ],
    },
    {
        key: SIRHA.ESTADO.PENDING_TECH_DECISION,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.TECNICO],
    },
    {
        key: SIRHA.ESTADO.PENDING_EMIT_LICENSE,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.JURIDICO],
    },
    {
        key: SIRHA.ESTADO.PENDING_DIR_SIGN,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.DIRECCION],
    },
    {
        key: SIRHA.ESTADO.DE_FACTO,
        roles: [],
    },
];

window.SIXHIARA.ESTADOS_RENOVACAO = [
    {
        key: SIRHA.ESTADO_RENOVACAO.NOT_APPROVED,
        roles: [],
    },
    {
        key: SIRHA.ESTADO_RENOVACAO.IRREGULAR,
        roles: [],
    },
    {
        key: SIRHA.ESTADO_RENOVACAO.INCOMPLETE_DA,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.ADMINISTRATIVO],
        // If a read only acces is needed to some state for some ARA it could be done
        // like this:
        // roles_only_read:
        //    window.SIRHA.getARA() === "ARAS" ? [SIRHA.ROLE.JURIDICO] : undefined,
    },
    {
        key: SIRHA.ESTADO_RENOVACAO.INCOMPLETE_DIR,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.DIRECCION],
    },
    {
        key: SIRHA.ESTADO_RENOVACAO.INCOMPLETE_DJ,
        roles: [
            SIRHA.ROLE.ADMIN,
            SIRHA.ROLE.OBSERVADOR,
            SIRHA.ROLE.JURIDICO,
            SIRHA.ROLE.TECNICO,
            SIRHA.ROLE.BASIN_DIVISION,
        ],
    },
    {
        key: SIRHA.ESTADO_RENOVACAO.INCOMPLETE_DT,
        roles: [
            SIRHA.ROLE.ADMIN,
            SIRHA.ROLE.OBSERVADOR,
            SIRHA.ROLE.TECNICO,
            SIRHA.ROLE.BASIN_DIVISION,
        ],
    },
    {
        key: SIRHA.ESTADO_RENOVACAO.PENDING_RENOV_LICENSE,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.ADMINISTRATIVO],
    },
    {
        key: SIRHA.ESTADO_RENOVACAO.PENDING_REVIEW_DIR,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.DIRECCION],
    },
    {
        key: SIRHA.ESTADO_RENOVACAO.PENDING_REVIEW_DJ,
        roles: [
            SIRHA.ROLE.ADMIN,
            SIRHA.ROLE.OBSERVADOR,
            SIRHA.ROLE.TECNICO,
            SIRHA.ROLE.JURIDICO,
            SIRHA.ROLE.BASIN_DIVISION,
        ],
    },
    {
        key: SIRHA.ESTADO_RENOVACAO.PENDING_TECH_DECISION,
        roles: [
            SIRHA.ROLE.ADMIN,
            SIRHA.ROLE.OBSERVADOR,
            SIRHA.ROLE.TECNICO,
            SIRHA.ROLE.BASIN_DIVISION,
        ],
    },
    {
        key: SIRHA.ESTADO_RENOVACAO.PENDING_EMIT_LICENSE,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.JURIDICO],
    },
    {
        key: SIRHA.ESTADO_RENOVACAO.PENDING_DIR_SIGN,
        roles: [
            SIRHA.ROLE.ADMIN,
            SIRHA.ROLE.OBSERVADOR,
            SIRHA.ROLE.DIRECCION,
            SIRHA.ROLE.JURIDICO,
        ],
    },
    {
        key: SIRHA.ESTADO_RENOVACAO.DE_FACTO,
        roles: [],
    },
    {
        key: SIRHA.ESTADO_RENOVACAO.PENDING_DADOS_LICENSE,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.JURIDICO],
    },
];

window.SIXHIARA.ESTADOS_FACT = [
    {
        key: window.SIRHA.ESTADO_FACT.NO,
        roles: [],
    },
    {
        key: window.SIRHA.ESTADO_FACT.PAID,
        roles: [],
    },
    {
        key: window.SIRHA.ESTADO_FACT.PENDING_PAY,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.FINANCIERO],
    },
    {
        key: window.SIRHA.ESTADO_FACT.PENDING_INVOICE,
        roles: [SIRHA.ROLE.ADMIN, SIRHA.ROLE.OBSERVADOR, SIRHA.ROLE.FINANCIERO],
    },
    {
        key: window.SIRHA.ESTADO_FACT.PENDING_M3,
        roles: [
            SIRHA.ROLE.ADMIN,
            SIRHA.ROLE.OBSERVADOR,
            SIRHA.ROLE.TECNICO,
            SIRHA.ROLE.BASIN_DIVISION,
        ],
    },
];

window.SIXHIARA.IVA = 17;

/*
WITH
epsg4326 AS (
    SELECT nome, ST_Envelope(ST_Transform(geom, 4326)) geom FROM cbase.aras
), tmp AS (
    SELECT
        nome
        , ST_X(ST_Centroid(geom)) center_x, ST_Y(ST_Centroid(geom)) center_y
        , ST_XMin(geom) st_xmin, ST_YMin(geom) st_ymin
        , ST_XMax(geom) st_xmax, ST_YMax(geom) st_ymax
    FROM epsg4326
)
SELECT
    nome
    , format('center: [%s, %s]', center_y, center_x)
    , format('southWest: [%s, %s]', st_ymin, st_xmin)
    , format('northEast: [%s, %s]', st_ymax, st_xmax)
FROM tmp;
*/
if (window.SIRHA.getARA() === "ARAN") {
    Object.assign(SIXHIARA, {
        center: [-14.0816665004768, 37.8663802821955],
        southWest: [-17.6920830007169, 34.8951205644252],
        northEast: [-10.4712500002367, 40.8376399999658],
    });

    window.SIXHIARA.IVA = 0;
    // If custom mapping between a Group and Role is needed for an ARA it could be done
    // here like this:
    // SIRHA.GROUPS_TO_ROLES[SIRHA.GROUP.JURIDICO] = [
    //     SIRHA.ROLE.JURIDICO,
    //     SIRHA.ROLE.ADMINISTRATIVO,
    //     SIRHA.ROLE.DIRECCION,
    // ];
}

if (window.SIRHA.getARA() === "ARAC") {
    Object.assign(SIXHIARA, {
        center: [-16.4549616328385, 33.7573715061195],
        southWest: [-21.3446634902801, 30.2173830126593],
        northEast: [-11.5652597753968, 37.2973599995797],
    });
}

if (window.SIRHA.getARA() === "ARAS") {
    Object.assign(SIXHIARA, {
        center: [-23.8762060191703, 33.4551624955176],
        southWest: [-26.8686950002522, 31.3062989916333],
        northEast: [-20.8837170380884, 35.604025999402],
    });
    window.SIXHIARA.IVA = 12.75;
}

window.SIXHIARA.xlsFieldsToExport = {};

// Botched job warning: The spaces (blank) in some header fields of this part of the code are use to adjust the width of the columns in xlsx export.
// The default setting is made in "setColumnsWidthFromHeaderRow" function on ButtonExportXLSView.js
window.SIXHIARA.xlsFieldsToExport.exploracaos = [
    {header: "       Nome Utente       ", value: "utente.nome"},
    {header: "   Tipo Utente   ", value: "utente.uten_tipo"},
    {header: "     Email Utente     ", value: "utente.email"},
    {header: "   Telefone Utente   ", value: "utente.telefone"},
    {header: "Número Exploração", value: "exp_id"},
    {header: "       Nome Exploração       ", value: "exp_name"},
    {
        header: "Ano",
        value: function(exp) {
            return SIRHA.Services.IdService.extractYearFromExpId(exp);
        },
    },
    {header: "Província Exploração", value: "loc_provin"},
    {header: "Distrito Exploração", value: "loc_distri"},
    {header: "Posto Exploração", value: "loc_posto"},
    {header: "Bairro Exploração", value: "loc_nucleo"},
    {header: "       Endereço Exploração       ", value: "loc_endere"},
    {header: "Divisão", value: "loc_divisao"},
    {header: "Bacia", value: "loc_bacia"},
    {header: "   Actividade   ", value: "actividade.tipo"},
    {
        header: "   Tipo Água   ",
        value: function(exp) {
            var licSubterranea = exp.licencias.filter(
                lic => lic.tipo_agua == "Subterrânea"
            ).length;
            var licSuperficial = exp.licencias.filter(
                lic => lic.tipo_agua == "Superficial"
            ).length;
            if (licSubterranea && licSuperficial) {
                return "Ambas";
            } else if (licSubterranea) {
                return "Subterrânea";
            } else if (licSuperficial) {
                return "Superficial";
            } else {
                return "";
            }
        },
    },
    {
        header: "Número Licença Sub.",
        value: function(exp) {
            var lic = exp.licencias.filter(lic => lic.tipo_agua == "Subterrânea");
            return (lic[0] && lic[0].lic_nro) || null;
        },
    },
    {
        header: "Estado Licença Sub.",
        value: function(exp) {
            var lic = exp.licencias.filter(lic => lic.tipo_agua == "Subterrânea");
            return (lic[0] && lic[0].estado) || null;
        },
    },
    {
        header: "Tipo Licença Sub.",
        value: function(exp) {
            var lic = exp.licencias.filter(lic => lic.tipo_agua == "Subterrânea");
            return (lic[0] && lic[0].tipo_lic) || null;
        },
    },
    {
        header: "Data Emissão Sub.",
        value: function(exp) {
            var lic = exp.licencias.filter(lic => lic.tipo_agua == "Subterrânea");
            return (lic[0] && formatter().formatDate(lic[0].d_emissao)) || null;
        },
    },
    {
        header: "Data Validade Sub.",
        value: function(exp) {
            var lic = exp.licencias.filter(lic => lic.tipo_agua == "Subterrânea");
            return (lic[0] && formatter().formatDate(lic[0].d_validade)) || null;
        },
    },
    {
        header: "Tipo Consumo Sub.",
        value: function(exp) {
            var lic = exp.licencias.filter(lic => lic.tipo_agua == "Subterrânea");
            return (lic[0] && lic[0].consumo_tipo) || null;
        },
    },
    {
        header: "Número Licença Sup.",
        value: function(exp) {
            var lic = exp.licencias.filter(lic => lic.tipo_agua == "Superficial");
            return (lic[0] && lic[0].lic_nro) || null;
        },
    },
    {
        header: "Estado Licencia Sup.",
        value: function(exp) {
            var lic = exp.licencias.filter(lic => lic.tipo_agua == "Superficial");
            return (lic[0] && lic[0].estado) || null;
        },
    },
    {
        header: "Tipo Licença Sup.",
        value: function(exp) {
            var lic = exp.licencias.filter(lic => lic.tipo_agua == "Superficial");
            return (lic[0] && lic[0].tipo_lic) || null;
        },
    },
    {
        header: "Data Emissão Sup.",
        value: function(exp) {
            var lic = exp.licencias.filter(lic => lic.tipo_agua == "Superficial");
            return (lic[0] && formatter().formatDate(lic[0].d_emissao)) || null;
        },
    },
    {
        header: "Data Validade Sup.",
        value: function(exp) {
            var lic = exp.licencias.filter(lic => lic.tipo_agua == "Superficial");
            return (lic[0] && formatter().formatDate(lic[0].d_validade)) || null;
        },
    },
    {
        header: "Tipo Consumo Sup.",
        value: function(exp) {
            var lic = exp.licencias.filter(lic => lic.tipo_agua == "Superficial");
            return (lic[0] && lic[0].consumo_tipo) || null;
        },
    },
    {header: "Facturação", value: "fact_tipo"},
    {header: "Consumo Real", value: "c_real"},
    {header: "Consumo Licencia", value: "c_licencia"},
    {
        header: "Consumo Factura",
        value: function(exp) {
            return exp.licencias.reduce(
                (accumulator, lic) => accumulator + lic.consumo_fact,
                0
            );
        },
    },
    {
        header: "Valor com IVA",
        value: function(exp) {
            return exp.licencias.reduce(
                (accumulator, lic) => accumulator + lic.pago_iva,
                0
            );
        },
    },
];

window.SIXHIARA.shpFieldsToExport = [
    {header: "nr_exp", value: "exp_id"},
    {header: "nome_exp", value: "exp_name"},
    {header: "provincia", value: "loc_provin"},
    {header: "distrito", value: "loc_distri"},
    {header: "posto", value: "loc_posto"},
    {header: "bairro", value: "loc_nucleo"},
    {header: "endereco", value: "loc_endere"},
    {header: "divisao", value: "loc_divisao"},
    {header: "bacia", value: "loc_bacia"},
    {header: "actividade", value: "actividade.tipo"},
    {
        header: "tipo_agua",
        value: function(exp) {
            var licSubterranea = exp.licencias.filter(
                lic => lic.tipo_agua == "Subterrânea"
            ).length;
            var licSuperficial = exp.licencias.filter(
                lic => lic.tipo_agua == "Superficial"
            ).length;
            if (licSubterranea && licSuperficial) {
                return "Ambas";
            } else if (licSubterranea) {
                return "Subterrânea";
            } else if (licSuperficial) {
                return "Superficial";
            } else {
                return "";
            }
        },
    },
    {header: "tipo_fact", value: "fact_tipo"},
    {header: "c_real", value: "c_real"},
    {header: "c_licenc", value: "c_licencia"},
    {
        header: "c_factura",
        value: function(exp) {
            return exp.licencias.reduce(
                (accumulator, lic) => accumulator + lic.consumo_fact,
                0
            );
        },
    },
    {
        header: "valor_iva",
        value: function(exp) {
            return exp.licencias.reduce(
                (accumulator, lic) => accumulator + lic.pago_iva,
                0
            );
        },
    },
];
