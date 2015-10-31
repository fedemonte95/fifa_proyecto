CREATE TRIGGER accion_edit BEFORE update ON accion
FOR EACH ROW
SET NEW.fecha_edicion = NOW();

CREATE TRIGGER alineaciones_edit BEFORE update ON alineacion
FOR EACH ROW
SET NEW.fecha_edicion = NOW();

CREATE TRIGGER continentes_edit BEFORE update ON continente
FOR EACH ROW
SET NEW.fecha_edicion = NOW();

CREATE TRIGGER bitacora_edit BEFORE update ON bitacora
FOR EACH ROW
SET NEW.fecha_edicion = NOW();

CREATE TRIGGER bitacoraporequipo_edit BEFORE update ON bitacoraporequipo
FOR EACH ROW
SET NEW.fecha_edicion = NOW();

CREATE TRIGGER catalogo_edit BEFORE update ON `catalogo de acciones`
FOR EACH ROW
SET NEW.fecha_edicion = NOW();

CREATE TRIGGER confederaciones BEFORE update ON confederaciones
FOR EACH ROW
SET NEW.fecha_edicion = NOW();

CREATE TRIGGER equipo_edit BEFORE update ON equipo
FOR EACH ROW
SET NEW.fecha_edicion = NOW();

CREATE TRIGGER estadio_edit BEFORE update ON estadio
FOR EACH ROW
SET NEW.fecha_edicion = NOW();

CREATE TRIGGER event_edit BEFORE update ON evento
FOR EACH ROW
SET NEW.fecha_edicion = NOW();

CREATE TRIGGER grupo_edit BEFORE update ON grupo
FOR EACH ROW
SET NEW.fecha_edicion = NOW();

CREATE TRIGGER jugador_edit BEFORE update ON jugador
FOR EACH ROW
SET NEW.fecha_edicion = NOW();

CREATE TRIGGER pais_edit BEFORE update ON pais
FOR EACH ROW
SET NEW.fecha_edicion = NOW();

CREATE TRIGGER parametros_edit BEFORE update ON parametros
FOR EACH ROW
SET NEW.fecha_edicion = NOW();

CREATE TRIGGER partido_edit BEFORE update ON partido
FOR EACH ROW
SET NEW.fecha_edicion = NOW();