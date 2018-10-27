-- Deploy utentes:create_table_datos_aras to pg

-- ARAN, ARAS, ARAZ, DPMAIP

-- endereco => ENDERECO
-- outros => VISAO & MISSAO
-- conta_bancaria => ENTIDADE, N CONTA, IBAN
BEGIN;
CREATE TABLE utentes.datos_aras (
    "id" text PRIMARY KEY,
    "name" text NOT NULL,
    "nuit" text NOT NULL,
    "endereco" text,
    "conta_bancaria" JSONB,
    "outros" JSONB,
    "valores" JSONB,
    "sedes" JSONB
);
-- ARA SUL
INSERT INTO utentes.datos_aras (
    id,
    name,
    nuit,
    endereco,
    conta_bancaria,
    outros,
    valores,
    sedes
) VALUES(
    'ARAS',
    'Administração Regional de Águas do Sul',
    '500001062',
    'Av. Samora Machel nº 30 7º andar. 4033, 1º Bairro Fiscal, Cidade de Maputo, Moçambique',
    '[{"entidade":"STANDARD BANK", "n_conta":"1010149101003", "iban":"MZ59 0003 0101 0014910100396"}]',
    '{"visao": "Assegurar a gestão dos recursos hídricos por forma a garantir água em quantidade e qualidade para a preservação do mio ambiente, a mitigação dos efeitos das cheias e secas cíclicas e satisfação das necessidades futuras","missao": "Promover a utilização racional dos recursos hídricos para a defensa do meio ambiente e satisfazer as necessidades dos utentes, alargando a rede de monitoramento, aumentando a capacidade de armazenamento e planeando os recursos hídricos disponíveis com base nas bacias hidrográficas"}',
    '["Orientação para o utente", "Gestão integrada e participativa", "Competência e integridade", "Responsabilidade social"]',
    '[
        {"nome": "SEDE ARA SUL",
        "datos": {
            "Localidade": "Cidade de Maputo",
            "Telefone": "(+258 21) 30 67 29/30",
            "Email": "arasul@ara-sul.co.mz",
            "Provincia": "Maputo",
            "Fax": "(+258 21) 30 67 56",
            "Website": "www.ara-sul.co.mz"
            }
        },
        {"nome": "UGBS - UNIDADE DE GESTÃO DA BACIA DO SAVE",
        "datos": {
            "Localidade": "Maxixe",
            "Telefone": "(+258 29) 33 08 53",
            "Email": "",
            "Provincia": "Inhambane",
            "Fax": "(+258 29) 33 03 85",
            "Website": ""
            }
        },
        {"nome": "UGBL - UNIDADE DE GESTÃO DA BACIA DO LIMPOPO",
        "datos": {
            "Localidade": "Lionde",
            "Telefone": "(+258 28) 12 00 58",
            "Email": "",
            "Provincia": "Gaza",
            "Fax": "(+258 21) 71 30 22",
            "Website": ""
            }
        },
        {"nome": "UGBI - UNIDADE DE GESTÃO DA BACIA DO INCOMATI",
        "datos": {
            "Localidade": "Boane",
            "Telefone": "(+258 21) 75 92 72",
            "Email": "",
            "Provincia": "Maputo",
            "Fax": "(+258 21) 75 92 72",
            "Website": ""
            }
        }
    ]');
