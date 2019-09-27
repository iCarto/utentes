-- Revert utentes:set_default_for_req_obs from pg

BEGIN;

ALTER TABLE utentes.exploracaos ALTER COLUMN req_obs DROP DEFAULT;

COMMIT;
