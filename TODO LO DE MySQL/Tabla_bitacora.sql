CREATE TABLE IF NOT EXISTS `proyecto2`.`bitacora` (
  `idbitacora` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `pj` INT NULL COMMENT '',
  `pg` INT NULL COMMENT '',
  `pe` INT NULL COMMENT '',
  `pp` INT NULL COMMENT '',
  `GF` INT NULL COMMENT '',
  `gc` INT NULL COMMENT '',
  `grupo_idgrupo` INT NOT NULL COMMENT '',
  `equipo_idequipo` INT NOT NULL COMMENT '',
  `Fecha_Creacion` DATE NULL COMMENT '',
  `Fecha_Edicion` DATE NULL COMMENT '',
  PRIMARY KEY (`idbitacora`)  COMMENT ''
)ENGINE=InnoDB DEFAULT CHARSET=utf8;