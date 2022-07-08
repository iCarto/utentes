-- Revisión de geometrías, documentación y cálculo demanda

SELECT
    now()::date AS "Data revisão"
    , u.nome AS "Nome Utente" -- NULL si está en proceso y todavía no se le ha asociado un Utente
    , e.exp_id AS "Número Exploração"
    , e.exp_name AS "Nome Exploração"
    , a.tipo AS "Actividade" -- NULL si está en proceso y todavía no se le ha asociado una Actividad
    , e.c_estimado AS "Consumo estimado"
    , e.c_licencia AS "Consumo licenciado"
    , e.the_geom IS NOT NULL AS "Tiene geometria"
    , e.updated_at AS "Última modificación" -- Poco fiable. No registra cambios en subtablas, se actualiza con la facturación, ...
    , d.last_uploaded_doc IS NOT NULL AS "Tiene documentación"
    , d.last_uploaded_doc AS "Fecha subida último doc"
    , e.estado_lic as "Estado Licença"
FROM 
    utentes.exploracaos e
    LEFT JOIN utentes.utentes u ON e.utente = u.gid
    LEFT JOIN utentes.actividades a ON e.gid = a.exploracao
    LEFT JOIN (
        SELECT exploracao, max(created_at)::date AS last_uploaded_doc FROM utentes.documentos GROUP BY exploracao
    ) d ON e.gid = d.exploracao
-- WHERE d.estado_lic IN ('', '') -- Si se quiere filtrar por el estado
ORDER BY
    -- Ordenamos en función del año/tipo_lic del exp_id y luego por el serial 
    RIGHT(e.exp_id, 7) ASC
    , e.exp_id ASC
;
