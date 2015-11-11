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

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `buscar_pass`(PPass varchar(250)) RETURNS int(11)
BEGIN
DECLARE resul VARBINARY(250);
SET resul = (select password from proyecto2.administrador where password =  AES_ENCRYPT(PPass, 'basesrulez'));

IF resul = AES_ENCRYPT(PPass, 'basesrulez') then
	return 1;
else 
	return 0;
end if;
END $$
DELIMITER;

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

DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` FUNCTION `seleccionar_alineacion`(pIDEquipo INT) RETURNS int(11)
BEGIN
DECLARE retorno INT;

SELECT idalineacion INTO retorno FROM alineacion WHERE equipo_idequipo = pIDEquipo;

RETURN retorno;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` FUNCTION `seleccionar_capitan`(Pid_equipo INT ) RETURNS int(11)
BEGIN
DECLARE retorno INT;

SELECT idjugador INTO retorno FROM jugador WHERE Pais_idPais = Pid_equipo AND  capitan = 1;
RETURN retorno;
END$$
DELIMITER ;
