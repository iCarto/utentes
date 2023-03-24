-- Revert utentes:3927_changes_in_departaments_names from pg

BEGIN;


-- licencia_estado
UPDATE
    domains.licencia_estado
SET
    (key, tooltip) =
    ('Documentação incompleta (Pendente utente - DSU-J)'
    , 'O utente tem pendente de entrega alguma documenta ção solicitada pelo ARA - DSJ')
WHERE
    key = 'Documentação incompleta (Pendente utente - DSU-L)';

UPDATE
    domains.licencia_estado
SET
    (key, tooltip) =
    ('Pendente Análise Pedido Licença (DSU-J)'
    , 'O utente tem entregado o pedido de licença. Pendente de revisão legal pelo departamento jurídico')
WHERE
    key = 'Pendente Análise Pedido Licença (DSU-L)';

UPDATE
    domains.licencia_estado
SET
    (key, tooltip) =
    ('Pendente Emissão Licença (DSU-J)'
    , 'Pendente de revisão dos pareceres técnicos e emissão da licença pelo departamento jurídico')
WHERE
    key = 'Pendente Emissão Licença (DSU-L)';

UPDATE
    domains.licencia_estado
SET
    tooltip = 'Pendente que o departamento técnico faça a visitoria ao utente'
WHERE
    key = 'Pendente Visita Campo (DRH)';


UPDATE
    domains.licencia_estado
SET
    tooltip = 'Pendente que o departamento técnico emita o parecer da divisão e o parecer técnico'
WHERE
    key = 'Pendente Parecer Técnico (DRH)';



--licencia_estado_renovacao
-- 15
UPDATE
   domains.licencia_estado_renovacao
SET
   (key, tooltip) =
   ('Documentação incompleta (Pendente utente - DSU-J)'
   , 'O utente tem pendente de entrega alguma documentação solicitada pelo ARA - DSU-J')
WHERE
   key = 'Documentação incompleta (Pendente utente - DSU-L';

UPDATE
    domains.licencia_estado_renovacao
SET
    (key, tooltip) =
    ('Pendente Análise Renovação Licença (DSU-J)'
    , 'O utente tem entregado o pedido renovação de licença. Pendente de revisão legal pelo DSU-J')
WHERE
    key = 'Pendente Análise Renovação Licença (DSU-L)';

UPDATE
    domains.licencia_estado_renovacao
SET
    (key, tooltip) =
    ('Pendente Emissão Renovação Licença (DSU-J)'
    , 'Pendente de revisão dos pareceres técnicos e emissão da licença pelo DSU-J')
WHERE
    key = 'Pendente Emissão Renovação Licença (DSU-L)';

UPDATE
    domains.licencia_estado_renovacao
SET
    (key, tooltip) = ('Pendente Dados Renovação Licença (DSU-J)'
    , 'Pendente de introcução dos dados da nova licença pelo DSU-J')
WHERE
    key = 'Pendente Dados Renovação Licença (DSU-L)';


UPDATE
    domains.licencia_estado_renovacao
SET
    tooltip = 'Pendente Parecer Técnico Renovação (DRH)'
WHERE
    key = 'Pendente que o departamento técnico emita o parecer da divisão e o parecer técnico';

-- groups
-- 8
UPDATE
    domains.groups
SET
    (key, value) =
    ('Departamento Serviços Utente - Financeiro', 'DSU - Financeiro')
WHERE
    key = 'Departamento Serviços Utente - Facturação';

UPDATE
    domains.groups
SET
    (key, value) =
    ('Departamento Serviços Utente - Jurídico', 'DSU - Jurídico')
WHERE
    key = 'Departamento Serviços Utente - Licenciamento';

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
