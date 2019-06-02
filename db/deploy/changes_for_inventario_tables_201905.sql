-- Deploy utentes:changes_for_inventario_tables_201905 to pg

BEGIN;

CREATE TABLE inventario_dominios.unidade (
  category text default 'unidade',
  key text UNIQUE,
  value text,
  ordering integer,
  parent text,
  tooltip text,
  app text
);
REVOKE ALL ON TABLE inventario_dominios.unidade FROM PUBLIC;
GRANT SELECT ON TABLE inventario_dominios.unidade TO sirha_base_user;

INSERT INTO inventario_dominios.unidade (key, app) VALUES
('UGBMM', 'Norte'), ('UGBC', 'Norte'), ('UGBR', 'Norte'),
('UGBI','Sul'), ('UGBL','Sul'), ('UGBS', 'Sul'), ('UGBU', 'Sul'),
('UGBZ', 'Zamebeze');

DELETE FROM inventario_dominios.unidade WHERE app != (SELECT key FROM domains.ara LIMIT 1);

with foo as (select a.key, b.parent from inventario_dominios.bacia a join domains.bacia b on a.key = b.key AND a.app && b.app ) update inventario_dominios.bacia c set parent = foo.parent from foo where c.key = foo.key;

ALTER TABLE  inventario.fontes DROP CONSTRAINT fontes_loc_unidad_fkey;

ALTER TABLE inventario.fontes ADD CONSTRAINT fontes_loc_unidad_fkey FOREIGN KEY (loc_unidad) REFERENCES inventario_dominios.unidade(key);

COMMIT;
