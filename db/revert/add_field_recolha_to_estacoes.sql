-- Revert utentes:add_field_recolha_to_estacoes from pg

BEGIN;

ALTER TABLE inventario.estacoes DROP COLUMN recolha;
DROP TABLE domains.estacoes_recolha;

COMMIT;
