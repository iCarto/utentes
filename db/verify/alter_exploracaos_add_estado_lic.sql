-- Verify utentes:alter_exploracaos_add_estado_lic on pg

BEGIN;

SELECT estado_lic FROM utentes.exploracaos WHERE false;

SELECT CASE (SELECT count(*) as nexploracaos FROM utentes.exploracaos) WHEN 0 THEN 1 ELSE 1/count(*) END FROM utentes.exploracaos WHERE estado_lic IS NOT NULL;


ROLLBACK;