-- ARA NORTE
INSERT INTO utentes.datos_aras (
    id,
    name,
    nuit,
    endereco,
    conta_bancaria,
    outros,
    valores,
    sedes
) VALUES(
    'ARAN',
    'Administração Regional de Águas do Norte',
    '500021357',
    'Rúa, nº: Avda. Josina Machel nº 583, Bairro de Natite, Cidade de Pemba, Moçambique',
    '[{"entidade":"BCI", "n_conta":"1428286310001", "iban":"MZ59 0008 0000 1428286310180"}]',
    '{"visao": "Promover o desenvolvimento e gestão coordenada dos recursos hídricos, envolvendo diversos actores a nível da sua área de jurisdição, de forma a garantir a segurança, bem-estar social e económico, sem comprometer a sustentabilidade dos ecossistemas","missao": "Implementar e coordenar a gestão integrada e participativa dos recursos hídricos, regular o acesso a água, por forma a garantir a preservação ambiental e um desenvolvimento sustentável e equilibrado, hoje, amanhã e sempre"}',
    '[]',
    '[
        {"nome": "SEDE ARA NORTE",
        "datos": {
            "Localidade": "Cidade de Pemba",
            "Telefone": "(+258 27) 22 03 19",
            "Email": "info.aranorte@gmail.com",
            "Provincia": "Cabo Delgado",
            "Fax": "(+258 27) 22 14 01",
            "Website": "www.ara-norte.co.mz"
            }
        },
        {"nome": "UGBS - UNIDADE DE GESTÃO DA BACIA DE MESSALO E MONTEPUEZ",
        "datos": {
            "Localidade": "Montepuez",
            "Telefone": "",
            "Email": "",
            "Provincia": "Cabo Delgado",
            "Fax": "",
            "Website": ""
            }
        },
        {"nome": "UGBL - UNIDADE DE GESTÃO DA BACIA DO ROVUMA",
        "datos": {
            "Localidade": "Lichinga",
            "Telefone": "",
            "Email": "",
            "Provincia": "Niassa",
            "Fax": "",
            "Website": ""
            }
        },
        {"nome": "UGBI - UNIDADE DE GESTÃO DAS BACIAS COSTEIRAS",
        "datos": {
            "Localidade": "Moçimboa da Praia",
            "Telefone": "",
            "Email": "",
            "Provincia": "Cabo Delgado",
            "Fax": "",
            "Website": ""
            }
        }
    ]');
-- ARA ZAMBEZE
INSERT INTO utentes.datos_aras (
    id,
    name,
    nuit,
    endereco,
    conta_bancaria,
    outros,
    valores,
    sedes
) VALUES(
    'ARAZ',
    'Administração Regional de Águas do Zambeze',
    '',
    'Bairro Mpadue EN, nº 07, C.P. 67, Cidade de Tete, Moçambique',
    '[{"entidade":"", "n_conta":"", "iban":""}]',
    '{"visao": "","missao": "Garantir a gestão participativa, integrada e sustentável dos recursos hídricos da bacia hidrográfica do rio Zambeze, através do estabelecimento e manutenção de uma base de dados hidrológicos, de um sistema de comunicação com os utentes eficaz e eficiente e do controle e fiscalização da utilização dos recursos hídricos da bacia"}',
    '[]',
    '[
        {"nome": "SEDE ARA ZAMBEZE",
        "datos": {
            "Localidade": "Cidade de Tête",
            "Telefone": "(+258 25) 22 39 07/09",
            "Email": "arazambeze@teledata.mz",
            "Provincia": "Tête",
            "Fax": "(+258 25) 22 39 08",
            "Website": "http://www.arazambeze.gov.mz"
            }
        },
        {"nome": "UGBS - UNIDADE DE GESTÃO DA BACIA DE MESSALO E MONTEPUEZ",
        "datos": {
            "Localidade": "Montepuez",
            "Telefone": "",
            "Email": "",
            "Provincia": "Cabo Delgado",
            "Fax": "",
            "Website": ""
            }
        },
        {"nome": "UGBL - UNIDADE DE GESTÃO DA BACIA DO ROVUMA",
        "datos": {
            "Localidade": "Lichinga",
            "Telefone": "",
            "Email": "",
            "Provincia": "Niassa",
            "Fax": "",
            "Website": ""
            }
        },
        {"nome": "UGBI - UNIDADE DE GESTÃO DAS BACIAS COSTEIRAS",
        "datos": {
            "Localidade": "Moçimboa da Praia",
            "Telefone": "",
            "Email": "",
            "Provincia": "Cabo Delgado",
            "Fax": "",
            "Website": ""
            }
        }
    ]');


COMMIT;
