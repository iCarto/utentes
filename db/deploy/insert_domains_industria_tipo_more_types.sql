-- Deploy utentes:insert_domains_industria_tipo_more_types to pg

BEGIN;

INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Constructora', NULL, NULL, NULL, NULL);
INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Embotelladora', NULL, NULL, NULL, NULL);
INSERT INTO domains.industria_tipo (category, key, value, ordering, parent, tooltip) VALUES ('industria_tipo', 'Revendedora de água', NULL, NULL, NULL, NULL);

COMMIT;
