-- Deploy utentes:aras_unification_rename_states to pg
BEGIN;

-- UPDATE domains.licencia_estado SET key = 'Irregular' WHERE key = 'Irregular';
-- UPDATE domains.licencia_estado SET key = 'Licenciada' WHERE key = 'Licenciada';
-- UPDATE domains.licencia_estado SET key = 'Utente de usos comuns' WHERE key = 'Utente de usos comuns';
-- UPDATE domains.licencia_estado SET key = 'Utente de facto' WHERE key = 'Utente de facto';
-- UPDATE domains.licencia_estado SET key = 'Não aprovada' WHERE key = 'Não aprovada';
UPDATE
    domains.licencia_estado
SET
    key = 'Documentação incompleta (Pendente utente - Direcção)'
    , tooltip = 'O utente tem pendente de entrega alguma documentação solicitada pelo ARA - Direcção'
WHERE
    key = 'Documentação incompleta (Pendente utente - Direcção)';

UPDATE
    domains.licencia_estado
SET
    key = 'Documentação incompleta (Pendente utente - DARH)'
    , tooltip = 'O utente tem pendente de entrega alguma documenta ção solicitada pelo ARA - DARH'
WHERE
    key = 'Documentação incompleta (Pendente utente - DA)';

UPDATE
    domains.licencia_estado
SET
    key = 'Documentação incompleta (Pendente utente - DSU-F)'
    , tooltip = 'O utente tem pendente de entrega alguma documenta ção solicitada pelo ARA - DSU-F'
WHERE
    key = 'Documentação incompleta (Pendente utente - DF)';

UPDATE
    domains.licencia_estado
SET
    key = 'Documentação incompleta (Pendente utente - DSU-J)'
    , tooltip = 'O utente tem pendente de entrega alguma documenta ção solicitada pelo ARA - DSU-J'
WHERE
    key = 'Documentação incompleta (Pendente utente - DJ)';

UPDATE
    domains.licencia_estado
SET
    key = 'Documentação incompleta (Pendente utente - DRH)'
    , tooltip = 'O utente tem pendente de entrega alguma documenta ção solicitada pelo ARA - DRH'
WHERE
    key = 'Documentação incompleta (Pendente utente - DT)';

-- UPDATE domains.licencia_estado SET key = 'Pendente Revisão Pedido Licença (Direcção)' WHERE key = 'Pendente Revisão Pedido Licença (Direcção)';
UPDATE
    domains.licencia_estado
SET
    key = 'Pendente Análise Pedido Licença (DSU-J)'
WHERE
    key = 'Pendente Análise Pedido Licença (DJ)';

UPDATE
    domains.licencia_estado
SET
    key = 'Pendente Emissão Licença (DSU-J)'
WHERE
    key = 'Pendente Emisão Licença (DJ)';

-- UPDATE domains.licencia_estado SET key = 'Pendente Firma Licença (Direcção)' WHERE key = 'Pendente Firma Licença (Direcção)';
UPDATE
    domains.licencia_estado
SET
    key = 'Pendente Visita Campo (DRH)'
WHERE
    key = 'Pendente Visita Campo (DT)';

UPDATE
    domains.licencia_estado
SET
    key = 'Pendente Parecer Técnico (DRH)'
    , tooltip = 'Pendente que o departamento técnico emita o parecer da divisão e o parecer técnico'
WHERE
    key = 'Pendente Parecer Técnico (DT)';

-- UPDATE domains.licencia_estado_renovacao SET key = 'Não aprovada' WHERE key = 'Não aprovada';
-- UPDATE domains.licencia_estado_renovacao SET key = 'Licenciada' WHERE key = 'Licenciada';
-- UPDATE domains.licencia_estado_renovacao SET key = 'Utente de facto' WHERE key = 'Utente de facto';
UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Documentação incompleta (Pendente utente - Direcção)'
    , tooltip = 'O utente tem pendente de entrega alguma documentação solicitada pelo ARA - Direcção'
WHERE
    key = 'Documentação incompleta (Pendente utente - Direcção)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Documentação incompleta (Pendente utente - DARH)'
    , tooltip = 'O utente tem pendente de entrega alguma documentação solicitada pelo ARA - DARH'
WHERE
    key = 'Documentação incompleta (Pendente utente - DA)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Documentação incompleta (Pendente utente - DSU-F)'
    , tooltip = 'O utente tem pendente de entrega alguma documentação solicitada pelo ARA - DSU-F'
WHERE
    key = 'Documentação incompleta (Pendente utente - DF)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Documentação incompleta (Pendente utente - DSU-J)'
    , tooltip = 'O utente tem pendente de entrega alguma documentação solicitada pelo ARA - DSU-J'
WHERE
    key = 'Documentação incompleta (Pendente utente - DJ)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Documentação incompleta (Pendente utente - DRH)'
    , tooltip = ''
WHERE
    key = 'Documentação incompleta (Pendente utente - DT)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Pendente Renovação da licença (DARH)'
    , tooltip = 'O utente tem entregado o pedido de renovação de licença. Pendente de revisão pelo departamento administrativo'
WHERE
    key = 'Pendente Renovação da licença (DA)';

-- UPDATE domains.licencia_estado_renovacao SET key = 'Pendente Revisão Renovação (Direcção)' WHERE key = 'Pendente Revisão Renovação (Direcção)';
UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Pendente Análise Renovação Licença (DSU-J)'
WHERE
    key = 'Pendente Análise Renovação Licença (DJ)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Pendente Parecer Técnico Renovação (DRH)'
    , tooltip = 'Pendente que o departamento técnico emita o parecer da divisão e o parecer técnico'
WHERE
    key = 'Pendente Parecer Técnico Renovação (DT)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Pendente Emissão Renovação Licença (DSU-J)'
WHERE
    key = 'Pendente Emisão Renovação Licença (DJ)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Pendente Dados Renovação Licença (DSU-J)'
WHERE
    key = 'Pendente Dados Renovação Licença (DJ)';

-- UPDATE domains.licencia_estado_renovacao SET key = 'Pendente Firma Renovação Licença (Direcção)' WHERE key = 'Pendente Firma Renovação Licença (Direcção)';
UPDATE
    domains.facturacao_fact_estado
SET
    key = 'Pendente Acrescentar Consumo (DRH)'
WHERE
    key = 'Pendente Acrescentar Consumo (DT)';

UPDATE
    domains.facturacao_fact_estado
SET
    key = 'Pendente Emissão Factura (DSU-F)'
WHERE
    key = 'Pendente Emisão Factura (DF)';

UPDATE
    domains.facturacao_fact_estado
SET
    key = 'Pendente Pagamento (DSU-F)'
WHERE
    key = 'Pendente Pagamento (DF)';

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;

