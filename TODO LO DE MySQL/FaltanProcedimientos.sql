DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `marcador`(pIDBitacora1 INT, pIDBitacora2 INT, pIDPartido INT)
BEGIN
DECLARE equipoG INT;
DECLARE equipoF INT;
DECLARE golesG INT;
DECLARE golesF INT;

SELECT equipo_idequipo into equipoG from bitacoraPorEquipo where idbitacoraPorEquipo = pIDBitacora1;
SELECT equipo_idequipo into equipoF from bitacoraPorEquipo where idbitacoraPorEquipo = pIDBitacora2;
SELECT Count(1) into golesG from accion where idCatalogo_de_Acciones = 1 and partido_idpartido = pIDPartido and equipo_idequipo = equipoG; 
SELECT Count(1) into golesF from accion where idCatalogo_de_Acciones = 1 and partido_idpartido = pIDPartido and equipo_idequipo = equipoF; 

CASE
WHEN (golesG > golesF)
THEN
update bitacoraPorEquipo
set pj = pj+1
where idbitacoraPorEquipo = pIDBitacora1;
update bitacoraPorEquipo
set pj = pj+1
where idbitacoraPorEquipo = pIDBitacora2;
update bitacoraPorEquipo
set pg = pg+1
where idbitacoraPorEquipo = pIDBitacora1;
update bitacoraPorEquipo
set pp = pp+1
where idbitacoraPorEquipo = pIDBitacora2;
WHEN (golesF > golesG)
THEN
update bitacoraPorEquipo
set pj = pj+1
where idbitacoraPorEquipo = pIDBitacora1;
update bitacoraPorEquipo
set pj = pj+1
where idbitacoraPorEquipo = pIDBitacora2;
update bitacoraPorEquipo
set pg = pg+1
where idbitacoraPorEquipo = pIDBitacora2;
update bitacoraPorEquipo
set pp = pp+1
where idbitacoraPorEquipo = pIDBitacora1;
ELSE
update bitacoraPorEquipo
set pj = pj+1
where idbitacoraPorEquipo = pIDBitacora1;
update bitacoraPorEquipo
set pj = pj+1
where idbitacoraPorEquipo = pIDBitacora2;
update bitacoraPorEquipo
set pe = pe+1
where idbitacoraPorEquipo = pIDBitacora2;
update bitacoraPorEquipo
set pe = pe+1
where idbitacoraPorEquipo = pIDBitacora1;
end case;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `crear_alineacion`(pIDEquipo INT,
Keeper INT,
Def1 INT,
Def2 INT,
Def3 INT,
Def4 INT,
Mid1 INT,
Mid2 INT,
Mid3 INT,
Mid4 INT,
Fwd1 INT,
Fwd2 INT
)
BEGIN

DECLARE antiguo INT;
set antiguo = `call  seleccionar_alineacion(PIDEquipo)`;
call  cambiar_alineacion(antiguo);

UPDATE jugador
SET alineacion_idalineacion = antiguo
WHERE idjugador = Keeper OR
idjugador = Def1 OR
idjugador = Def2 OR
idjugador = Def3 OR
idjugador = Def4 OR
idjugador = Mid1 OR
idjugador = Mid2 OR
idjugador = Mid3 OR
idjugador = Mid4 OR
idjugador = Fwd1 OR
idjugador = Fwd2;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `cambiar_capitan`(pIDjugador INT, PIDEquipo INT)
BEGIN

DECLARE antiguo INT;
set antiguo = `call  seleccionar_capitan(PIDEquipo)`;

UPDATE jugador
SET capitan = 0
WHERE idjugador = antiguo;

UPDATE jugador
SET capitan = 1
WHERE idjugador = pIDjugador;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `cambiar_alineacion`(pIDalineacion INT)
BEGIN

UPDATE jugador
SET alineacion_idalineacion = NULL
WHERE alineacion_idalineacion = pIDalineacion ;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `agregar_goles_recibidos`(pIDBitacora INT, pIDPartido INT)
BEGIN

DECLARE equipoG INT;

SELECT equipo_idequipo into equipoG from bitacoraPorEquipo where idbitacoraPorEquipo = pIDBitacora;

UPDATE bitacoraPorEquipo
SET gc = gc + (SELECT Count(1) from accion where idCatalogo_de_Acciones = 1 and partido_idpartido = pIDPartido and equipo_idequipo <> equipoG )
WHERE idbitacoraPorEquipo = pIDBitacora;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`proyecto2`@`localhost` PROCEDURE `agregar_goles_hechos`(pIDBitacora INT, pIDPartido INT)
BEGIN

DECLARE equipoG INT;

SELECT equipo_idequipo into equipoG from bitacoraPorEquipo where idbitacoraPorEquipo = pIDBitacora;

UPDATE bitacoraPorEquipo
SET gf = gf + (SELECT Count(1) from accion where idCatalogo_de_Acciones = 1 and equipo_idequipo = equipoG and partido_idpartido = pIDPartido)
WHERE idbitacoraPorEquipo = pIDBitacora;


END$$
DELIMITER ;
