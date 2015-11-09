--------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Evento_has_Confederaciones`(IN PEvento_idEvento INT(11), IN PConfederaciones_idconfederaciones INT(11))
BEGIN
INSERT INTO proyecto2.evento_has_confederaciones
(
  Evento_idEvento
 ,confederaciones_idconfederaciones
)
VALUES
(
  PEvento_idEvento -- Evento_idEvento - INT(11) NOT NULL
 ,PConfederaciones_idconfederaciones -- confederaciones_idconfederaciones - INT(11) NOT NULL
);
END
DELIMITER;

--------------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Evento_has_Equipo`(IN PEvento_idEvento INT(11), IN PEquipo_idequipo INT(11), IN PGanador TINYINT(1), IN PSegundo_Lugar TINYINT(1))
BEGIN
INSERT INTO proyecto2.evento_has_equipo
(
  Evento_idEvento
 ,equipo_idequipo
 ,ganador
 ,`segundo lugar`
)
VALUES
(
  PEvento_idEvento -- Evento_idEvento - INT(11) NOT NULL
 ,PEvento_idEvento -- equipo_idequipo - INT(11) NOT NULL
 ,PGanador -- ganador - TINYINT(1)
 ,PSegundo_Lugar -- segundo lugar - TINYINT(1)
);
END

DELIMITER;

--------------------------------------------------------------------------------------------------------

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_Evento_has_Pais`(IN PEvento_idEvento INT(11), IN PPais_idPais INT(11))
BEGIN
INSERT INTO proyecto2.evento_has_pais
(
  Evento_idEvento
 ,Pais_idPais
)
VALUES
(
  PEvento_idEvento -- Evento_idEvento - INT(11) NOT NULL
 ,PPais_idPais -- Pais_idPais - INT(11) NOT NULL
);
END

DELIMITER;

--------------------------------------------------------------------------------------------------------

DELIMITER $$

CREATE DEFINER = 'root'@'localhost'
PROCEDURE proyecto2.Insert_Partido_has_Jugador(IN PPartido_idpartido INT(11), IN PJugador_idjugador INT(11))
BEGIN
INSERT INTO proyecto2.partido_has_jugador
(
  partido_idpartido
 ,jugador_idjugador
)
VALUES
(
  PPartido_idpartido -- partido_idpartido - INT(11) NOT NULL
 ,PJugador_idjugador -- jugador_idjugador - INT(11) NOT NULL
);
END

DELIMITER;