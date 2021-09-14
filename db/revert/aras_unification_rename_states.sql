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
    , tooltip = 'O utente tem pendente de entrega alguma documentação solicitada pela Direcção'
WHERE
    key = 'Documentação incompleta (Pendente utente - Direcção)';

UPDATE
    domains.licencia_estado
SET
    key = 'Documentação incompleta (Pendente utente - DA)'
    , tooltip = 'O utente tem pendente de entrega alguma documentação solicitada pelo D. Administrativo'
WHERE
    key = 'Documentação incompleta (Pendente utente - DARH)';

UPDATE
    domains.licencia_estado
SET
    key = 'Documentação incompleta (Pendente utente - DF)'
    , tooltip = 'O utente tem pendente de entrega alguma documentação solicitada pelo D. Finaciero'
WHERE
    key = 'Documentação incompleta (Pendente utente - DSU-F)';

UPDATE
    domains.licencia_estado
SET
    key = 'Documentação incompleta (Pendente utente - DJ)'
    , tooltip = 'Pendente de revisão dos pareceres técnicos e emissão da licença pelo departamento jurídico'
WHERE
    key = 'Documentação incompleta (Pendente utente - DSU-J)';

UPDATE
    domains.licencia_estado
SET
    key = 'Documentação incompleta (Pendente utente - DT)'
    , tooltip = 'O utente tem pendente de entrega alguma documentação solicitada pelo R. Cadastro DT'
WHERE
    key = 'Documentação incompleta (Pendente utente - DRH)';

UPDATE
    domains.licencia_estado
SET
    key = 'Pendente Revisão Pedido Licença (Direcção)'
WHERE
    key = 'Pendente Revisão Pedido Licença (Direcção)';

UPDATE
    domains.licencia_estado
SET
    key = 'Pendente Firma Licença (Direcção)'
WHERE
    key = 'Pendente Firma Licença (Direcção)';

UPDATE
    domains.licencia_estado
SET
    key = 'Pendente Análise Pedido Licença (DJ)'
WHERE
    key = 'Pendente Análise Pedido Licença (DSU-J)';

UPDATE
    domains.licencia_estado
SET
    key = 'Pendente Emisão Licença (DJ)'
WHERE
    key = 'Pendente Emissão Licença (DSU-J)';

UPDATE
    domains.licencia_estado
SET
    key = 'Pendente Visita Campo (DT)'
WHERE
    key = 'Pendente Visita Campo (DRH)';

UPDATE
    domains.licencia_estado
SET
    key = 'Pendente Parecer Técnico (DT)'
    , tooltip = 'Pendente que o departamento técnico emita o parecer da unidade e o parecer técnico.'
WHERE
    key = 'Pendente Parecer Técnico (DRH)';

-- UPDATE domains.licencia_estado_renovacao SET key = 'Não aprovada' WHERE key = 'Não aprovada';
-- UPDATE domains.licencia_estado_renovacao SET key = 'Licenciada' WHERE key = 'Licenciada';
-- UPDATE domains.licencia_estado_renovacao SET key = 'Utente de facto' WHERE key = 'Utente de facto';
UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Documentação incompleta (Pendente utente - Direcção)'
    , tooltip = 'O utente tem pendente de entrega alguma documentação solicitada pela Direcção'
WHERE
    key = 'Documentação incompleta (Pendente utente - Direcção)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Documentação incompleta (Pendente utente - DA)'
    , tooltip = 'O utente tem pendente de entrega alguma documentação solicitada pelo D. Administrativo'
WHERE
    key = 'Documentação incompleta (Pendente utente - DARH)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Documentação incompleta (Pendente utente - DF)'
    , tooltip = 'O utente tem pendente de entrega alguma documentação solicitada pelo D. Finaciero'
WHERE
    key = 'Documentação incompleta (Pendente utente - DSU-F)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Documentação incompleta (Pendente utente - DJ)'
    , tooltip = 'O utente tem pendente de entrega alguma documentação solicitada pelo D. Jurídico'
WHERE
    key = 'Documentação incompleta (Pendente utente - DSU-J)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Documentação incompleta (Pendente utente - DT)'
    , tooltip = 'O utente tem pendente de entrega alguma documentação solicitada pelo R. Cadastro DT'
WHERE
    key = 'Documentação incompleta (Pendente utente - DRH)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Pendente Renovação da licença (DA)'
    , tooltip = 'O utente tem entregado o pedido de renovação de licença. Pendente de revisão pelo departamento administrativo'
WHERE
    key = 'Pendente Renovação da licença (DARH)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Pendente Revisão Renovação (Direcção)'
    , tooltip = 'O utente tem entregado o pedido de renovação de licença. Pendente de revisão pela direcção'
WHERE
    key = 'Pendente Revisão Renovação (Direcção)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Pendente Análise Renovação Licença (DJ)'
WHERE
    key = 'Pendente Análise Renovação Licença (DSU-J)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Pendente Parecer Técnico Renovação (DT)'
    , tooltip = 'Pendente que o departamento técnico emita o parecer da unidade e o parecer técnico.'
WHERE
    key = 'Pendente Parecer Técnico Renovação (DRH)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Pendente Emisão Renovação Licença (DJ)'
WHERE
    key = 'Pendente Emissão Renovação Licença (DSU-J)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Pendente Dados Renovação Licença (DJ)'
WHERE
    key = 'Pendente Dados Renovação Licença (DSU-J)';

UPDATE
    domains.licencia_estado_renovacao
SET
    key = 'Pendente Firma Renovação Licença (Direcção)'
WHERE
    key = 'Pendente Firma Renovação Licença (Direcção)';

UPDATE
    domains.facturacao_fact_estado
SET
    key = 'Pendente Acrescentar Consumo (DT)'
WHERE
    key = 'Pendente Acrescentar Consumo (DRH)';

UPDATE
    domains.facturacao_fact_estado
SET
    key = 'Pendente Emisão Factura (DF)'
WHERE
    key = 'Pendente Emissão Factura (DSU-F)';

UPDATE
    domains.facturacao_fact_estado
SET
    key = 'Pendente Pagamento (DF)'
WHERE
    key = 'Pendente Pagamento (DSU-F)';

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;

