CREATE DEFINER=`root`@`localhost` FUNCTION `Promedio_rojasXpartido`(PId_Evento INT) RETURNS float
BEGIN
DECLARE rojas_Totales int;
DECLARE cant_Partidos int;
DECLARE Promedio_rojasXpartido float;

SET cant_Partidos = (
  SELECT
  COUNT(partido.idpartido) AS expr1
FROM partido
  INNER JOIN evento
    ON partido.Evento_idEvento = evento.idEvento
WHERE evento.idEvento = partido.Evento_idEvento);



SET rojas_Totales = (
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
AND accion.idCatalogo_de_Acciones = 3);

SET Promedio_rojasXpartido = rojas_Totales / cant_Partidos;

RETURN Promedio_rojasXpartido;
END