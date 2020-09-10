-- Deploy utentes:update_table_datos_aras_with_rigth_unidades to pg

BEGIN;

-- select jsonb_set(sede, '{datos, Email}', '"foo"', false) from domains.datos_aras where id = 'ARAS';

UPDATE domains.datos_aras SET
    sede = jsonb_set(sede, '{datos}', sede -> 'datos' || '{"Email": "ara-sul@ara-sul.gov.mz", "Website": "www.ara-sul.gov.mz"}', false)
    , unidades = jsonb_set(unidades, '{3}', unidades -> 3 || '{"nome": "UGBU - UNIDADE DE GESTÃO DA BACIA DO UMBELÚZI"}', false)
WHERE id = 'ARAS';

UPDATE domains.datos_aras SET
    unidades = jsonb_set(unidades, '{0}', unidades -> 0 || '{"nome": "UGBAZ - UNIDADE DE GESTÃO DA REGIÃO HIDROGRAFICA DO ALTO ZAMBEZE"}', false)
WHERE id = 'ARAZ';

UPDATE domains.datos_aras SET
    unidades = jsonb_set(unidades, '{1}', unidades -> 1 || '{"nome": "UGBBZ - UNIDADE DE GESTÃO DA REGIÃO HIDROGRAFICA DO BAIXO ZAMBEZE"}', false)
WHERE id = 'ARAZ';


COMMIT;
