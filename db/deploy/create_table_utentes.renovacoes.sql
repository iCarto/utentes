-- Deploy utentes:create_table_utentes.renovacoes to pg
-- requires: create_table_exploracaos

BEGIN;

CREATE TABLE utentes.renovacoes (

    gid                     serial PRIMARY KEY,

    exp_id                  text NOT NULL,

    d_soli                  date,
    d_ultima_entrega_doc    date,

    estado                  text NOT NULL REFERENCES domains.licencia_estado_renovacao(key) ON UPDATE CASCADE,

    carta_ren               boolean not null default false,
    carta_ren_v             boolean not null default false,

    ident_pro               boolean not null default false,
    ident_pro_v             boolean not null default false,

    certi_reg               boolean not null default false,
    certi_reg_v             boolean not null default false,

    duat                    boolean not null default false,
    duat_v                  boolean not null default false,

    anali_doc               boolean not null default false,
    soli_visit              boolean not null default false,
    p_unid                  boolean not null default false,
    p_tec                   boolean not null default false,
    doc_legal               boolean not null default false,
    p_juri                  boolean not null default false,
    p_rel                   boolean not null default false,
    lic_imp                 boolean not null default false,
    obser                   jsonb DEFAULT '[{"created_at": null, "autor": null, "text": null, "state": null}]',


    -- licencias
    tipo_lic_sup_old         text REFERENCES domains.licencia_tipo_lic(key) ON UPDATE CASCADE,
    d_emissao_sup_old        date,
    d_validade_sup_old       date,
    c_licencia_sup_old       numeric(10, 2),
    consumo_fact_sup_old     numeric(10,2),

    tipo_lic_sup             text REFERENCES domains.licencia_tipo_lic(key) ON UPDATE CASCADE,
    d_emissao_sup            date,
    d_validade_sup           date,
    c_licencia_sup           numeric(10, 2),

    tipo_lic_sub_old         text REFERENCES domains.licencia_tipo_lic(key) ON UPDATE CASCADE,
    d_emissao_sub_old        date,
    d_validade_sub_old       date,
    c_licencia_sub_old       numeric(10, 2),
    consumo_fact_sub_old     numeric(10, 2),

    tipo_lic_sub             text REFERENCES domains.licencia_tipo_lic(key) ON UPDATE CASCADE,
    d_emissao_sub            date,
    d_validade_sub           date,
    c_licencia_sub           numeric(10, 2),

    exploracao integer NOT NULL REFERENCES utentes.exploracaos(gid)
        ON UPDATE CASCADE
        ON DELETE CASCADE

);

COMMIT;
