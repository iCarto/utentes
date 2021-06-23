-- Revert utentes:aras_unification_update_datos_aras from pg


-- endereco => ENDERECO
-- outros => VISAO & MISSAO
-- conta_bancaria => ENTIDADE, N CONTA, IBAN

BEGIN;

DELETE FROM domains.datos_aras;

-- ARA SUL
INSERT INTO domains.datos_aras (
    id,
    name,
    nuit,
    endereco,
    conta_bancaria,
    outros,
    valores,
    sede,
    unidades
) VALUES(
    'ARAS',
    'Administração Regional de Águas do Sul',
    '500001062',
    '{Av. Samora Machel nº 30 7º andar. 4033\,,1º Bairro Fiscal\, Cidade de Maputo\, Moçambique}'::text[],
    '{"entidade":"STANDARD BANK", "n_conta":"1010149101003", "iban":"MZ59 0003 0101 0014910100396"}',
    '{"visao": "Assegurar a gestão dos recursos hídricos por forma a garantir água em quantidade e qualidade para a preservação do mio ambiente, a mitigação dos efeitos das cheias e secas cíclicas e satisfação das necessidades futuras","missao": "Promover a utilização racional dos recursos hídricos para a defensa do meio ambiente e satisfazer as necessidades dos utentes, alargando a rede de monitoramento, aumentando a capacidade de armazenamento e planeando os recursos hídricos disponíveis com base nas bacias hidrográficas"}',
    '["Orientação para o utente", "Gestão integrada e participativa", "Competência e integridade", "Responsabilidade social"]',
    '{
        "nome": "ARA SUL",
        "datos": {
            "Localidade": "Cidade de Maputo",
            "Provincia": "Maputo",
            "Telefone": "(+258 21) 30 67 29/30",
            "Fax": "(+258 21) 30 67 56",
            "Email": "ara-sul@ara-sul.gov.mz",
            "Website": "www.ara-sul.gov.mz"
        }
    }',
    '[
        {"nome": "UGBS - UNIDADE DE GESTÃO DA BACIA DO SAVE",
        "datos": {
            "Localidade": "Maxixe",
            "Provincia": "Inhambane",
            "Telefone": "(+258 29) 33 08 53",
            "Fax": "(+258 29) 33 03 85"
            }
        },
        {"nome": "UGBL - UNIDADE DE GESTÃO DA BACIA DO LIMPOPO",
        "datos": {
            "Localidade": "Lionde",
            "Provincia": "Gaza",
            "Telefone": "(+258 28) 12 00 58",
            "Fax": "(+258 21) 71 30 22"
            }
        },
        {"nome": "UGBI - UNIDADE DE GESTÃO DA BACIA DO INCOMATI",
        "datos": {
            "Localidade": "Corumana",
            "Provincia": "Maputo",
            "Telefone": "(+258 21) 56 00 16",
            "Fax": "(+258 21) 56 00 22"
            }
        },
        {"nome": "UGBU - UNIDADE DE GESTÃO DA BACIA DO UMBELÚZI",
        "datos": {
            "Localidade": "Boane",
            "Provincia": "Maputo",
            "Telefone": "(+258 21) 75 92 72",
            "Fax": "(+258 21) 75 92 72"
            }
        }
    ]');

