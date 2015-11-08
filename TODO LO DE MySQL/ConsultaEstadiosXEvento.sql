SELECT 
    estadio.nombre
FROM
    estadio
        INNER JOIN
    pais ON estadio.Pais_idPais = pais.idPais
        INNER JOIN
    evento_has_pais ON evento_has_pais.Pais_idPais = pais.idPais
        INNER JOIN
    evento ON evento_has_pais.Evento_idEvento = evento.idEvento
WHERE
    evento_has_pais.Evento_idEvento = evento.idEvento
        AND evento_has_pais.Pais_idPais = pais.idPais
        AND pais.idPais = estadio.Pais_idPais