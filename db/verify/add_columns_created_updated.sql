-- Verify utentes:add_columns_created_updated on pg

BEGIN;

SELECT 1/COUNT(*)
FROM information_schema.routines
WHERE
    routine_schema = 'utentes'
    AND routine_name = 'update_updated_at'
    AND data_type = 'trigger'
;




SELECT updated_at, created_at FROM utentes.utentes;
SELECT updated_at, created_at FROM utentes.exploracaos;
SELECT updated_at, created_at FROM utentes.fontes;
SELECT updated_at, created_at FROM utentes.licencias;
SELECT updated_at, created_at FROM utentes.renovacoes;
SELECT updated_at, created_at FROM utentes.users;


SELECT 1/count(*) FROM information_schema.triggers
	WHERE event_object_schema = 'utentes' AND event_object_table = 'utentes'
	AND   trigger_schema = 'utentes' AND trigger_name = 'update_updated_at'
	AND   event_manipulation = 'UPDATE'
	AND   action_timing = 'BEFORE'
	AND   action_statement = 'EXECUTE PROCEDURE utentes.update_updated_at()'
	AND   action_orientation = 'ROW';


SELECT 1/count(*) FROM information_schema.triggers
	WHERE event_object_schema = 'utentes' AND event_object_table = 'exploracaos'
	AND   trigger_schema = 'utentes' AND trigger_name = 'update_updated_at'
	AND   event_manipulation = 'UPDATE'
	AND   action_timing = 'BEFORE'
	AND   action_statement = 'EXECUTE PROCEDURE utentes.update_updated_at()'
	AND   action_orientation = 'ROW';

SELECT 1/count(*) FROM information_schema.triggers
	WHERE event_object_schema = 'utentes' AND event_object_table = 'facturacao'
	AND   trigger_schema = 'utentes' AND trigger_name = 'update_updated_at'
	AND   event_manipulation = 'UPDATE'
	AND   action_timing = 'BEFORE'
	AND   action_statement = 'EXECUTE PROCEDURE utentes.update_updated_at()'
	AND   action_orientation = 'ROW';

SELECT 1/count(*) FROM information_schema.triggers
	WHERE event_object_schema = 'utentes' AND event_object_table = 'fontes'
	AND   trigger_schema = 'utentes' AND trigger_name = 'update_updated_at'
	AND   event_manipulation = 'UPDATE'
	AND   action_timing = 'BEFORE'
	AND   action_statement = 'EXECUTE PROCEDURE utentes.update_updated_at()'
	AND   action_orientation = 'ROW';

SELECT 1/count(*) FROM information_schema.triggers
	WHERE event_object_schema = 'utentes' AND event_object_table = 'licencias'
	AND   trigger_schema = 'utentes' AND trigger_name = 'update_updated_at'
	AND   event_manipulation = 'UPDATE'
	AND   action_timing = 'BEFORE'
	AND   action_statement = 'EXECUTE PROCEDURE utentes.update_updated_at()'
	AND   action_orientation = 'ROW';

SELECT 1/count(*) FROM information_schema.triggers
	WHERE event_object_schema = 'utentes' AND event_object_table = 'renovacoes'
	AND   trigger_schema = 'utentes' AND trigger_name = 'update_updated_at'
	AND   event_manipulation = 'UPDATE'
	AND   action_timing = 'BEFORE'
	AND   action_statement = 'EXECUTE PROCEDURE utentes.update_updated_at()'
	AND   action_orientation = 'ROW';

SELECT 1/count(*) FROM information_schema.triggers
	WHERE event_object_schema = 'utentes' AND event_object_table = 'users'
	AND   trigger_schema = 'utentes' AND trigger_name = 'update_updated_at'
	AND   event_manipulation = 'UPDATE'
	AND   action_timing = 'BEFORE'
	AND   action_statement = 'EXECUTE PROCEDURE utentes.update_updated_at()'
	AND   action_orientation = 'ROW';

ROLLBACK;
