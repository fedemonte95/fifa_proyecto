CREATE TABLE `accion` (
  `idAccion` int(11) NOT NULL AUTO_INCREMENT,
  `jugador_idjugador` int(11) NOT NULL,
  `partido_idpartido` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `idCatalogo_de_Acciones` int(11) NOT NULL,
  `Fecha_Creacion` date DEFAULT NULL,
  `Fecha_Edicion` date DEFAULT NULL,
  `equipo_idequipo` int(11) NOT NULL,
  PRIMARY KEY (`idAccion`),
  KEY `fk_Accion_jugador1_idx` (`jugador_idjugador`),
  KEY `fk_Accion_partido1_idx` (`partido_idpartido`),
  KEY `fk_Accion_Catalogo de Acciones1_idx` (`idCatalogo_de_Acciones`),
  KEY `fk_Accion_equipo2_idx` (`equipo_idequipo`),
  CONSTRAINT `fk_Accion_Catalogo de Acciones1` FOREIGN KEY (`idCatalogo_de_Acciones`) REFERENCES `catalogo_de_acciones` (`idCatalogo_de_Acciones`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Accion_equipo2` FOREIGN KEY (`equipo_idequipo`) REFERENCES `equipo` (`idequipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Accion_jugador1` FOREIGN KEY (`jugador_idjugador`) REFERENCES `jugador` (`idjugador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Accion_partido1` FOREIGN KEY (`partido_idpartido`) REFERENCES `partido` (`idpartido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
