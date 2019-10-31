-- Deploy utentes:estacoes_estado_domain_ampliado_to_estado to pg

BEGIN;

ALTER TABLE inventario.estacoes DROP CONSTRAINT estacoes_estado_fkey;

ALTER TABLE inventario.estacoes ADD CONSTRAINT
    estacoes_estado_fkey FOREIGN KEY(estado) REFERENCES inventario_dominios.estado(key)
        ON UPDATE CASCADE ON DELETE NO ACTION;

COMMIT;
