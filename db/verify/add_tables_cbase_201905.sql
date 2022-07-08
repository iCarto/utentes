-- Verify utentes:add_tables_cbase_201905 on pg

BEGIN;

SELECT * FROM cbase.aras WHERE false;
SELECT * FROM cbase.bacias WHERE false;
SELECT * FROM cbase.albufeiras WHERE false;
SELECT * FROM cbase.lagos WHERE false;
SELECT * FROM cbase.rios WHERE false;
SELECT * FROM cbase.entidades_populacao WHERE false;
SELECT * FROM cbase.estradas WHERE false;
SELECT * FROM cbase.paises_limitrofes WHERE false;
SELECT * FROM cbase.oceanos WHERE false;
SELECT * FROM cbase.batimetria WHERE false;
SELECT * FROM cbase.provincias WHERE false;
SELECT * FROM cbase.distritos WHERE false;
SELECT * FROM cbase.postos WHERE false;

ROLLBACK;
