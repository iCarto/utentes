-- Revisión tabla monitorización
-- Si en route_path aparece por algún sitio ".html" es que está accediendo a una pestaña/página
-- Si aparece emitir_recibo o emitir_factura es que le dió al botón "Factura"/"Recibo"
-- Si en verb aparece PUT, POST O PATCH es que está modificando algún dato o ejecutando alguna acción
SELECT
    id
    , username
    , verb
    , route_path
    , created_at
FROM
    monitoring.view_monitor
WHERE
    route_path ~ 'html'
    OR route_path ~ 'emitir_'
    OR verb IN ('PUT' , 'POST' , 'PATCH')
    OR route_path ~ 'login'
    OR route_path ~ 'logout';

