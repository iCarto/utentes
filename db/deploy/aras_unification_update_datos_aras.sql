-- Deploy utentes:aras_unification_update_datos_aras to pg


-- endereco => ENDERECO
-- outros => VISAO & MISSAO
-- conta_bancaria => ENTIDADE, N CONTA, IBAN

BEGIN;

DELETE FROM domains.datos_aras;

-- ARA-SUL, IP
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
    'ARAS'
    , 'Administração Regional de Águas do Sul, Instituto Público'
    , '500001062'
    , '{Av. Samora Machel nº 30 7º andar. 4033\,,1º Bairro Fiscal\, Cidade de Maputo\, Moçambique}'::text[]
    , '{"entidade":"STANDARD BANK", "n_conta":"1010149101003", "iban":"MZ59 0003 0101 0014910100396"}'
    , '{
        "visao": "Assegurar a gestão sócio-económica dos recursos hídricos para garantir água em quantidade e qualidade para a preservação do meio ambiente, mitigação dos efeitos das cheias, secas cíclicas e satisfação das necessidades futuras."
        ,
        "missao": "Garantir a utilização económica e racional da água para a defesa do meio ambiente e satisfação dos utentes, alargando a rede de monitoramento dos recursos hídricos e gerindo eficientemente as infra-estructuras de retenção de água."
      }'
    , '["Orientação para o utente", "Gestão integrada e participativa", "Competência e integridade", "Responsabilidade social"]'
    , '{
        "nome": "ARA-SUL, IP",
        "datos": {
            "Localidade": "Cidade de Maputo",
            "Provincia": "Maputo",
            "Telefone": "(+258 21) 30 67 29/30",
            "Fax": "(+258 21) 30 67 56",
            "Email": "ara-sul@ara-sul.gov.mz",
            "Website": "www.ara-sul.gov.mz"
        }
      }'
    , '[
        {"nome": "DGBS - DIVISÃO DE GESTÃO DA BACIA HIDROGRÁFICA DO SAVE ",
        "datos": {
            "Localidade": "Maxixe",
            "Provincia": "Inhambane",
            "Telefone": "(+258 29) 33 08 53",
            "Fax": "(+258 29) 33 03 85"
            }
        },
        {"nome": "DGBL - DIVISÃO DE GESTÃO DA BACIA HIDROGRÁFICA DO LIMPOPO",
        "datos": {
            "Localidade": "Lionde",
            "Provincia": "Gaza",
            "Telefone": "(+258 28) 12 00 58",
            "Fax": "(+258 21) 71 30 22"
            }
        },
        {"nome": "DGBI - DIVISÃO DE GESTÃO DA BACIA HIDROGRÁFICA DO INCOMATI ",
        "datos": {
            "Localidade": "Corumana",
            "Provincia": "Maputo",
            "Telefone": "(+258 21) 56 00 16",
            "Fax": "(+258 21) 56 00 22"
            }
        },
        {"nome": "DGBUM – DIVISÃO DE GESTÃO DA BACIA HIDROGRÁFICA DO UMBELÚZI",
        "datos": {
            "Localidade": "Boane",
            "Provincia": "Maputo",
            "Telefone": "(+258 21) 75 92 72",
            "Fax": "(+258 21) 75 92 72"
            }
        }
    ]'
);

