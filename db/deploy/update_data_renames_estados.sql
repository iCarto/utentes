-- Deploy utentes:update_data_renames_estados to pg

BEGIN;

update domains.licencia_estado SET key = replace(key, 'D. Adm', 'DA') where key like '%D. Adm%';
update domains.licencia_estado SET key = replace(key, 'D. Jur', 'DJ') where key like '%D. Jur%';
update domains.licencia_estado SET key = replace(key, 'R. Cad DT', 'DT') where key like '%R. Cad DT%';
update domains.licencia_estado SET key = replace(key, 'D. Fin', 'DF') where key like '%D. Fin%';


update utentes.exploracaos set req_obs = replace(req_obs::text, 'D. Adm', 'DA')::jsonb where req_obs::text like '%D. Adm%';
update utentes.exploracaos set req_obs = replace(req_obs::text, 'D. Jur', 'DJ')::jsonb where req_obs::text like '%D. Jur%';
update utentes.exploracaos set req_obs = replace(req_obs::text, 'R. Cad DT', 'DT')::jsonb where req_obs::text like '%R. Cad DT%';
update utentes.exploracaos set req_obs = replace(req_obs::text, 'D. Fin', 'DF')::jsonb where req_obs::text like '%D. Fin%';

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
