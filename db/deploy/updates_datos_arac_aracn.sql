-- Deploy utentes:updates_datos_arac_aracn to pg

BEGIN;

-- ARAC
INSERT INTO domains.datos_aras (
    id
    , name
    , nuit
    , endereco
    , conta_bancaria
    , outros
    , valores
    , sede
    , unidades
) VALUES (
    'ARAC'
    , 'Administração Regional de Águas do Centro'
    , 'PENDENTE'
    , '{
        Rua Sancho de Toar, n° 67\,
        ,
        Bairro da Ponta-Gea\, Cidade da Beira\, Moçambique.
      }'
    , '{"entidade":"PENDENTE", "n_conta":"PENDENTE", "iban":"PENDENTE"}'
    , '{
        "visao": "PENDENTE"
        ,
        "missao": "PENDENTE"}'
    , '["PENDENTE", "PENDENTE", "PENDENTE", "PENDENTE"]'
    , '{
        "nome": "ARA CENTRO",
        "datos": {
            "Localidade": "Cidade da Beira",
            "Provincia": "Sofala",
            "Telefone": "",
            "Fax": "",
            "Email": "",
            "Website": ""
        }
    }'
    , '[
        {"nome": "UGBP - UNIDADE DE GESTÃO DA BACIA DO PUNGUE",
        "datos": {
            "Localidade": "",
            "Provincia": "",
            "Telefone": "",
            "Fax": ""
            }
        },
        {"nome": "UGBB - UNIDADE DE GESTÃO DA BACIA DO BÚZI",
        "datos": {
            "Localidade": "",
            "Provincia": "",
            "Telefone": "",
            "Fax": ""
            }
        },
        {"nome": "UGBS - UNIDADE DE GESTÃO DA BACIA DO SAVE",
        "datos": {
            "Localidade": "",
            "Provincia": "",
            "Telefone": "",
            "Fax": ""
            }
        }
    ]'
);


-- ARACN
INSERT INTO domains.datos_aras (
    id
    , name
    , nuit
    , endereco
    , conta_bancaria
    , outros
    , valores
    , sede
    , unidades
) VALUES (
    'ARACN'
    , 'Administração Regional de Águas do Centro-Norte'
    , 'PENDENTE'
    , '{
        Avenida 25 de setembro, nº 80\,
        ,
        bairro central\, Cidade de Nampula\, Moçambique.
      }'
    , '{"entidade":"PENDENTE", "n_conta":"PENDENTE", "iban":"PENDENTE"}'
    , '{
        "visao": "Proporcionar uma melhor gestão integrada e sustentável dos recursos hídricos em benefício das comunidades."
        ,
        "missao": "A missão da ARA Centro-Norte é:\nPlaneamento e distribuição de recursos hídricos;\nControlo do uso e aproveitamento de água, da descarga de influentes e de outras actividades que afectam os recursos hídricos;\nOutorgação de direitos de uso de água e a imposição de taxas relacionadas a projectos de contrucção e operação das infraestruturas hidráulicas;\nAutorização e inspecção de infraestruturas hidráulicas;\nPrestação de serviços técnicos para os sectores públicos e privados;\nRecolha de gestão de dados hidrológicos."}'
    , '["Compromisso.", "Integridade.", "Eficiência e eficácia.", "Solidariedade.", "Profissionalismo."]'
    , '{
        "nome": "ARA CENTRO-NORTE",
        "datos": {
            "Localidade": "Cidade de Nampula",
            "Provincia": "Nampula",
            "Telefone": "",
            "Fax": "",
            "Email": "",
            "Website": ""
        }
    }'
    , '[
        {"nome": "UGBL - UNIDADE DE GESTÃO DA BACIA DO LÚRIO",
        "datos": {
            "Localidade": "",
            "Provincia": "",
            "Telefone": "",
            "Fax": ""
            }
        },
        {"nome": "UGBO - UNIDADE DE GESTÃO DE BACIAS DO OESTE",
        "datos": {
            "Localidade": "",
            "Provincia": "",
            "Telefone": "",
            "Fax": ""
            }
        },
        {"nome": "UGBE - UNIDADE DE GESTÃO DE BACIAS DO ESTE",
        "datos": {
            "Localidade": "",
            "Provincia": "",
            "Telefone": "",
            "Fax": ""
            }
        }
    ]'
);




COMMIT;
