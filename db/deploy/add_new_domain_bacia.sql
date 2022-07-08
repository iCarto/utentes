-- Deploy utentes:add_new_domain_bacia to pg

BEGIN;

INSERT INTO domains.bacia (category, key, parent, app) VALUES
('bacia', 'Infulene', 'UGBU', '{Sul}');

INSERT INTO domains.subacia (category, key, parent, app) VALUES
('subacia', 'Infulene', 'Infulene', '{Sul}');


COMMIT;
