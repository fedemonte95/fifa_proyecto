DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `accionUpdate`(IN Paccion_id INT, IN Pjugador_idjugador INT, IN Ppartido_idpartido INT, IN Ptiempo INT, IN `Pcatalogo_acciones` INT)
BEGIN
UPDATE proyecto2.accion 
SET
 jugador_idjugador = Pjugador_idjugador
 ,partido_idpartido = Ppartido_idpartido -- partido_idpartido - INT(11) NOT NULL
 ,tiempo = Ptiempo -- tiempo - INT(11)
 ,`Catalogo de Acciones_idCatalogo de Acciones` = Pcatalogo_acciones -- Catalogo de Acciones_idCatalogo de Acciones - INT(11) NOT NULL
WHERE
  idAccion = Paccion_id; -- idAccion - INT(11) NOT NULL
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alineacionUPDATE`(IN Pid_alineacion INT, IN Pid_equipo INT)
BEGIN
UPDATE proyecto2.alineacion 
SET
  equipo_idequipo = Pid_equipo -- equipo_idequipo - INT(11) NOT NULL

WHERE
  idalineacion = Pid_alineacion ;-- idalineacion - INT(11) NOT NULL
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `administradorUPDATE`(IN Padminid INT, IN Puser VARCHAR(45), IN Ppassword VARCHAR(45))
BEGIN
UPDATE proyecto2.adminisrtador 
SET
  username = Puser -- username - VARCHAR(45)
 ,password = Ppassword -- password - VARCHAR(45)
WHERE
  idadminisrtador = Padminid; -- idadminisrtador - INT(11) NOT NULL
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `bitacoraXequipoUPDATE`(IN Pid INT, IN Ppj INT, IN Ppg INT, IN Ppe INT, IN Ppp INT, IN Pgf INT, IN Pgc INT, IN Pidgrupo INT, IN Pidequipo INT)
BEGIN
UPDATE proyecto2.bitacoraporequipo 
SET
  pj = Ppj -- pj - INT(11)
 ,pg = Ppg -- pg - INT(11)
 ,pe = Ppe -- pe - INT(11)
 ,pp = Ppp -- pp - INT(11)
 ,GF = Pgf -- GF - INT(11)
 ,gc = pGC -- gc - INT(11)
 ,grupo_idgrupo = Pidgrupo -- grupo_idgrupo - INT(11) NOT NULL
 ,equipo_idequipo = Pidequipo -- equipo_idequipo - INT(11) NOT NULL
WHERE
  idbitacoraPorEquipo = Pid; -- idbitacoraPorEquipo - INT(11) NOT NULL
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cataAccionesUPDATE`(IN Pidcatacciones INT, IN Pnombre VARCHAR(45))
BEGIN
UPDATE proyecto2.`catalogo de acciones` 
SET
  nombre = Pnombre -- nombre - VARCHAR(45)
WHERE
  `idCatalogo de Acciones` = Pidcatacciones; -- idCatalogo de Acciones - INT(11) NOT NULL
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `confederacionesUpdate`(IN Pidconfederaciones INT, IN Pnombre VARCHAR(45), IN Picono BLOB)
BEGIN
UPDATE proyecto2.confederaciones 
SET
  nombre = Pnombre -- nombre - VARCHAR(45)
 ,icono = Picono -- icono - BLOB
WHERE
  idconfederaciones = Pidconfederaciones; -- idconfederaciones - INT(11) NOT NULL
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `continenteUPDATE`(IN Pcontinente VARCHAR(45), IN Pid INT)
BEGIN
UPDATE proyecto2.continente 
SET
  nombre = Pcontinente -- nombre - VARCHAR(45)
WHERE
  idContinente = Pid; -- idContinente - INT(11) NOT NULL
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `equipoUPDATE`(IN Pidequipo INT, IN Pnombre VARCHAR(45), IN Pbandera BLOB, IN Ptecnico VARCHAR(45), IN Pidconfederaciones INT, IN Pidgrupo INT, IN Pidpais INT, IN Pseleccion TINYINT)
BEGIN
UPDATE proyecto2.equipo 
SET
  nombre = Pnombre -- nombre - VARCHAR(45)
 ,bandera =Pbandera  -- bandera - BLOB
 ,tecnico = Ptecnico -- tecnico - VARCHAR(95)
 ,confederaciones_idconfederaciones = Pidconfederaciones -- confederaciones_idconfederaciones - INT(11) NOT NULL
 ,grupo_idgrupo = Pidgrupo -- grupo_idgrupo - INT(11) NOT NULL
 ,Pais_idPais = Pidpais -- Pais_idPais - INT(11) NOT NULL
 ,seleccion = Pseleccion-- seleccion - TINYINT(1)
WHERE
  idequipo = Pidequipo; -- idequipo - INT(11) NOT NULL
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `estadioUPDATE`(IN Pidestadio INT, IN Pnombre VARCHAR(45), IN Pidpais INT, IN Pcapacidad INT)
BEGIN
UPDATE proyecto2.estadio 
SET
  nombre = Pnombre-- nombre - VARCHAR(45)
 ,Pais_idPais = Pidpais -- Pais_idPais - INT(11) NOT NULL
 ,capacidad = Pcapacidad -- capacidad - INT(11)

