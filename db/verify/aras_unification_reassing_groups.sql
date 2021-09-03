-- Verify utentes:aras_unification_reassing_groups on pg

BEGIN;

SELECT 1/count(*) FROM domains.groups WHERE key = 'Administrador' and ordering = 1;
SELECT 1/count(*) FROM domains.groups WHERE key = 'Departamento de Administração e Recursos Humanos' and ordering = 2;
SELECT 1/count(*) FROM domains.groups WHERE key = 'Direcção' and ordering = 3;
SELECT 1/count(*) FROM domains.groups WHERE key = 'Departamento Serviços Utente - Financeiro' and ordering = 4;
SELECT 1/count(*) FROM domains.groups WHERE key = 'Departamento Serviços Utente - Jurídico' and ordering = 5;
SELECT 1/count(*) FROM domains.groups WHERE key = 'Departamento Recursos Hídricos' and ordering = 6;
SELECT 1/count(*) FROM domains.groups WHERE key = 'Observador' and ordering = 7;
SELECT 1/count(*) FROM domains.groups WHERE key = 'Divisão' and ordering = 8;

DO $$
DECLARE
    result int;
    result2 text;
BEGIN
   result := (SELECT count(*) FROM domains.groups);
   ASSERT result = 8;

   result2 := (
       SELECT usergroup
       FROM utentes.users
       WHERE usergroup NOT IN ('Administrador', 'Departamento de Administração e Recursos Humanos', 'Direcção', 'Departamento Serviços Utente - Financeiro', 'Departamento Serviços Utente - Jurídico', 'Departamento Recursos Hídricos', 'Observador', 'Divisão')
       LIMIT 1
   );
   ASSERT result2 IS NULL;

   result2 := (
       SELECT departamento
       FROM utentes.documentos
       WHERE departamento NOT IN ('Administrador', 'Departamento de Administração e Recursos Humanos', 'Direcção', 'Departamento Serviços Utente - Financeiro', 'Departamento Serviços Utente - Jurídico', 'Departamento Recursos Hídricos', 'Observador', 'Divisão')
       LIMIT 1
   );
   ASSERT result2 IS NULL;
END $$;



ROLLBACK;
