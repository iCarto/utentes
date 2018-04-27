-- Revert utentes:update_domains_licencia_estado_1435 from pg

BEGIN;



-- INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip, app) VALUES ('licencia_estado', 'Irregular', NULL, 1, 'precampo', 'A licença encontra-se num estado irregular (Incumplimieto dos acordos)', '{Norte,Sul}');
-- INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip, app) VALUES ('licencia_estado', 'Não aprovada', NULL, 2, 'precampo', 'A licença foi negada por não cumprir os requisitos', '{Norte,Sul}');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip, app) VALUES ('licencia_estado', 'Pendente de aprovação técnica (R. Cadastro)', NULL, 7, 'precampo', 'Pendente que os técnicos do departamento de cadastro saiam a terreno a realizar a avaliação técnica e entrevista com o utente', '{Norte,Sul}');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip, app) VALUES ('licencia_estado', 'Pendente de solicitação do utente', NULL, 3, 'precampo', 'O utente ainda não tem entregado a carta de solicitação', '{Norte,Sul}');
-- INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip, app) VALUES ('licencia_estado', 'Licenciada', NULL, 11, 'postcampo', 'Licença concedida, em activo e com funcionamento regular', '{Norte,Sul}');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip, app) VALUES ('licencia_estado', 'Pendente de aprovação técnica (Chefe DT)', NULL, 8, 'postcampo', 'Avaliação técnica e entrevista realizada. Pendente revisão e aprovação pelo chefe do Departamento Técnico', '{Norte,Sul}');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip, app) VALUES ('licencia_estado', 'Pendente da emisão (D. Jurídico)', NULL, 9, 'postcampo', 'Pendente de revisão e emissão da licença pelo departamento jurídico', '{Norte,Sul}');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip, app) VALUES ('licencia_estado', 'Pendente de revisão da solicitação (D. Jurídico)', NULL, 6, 'precampo', 'O utente tem entregado a solicitação. Pendente de revisão pelo departamento jurídico', '{Norte,Sul}');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip, app) VALUES ('licencia_estado', 'Pendente de revisão da solicitação (Chefe DT)', NULL, 5, 'precampo', 'O utente tem entregado a solicitação. Pendente de revisão pelo chefe do Departamento Técnico', '{Norte,Sul}');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip, app) VALUES ('licencia_estado', 'Pendente de revisão da solicitação (Direcção)', NULL, 4, 'precampo', 'O utente tem entregado a solicitação. Pendente de revisão por direcção', '{Norte,Sul}');
-- INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip, app) VALUES ('licencia_estado', 'Desconhecido', NULL, 1, 'precampo', NULL, '{DPMAIP}');
INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip, app) VALUES ('licencia_estado', 'Pendente da firma (Direcção)', NULL, 10, 'postcampo', 'Licença emitida. Pendente da revisão e assinatura de direcção para sua aprovação definitiva.', '{Norte,Sul}');

UPDATE domains.licencia_estado SET parent = 'postcampo' WHERE key IN ('Licenciada', 'Irregular');

UPDATE utentes.licencias SET
estado = 'Pendente de aprovação técnica (R. Cadastro)'
WHERE estado = 'Pendente Visita Campo (R. Cad DT)';

UPDATE utentes.licencias SET
estado = 'Pendente de solicitação do utente'
WHERE estado = 'Documentação incompleta (Pendente utente - R. Cad DT)';

UPDATE utentes.licencias SET
estado = 'Pendente de aprovação técnica (Chefe DT)'
WHERE estado = 'Pendente Parecer Técnico (R. Cad DT)';

UPDATE utentes.licencias SET
estado = 'Pendente da emisão (D. Jurídico)'
WHERE estado = 'Pendente Emisão Licença (D. Jur)';

UPDATE utentes.licencias SET
estado = 'Pendente de revisão da solicitação (D. Jurídico)'
WHERE estado = 'Pendente Análise Pedido Licença (D. Jur)';

UPDATE utentes.licencias SET
estado = 'Pendente de revisão da solicitação (Chefe DT)'
WHERE estado = 'Pendente Visita Campo (R. Cad DT)';

UPDATE utentes.licencias SET
estado = 'Pendente de revisão da solicitação (Direcção)'
WHERE estado = 'Pendente Revisão Pedido Licença (Direcção)';

UPDATE utentes.licencias SET
estado = 'Pendente da firma (Direcção)'
WHERE estado = 'Pendente Firma Licença (Direcção)';

DELETE FROM domains.licencia_estado WHERE key NOT IN ('Irregular', 'Não aprovada', 'Pendente de aprovação técnica (R. Cadastro)', 'Pendente de solicitação do utente', 'Licenciada', 'Pendente de aprovação técnica (Chefe DT)', 'Pendente da emisão (D. Jurídico)', 'Pendente de revisão da solicitação (D. Jurídico)', 'Pendente de revisão da solicitação (Chefe DT)', 'Pendente de revisão da solicitação (Direcção)', 'Desconhecido', 'Pendente da firma (Direcção)');

-- INSERT INTO domains.licencia_estado (category, key, value, ordering, parent, tooltip, app) VALUES ('licencia_estado', NULL, NULL, 0, 'precampo', NULL, NULL);

REFRESH MATERIALIZED VIEW domains.domains;
COMMIT;
