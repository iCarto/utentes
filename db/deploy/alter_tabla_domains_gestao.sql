-- Deploy utentes:alter_tabla_domains_gestao to pg

BEGIN;

UPDATE inventario_dominios.gestao SET key='ARA' WHERE key='ARA-Norte';
UPDATE inventario_dominios.gestao SET ordering=2 WHERE key='Privada';

INSERT INTO inventario_dominios.gestao (key, ordering) VALUES
  ('DNGRH', 1);

COMMIT;
