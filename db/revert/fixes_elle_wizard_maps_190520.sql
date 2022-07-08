-- Revert utentes:fixes_elle_wizard_maps_190520 from pg

BEGIN;

UPDATE elle._map_style SET
    definicion = (
        SELECT replace(
            definicion
            , '<item type="string">Operacional</item>'
            , '<item type="string">Bo</item>')
        FROM elle._map_style
        WHERE nombre_capa = 'barragens' LIMIT 1)
WHERE nombre_capa = 'barragens';

UPDATE elle._map_style SET
    definicion = (
        SELECT replace(
            definicion
            , '<key type="string">Operacional</key>'
            , '<key type="string">Bo</key>')
        FROM elle._map_style
        WHERE nombre_capa = 'barragens' LIMIT 1)
WHERE nombre_capa = 'barragens';


UPDATE elle._map_style SET
    definicion = (
        SELECT replace(
            definicion
            , '(estado != ''Operacional'' or estado is null)'
            , 'estado != ''Operacional''')
        FROM elle._map_style
        WHERE nombre_capa = 'estacoes' LIMIT 1)
WHERE nombre_capa = 'estacoes';

delete from utentes.version;
delete from inventario.version;


COMMIT;
