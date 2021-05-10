-- Revert utentes:add_columns_created_updated from pg

BEGIN;

ALTER TABLE utentes.utentes
    DROP COLUMN updated_at
    , DROP COLUMN created_at
;

DROP TRIGGER update_updated_at ON utentes.utentes;



ALTER TABLE utentes.exploracaos
    DROP COLUMN updated_at
;

DROP TRIGGER update_updated_at ON utentes.exploracaos;


ALTER TABLE utentes.fontes
    DROP COLUMN updated_at
    , DROP COLUMN created_at
;

DROP TRIGGER update_updated_at ON utentes.fontes;



ALTER TABLE utentes.licencias
    DROP COLUMN updated_at
    , DROP COLUMN created_at
;

DROP TRIGGER update_updated_at ON utentes.licencias;



ALTER TABLE utentes.renovacoes
    DROP COLUMN updated_at
    , DROP COLUMN created_at
;

DROP TRIGGER update_updated_at ON utentes.renovacoes;



ALTER TABLE utentes.users
    DROP COLUMN updated_at
;

DROP TRIGGER update_updated_at ON utentes.users;


COMMIT;
