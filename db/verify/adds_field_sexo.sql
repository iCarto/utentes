-- Verify utentes:adds_field_sexo on pg

BEGIN;

SELECT * FROM domains.sexo WHERE false;
SELECT sexo_gerente FROM utentes.exploracaos WHERE false;
SELECT sexo_gerente FROM utentes.utentes WHERE false;

SELECT 1/count(*)FROM domains.domains WHERE category = 'sexo';

ROLLBACK;
