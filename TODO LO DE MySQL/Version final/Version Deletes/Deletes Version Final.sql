DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_accion`(borrar INT)
BEGIN

DELETE FROM accion where idAccion = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_tipo`(borrar INT)
BEGIN

DELETE FROM tipo_eventos where idTipo_Eventos = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_sede`(borrar INT, borrar2 INT)
BEGIN

DELETE FROM sede where Evento_idEvento = borrar and Pais_idPais = borrar2;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_posicion`(borrar INT)
BEGIN

DELETE FROM posicion where idpposicion = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_partido`(borrar INT)
BEGIN

DELETE FROM partido where idpartido = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_pais`(borrar INT)
BEGIN

DELETE FROM pais where idpais = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_jugador`(borrar INT)
BEGIN

DELETE FROM jugador where idjugador = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_grupo`(borrar INT)
BEGIN

DELETE FROM grupo where idgrupo = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_eventoXequipo`(borrar INT, borrar2 INT)
BEGIN

DELETE FROM evento_has_equipo where Evento_idEvento = borrar and equipo_idequipo = borrar2;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_eventoXconfederacion`(borrar INT,borrar2 INT)
BEGIN

DELETE FROM evento_has_confederaciones where Evento_idEvento = borrar and confederaciones_idconfederaciones = borrar2;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_evento`(borrar INT)
BEGIN

DELETE FROM evento where idevento = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_estadio`(borrar INT)
BEGIN

DELETE FROM estadio where idestadio = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_equipo`(borrar INT)
BEGIN

DELETE FROM equipo where idequipo = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_continentes`(borrar INT)
BEGIN

DELETE FROM continente where idcontinente = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_confederaciones`(borrar INT)
BEGIN

DELETE FROM confederaciones where idconfederaciones = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_categoria`(borrar INT)
BEGIN

DELETE FROM categoria_grupo where idcategoria_grupo = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_catalogo`(borrar INT)
BEGIN

DELETE FROM catalogo_de_acciones where idCatalogo_de_Acciones = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_bitacoraporequipo`(borrar INT)
BEGIN

DELETE FROM bitacoraporequipo where idbitacoraporequipo = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_bitacora`(borrar INT)
BEGIN

DELETE FROM bitacora where idbitacora = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_alineacion_from_jugador`(borrar INT)
BEGIN

UPDATE jugador
set alineacion = NULL
 where `alineacion_idalineacion` = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_alineacion`(borrar INT)
BEGIN

call `delete_alineacion_from_jugador`(borrar);
DELETE FROM alineacion where idAlineacion = borrar;

END$$
DELIMITER ;
-----------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `delete_administrador`(borrar INT)
BEGIN

DELETE FROM administrador where idAdministrador = borrar;

END$$
DELIMITER ;