WHERE
  idestadio = Pidestadio; -- idestadio - INT(11) NOT NULL
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eventoUPDATE`(IN Pidevento INT, IN Ptipo VARCHAR(45), IN Pidadmin INT, IN Pfecha_inicio DATE, IN Pfecha_final DATE, IN Pconfederacion TINYINT, IN Pnacionales TINYINT)
BEGIN
UPDATE proyecto2.evento 
SET
  tipo = Ptipo -- tipo - VARCHAR(45)
 ,adminisrtador_idadminisrtador = Pidadmin -- adminisrtador_idadminisrtador - INT(11) NOT NULL
 ,fecha_inicio = Pfecha_inicio-- fecha_inicio - DATE
 ,fecha_final = Pfecha_final -- fecha_final - DATE
 ,confederacion = Pconfederacion -- confederacion - TINYINT(1)
 ,nacionales = Pnacionales -- nacionales - TINYINT(1)

WHERE
  idEvento = Pidevento; -- idEvento - INT(11) NOT NULL
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eventoXequipoUPDATE`(IN Pidevento INT, IN Pidequino INT, IN Pganador TINYINT, IN Psegundolugar TINYINT)
BEGIN
UPDATE proyecto2.evento_has_equipo 
SET
  ganador = Pganador -- ganador - TINYINT(1)
 ,`segundo lugar` = Psegundolugar -- segundo lugar - TINYINT(1)
WHERE
  Evento_idEvento = Pidevento -- Evento_idEvento - INT(11) NOT NULL
  AND equipo_idequipo = Pidequino; -- equipo_idequipo - INT(11) NOT NULL
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `grupoUPDATE`(IN Pidgrupo INT, IN Pidevento INT, IN Pnombre VARCHAR(45))
BEGIN
UPDATE proyecto2.grupo 
SET
  Evento_idEvento = Pidevento -- Evento_idEvento - INT(11) NOT NULL
 ,nombre = Pnombre -- nombre - VARCHAR(45)
WHERE
  idgrupo = Pidgrupo;-- idgrupo - INT(11) NOT NULL
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jugadorUPDATE`(IN Pidjugador INT, IN Pnumcamiseta INT, IN Pnombre VARCHAR(45), IN Papellido VARCHAR(45), IN Pcedula VARCHAR(45), IN Pfoto BLOB, IN Pidequipo INT, IN Psuspendido TINYINT, IN Pidalineacion INT, IN Pidpais INT, IN Pcapitan TINYINT)
BEGIN
UPDATE proyecto2.jugador 
SET
  numeroCamiseta = Pnumcamiseta -- numeroCamiseta - INT(11)
 ,nombre = Pnombre -- nombre - VARCHAR(45)
 ,apellidos = Papellido -- apellidos - VARCHAR(45)
 ,cedula = Pcedula -- cedula - VARCHAR(45)
 ,foto =  Pfoto-- foto - BLOB
 ,equipo_idequipo = Pidequipo -- equipo_idequipo - INT(11) NOT NULL
 ,suspendido = Psuspendido -- suspendido - TINYINT(1)
 ,alineacion_idalineacion = Pidalineacion -- alineacion_idalineacion - INT(11) NOT NULL
 ,Pais_idPais = Pidpais -- Pais_idPais - INT(11) NOT NULL
 ,capitan = Pcapitan -- capitan - TINYINT(1)
WHERE
  idjugador = Pidjugador; -- idjugador - INT(11) NOT NULL
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `paisUPDATE`(IN Pidpais INT, IN Pnombre VARCHAR(45), IN Pbandera BLOB, IN Pidcontinente INT)
BEGIN
UPDATE proyecto2.pais 
SET
  nombre = Pnombre -- nombre - VARCHAR(45)
 ,bandera = Pbandera -- bandera - BLOB
 ,Continente_idContinente = Pidcontinente -- Continente_idContinente - INT(11) NOT NULL
WHERE
  idPais = Pidpais; -- idPais - INT(11) NOT NULL
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `parametrosUPDATES`(IN Pidparametros INT, IN Pcant_equipos INT)
BEGIN
UPDATE proyecto2.parametros 
SET
  cantidad_equipos = Pcant_equipos -- cantidad_equipos - INT(11)

WHERE
  idparametros = Pidparametros; -- idparametros - INT(11) NOT NULL
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `partidoUPDATE`(IN PidPartido INT, IN Pidevento INT, IN Plocal INT, IN Pvisita INT, IN Pganador INT, IN Pidestadio INT, IN Pfecha DATE)
BEGIN
UPDATE proyecto2.partido 
SET
  Evento_idEvento = Pidevento -- Evento_idEvento - INT(11) NOT NULL
 ,EquipoLocal = Plocal -- EquipoLocal - INT(11) NOT NULL
 ,EquipoVisita = Pvisita -- EquipoVisita - INT(11) NOT NULL
 ,Ganador = Pganador -- Ganador - INT(11)
 ,estadio_idestadio = Pidestadio -- estadio_idestadio - INT(11) NOT NULL
 ,fecha = Pfecha -- fecha - DATETIME
WHERE
  idpartido = PidPartido; -- idpartido - INT(11) NOT NULL
END$$
DELIMITER ;
