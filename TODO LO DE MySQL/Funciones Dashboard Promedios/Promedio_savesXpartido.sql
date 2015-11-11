CREATE DEFINER=`root`@`localhost` FUNCTION `Promedio_savesXpartido`(PId_Evento INT) RETURNS float
BEGIN
DECLARE saves_Totales int;
DECLARE cant_Partidos int;
DECLARE Promedio_savesXpartido float;

SET cant_Partidos = (
  SELECT
  COUNT(partido.idpartido) AS expr1
FROM partido
  INNER JOIN evento
    ON partido.Evento_idEvento = evento.idEvento
WHERE evento.idEvento = partido.Evento_idEvento);



SET saves_Totales = (
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
AND accion.idCatalogo_de_Acciones = 4);

SET Promedio_savesXpartido = saves_Totales / cant_Partidos;

RETURN Promedio_savesXpartido;
END