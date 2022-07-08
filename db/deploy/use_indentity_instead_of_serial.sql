-- Deploy utentes:use_indentity_instead_of_serial to pg

BEGIN;

CREATE OR REPLACE FUNCTION upgrade_serial_to_identity(tbl regclass, col name)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  colnum smallint;
  seqid oid;
  count int;
BEGIN
  -- find column number
  SELECT attnum INTO colnum FROM pg_attribute WHERE attrelid = tbl AND attname = col;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'column does not exist';
  END IF;

  -- find sequence
  SELECT INTO seqid objid
    FROM pg_depend
    WHERE (refclassid, refobjid, refobjsubid) = ('pg_class'::regclass, tbl, colnum)
      AND classid = 'pg_class'::regclass AND objsubid = 0
      AND deptype = 'a';

  GET DIAGNOSTICS count = ROW_COUNT;
  IF count < 1 THEN
    RAISE EXCEPTION 'no linked sequence found';
  ELSIF count > 1 THEN
    RAISE EXCEPTION 'more than one linked sequence found';
  END IF;

  -- drop the default
  EXECUTE 'ALTER TABLE ' || tbl || ' ALTER COLUMN ' || quote_ident(col) || ' DROP DEFAULT';

  -- change the dependency between column and sequence to internal
  UPDATE pg_depend
    SET deptype = 'i'
    WHERE (classid, objid, objsubid) = ('pg_class'::regclass, seqid, 0)
      AND deptype = 'a';

  -- mark the column as identity column
  UPDATE pg_attribute
    SET attidentity = 'd'
    WHERE attrelid = tbl
      AND attname = col;
END;
$$;

SELECT upgrade_serial_to_identity('inventario.acuiferos', 'gid');
SELECT upgrade_serial_to_identity('inventario.barragens', 'gid');
SELECT upgrade_serial_to_identity('inventario.dados_hidrometricos', 'gid');
SELECT upgrade_serial_to_identity('inventario.dados_pluviometricos', 'gid');
SELECT upgrade_serial_to_identity('inventario.estacoes_analise', 'gid');
SELECT upgrade_serial_to_identity('inventario.estacoes', 'gid');
SELECT upgrade_serial_to_identity('inventario.exploracoes', 'gid');
SELECT upgrade_serial_to_identity('inventario.fontes_analise', 'gid');
SELECT upgrade_serial_to_identity('inventario.fontes_carac_hidro', 'gid');
SELECT upgrade_serial_to_identity('inventario.fontes', 'gid');
SELECT upgrade_serial_to_identity('inventario.fontes_litologia', 'gid');
SELECT upgrade_serial_to_identity('inventario.quantidade_agua', 'gid');
SELECT upgrade_serial_to_identity('utentes.actividades_cultivos', 'gid');
SELECT upgrade_serial_to_identity('utentes.actividades', 'gid');
SELECT upgrade_serial_to_identity('utentes.actividades_reses', 'gid');
SELECT upgrade_serial_to_identity('utentes.actividades_tanques_piscicolas', 'gid');
SELECT upgrade_serial_to_identity('utentes.documentos', 'gid');
SELECT upgrade_serial_to_identity('utentes.exploracaos', 'gid');
SELECT upgrade_serial_to_identity('utentes.facturacao', 'gid');
SELECT upgrade_serial_to_identity('utentes.fontes', 'gid');
SELECT upgrade_serial_to_identity('utentes.inventario_fontes', 'gid');
SELECT upgrade_serial_to_identity('utentes.licencias', 'gid');
SELECT upgrade_serial_to_identity('utentes.renovacoes', 'gid');
SELECT upgrade_serial_to_identity('utentes.users', 'id');
SELECT upgrade_serial_to_identity('utentes.utentes', 'gid');

DROP FUNCTION upgrade_serial_to_identity(tbl regclass, col name);

COMMIT;
