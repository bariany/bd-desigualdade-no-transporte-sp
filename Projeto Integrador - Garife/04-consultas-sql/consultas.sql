-- Qual é a zona com maior tempo médio de deslocamento coletivo na cidade de São Paulo?
 
SELECT 
    z.id_zona,
    z.nome_zona,
    r.renda_media_familiar,
    z.tempo_medio_coletivo
FROM zonas z
JOIN renda r 
  ON z.id_zona = r.id_zona
WHERE r.ano = 2023
ORDER BY z.tempo_medio_coletivo DESC NULLS LAST
LIMIT 1;

-- Quais as três zonas com maior e as três com menor tempo coletivo?

(SELECT 
	'MAIOR TEMPO' AS grupo,
	nome_zona, 
	tempo_medio_coletivo
FROM zonas 
WHERE tempo_medio_coletivo IS NOT NULL
ORDER BY tempo_medio_coletivo DESC LIMIT 3)

UNION ALL

(SELECT
    'MENOR TEMPO' AS grupo,
    nome_zona,
    tempo_medio_coletivo
FROM zonas
WHERE tempo_medio_coletivo IS NOT NULL
ORDER BY tempo_medio_coletivo ASC LIMIT 3);

-- Qual é a distribuição percentual da população de cada zona entre as cinco faixas de renda?

	WITH total_por_zona AS (
    SELECT
        id_zona,
        SUM(quantidade_pessoas) AS total_pessoas
    FROM pessoas_por_renda
    GROUP BY id_zona
)

SELECT
    z.id_zona,
    z.nome_zona,

    ROUND(
        SUM(
            CASE
                WHEN p.id_faixa = 1
                THEN p.quantidade_pessoas
                ELSE 0
            END
        )::NUMERIC
        / NULLIF(t.total_pessoas, 0) * 100,
        2
    ) AS percentual_ate_2640,

    ROUND(
        SUM(
            CASE
                WHEN p.id_faixa = 2
                THEN p.quantidade_pessoas
                ELSE 0
            END
        )::NUMERIC
        / NULLIF(t.total_pessoas, 0) * 100,
        2
    ) AS percentual_2640_5280,

    ROUND(
        SUM(
            CASE
                WHEN p.id_faixa = 3
                THEN p.quantidade_pessoas
                ELSE 0
            END
        )::NUMERIC
        / NULLIF(t.total_pessoas, 0) * 100,
        2
    ) AS percentual_5280_10560,

    ROUND(
        SUM(
            CASE
                WHEN p.id_faixa = 4
                THEN p.quantidade_pessoas
                ELSE 0
            END
        )::NUMERIC
        / NULLIF(t.total_pessoas, 0) * 100,
        2
    ) AS percentual_10560_15840,

    ROUND(
        SUM(
            CASE
                WHEN p.id_faixa = 5
                THEN p.quantidade_pessoas
                ELSE 0
            END
        )::NUMERIC
        / NULLIF(t.total_pessoas, 0) * 100,
        2
    ) AS percentual_acima_15840

FROM zonas z

INNER JOIN pessoas_por_renda p
    ON z.id_zona = p.id_zona

INNER JOIN total_por_zona t
    ON z.id_zona = t.id_zona

GROUP BY
    z.id_zona,
    z.nome_zona,
    t.total_pessoas

ORDER BY
    z.id_zona;


-- Como os modos de transporte utilizados variam entre zonas com diferentes perfis de renda?

WITH total_por_zona AS (
    SELECT
        id_zona,
        SUM(quantidade_pessoas) AS total_pessoas
    FROM pessoas_por_renda
    GROUP BY id_zona
),

percentual_baixa_renda AS (
    SELECT
        p.id_zona,

        ROUND(
            SUM(
                CASE
                    WHEN p.id_faixa = 1
                    THEN p.quantidade_pessoas
                    ELSE 0
                END
            )::NUMERIC
            / NULLIF(t.total_pessoas, 0) * 100,
            2
        ) AS percentual_ate_2640

    FROM pessoas_por_renda p

    INNER JOIN total_por_zona t
        ON p.id_zona = t.id_zona

    GROUP BY
        p.id_zona,
        t.total_pessoas
)

SELECT
    z.id_zona,
    z.nome_zona,

    p.percentual_ate_2640,

    m.id_modo,
    m.descricao AS modo,

    q.quantidade_viagens_produzidas,
    q.quantidade_viagens_atraidas

FROM quantidade_modo q

INNER JOIN zonas z
    ON q.id_zona = z.id_zona

INNER JOIN categoria_modo m
    ON q.id_modo = m.id_modo

INNER JOIN percentual_baixa_renda p
    ON q.id_zona = p.id_zona

ORDER BY
    p.percentual_ate_2640 DESC,
    q.quantidade_viagens_produzidas DESC;


-- Quais são os principais fluxos de viagens entre as 343 zonas e como eles se distribuem entre transporte coletivo e individual?

SELECT
    zo.nome_zona AS zona_origem,
    zd.nome_zona AS zona_destino,

    t.descricao AS tipo_transporte,

    v.quantidade_viagens_diarias

FROM viagem v

INNER JOIN zonas zo
    ON v.id_origem = zo.id_zona

INNER JOIN zonas zd
    ON v.id_destino = zd.id_zona

INNER JOIN categoria_tipo t
    ON v.id_tipo = t.id_tipo

ORDER BY
    v.quantidade_viagens_diarias DESC;
