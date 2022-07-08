-- Revert utentes:alter_tabla_domains_gestao from pg

BEGIN;

DELETE FROM inventario_dominios.gestao WHERE key='DNGRH';

UPDATE inventario_dominios.gestao SET key='ARA-Norte' WHERE key='ARA';
UPDATE inventario_dominios.gestao SET ordering=1 WHERE key='Privada';

COMMIT;
