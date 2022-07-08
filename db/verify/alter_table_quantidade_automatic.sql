-- Verify utentes:alter_table_quantidade_automatic on pg

BEGIN;

SELECT 1/(count(*)-1) FROM information_schema.columns
WHERE table_schema = 'inventario' AND table_name='quantidade_agua' AND column_name='q_extraer';

SELECT nivel_agua, prof_campo FROM inventario.quantidade_agua;

SELECT 1/COUNT(*) FROM information_schema.routines
WHERE routine_schema = 'inventario' AND routine_name = 'calcular_quan_agua' AND data_type = 'trigger';

SELECT 1/count(*) FROM information_schema.triggers
	WHERE event_object_schema = 'inventario' AND event_object_table = 'quantidade_agua'
	AND   trigger_schema = 'inventario' AND trigger_name = 'calcular_quan_agua'
	AND   event_manipulation = 'INSERT'
	AND   action_timing = 'BEFORE'
	AND   action_statement = 'EXECUTE PROCEDURE inventario.calcular_quan_agua()'
	AND   action_orientation = 'ROW';

ROLLBACK;
