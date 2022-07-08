-- Verify utentes:aras_unification_rename_states on pg

BEGIN;

DO $$
DECLARE
    result int;
    result2 text;
    result3 int;
BEGIN
   -- el número de dominios es el mismo que antes
   result := (SELECT count(*) FROM domains.licencia_estado);
   ASSERT result = 17, 'el número de dominios total es incorrecto';

   -- estos dominios no están
   result2 := (
       SELECT key
       FROM domains.licencia_estado
       WHERE key IN ('Documentação incompleta (Pendente utente - DA)', 'Documentação incompleta (Pendente utente - DF)', 'Documentação incompleta (Pendente utente - DJ)', 'Documentação incompleta (Pendente utente - DT)',  'Pendente Análise Pedido Licença (DJ)', 'Pendente Emisão Licença (DJ)',  'Pendente Visita Campo (DT)', 'Pendente Parecer Técnico (DT)')
       LIMIT 1
   );
   ASSERT result2 IS NULL, 'hay dominios en la bd que no deberían estar';

   -- estos dominios si están
   result3 := (
       SELECT count(key)
       FROM domains.licencia_estado
       WHERE key IN ('Documentação incompleta (Pendente utente - DARH)', 'Documentação incompleta (Pendente utente - DSU-F)', 'Documentação incompleta (Pendente utente - DSU-J)', 'Documentação incompleta (Pendente utente - DRH)',  'Pendente Análise Pedido Licença (DSU-J)', 'Pendente Emissão Licença (DSU-J)',  'Pendente Visita Campo (DRH)', 'Pendente Parecer Técnico (DRH)')
   );
   ASSERT result3 = 8, 'faltan dominios que deberían estar';


END $$;

DO $$
DECLARE
    result int;
    result2 text;
    result3 int;
BEGIN
   -- el número de dominios es el mismo que antes
   result := (SELECT count(*) FROM domains.licencia_estado_renovacao);
   ASSERT result = 15, 'renovación: el número total de dominios no es correcto';

   -- estos dominios no están
   result2 := (
       SELECT key
       FROM domains.licencia_estado_renovacao
       WHERE key IN ('Documentação incompleta (Pendente utente - DA)', 'Documentação incompleta (Pendente utente - DF)', 'Documentação incompleta (Pendente utente - DJ)', 'Documentação incompleta (Pendente utente - DT)', 'Pendente Renovação da licença (DA)',  'Pendente Análise Renovação Licença (DJ)', 'Pendente Parecer Técnico Renovação (DT)',  'Pendente Emisão Renovação Licença (DJ)', 'Pendente Dados Renovação Licença (DJ)' )
       LIMIT 1
   );
   ASSERT result2 IS NULL, 'renovación: hay dominios que no deberían estar';

   -- estos dominios si están
   result3 := (
       SELECT count(key)
       FROM domains.licencia_estado_renovacao
       WHERE key IN ('Documentação incompleta (Pendente utente - DARH)', 'Documentação incompleta (Pendente utente - DSU-F)', 'Documentação incompleta (Pendente utente - DSU-J)', 'Documentação incompleta (Pendente utente - DRH)', 'Pendente Renovação da licença (DARH)',  'Pendente Análise Renovação Licença (DSU-J)', 'Pendente Parecer Técnico Renovação (DRH)',  'Pendente Emissão Renovação Licença (DSU-J)', 'Pendente Dados Renovação Licença (DSU-J)' )
   );
   ASSERT result3 = 9, 'renovación: faltan dominios que deberían estar';


END $$;


ROLLBACK;
