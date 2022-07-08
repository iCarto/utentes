-- Deploy utentes:aras_unification_rename_state_irregular to pg
BEGIN;

UPDATE
    domains.licencia_estado
SET
    key = 'Inactiva'
    , tooltip = 'A licença encontra-se num estado de inactividade. Não se está a usar água'
WHERE
    key = 'Irregular';

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;

