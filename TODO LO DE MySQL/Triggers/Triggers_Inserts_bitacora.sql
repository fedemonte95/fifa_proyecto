CREATE TRIGGER accion_timestamp BEFORE INSERT ON accion
FOR EACH ROW
SET NEW.fecha_creacion = NOW();

CREATE TRIGGER alineaciones_timestamp BEFORE INSERT ON alineacion
FOR EACH ROW
SET NEW.fecha_creacion = NOW();

CREATE TRIGGER continentes_timestamp BEFORE INSERT ON continente
FOR EACH ROW
SET NEW.fecha_creacion = NOW();

CREATE TRIGGER bitacora_timestamp BEFORE INSERT ON bitacora
FOR EACH ROW
SET NEW.fecha_creacion = CURRENT_TIMESTAMP;

CREATE TRIGGER bitacoraporequipo_timestamp BEFORE INSERT ON bitacoraporequipo
FOR EACH ROW
SET NEW.fecha_creacion = NOW();

CREATE TRIGGER catalogo_timestamp BEFORE INSERT ON `catalogo de acciones`
FOR EACH ROW
SET NEW.fecha_creacion = NOW();

CREATE TRIGGER confederaciones_timestamp BEFORE INSERT ON confederaciones
FOR EACH ROW
SET NEW.fecha_creacion = NOW();

CREATE TRIGGER equipo_timestamp BEFORE INSERT ON equipo
FOR EACH ROW
SET NEW.fecha_creacion = NOW();

CREATE TRIGGER estadio_timestamp BEFORE INSERT ON estadio
FOR EACH ROW
SET NEW.fecha_creacion = NOW();

CREATE TRIGGER evento_timestamp BEFORE INSERT ON evento
FOR EACH ROW
SET NEW.fecha_creacion = NOW();

CREATE TRIGGER grupo_timestamp BEFORE INSERT ON grupo
FOR EACH ROW
SET NEW.fecha_creacion = NOW();

CREATE TRIGGER jugador_timestamp BEFORE INSERT ON jugador
FOR EACH ROW
SET NEW.fecha_creacion = NOW();

CREATE TRIGGER pais_timestamp BEFORE INSERT ON pais
FOR EACH ROW
SET NEW.fecha_creacion = NOW();

CREATE TRIGGER parametros_timestamp BEFORE INSERT ON parametros
FOR EACH ROW
SET NEW.fecha_creacion = NOW();

CREATE TRIGGER partido_timestamp BEFORE INSERT ON partido
FOR EACH ROW
SET NEW.fecha_creacion = NOW();
