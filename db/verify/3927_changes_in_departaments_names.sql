-- Verify utentes:3927_changes_in_departaments_names on pg

BEGIN;

-- licencia estado
DO $$
DECLARE
    result int;
    result2 text;
    result3 int;
    result4 int;
BEGIN
   -- el número de dominios es el mismo que antes
   result := (SELECT count(*) FROM domains.licencia_estado);
   ASSERT result = 17, 'el número de dominios total es incorrecto';

   -- estos dominios no están
   result2 := (
       SELECT key
       FROM domains.licencia_estado
       WHERE key IN ('Pendente Análise Renovação Licença (DSU-J)','Pendente Análise Pedido Licença (DSU-J)', 'Pendente Emissão Licença (DSU-J)')
       LIMIT 1
   );
   ASSERT result2 IS NULL, 'hay dominios en la bd que no deberían estar';

   -- estos dominios si están
   result3 := (
       SELECT count(key)
       FROM domains.licencia_estado
       WHERE key IN ('Documentação incompleta (Pendente utente - DSU-L)', 'Pendente Análise Pedido Licença (DSU-L)', 'Pendente Emissão Licença (DSU-L)')
   );
   ASSERT result3 = 3, 'faltan dominios que deberían estar';

   result4:= (
        SELECT count(*)
        FROM domains.licencia_estado
        WHERE tooltip ~ 'departamento jurídico|departamento técnico'
   );
   ASSERT result4 = 0, 'licencia_estado: hay tooltips incorrectos';

END $$;


-- licencia_estado_renovacao
DO $$
DECLARE
    result int;
    result2 text;
    result3 int;
    result4 int;
BEGIN
   -- el número de dominios es el mismo que antes
   result := (SELECT count(*) FROM domains.licencia_estado_renovacao);
   ASSERT result = 15, 'el número de dominios total es incorrecto';

   -- estos dominios no están
   result2 := (
       SELECT key
       FROM domains.licencia_estado_renovacao
       WHERE key IN ('Documentação incompleta (Pendente utente - DSU-J)', 'Pendente Análise Renovação Licença (DSU-J)', 'Pendente Emissão Renovação Licença (DSU-J)', 'Pendente Dados Renovação Licença (DSU-J)')
       LIMIT 1
   );
   ASSERT result2 IS NULL, 'hay dominios en la bd que no deberían estar';

   -- estos dominios si están
   result3 := (
       SELECT count(key)
       FROM domains.licencia_estado_renovacao
       WHERE key IN ('Documentação incompleta (Pendente utente - DSU-L', 'Pendente Análise Renovação Licença (DSU-L)', 'Pendente Emissão Renovação Licença (DSU-L)', 'Pendente Dados Renovação Licença (DSU-L)')
   );
   ASSERT result3 = 4, 'faltan dominios que deberían estar';

   result4:= (
        SELECT count(*)
        FROM domains.licencia_estado_renovacao
        WHERE tooltip ~ 'departamento jurídico|departamento técnico'
   );
   ASSERT result4 = 0, 'licencia_estado_renovacao: hay tooltips incorrectos';

END $$;


-- groups
DO $$
DECLARE
    result int;
    result2 text;
    result3 int;
BEGIN
   -- el número de dominios es el mismo que antes
   result := (SELECT count(*) FROM domains.groups);
   ASSERT result = 8, 'el número de dominios total es incorrecto';

   -- estos dominios no están
   result2 := (
       SELECT key
       FROM domains.groups
       WHERE key IN ('Departamento Serviços Utente - Financeiro',  'Departamento Serviços Utente - Jurídico')
       LIMIT 1
   );
   ASSERT result2 IS NULL, 'hay dominios en la bd que no deberían estar';

   -- estos dominios si están
   result3 := (
       SELECT count(key)
       FROM domains.groups
       WHERE key IN ('Departamento Serviços Utente - Facturação', 'Departamento Serviços Utente - Licenciamento')
   );
   ASSERT result3 = 2, 'faltan dominios que deberían estar';
END $$;

ROLLBACK;
