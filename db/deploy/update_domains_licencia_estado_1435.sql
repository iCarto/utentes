-- Deploy utentes:update_domains_licencia_estado_1435 to pg

BEGIN;

ALTER TABLE domains.licencia_estado ALTER COLUMN category SET DEFAULT 'licencia_estado';

INSERT INTO domains.licencia_estado (key, ordering, parent, tooltip, app) VALUES
-- ('Desconhecido', 1, 'precampo', '', '{DPMAIP}'),
-- ('Não aprovada', 2, 'precampo', 'A licença foi negada por não cumprir os requisitos', '{Norte,Sul}'),
-- ('Irregular', 1, 'precampo', 'A licença encontra-se num estado irregular (Incumplimieto dos acordos)', '{Norte,Sul}');
('Documentação incompleta (Pendente utente - D. Adm)', 3, 'precampo', 'O utente tem pendente de entrega alguma documentação solicitada pelo D. Administrativo', '{Norte,Sul}'),
('Documentação incompleta (Pendente utente - Direcção)', 3, 'precampo', 'O utente tem pendente de entrega alguma documentação solicitada pela Direcção', '{Norte,Sul}'),
('Documentação incompleta (Pendente utente - D. Jur)', 3, 'precampo', 'O utente tem pendente de entrega alguma documentação solicitada pelo D. Jurídico', '{Norte,Sul}'),
('Documentação incompleta (Pendente utente - R. Cad DT)', 3, 'precampo', 'O utente tem pendente de entrega alguma documentação solicitada pelo R. Cadastro DT', '{Norte,Sul}'),
('Documentação incompleta (Pendente utente - D. Fin)', 3, 'precampo', 'O utente tem pendente de entrega alguma documentação solicitada pelo D. Finaciero', '{Norte,Sul}'),
('Pendente Revisão Pedido Licença (D. Adm)', 4, 'precampo', 'O utente tem entregado o pedido de licença. Pendente de revisão pelo departamento administrativo', '{Norte,Sul}'),
('Pendente Revisão Pedido Licença (Direcção)', 5, 'precampo', 'O utente tem entregado o pedido de licença. Pendente de revisão pela direcção', '{Norte,Sul}'),
('Pendente Análise Pedido Licença (D. Jur)', 6, 'precampo', 'O utente tem entregado o pedido de licença. Pendente de revisão legal pelo departamento jurídico', '{Norte,Sul}'),
('Pendente Visita Campo (R. Cad DT)', 7, 'precampo', 'Pendente que o departamento técnico faça a visitoria ao utente', '{Norte,Sul}'),
('Pendente Parecer Técnico (R. Cad DT)', 8, 'postcampo', 'Pendente que o departamento técnico emita o parecer da unidade e o parecer técnico.', '{Norte,Sul}'),
('Pendente Emisão Licença (D. Jur)', 9, 'postcampo', 'Pendente de revisão dos pareceres técnicos e emissão da licença pelo departamento jurídico', '{Norte,Sul}'),
('Pendente Firma Licença (Direcção)', 10, 'postcampo', 'Licença emitida. Pendente da revisão e assinatura de direcção para sua aprovação definitiva e do pagamento da factura de emissão da licença.', '{Norte,Sul}'),
-- ('Licenciada', 11, 'postcampo', 'Licença concedida, em activo e com funcionamento regular', '{Norte,Sul}'),
('Utente de facto', 12, 'postcampo', 'Utente que usa e aprovietam a água sem licença ou título que o legitime. Fica sujeito ao pagamento em dobro da taxa.', '{Norte,Sul}');

UPDATE domains.licencia_estado SET parent = 'post-licenciada' WHERE key IN ('Irregular', 'Licenciada', 'Utente de facto');

UPDATE utentes.licencias SET
estado = 'Pendente Visita Campo (R. Cad DT)'
WHERE estado = 'Pendente de aprovação técnica (R. Cadastro)';

UPDATE utentes.licencias SET
estado = 'Documentação incompleta (Pendente utente - R. Cad DT)'
WHERE estado = 'Pendente de solicitação do utente';

UPDATE utentes.licencias SET
estado = 'Pendente Parecer Técnico (R. Cad DT)'
WHERE estado = 'Pendente de aprovação técnica (Chefe DT)';

UPDATE utentes.licencias SET
estado = 'Pendente Emisão Licença (D. Jur)'
WHERE estado = 'Pendente da emisão (D. Jurídico)';

UPDATE utentes.licencias SET
estado = 'Pendente Análise Pedido Licença (D. Jur)'
WHERE estado = 'Pendente de revisão da solicitação (D. Jurídico)';

UPDATE utentes.licencias SET
estado = 'Pendente Visita Campo (R. Cad DT)'
WHERE estado = 'Pendente de revisão da solicitação (Chefe DT)';

UPDATE utentes.licencias SET
estado = 'Pendente Revisão Pedido Licença (Direcção)'
WHERE estado = 'Pendente de revisão da solicitação (Direcção)';

UPDATE utentes.licencias SET
estado = 'Pendente Firma Licença (Direcção)'
WHERE estado = 'Pendente da firma (Direcção)';

DELETE FROM domains.licencia_estado WHERE key NOT IN ('Irregular', 'Desconhecido', 'Não aprovada', 'Documentação incompleta (Pendente utente - D. Adm)', 'Documentação incompleta (Pendente utente - Direcção)', 'Documentação incompleta (Pendente utente - D. Jur)', 'Documentação incompleta (Pendente utente - R. Cad DT)', 'Documentação incompleta (Pendente utente - D. Fin)', 'Pendente Revisão Pedido Licença (D. Adm.)', 'Pendente Revisão Pedido Licença (Direcção)', 'Pendente Análise Pedido Licença (D. Jur)', 'Pendente Visita Campo (R. Cad DT)', 'Pendente Parecer Técnico (R. Cad DT)', 'Pendente Emisão Licença (D. Jur)', 'Pendente Firma Licença (Direcção)', 'Licenciada', 'Utente de facto');

-- INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip, app) VALUES ('licencia_estado', NULL, NULL, 0, 'precampo', NULL, NULL);

REFRESH MATERIALIZED VIEW domains.domains;
COMMIT;
