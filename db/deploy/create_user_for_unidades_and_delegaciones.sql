-- Deploy utentes:create_user_for_unidades_and_delegaciones to pg

BEGIN;

INSERT INTO domains.groups (key, ordering) VALUES ('Unidade ou Delegação', 8);

COMMIT;
