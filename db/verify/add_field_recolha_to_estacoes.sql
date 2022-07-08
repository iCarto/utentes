-- Verify utentes:add_field_recolha_to_estacoes on pg

BEGIN;

SELECT key FROM domains.estacoes_recolha WHERE false;
SELECT recolha FROM inventario.estacoes WHERE false;

ROLLBACK;
