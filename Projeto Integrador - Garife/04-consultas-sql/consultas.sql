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