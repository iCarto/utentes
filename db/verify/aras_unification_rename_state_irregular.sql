-- Verify utentes:aras_unification_rename_state_irregular on pg

BEGIN;

DO $$
DECLARE
    result text;
    result2 text;

BEGIN

   -- estos dominios si están
   result := (
       SELECT key
       FROM domains.licencia_estado
       WHERE key IN ('Inactiva')
       LIMIT 1
   );
   ASSERT result = 'Inactiva', 'Inactiva debería estar en la tabla';


   -- estos dominios no deben estar
   result2 := (
       SELECT key
       FROM domains.licencia_estado
       WHERE key IN ('Irregular')
       LIMIT 1
   );
   ASSERT result2 IS NULL, 'Irregular no debería estar en la tabla';



END $$;

ROLLBACK;
