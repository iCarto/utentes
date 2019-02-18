-- Deploy utentes:create_new_user_can_not_edit_anything to pg

BEGIN;

INSERT INTO domains.groups (key, ordering) VALUES ('Observador', 7);

COMMIT;