-- ARA-NORTE, IP
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
    'ARAN'
    , 'Administração Regional de Águas do Norte, Instituto Público'
    , '500171871'
    , '{
        Estrada Nacional nº1\,
        ,
        Bairro Mutauanha\, Nampula\, Moçambique.
     }'
    , '{"entidade":"BCI / BIM", "n_conta":"1631734110001 / 140084394", "iban":"MZ59 0008 0000 16317341101 80 / MZ59 0001 0000 00140084394 57"}'
    , '{
        "visao": "Proporcionar uma melhor gestão integrada e sustentável dos recursos hídricos em benefício das comunidades."
        ,
        "missao": "Uma Bacia com água disponível em qualidade e quantidade adequadas para os usos actuais e futuros, assegurando o desenvolvimento sustentável, e promoção do bem-estar e paz das comunidades."
      }'
    , '["Compromisso.", "Profissionalismo.", "Integridade.", "Excelência", "Eficiência e eficácia.", "Transparência."]'
    , '{
        "nome": "ARA-NORTE, IP",
         "datos": {
            "Localidade": "Cidade de Nampula",
            "Provincia": "Nampula",
            "Telefone": "+258 26217326",
            "Fax": "+258 26217318",
            "Email": "aranorteip@aranorte.gov.mz",
            "Website": "www.aranorte.gov.mz"
        }
      }'
     , '[
        {"nome": "DGBR - DIVISÃO DE GESTÃO DA BACIA HIDROGRÁFICA DO ROVUMA",
        "datos": {
            "Localidade": "Lichinga",
            "Provincia": "Niassa",
            "Telefone": "",
            "Fax": "N/A",
            "Email": ""
            }
        },

        {"nome": "DGBM - DIVISÃO DE GESTÃO DAS BACIAS HIDROGRÁFICAS DO MESSALO E MONTEPUEZ",
        "datos": {
            "Localidade": "Pemba",
            "Provincia": "Cabo Delgado",
            "Telefone": "+258 877350050",
            "Fax": "N/A",
            "Email": ""
            }
        },

        {"nome": "DGBL - DIVISÃO DE GESTÃO DA BACIA HIDROGRÁFICA DO LÚRIO",
        "datos": {
            "Localidade": "Cuamba",
            "Provincia": "Niassa",
            "Telefone": "+258 876217317",
            "Fax": "N/A",
            "Email": ""
            }
        },

        {"nome": "DGBLIC - DIVISÃO DE GESTÃO DA BACIA HIDROGRÁFICA DO LICUNGO E BACIAS COSTEIRAS",
        "datos": {
            "Localidade": "Mocuba",
            "Provincia": "Zambézia",
            "Telefone": "+258 24810757 / +25864719976",
            "Fax": "N/A",
            "Email": ""
            }
        }
    ]'
);



-- ARA-CENTRO, IP
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
    'ARAC'
    , 'Administração Regional de Águas do Centro, Instituto Público'
    , '500001577'
    , '{Bairro Mpadue EN\, nº 07\,,C.P. 67\, Cidade de Tete\, Moçambique}'::text[]
    , '{"entidade":"BCI", "n_conta": "1079144510001", "iban": "0008 0000 1079144510180"}'
    , '{
        "visao": "Uma Bacia com água disponível em qualidade e quantidade adequadas para os usos de actuais e futuros, assegurando o desenvolvimento sustentável, e promoção do bem-estar e paz das comunidades, onde se minimizam os efeitos negativos de cheias e secas e se salvaguardam os interesses dos utentes e de outros interessados."
        ,
        "missao": "Garantir a gestão participativa, integrada e sustentável dos recursos hídricos da bacia hidrográfica dos rios Zambeze, Púnguè e Buzi, através do estabelecimento e manutenção de uma base de dados hidrológicos, de um sistema de comunicação com os utentes eficaz e eficiente e do controle e fiscalização da utilização dos recursos hídricos da bacia."}'
     , '["Compromisso.", "Integridade.", "Eficiência e eficácia.", "Solidariedade."]'
     , '{
        "nome": "ARA-CENTRO, IP",
        "datos": {
            "Localidade": "Cidade de Tête",
            "Provincia": "Tête",
            "Telefone": "(+258 25) 22 39 07/09",
            "Fax": "(+258 25) 22 39 08",
            "Email": "info@aracentroip.gov.mz",
            "Website": "www.aracentroip.gov.mz"
        }
       }'
    , '[
        {
            "nome": "DGBZ - DIVISÃO DE GESTÃO DA BACIA HIDROGRÁFICA DO ZAMBEZE",
            "datos": {
                "Localidade": "Moatize",
                "Provincia": "Tête",
                "Telefone": "",
                "Fax": ""
            }
        },
        {"nome": "DGBP - DIVISÃO DE GESTÃO DA BACIA HIDROGRÁFICA DO PÚNGUÈ",
        "datos": {
            "Localidade": "Cidade da Beira",
            "Provincia": "Sofala",
            "Telefone": "",
            "Fax": ""
            }
        },
        {"nome": "DGBB - DIVISÃO DE GESTÃO DA BACIA HIDROGRÁFICA DO BÚZI",
        "datos": {
            "Localidade": "Goonda",
            "Provincia": "Sofala",
            "Telefone": "",
            "Fax": ""
            }
        }
     ]'
);






COMMIT;
