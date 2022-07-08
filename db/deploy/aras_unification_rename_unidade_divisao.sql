-- Deploy utentes:aras_unification_rename_unidade_divisao to pg

BEGIN;

ALTER INDEX cbase.unidades_pkey RENAME TO divisoes_pkey;
ALTER INDEX cbase.unidades_geom_idx RENAME TO divisoes_geom_idx;

ALTER INDEX cbase_ara.unidades_pkey RENAME TO divisoes_pkey;
ALTER INDEX cbase_ara.unidades_geom_idx RENAME TO divisoes_geom_idx;

ALTER INDEX domains.unidade_key_key RENAME TO divisao_key_key;
ALTER INDEX inventario_dominios.unidade_key_key RENAME TO divisao_key_key;



ALTER TABLE cbase.bacias RENAME COLUMN unidade TO divisao;
ALTER TABLE cbase_ara.bacias RENAME COLUMN unidade TO divisao;
ALTER TABLE domains.datos_aras RENAME COLUMN unidades TO divisoes;
ALTER TABLE inventario.fontes RENAME COLUMN loc_unidad TO loc_divisao;
ALTER TABLE utentes.documentos RENAME COLUMN unidade TO divisao;
ALTER TABLE utentes.exploracaos RENAME COLUMN loc_unidad TO loc_divisao;
ALTER TABLE utentes.exploracaos RENAME COLUMN p_unid TO parecer_divisao;
ALTER TABLE utentes.users RENAME COLUMN unidade TO divisao;
ALTER TABLE utentes.renovacoes RENAME COLUMN p_unid TO parecer_divisao;

ALTER TABLE cbase.unidades RENAME TO divisoes;
ALTER TABLE cbase_ara.unidades RENAME TO divisoes;
ALTER TABLE domains.unidade RENAME TO divisao;
ALTER TABLE inventario_dominios.unidade RENAME TO divisao;

ALTER TABLE cbase_ara.divisoes RENAME CONSTRAINT unidades_gid_fkey TO divisoes_gid_fkey;
ALTER TABLE inventario.fontes RENAME CONSTRAINT fontes_loc_unidad_fkey TO fontes_loc_divisao_fkey;
ALTER TABLE utentes.documentos RENAME CONSTRAINT documentos_unidade_fkey  TO documentos_divisao_fkey;
ALTER TABLE utentes.exploracaos RENAME CONSTRAINT exploracaos_loc_unidad_fkey TO exploracaos_loc_divisao_fkey;
ALTER TABLE utentes.users RENAME CONSTRAINT users_unidade_fkey TO users_divisao_fkey;

ALTER TABLE domains.divisao ALTER COLUMN category SET DEFAULT 'divisao';
UPDATE domains.divisao SET category = 'divisao';

REFRESH MATERIALIZED VIEW domains.domains;
COMMIT;
