CREATE DEFINER=`root`@`localhost` FUNCTION `Promedio_offsidesXpartido`(PId_Evento INT) RETURNS float
BEGIN
DECLARE offsides_Totales int;
DECLARE cant_Partidos int;
DECLARE Promedio_offsidesXpartido float;

SET cant_Partidos = (
  SELECT
  COUNT(partido.idpartido) AS expr1
FROM partido
  INNER JOIN evento
    ON partido.Evento_idEvento = evento.idEvento
WHERE evento.idEvento = partido.Evento_idEvento);



SET offsides_Totales = (
SELECT
 COUNT(accion.idAccion) AS expr1
FROM accion
  INNER JOIN catalogo_de_acciones
    ON accion.idCatalogo_de_Acciones = catalogo_de_acciones.idCatalogo_de_Acciones
  INNER JOIN partido
    ON accion.partido_idpartido = partido.idpartido
  INNER JOIN evento
    ON partido.Evento_idEvento = evento.idEvento
WHERE evento.idEvento = PId_Evento
AND accion.idCatalogo_de_Acciones = 6);

SET Promedio_offsidesXpartido = offsides_Totales / cant_Partidos;

RETURN Promedio_offsidesXpartido;
END