DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_accion`(pidJugador int, pidPartido int, ptiempo int, pCatalogoAcciones int)
BEGIN
insert into accion(
	jugador_idjugador,
    partido_idpartido,
    tiempo,
    CatalogodeAcciones_idCatalogodeAcciones,
    Fecha_Creacion,
    FechaEdicion
  )
values(
	pidJugador,
    pidPartido,
    ptiempo,
    pCatalogoAcciones,
    curdate(),
    curdate()
);
END$$
DELIMITER ;
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_administrador`(pUsername varchar(45), pPassword varchar(45))
BEGIN
	insert into proyecto2.administrador(username, password)
    values(pUsername, AES_ENCRYPT(pPassword, 'basesrulez'));
END$$
DELIMITER ;
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_aliniacion`(idEquipo int)
BEGIN
insert into alineacion( equipo_idequipo, Fecha_Creacion, Fecha_Edicion )
values( idEquipo, curdate(), curdate() );
END$$
DELIMITER ;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_confederacion`(pNombre varchar(45), pIcono blob)
BEGIN
	insert into proyecto2.confederaciones(nombre, icono, Fecha_Creacion, Fecha_Edicion)
    values(pNombre, pIcono, curdate(), curdate());
END$$
DELIMITER ;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_continente`(pNombre varchar(45))
BEGIN
	insert into proyecto2.continente(nombre, Fecha_Creacion, Fecha_Edicion)
    values(pNombre, curdate(), curdate());
END$$
DELIMITER ;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_equipo`(pnombre varchar(45), pbandera blob, ptecnico varchar(95), pconfederaciones int, pgrupo int, pPais int, pseleccion tinyint(1))
BEGIN
	insert into equipo(
    nombre,
    bandera,
    tecnico,
    confederaciones_idconfederaciones,
    grupo_idgrupo,
    Pais_idPais,
    seleccion,
    Fecha_Creacion,
    Fecha_Edicion
    )
    values(
    pnombre,
    pbandera ,
    ptecnico ,
    pconfederaciones ,
    pgrupo ,
    pPais ,
    pseleccion
    );
END$$
DELIMITER ;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_estadio`(pnombre varchar(45), idPais int, pcapacidad int)
BEGIN
insert into estadio(
	nombre,
	Pais_idPais,
	capacidad,
	Fecha_Creacion,
	Fecha_Edicion
)
values(
	pnombre,
    idPais,
    pcapacidad,
    curdate(),
    curdate()
);
END$$
DELIMITER ;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_evento`(pTipo varchar(45), pFechaInicio date, pFechaFinal date,
pConfederacion tinyint(1), pNacionales tinyint(1), pAdministrador int)
BEGIN
insert into evento(
	tipo,
	fecha_inicio,
	fecha_final,
	confederacion,
	nacionales,
	Fecha_Creacion,
	Fecha_Edicion,
	administrador_idadministrador
)


values(
	pTipo ,
	pFechaInicio ,
	pFechaFinal,
	pConfederacion ,
	pNacionales,
	curdate(),
	curdate(),
	pAdministrador
);
END$$
DELIMITER ;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_grupo`(pEventID int, pNombre varchar(45))
BEGIN
	insert into proyecto2.grupo(Evento_idEvento, nombre, Fecha_Creacion, Fecha_Edicion)
    values(pEventID, pNombre, curdate(), curdate());
END$$
DELIMITER ;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_jugador`(pnumCamiseta int, pnombre varchar(45), pApellidos varchar(45), pCedula varchar(45), pfoto blob,
idEquipo int, pSuspendido tinyint(1), pAlineacionID int, pPais int, pcapitan tinyint(1), pPosicion int )
BEGIN
	insert into jugador(
    numeroCamiseta,
    nombre,
    apellidos,
    cedula,
    foto,
    equipo_idequipo,
    suspendido,
    alineacion_idalineacion,
    Pais_idPais,
    capitan,
    Fecha_Creacion,
    Fecha_edicion,
    posicion_idposicion
    )
    values (
    pnumCamiseta ,
    pnombre ,
    pApellidos ,
    pCedula ,
    pfoto ,
	idEquipo ,
	pSuspendido ,
    pAlineacionID ,
    pPais,
    pcapitan,
    curdate(),
    curdate(),
    pPosicion
    );
END$$
DELIMITER ;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_partido`(pEventID int, pEquipoLocal int, pEquipoVisita int, pGanador int,
									pEstadio int, pFecha date)
BEGIN
	insert into partido(Evento_idEvento, EquipoLocal, EquipoVisita, Ganador,
    estadio_idestadio, fecha, Fecha_Creacion, Fecha_Edicion)
    values(pEventID , pEquipoLocal , pEquipoVisita , pGanador ,
									pEstadio , pFecha , curdate() , curdate() );
END$$
DELIMITER ;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_partido`(pEventID int, pEquipoLocal int, pEquipoVisita int, pGanador int,
									pEstadio int, pFecha date)
BEGIN
	insert into partido(Evento_idEvento, EquipoLocal, EquipoVisita, Ganador,
    estadio_idestadio, fecha, Fecha_Creacion, Fecha_Edicion)
    values(pEventID , pEquipoLocal , pEquipoVisita , pGanador ,
									pEstadio , pFecha , curdate() , curdate() );
END$$
DELIMITER ;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_pais`(pNombre varchar(45), pBandera blob, pContinenteID int)
BEGIN
	insert into proyecto2.pais(nombre, bandera, Continente_idContinente,Fecha_Creacion, Fecha_Edicion)
    values(pNombre, pBandera, pContinente, curdate(), curdate());
END$$
DELIMITER ;