-- ARA NORTE
INSERT INTO domains.datos_aras (
    id,
    name,
    nuit,
    endereco,
    conta_bancaria,
    outros,
    valores,
    sede,
    unidades
) VALUES(
    'ARAN',
    'Administração Regional de Águas do Norte',
    '500021357',
    '{"Avda. Josina Machel nº 583,","Bairro de Natite, Cidade de Pemba, Moçambique"}',
    '{"entidade":"BCI", "n_conta":"1428286310001", "iban":"MZ59 0008 0000 1428286310180"}',
    '{"visao": "Promover o desenvolvimento e gestão coordenada dos recursos hídricos, envolvendo diversos actores a nível da sua área de jurisdição, de forma a garantir a segurança, bem-estar social e económico, sem comprometer a sustentabilidade dos ecossistemas","missao": "Implementar e coordenar a gestão integrada e participativa dos recursos hídricos, regular o acesso a água, por forma a garantir a preservação ambiental e um desenvolvimento sustentável e equilibrado, hoje, amanhã e sempre"}',
    '[]',
    '{
        "nome": "ARA NORTE",
        "datos": {
            "Localidade": "Cidade de Pemba",
            "Provincia": "Cabo Delgado",
            "Telefone": "(+258 27) 22 03 19",
            "Fax": "(+258 27) 22 14 01",
            "Email": "info.aranorte@gmail.com",
            "Website": "www.ara-norte.co.mz"
            }
    }',
    '[
        {"nome": "UGBS - UNIDADE DE GESTÃO DA BACIA DE MESSALO E MONTEPUEZ",
        "datos": {
            "Localidade": "Montepuez",
            "Provincia": "Cabo Delgado",
            "Telefone": "",
            "Email": ""
            }
        },
        {"nome": "UGBL - UNIDADE DE GESTÃO DA BACIA DO ROVUMA",
        "datos": {
            "Localidade": "Lichinga",
            "Provincia": "Niassa",
            "Telefone": "",
            "Email": ""
            }
        },
        {"nome": "UGBI - UNIDADE DE GESTÃO DAS BACIAS COSTEIRAS",
        "datos": {
            "Localidade": "Moçimboa da Praia",
            "Provincia": "Cabo Delgado",
            "Telefone": "",
            "Email": ""
            }
        }
    ]');

-- ARA ZAMBEZE
INSERT INTO domains.datos_aras (
    id,
    name,
    nuit,
    endereco,
    conta_bancaria,
    outros,
    valores,
    sede,
    unidades
) VALUES(
    'ARAZ',
    'Administração Regional de Águas do Zambeze',
    '500001577',
    '{Bairro Mpadue EN\, nº 07\,,C.P. 67\, Cidade de Tete\, Moçambique}'::text[],
    '{"iban":"0008 0000 1079144510180", "n_conta":"1079144510001", "entidade":"BCI"}',
    '{"visao": "Uma Bacia com água disponível em qualidade e quantidade adequadas para os usos de actuais e futuros, assegurando o desenvolvimento sustentável, e promoção do bem-estar e paz das comunidades, onde se minimizam os efeitos negativos de cheias e secas e se salvaguardam os interesses dos utentes e de outros interessados","missao": "Garantir a gestão participativa, integrada e sustentável dos recursos hídricos da bacia hidrográfica do rio Zambeze, através do estabelecimento e manutenção de uma base de dados hidrológicos, de um sistema de comunicação com os utentes eficaz e eficiente e do controle e fiscalização da utilização dos recursos hídricos da bacia"}',
    '[]',
    '{
        "nome": "ARA ZAMBEZE",
        "datos": {
            "Localidade": "Cidade de Tête",
            "Provincia": "Tête",
            "Telefone": "(+258 25) 22 39 07/09",
            "Fax": "(+258 25) 22 39 08",
            "Email": "arazambeze@teledata.mz",
            "Website": "http://www.arazambeze.gov.mz"
            }
    }',
    '[
         {"nome": "UGBAZ - UNIDADE DE GESTÃO DA REGIÃO HIDROGRAFICA DO ALTO ZAMBEZE", "datos": {"Fax": "", "Telefone": "(+258) 824295150 / 847047702", "Provincia": "Tete", "Localidade": "Zumbo"}},
         {"nome": "UGBBZ - UNIDADE DE GESTÃO DA REGIÃO HIDROGRAFICA DO BAIXO ZAMBEZE", "datos": {"Fax": "(+258 29) 33 03 85", "Telefone": "(+258) 825715130 / 876830681", "Provincia": "Sofala", "Localidade": "Caia"}}
     ]'
);


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
