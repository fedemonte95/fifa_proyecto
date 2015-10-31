SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`confederaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`confederaciones` (
  `idconfederaciones` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `icono` BLOB NULL,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  PRIMARY KEY (`idconfederaciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`administrador` (
  `idadministrador` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`idadministrador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Evento` (
  `idEvento` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  `fecha_inicio` DATE NULL,
  `fecha_final` DATE NULL,
  `confederacion` TINYINT(1) NULL,
  `nacionales` TINYINT(1) NULL,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  `administrador_idadministrador` INT NOT NULL,
  PRIMARY KEY (`idEvento`),
  INDEX `fk_Evento_administrador1_idx` (`administrador_idadministrador` ASC),
  CONSTRAINT `fk_Evento_administrador1`
    FOREIGN KEY (`administrador_idadministrador`)
    REFERENCES `mydb`.`administrador` (`idadministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`grupo` (
  `idgrupo` INT NOT NULL AUTO_INCREMENT,
  `Evento_idEvento` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  PRIMARY KEY (`idgrupo`),
  INDEX `fk_grupo_Evento1_idx` (`Evento_idEvento` ASC),
  CONSTRAINT `fk_grupo_Evento1`
    FOREIGN KEY (`Evento_idEvento`)
    REFERENCES `mydb`.`Evento` (`idEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Continente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Continente` (
  `idContinente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  PRIMARY KEY (`idContinente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `bandera` BLOB NULL,
  `Continente_idContinente` INT NOT NULL,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  PRIMARY KEY (`idPais`),
  INDEX `fk_Pais_Continente1_idx` (`Continente_idContinente` ASC),
  CONSTRAINT `fk_Pais_Continente1`
    FOREIGN KEY (`Continente_idContinente`)
    REFERENCES `mydb`.`Continente` (`idContinente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`equipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`equipo` (
  `idequipo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `bandera` BLOB NULL,
  `tecnico` VARCHAR(95) NULL,
  `confederaciones_idconfederaciones` INT NOT NULL,
  `grupo_idgrupo` INT NOT NULL,
  `Pais_idPais` INT NOT NULL,
  `seleccion` TINYINT(1) NULL,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  PRIMARY KEY (`idequipo`),
  INDEX `fk_equipo_confederaciones1_idx` (`confederaciones_idconfederaciones` ASC),
  INDEX `fk_equipo_grupo1_idx` (`grupo_idgrupo` ASC),
  INDEX `fk_equipo_Pais1_idx` (`Pais_idPais` ASC),
  CONSTRAINT `fk_equipo_confederaciones1`
    FOREIGN KEY (`confederaciones_idconfederaciones`)
    REFERENCES `mydb`.`confederaciones` (`idconfederaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipo_grupo1`
    FOREIGN KEY (`grupo_idgrupo`)
    REFERENCES `mydb`.`grupo` (`idgrupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipo_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `mydb`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`alineacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`alineacion` (
  `idalineacion` INT NOT NULL AUTO_INCREMENT,
  `equipo_idequipo` INT NOT NULL,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  PRIMARY KEY (`idalineacion`),
  INDEX `fk_alineacion_equipo1_idx` (`equipo_idequipo` ASC),
  CONSTRAINT `fk_alineacion_equipo1`
    FOREIGN KEY (`equipo_idequipo`)
    REFERENCES `mydb`.`equipo` (`idequipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`posicion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`posicion` (
  `idposicion` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  PRIMARY KEY (`idposicion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`jugador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`jugador` (
  `idjugador` INT NOT NULL AUTO_INCREMENT,
  `numeroCamiseta` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `cedula` VARCHAR(45) NULL,
  `foto` BLOB NULL,
  `equipo_idequipo` INT NOT NULL,
  `suspendido` TINYINT(1) NULL,
  `alineacion_idalineacion` INT NOT NULL,
  `Pais_idPais` INT NOT NULL,
  `capitan` TINYINT(1) NULL,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  `posicion_idposicion` INT NOT NULL,
  PRIMARY KEY (`idjugador`),
  INDEX `fk_jugador_equipo1_idx` (`equipo_idequipo` ASC),
  INDEX `fk_jugador_alineacion1_idx` (`alineacion_idalineacion` ASC),
  INDEX `fk_jugador_Pais1_idx` (`Pais_idPais` ASC),
  UNIQUE INDEX `numeroCamiseta_UNIQUE` (`numeroCamiseta` ASC),
  INDEX `fk_jugador_posicion1_idx` (`posicion_idposicion` ASC),
  CONSTRAINT `fk_jugador_equipo1`
    FOREIGN KEY (`equipo_idequipo`)
    REFERENCES `mydb`.`equipo` (`idequipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jugador_alineacion1`
    FOREIGN KEY (`alineacion_idalineacion`)
    REFERENCES `mydb`.`alineacion` (`idalineacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jugador_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `mydb`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jugador_posicion1`
    FOREIGN KEY (`posicion_idposicion`)
    REFERENCES `mydb`.`posicion` (`idposicion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estadio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estadio` (
  `idestadio` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `Pais_idPais` INT NOT NULL,
  `capacidad` INT NULL,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  PRIMARY KEY (`idestadio`),
  INDEX `fk_estadio_Pais1_idx` (`Pais_idPais` ASC),
  CONSTRAINT `fk_estadio_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `mydb`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`partido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`partido` (
  `idpartido` INT NOT NULL AUTO_INCREMENT,
  `Evento_idEvento` INT NOT NULL,
  `EquipoLocal` INT NOT NULL,
  `EquipoVisita` INT NOT NULL,
  `Ganador` INT NULL,
  `estadio_idestadio` INT NOT NULL,
  `fecha` DATETIME NULL,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  PRIMARY KEY (`idpartido`),
  INDEX `fk_partido_Evento1_idx` (`Evento_idEvento` ASC),
  INDEX `fk_partido_equipo1_idx` (`EquipoLocal` ASC),
  INDEX `fk_partido_equipo2_idx` (`EquipoVisita` ASC),
  INDEX `fk_partido_estadio1_idx` (`estadio_idestadio` ASC),
  CONSTRAINT `fk_partido_Evento1`
    FOREIGN KEY (`Evento_idEvento`)
    REFERENCES `mydb`.`Evento` (`idEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_equipo1`
    FOREIGN KEY (`EquipoLocal`)
    REFERENCES `mydb`.`equipo` (`idequipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_equipo2`
    FOREIGN KEY (`EquipoVisita`)
    REFERENCES `mydb`.`equipo` (`idequipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_estadio1`
    FOREIGN KEY (`estadio_idestadio`)
    REFERENCES `mydb`.`estadio` (`idestadio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bitacora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`bitacora` (
  `idbitacora` INT NOT NULL AUTO_INCREMENT,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  PRIMARY KEY (`idbitacora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`parametros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`parametros` (
  `idparametros` INT NOT NULL,
  `cantidad_equipos` INT NULL,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  PRIMARY KEY (`idparametros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Evento_has_confederaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Evento_has_confederaciones` (
  `Evento_idEvento` INT NOT NULL,
  `confederaciones_idconfederaciones` INT NOT NULL,
  PRIMARY KEY (`Evento_idEvento`, `confederaciones_idconfederaciones`),
  INDEX `fk_Evento_has_confederaciones_confederaciones1_idx` (`confederaciones_idconfederaciones` ASC),
  INDEX `fk_Evento_has_confederaciones_Evento_idx` (`Evento_idEvento` ASC),
  CONSTRAINT `fk_Evento_has_confederaciones_Evento`
    FOREIGN KEY (`Evento_idEvento`)
    REFERENCES `mydb`.`Evento` (`idEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_has_confederaciones_confederaciones1`
    FOREIGN KEY (`confederaciones_idconfederaciones`)
    REFERENCES `mydb`.`confederaciones` (`idconfederaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Evento_has_equipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Evento_has_equipo` (
  `Evento_idEvento` INT NOT NULL,
  `equipo_idequipo` INT NOT NULL,
  `ganador` TINYINT(1) NULL,
  `segundo lugar` TINYINT(1) NULL,
  PRIMARY KEY (`Evento_idEvento`, `equipo_idequipo`),
  INDEX `fk_Evento_has_equipo_equipo1_idx` (`equipo_idequipo` ASC),
  INDEX `fk_Evento_has_equipo_Evento1_idx` (`Evento_idEvento` ASC),
  CONSTRAINT `fk_Evento_has_equipo_Evento1`
    FOREIGN KEY (`Evento_idEvento`)
    REFERENCES `mydb`.`Evento` (`idEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_has_equipo_equipo1`
    FOREIGN KEY (`equipo_idequipo`)
    REFERENCES `mydb`.`equipo` (`idequipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`partido_has_jugador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`partido_has_jugador` (
  `partido_idpartido` INT NOT NULL,
  `jugador_idjugador` INT NOT NULL,
  PRIMARY KEY (`partido_idpartido`, `jugador_idjugador`),
  INDEX `fk_partido_has_jugador_jugador1_idx` (`jugador_idjugador` ASC),
  INDEX `fk_partido_has_jugador_partido1_idx` (`partido_idpartido` ASC),
  CONSTRAINT `fk_partido_has_jugador_partido1`
    FOREIGN KEY (`partido_idpartido`)
    REFERENCES `mydb`.`partido` (`idpartido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_has_jugador_jugador1`
    FOREIGN KEY (`jugador_idjugador`)
    REFERENCES `mydb`.`jugador` (`idjugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Catalogo de Acciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Catalogo de Acciones` (
  `idCatalogo de Acciones` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  PRIMARY KEY (`idCatalogo de Acciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Accion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Accion` (
  `idAccion` INT NOT NULL AUTO_INCREMENT,
  `jugador_idjugador` INT NOT NULL,
  `partido_idpartido` INT NOT NULL,
  `tiempo` INT NULL,
  `Catalogo de Acciones_idCatalogo de Acciones` INT NOT NULL,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  PRIMARY KEY (`idAccion`),
  INDEX `fk_Accion_jugador1_idx` (`jugador_idjugador` ASC),
  INDEX `fk_Accion_partido1_idx` (`partido_idpartido` ASC),
  INDEX `fk_Accion_Catalogo de Acciones1_idx` (`Catalogo de Acciones_idCatalogo de Acciones` ASC),
  CONSTRAINT `fk_Accion_jugador1`
    FOREIGN KEY (`jugador_idjugador`)
    REFERENCES `mydb`.`jugador` (`idjugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Accion_partido1`
    FOREIGN KEY (`partido_idpartido`)
    REFERENCES `mydb`.`partido` (`idpartido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Accion_Catalogo de Acciones1`
    FOREIGN KEY (`Catalogo de Acciones_idCatalogo de Acciones`)
    REFERENCES `mydb`.`Catalogo de Acciones` (`idCatalogo de Acciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bitacoraPorEquipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`bitacoraPorEquipo` (
  `idbitacoraPorEquipo` INT NOT NULL AUTO_INCREMENT,
  `pj` INT NULL,
  `pg` INT NULL,
  `pe` INT NULL,
  `pp` INT NULL,
  `GF` INT NULL,
  `gc` INT NULL,
  `grupo_idgrupo` INT NOT NULL,
  `equipo_idequipo` INT NOT NULL,
  `Fecha_Creacion` DATE NULL,
  `Fecha_Edicion` DATE NULL,
  PRIMARY KEY (`idbitacoraPorEquipo`),
  INDEX `fk_bitacoraPorEquipo_grupo1_idx` (`grupo_idgrupo` ASC),
  INDEX `fk_bitacoraPorEquipo_equipo1_idx` (`equipo_idequipo` ASC),
  CONSTRAINT `fk_bitacoraPorEquipo_grupo1`
    FOREIGN KEY (`grupo_idgrupo`)
    REFERENCES `mydb`.`grupo` (`idgrupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bitacoraPorEquipo_equipo1`
    FOREIGN KEY (`equipo_idequipo`)
    REFERENCES `mydb`.`equipo` (`idequipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Evento_has_Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Evento_has_Pais` (
  `Evento_idEvento` INT NOT NULL,
  `Pais_idPais` INT NOT NULL,
  PRIMARY KEY (`Evento_idEvento`, `Pais_idPais`),
  INDEX `fk_Evento_has_Pais_Pais1_idx` (`Pais_idPais` ASC),
  INDEX `fk_Evento_has_Pais_Evento1_idx` (`Evento_idEvento` ASC),
  CONSTRAINT `fk_Evento_has_Pais_Evento1`
    FOREIGN KEY (`Evento_idEvento`)
    REFERENCES `mydb`.`Evento` (`idEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_has_Pais_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `mydb`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
