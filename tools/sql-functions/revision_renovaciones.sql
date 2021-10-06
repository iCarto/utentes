-- Revisión procesos de renovación

-- Licencias a 6 meses de caducar, ya caducadas o con el proceso de renovación iniciado
-- La salida incluye una fila por cada Licencia, no por cada Explotación

SELECT
    now()::date AS "Data revisão"
    , (SELECT u.nome FROM utentes.utentes u WHERE e.utente = u.gid) AS "Nome Utente"
    , e.exp_id AS "Número Exploração"
    , e.exp_name AS "Nome Exploração"
    , e.loc_divisao AS "Divisão"
    , e.loc_bacia AS "Bacia"
    , l.tipo_agua AS "Tipo Água" -- con valores: 'Superficial', 'Subterrânea'
    , l.lic_nro AS "Número Licença"
    , e.estado_lic AS "Estado licença" -- Siempre valdrá 'Licenciada'
    , l.d_emissao AS "Data Emissão"
    , l.d_validade AS "Data Validade"
    , COALESCE(r.estado, '') AS "Estado Renovação" -- En blanco si no se ha iniciado el proceso de renovación
FROM
    utentes.exploracaos e
JOIN
    utentes.licencias l ON e.gid = l.exploracao
LEFT JOIN (
    SELECT exploracao, estado FROM utentes.renovacoes WHERE estado NOT IN ('Licenciada', 'Utente de facto', 'Não aprovada')
) r ON e.gid = r.exploracao

WHERE
    e.estado_lic IN ('Licenciada')
    AND l.d_validade < now() + '6 months'::interval
ORDER BY
    -- Ordenamos en función del año/tipo_lic del exp_id y luego por el serial y tipo_agua
    RIGHT(e.exp_id, 7) ASC
    , e.exp_id ASC
    , l.tipo_agua ASC
;
