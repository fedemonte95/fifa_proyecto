CREATE DEFINER=`root`@`localhost` FUNCTION `Promedio_golesXpartido`(PId_Evento INT) RETURNS float
BEGIN
  DECLARE cant_Goles int;
  DECLARE cant_Partidos int;
  DECLARE Promedio_golesXpartido float;


SET cant_Partidos = (
  SELECT
  COUNT(partido.idpartido) AS expr1
FROM partido
  INNER JOIN evento
    ON partido.Evento_idEvento = evento.idEvento
WHERE evento.idEvento = partido.Evento_idEvento);

  SET cant_Goles = (
SELECT
  COUNT(accion.idAccion) AS expr1
FROM partido
  INNER JOIN evento
    ON partido.Evento_idEvento = evento.idEvento
  INNER JOIN accion
    ON accion.partido_idpartido = partido.idpartido
  INNER JOIN catalogo_de_acciones
    ON accion.idCatalogo_de_Acciones = catalogo_de_acciones.idCatalogo_de_Acciones
WHERE evento.idEvento = PId_Evento
AND accion.idCatalogo_de_Acciones = 1);


SET Promedio_golesXpartido = cant_Goles / cant_Partidos;
RETURN Promedio_golesXpartido;
END