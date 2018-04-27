-- Deploy utentes:alter_exploracaos_add_estado_lic to pg

BEGIN;

UPDATE utentes.licencias a SET estado = 'Irregular' WHERE exploracao = (SELECT gid FROM utentes.exploracaos WHERE exp_id = '2016-021' and exp_name = 'Herculano E. Faria');
ALTER TABLE utentes.exploracaos ADD COLUMN estado_lic TEXT REFERENCES domains.licencia_estado(key) ON UPDATE CASCADE;
UPDATE utentes.exploracaos a SET estado_lic = (SELECT estado FROM utentes.licencias b WHERE b.exploracao = a.gid LIMIT 1);
ALTER TABLE utentes.exploracaos ALTER COLUMN estado_lic SET NOT NULL;

COMMIT;
