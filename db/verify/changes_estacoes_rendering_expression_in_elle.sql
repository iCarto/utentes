-- Verify utentes:changes_estacoes_rendering_expression_in_elle on pg

BEGIN;

-- SELECT count(*) FROM elle._map_style WHERE definicion ~ '!=';

SELECT 1/count(*) FROM elle._map_style WHERE definicion ~ '<>';

ROLLBACK;
