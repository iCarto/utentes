-- Revert utentes:populate_domains_table from pg

BEGIN;


DELETE FROM domains.actividade;
DELETE FROM domains.animal_tipo;
DELETE FROM domains.subacia;
DELETE FROM domains.rega_tipo;
DELETE FROM domains.bacia;
DELETE FROM domains.contador;
DELETE FROM domains.cultivo_tipo;
DELETE FROM domains.distrito;
DELETE FROM domains.energia_tipo;
DELETE FROM domains.fonte_tipo;
DELETE FROM domains.industria_tipo;
DELETE FROM domains.licencia_estado;
DELETE FROM domains.licencia_tipo;
DELETE FROM domains.pagamentos;
DELETE FROM domains.posto;
DELETE FROM domains.provincia;


COMMIT;


