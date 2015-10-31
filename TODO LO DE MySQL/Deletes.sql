DELIMITER $$

CREATE PROCEDURE `delete_accion` (IN borrar INT)
BEGIN

DELETE FROM accion where idAccion = borrar;

END

DELIMITER $$

CREATE PROCEDURE `delete_administrador` (IN borrar INT)
BEGIN

DELETE FROM administrador where idAdministrador = borrar;

END

DELIMITER $$

CREATE PROCEDURE `delete_alineacion_from_jugador` (IN borrar INT)
BEGIN

UPDATE jugador
set alineacion = NULL
 where `alineacion_idalineacion` = borrar;

END

DELIMITER $$

CREATE PROCEDURE `delete_alineacion` (IN borrar INT)
BEGIN

call `delete_alineacion_from_jugador`(borrar);
DELETE FROM alineacion where idAlineacion = borrar;

END


DELIMITER $$

CREATE PROCEDURE `delete_bitacora` (IN borrar INT)
BEGIN

DELETE FROM bitacora where idbitacora = borrar;

END

DELIMITER $$

CREATE PROCEDURE `delete_bitacoraporequipo` (IN borrar INT)
BEGIN

DELETE FROM bitacoraporequipo where idbitacoraporequipo = borrar;

END


DELIMITER $$

CREATE PROCEDURE `delete_catalogo` (IN borrar INT)
BEGIN

DELETE FROM `catalogo de acciones` where `idCatalogo de Acciones` = borrar;

END

DELIMITER $$

CREATE PROCEDURE `delete_confederaciones` (IN borrar INT)
BEGIN

DELETE FROM confederaciones where idconfederaciones = borrar;

END


DELIMITER $$

CREATE PROCEDURE `delete_confederaciones` (IN borrar INT)
BEGIN

DELETE FROM confederaciones where idconfederaciones = borrar;

END

DELIMITER $$

CREATE PROCEDURE `delete_continentes` (IN borrar INT)
BEGIN

DELETE FROM continente where idcontinente = borrar;

END

DELIMITER $$

CREATE PROCEDURE `delete_equipo` (IN borrar INT)
BEGIN

DELETE FROM equipo where idequipo = borrar;

END

DELIMITER $$

CREATE PROCEDURE `delete_estadio` (IN borrar INT)
BEGIN

DELETE FROM estadio where idestadio = borrar;

END


DELIMITER $$

CREATE PROCEDURE `delete_evento` (IN borrar INT)
BEGIN

DELETE FROM evento where idevento = borrar;

END

DELIMITER $$

CREATE PROCEDURE `delete_grupo` (IN borrar INT)
BEGIN

DELETE FROM grupo where idgrupo = borrar;

END

DELIMITER $$

CREATE PROCEDURE `delete_jugador` (IN borrar INT)
BEGIN

DELETE FROM jugador where idjugador = borrar;

END

DELIMITER $$

CREATE PROCEDURE `delete_pais` (IN borrar INT)
BEGIN

DELETE FROM pais where idpais = borrar;

END

DELIMITER $$

CREATE PROCEDURE `delete_parametros` (IN borrar INT)
BEGIN

DELETE FROM parametros where idparametros = borrar;

END

DELIMITER $$

CREATE PROCEDURE `delete_partido` (IN borrar INT)
BEGIN

DELETE FROM partido where idpartido = borrar;

END

DELIMITER $$

CREATE PROCEDURE `delete_eventoXconfederacion` (IN borrar INT, IN borrar2 INT)
BEGIN

DELETE FROM `evento_has_confederaciones` where `Evento_idEvento` = borrar and `confederaciones_idconfederaciones` = borrar2;

END

DELIMITER $$

CREATE PROCEDURE `delete_eventoXpais` (IN borrar INT, IN borrar2 INT)
BEGIN

DELETE FROM `evento_has_pais` where `Evento_idEvento` = borrar and `Pais_idPais` = borrar2;

END

DELIMITER $$

CREATE PROCEDURE `delete_eventoXequipo` (IN borrar INT, IN borrar2 INT)
BEGIN

DELETE FROM `evento_has_equipo` where `Evento_idEvento` = borrar and `equipo_idequipo` = borrar2;

END

DELIMITER $$

CREATE PROCEDURE `delete_eventoXequipo` (IN borrar INT, IN borrar2 INT)
BEGIN

DELETE FROM `partido_has_jugador` where `partido_idpartido` = borrar and `jugador_idjugador` = borrar2;

END