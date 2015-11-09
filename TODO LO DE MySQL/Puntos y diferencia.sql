-- funcion para sacar la bitacora donde se tienen las estadisticas del equipo en el torneo
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` FUNCTION `sacar_bitacoraEquipo`(pIDEquipo INT, PIdEvento INT) RETURNS int(11)
BEGIN
Declare bitacoraE INT;
SET @bitacoras = (SELECT * FROM bitacoraPorEquipo WHERE equipo_idequipo = pIDEquipo);
SET @grupos = (SELECT idgrupo FROM grupo WHERE Evento_idEvento = PIdEvento);
SELECT idbitacoraPorEquipo INTO bitacoraE FROM bitacoras WHERE grupo_idgrupo IN (grupos);
RETURN bitacoraE;
END$$
DELIMITER ;


-- Ya teniendo la bitacora se agarran los goles a favor y en contra y se restan para sacar la diferencia
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` FUNCTION `retornar_diferencia`(pIDBitacora INT) RETURNS int(11)
BEGIN
DECLARE diferencia INT;
SELECT (hechos-recibidos) INTO diferencia
FROM
(SELECT gf AS hechos,
gc AS recibidos
FROM bitacoraPorEquipo
WHERE idbitacoraPorEquipo = pIDBitacora) T1;
RETURN diferencia;
END$$
DELIMITER ;

-- se sacan los partidos ganados y los partidos empatados. Se multiplican los ganados por 3 y se suman con los empatados para sacar los puntos
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` FUNCTION `retornar_puntos`(pIDBitacora INT) RETURNS int(11)
BEGIN
DECLARE puntos INT;
SELECT (empates+ganes) INTO puntos
FROM
(SELECT pg * 3 AS ganes,
pe AS empates
FROM bitacoraPorEquipo
WHERE idbitacoraPorEquipo = pIDBitacora) T1;
RETURN puntos;
END$$
DELIMITER ;


