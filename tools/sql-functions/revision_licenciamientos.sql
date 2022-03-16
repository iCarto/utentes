-- Revisión procesos de licenciamiento
-- La salida incluye una fila por cada Licencia, no por cada Explotación
SELECT
    now()::date AS "Data revisão"
    , COALESCE((
        SELECT
            u.nome FROM utentes.utentes u
        WHERE
            e.utente = u.gid) , '') AS "Nome Utente" -- En blanco si no se ha creado la ficha
    , e.exp_id AS "Número Exploração"
    , e.exp_name AS "Nome Exploração"
    , (utentes.exp_id_part(e.exp_id)).year as "Ano" -- El "año" que aparece en el código de licencia. Hay otras formas de interpretar el año
    , COALESCE(e.loc_divisao , '') AS "Divisão" -- En blanco si no se ha creado la ficha
    , COALESCE(e.loc_bacia , '') AS "Bacia" -- En blanco si no se ha creado la ficha
    , COALESCE(l.tipo_agua , '') AS "Tipo Água" -- En blanco si no se ha creado la ficha. Con valores: 'Superficial', 'Subterrânea'
    , COALESCE(l.lic_nro , '') AS "Número Licença" -- En blanco si no se ha creado la ficha
    , e.estado_lic AS "Estado licença"
FROM
    utentes.exploracaos e
    LEFT JOIN utentes.licencias l ON e.gid = l.exploracao
WHERE
    -- Filtramos a la inversa para quedarnos con las que se consideran "Em Proceso"
    e.estado_lic NOT IN ('Licenciada' , 'Não aprovada' , 'Inactiva' , 'Utente de facto' , 'Utente de usos comuns')
ORDER BY
    -- Ordenamos en función del año/tipo_lic del exp_id y luego por el serial y tipo_agua
    RIGHT (e.exp_id
        , 7) ASC
    , e.exp_id ASC
    , l.tipo_agua ASC;

