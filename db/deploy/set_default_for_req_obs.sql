-- Deploy utentes:set_default_for_req_obs to pg

BEGIN;

ALTER TABLE utentes.exploracaos ALTER COLUMN req_obs SET DEFAULT
    '[{"created_at": null, "autor": null, "text": null, "state": null}, {"created_at": null, "autor": null, "text": null, "state": null}]';

COMMIT;
