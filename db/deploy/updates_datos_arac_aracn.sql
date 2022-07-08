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
    , '600000276'
    , '{
        Rua Sancho de Toar, n° 67\,
        ,
        Bairro da Ponta-Gea\, Cidade da Beira\, Moçambique.
      }'
    , '{"entidade":"Banco Millenium Bim", "n_conta":"0005165764257", "iban":"MZ59000100000005165764257"}'
    , '{
        "visao": "Ser uma instituição de referência na gestão e promoção do uso sustentável dos Recursos Hídricos."
        ,
        "missao": "Garantir a gestão integrada e participativa, protecção e desenvolvimento dos recursos hídricos para a satisfação das necessidades actuais e futuras dos utentes."}'
    , '["Compromisso.", "Integridade.", "Eficiência e eficácia.", "Solidariedade."]'
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
            "Localidade": "Catandica",
            "Provincia": "Manica",
            "Telefone": "",
            "Fax": ""
            }
        },
        {"nome": "UGBB - UNIDADE DE GESTÃO DA BACIA DO BÚZI",
        "datos": {
            "Localidade": "Goonda",
            "Provincia": "Sofala",
            "Telefone": "",
            "Fax": ""
            }
        },
        {"nome": "UGBS - UNIDADE DE GESTÃO DA BACIA DO SAVE",
        "datos": {
            "Localidade": "Vila Franca do Save (Govuro)",
            "Provincia": "Inhambane",
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
    , '500024569'
    , '{
        EN nº1\, U/Comunal Namuatho-B\,
        ,
        Bairro Mutauanha\, Muatala\, Moçambique.
      }'
    , '{"entidade":"BCI / BIM", "n_conta":"1631734110001 / 140084394.", "iban":"MZ59 0008 0000 16317341101 80 / MZ59 0001 0000 00140084394 57."}'
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
            "Telefone": "+258 26217326",
            "Fax": "+258 26217318",
            "Email": "aracentronorte@ara-centronorte.gov.mz",
            "Website": "www.ara-centronorte.gov.mz"
        }
    }'
    , '[
        {"nome": "UGBL - UNIDADE DE GESTÃO DA BACIA DO LÚRIO",
        "datos": {
            "Localidade": "Vila sede de Namapa",
            "Provincia": "Nampula",
            "Telefone": "+258 876217317",
            "Fax": "N/A"
            }
        },
        {"nome": "UGBO - UNIDADE DE GESTÃO DE BACIAS DO OESTE",
        "datos": {
            "Localidade": "Mocuba",
            "Provincia": "Zambézia",
            "Telefone": "+258 24810757",
            "Fax": "N/A"
            }
        },
        {"nome": "UGBE - UNIDADE DE GESTÃO DE BACIAS DO ESTE",
        "datos": {
            "Localidade": "Nacala-Porto",
            "Provincia": "Nampula",
            "Telefone": "+258 863391115",
            "Fax": "N/A"
            }
        }
    ]'
);




COMMIT;
