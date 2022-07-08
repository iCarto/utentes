-- Deploy utentes:alter_table_exploracaos_add_new_requerimento_documents_1510 to pg

BEGIN;

-- Relatório técnico de perforação (Se é preciso)
-- Boletim de análise de água


ALTER TABLE utentes.exploracaos
    ADD COLUMN r_perf boolean not null default false,
    ADD COLUMN b_a_agua boolean not null default false,
    ADD COLUMN r_perf_v boolean not null default false,
    ADD COLUMN b_a_agua_v boolean not null default false
;

COMMIT;
