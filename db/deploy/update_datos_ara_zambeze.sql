-- Deploy utentes:update_datos_ara_zambeze to pg

BEGIN;

UPDATE utentes.datos_aras SET nuit = '500001577' WHERE name = 'Administração Regional de Águas do Zambeze';
UPDATE utentes.datos_aras SET conta_bancaria = '{"iban":"0008 0000 1079144510180", "n_conta":"1079144510001", "entidade":"BCI"}'::jsonb WHERE name = 'Administração Regional de Águas do Zambeze';
UPDATE utentes.datos_aras SET outros = jsonb_set(outros, '{visao}','"Uma Bacia com água disponível em qualidade e quantidade adequadas para os usos de actuais e futuros, assegurando o desenvolvimento sustentável, e promoção do bem-estar e paz das comunidades, onde se minimizam os efeitos negativos de cheias e secas e se salvaguardam os interesses dos utentes e de outros interessados"') WHERE name = 'Administração Regional de Águas do Zambeze';
UPDATE utentes.datos_aras SET unidades = '[
    {"nome": "UGBS - UNIDADE DE GESTÃO DA BACIA REGIÃO HIDROGRAFICA DO ALTO ZAMBEZE",
    "datos": {
        "Localidade": "Zumbo",
        "Provincia": "Tete",
        "Telefone": "(+258) 824295150 / 847047702",
        "Fax": ""
        }
    },
    {"nome": "UGBL - UNIDADE DE GESTÃO DA BACIA DO",
    "datos": {
        "Localidade": "Caia",
        "Provincia": "Sofala",
        "Telefone": "(+258) 825715130 / 876830681",
        "Fax": "(+258 29) 33 03 85"
        }
    }
]' WHERE name = 'Administração Regional de Águas do Zambeze';

COMMIT;
