-- Deploy utentes:3927_changes_in_departaments_names to pg

BEGIN;

-- licencia_estado
UPDATE
    domains.licencia_estado
SET
    (key, tooltip) =
    ('Documentação incompleta (Pendente utente - DSU-L)'
    , 'O utente tem pendente de entrega alguma documenta ção solicitada pelo ARA - DSU-L')
WHERE
    key = 'Documentação incompleta (Pendente utente - DSU-J)';

UPDATE
    domains.licencia_estado
SET
    (key, tooltip) =
    ('Pendente Análise Pedido Licença (DSU-L)'
    , 'O utente tem entregado o pedido de licença. Pendente de revisão legal pelo DSU-L')
WHERE
    key = 'Pendente Análise Pedido Licença (DSU-J)';

UPDATE
    domains.licencia_estado
SET
    (key, tooltip) =
    ('Pendente Emissão Licença (DSU-L)'
    , 'Pendente de revisão dos pareceres técnicos e emissão da licença pelo DSU-L')
WHERE
    key = 'Pendente Emissão Licença (DSU-J)';

UPDATE
    domains.licencia_estado
SET
    tooltip = 'Pendente que o DRH faça a visitoria ao utente'
WHERE
    key = 'Pendente Visita Campo (DRH)';


UPDATE
    domains.licencia_estado
SET
    tooltip = 'Pendente que o DRH emita o parecer da divisão e o parecer técnico'
WHERE
    key = 'Pendente Parecer Técnico (DRH)';



--licencia_estado_renovacao
-- 15
UPDATE
   domains.licencia_estado_renovacao
SET
   (key, tooltip) =
   ('Documentação incompleta (Pendente utente - DSU-L'
   , 'O utente tem pendente de entrega alguma documentação solicitada pelo ARA - DSU-L')
WHERE
   key = 'Documentação incompleta (Pendente utente - DSU-J)';

UPDATE
    domains.licencia_estado_renovacao
SET
    (key, tooltip) =
    ('Pendente Análise Renovação Licença (DSU-L)'
    , 'O utente tem entregado o pedido renovação de licença. Pendente de revisão legal pelo DSU-L')
WHERE
    key = 'Pendente Análise Renovação Licença (DSU-J)';

UPDATE
    domains.licencia_estado_renovacao
SET
    (key, tooltip) =
    ('Pendente Emissão Renovação Licença (DSU-L)'
    , 'Pendente de revisão dos pareceres técnicos e emissão da licença pelo DSU-L')
WHERE
    key = 'Pendente Emissão Renovação Licença (DSU-J)';

UPDATE
    domains.licencia_estado_renovacao
SET
    (key, tooltip) = ('Pendente Dados Renovação Licença (DSU-L)'
    , 'Pendente de introcução dos dados da nova licença pelo DSU-L')
WHERE
    key = 'Pendente Dados Renovação Licença (DSU-J)';


UPDATE
    domains.licencia_estado_renovacao
SET
    tooltip = 'Pendente que o DRH emita o parecer da divisão e o parecer técnico'
WHERE
    key = 'Pendente Parecer Técnico Renovação (DRH)';

-- groups
-- 8
UPDATE
    domains.groups
SET
    (key, value) =
    ('Departamento Serviços Utente - Facturação', 'DSU - Facturação')
WHERE
    key = 'Departamento Serviços Utente - Financeiro';

UPDATE
    domains.groups
SET
    (key, value) =
    ('Departamento Serviços Utente - Licenciamento', 'DSU - Licenciamento')
WHERE
    key = 'Departamento Serviços Utente - Jurídico';

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
