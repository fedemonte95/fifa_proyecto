SELECT
  equipo.nombre,
  confederaciones.nombre
FROM evento_has_confederaciones
  INNER JOIN evento
    ON evento_has_confederaciones.Evento_idEvento = evento.idEvento
  INNER JOIN confederaciones
    ON evento_has_confederaciones.confederaciones_idconfederaciones = confederaciones.idconfederaciones
  INNER JOIN equipo
    ON equipo.confederaciones_idconfederaciones = confederaciones.idconfederaciones
WHERE equipo.confederaciones_idconfederaciones = confederaciones.idconfederaciones
AND confederaciones.idconfederaciones = evento_has_confederaciones.confederaciones_idconfederaciones
AND evento_has_confederaciones.Evento_idEvento = evento.idEvento