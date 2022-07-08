-- Revert utentes:aras_unification_rename_state_irregular from pg

BEGIN;

UPDATE domains.licencia_estado SET
    key = 'Irregular'
    , tooltip = 'A licença encontra-se num estado irregular (Incumplimieto dos acordos)'
WHERE
    key = 'Inactiva'
;

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
