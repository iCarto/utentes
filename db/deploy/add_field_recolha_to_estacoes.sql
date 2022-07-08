-- Deploy utentes:add_field_recolha_to_estacoes to pg

BEGIN;

CREATE TABLE domains.estacoes_recolha (
    category text DEFAULT 'estacoes_recolcha',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO domains.estacoes_recolha (key) VALUES
('Automática'), ('Convencional');

ALTER TABLE domains.estacoes_recolha OWNER TO :owner;
REVOKE ALL ON TABLE domains.estacoes_recolha FROM PUBLIC;
GRANT SELECT ON TABLE domains.estacoes_recolha TO :base_user;

ALTER TABLE inventario.estacoes ADD COLUMN
    recolha text
        REFERENCES domains.estacoes_recolha(key) ON UPDATE CASCADE ON DELETE NO ACTION
;

COMMIT;
