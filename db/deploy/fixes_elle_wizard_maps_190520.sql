-- Deploy utentes:fixes_elle_wizard_maps_190520 to pg

BEGIN;

UPDATE elle._map_style SET
    definicion = (
        SELECT replace(
            definicion
            , '<item type="string">Bo</item>'
            , '<item type="string">Operacional</item>')
        FROM elle._map_style
        WHERE nombre_capa = 'barragens' LIMIT 1)
WHERE nombre_capa = 'barragens';

UPDATE elle._map_style SET
    definicion = (
        SELECT replace(
            definicion
            , '<key type="string">Bo</key>'
            , '<key type="string">Operacional</key>')
        FROM elle._map_style
        WHERE nombre_capa = 'barragens' LIMIT 1)
WHERE nombre_capa = 'barragens';


UPDATE elle._map_style SET
    definicion = (
        SELECT replace(
            definicion
            , 'estado != ''Operacional'''
            , '(estado != ''Operacional'' or estado is null)')
        FROM elle._map_style
        WHERE nombre_capa = 'estacoes' LIMIT 1)
WHERE nombre_capa = 'estacoes';

delete from utentes.version;
insert into utentes.version (version) values ('190528');
delete from inventario.version;
insert into inventario.version (version) values ('190528');

COMMIT;
