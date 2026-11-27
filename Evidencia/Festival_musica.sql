-- =========================================================
-- BASE DE DATOS: FESTIVAL DE MÚSICA
-- =========================================================

-- 1. Crear la base de datos (se borra si ya existe, para poder re-ejecutar)
DROP DATABASE IF EXISTS festival_musica;
CREATE DATABASE festival_musica
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE festival_musica;

-- =========================================================
-- 2. TABLA: GENEROS
-- =========================================================
CREATE TABLE generos (
  id_genero INT AUTO_INCREMENT,
  nombre    VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_genero)
);

-- =========================================================
-- 3. TABLA: ARTISTAS
-- =========================================================
CREATE TABLE artistas (
  id_artista       INT AUTO_INCREMENT,
  nombre_artistico VARCHAR(100) NOT NULL,
  pais             VARCHAR(50),
  id_genero        INT NOT NULL,
  PRIMARY KEY (id_artista),
  CONSTRAINT fk_artista_genero
    FOREIGN KEY (id_genero) REFERENCES generos(id_genero)
);

-- =========================================================
-- 4. TABLA: ESCENARIOS
-- =========================================================
CREATE TABLE escenarios (
  id_escenario INT AUTO_INCREMENT,
  nombre       VARCHAR(100) NOT NULL,
  capacidad    INT NOT NULL,
  ubicacion    VARCHAR(100),
  PRIMARY KEY (id_escenario)
);

-- =========================================================
-- 5. TABLA: PRESENTACIONES
-- =========================================================
CREATE TABLE presentaciones (
  id_presentacion  INT AUTO_INCREMENT,
  id_artista       INT NOT NULL,
  id_escenario     INT NOT NULL,
  fecha            DATE NOT NULL,
  hora_inicio      TIME NOT NULL,
  duracion_minutos INT,
  PRIMARY KEY (id_presentacion),
  CONSTRAINT fk_presentacion_artista
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista),
  CONSTRAINT fk_presentacion_escenario
    FOREIGN KEY (id_escenario) REFERENCES escenarios(id_escenario)
);

-- =========================================================
-- 6. TABLA: ENTRADAS
-- =========================================================
CREATE TABLE entradas (
  id_entrada      INT AUTO_INCREMENT,
  id_presentacion INT NOT NULL,
  codigo          VARCHAR(20) NOT NULL UNIQUE,
  tipo            VARCHAR(30) NOT NULL,
  precio          DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (id_entrada),
  CONSTRAINT fk_entrada_presentacion
    FOREIGN KEY (id_presentacion) REFERENCES presentaciones(id_presentacion)
);

-- =========================================================
-- 7. INSERTAR DATOS DE EJEMPLO
-- =========================================================
INSERT INTO generos (nombre) VALUES
('Rock'), ('Metal'), ('Jazz'), ('Electrónica'), ('Reggae');

INSERT INTO artistas (nombre_artistico, pais, id_genero) VALUES
('Iron Shadows',  'Panamá',         2),
('Pacific Waves', 'Costa Rica',     5),
('Neon Pulse',    'México',         4),
('Blue Avenue',   'Colombia',       3),
('Thunder Road',  'Estados Unidos', 1);

INSERT INTO escenarios (nombre, capacidad, ubicacion) VALUES
('Escenario Principal',   5000, 'Zona Norte'),
('Escenario Alternativo', 2500, 'Zona Sur'),
('Escenario Acústico',    1000, 'Zona Central');

INSERT INTO presentaciones
(id_artista, id_escenario, fecha, hora_inicio, duracion_minutos) VALUES
(1, 1, '2026-11-15', '20:00:00', 90),
(2, 2, '2026-11-15', '18:00:00', 60),
(3, 1, '2026-11-15', '22:00:00', 75),
(4, 3, '2026-11-16', '17:00:00', 60),
(5, 1, '2026-11-16', '20:30:00', 90);

INSERT INTO entradas (id_presentacion, codigo, tipo, precio) VALUES
(1, 'ENT001', 'VIP',     85.00),
(1, 'ENT002', 'General', 45.00),
(2, 'ENT003', 'General', 35.00),
(3, 'ENT004', 'VIP',     90.00),
(4, 'ENT005', 'General', 30.00),
(5, 'ENT006', 'VIP',     80.00);

-- =========================================================
-- 8. VERIFICACIÓN
-- =========================================================
SHOW TABLES;

-- Llaves foráneas creadas (deben salir 4)
SELECT TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME,
       REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'festival_musica'
  AND REFERENCED_TABLE_NAME IS NOT NULL;

-- Consulta que une las relaciones
SELECT
  p.id_presentacion,
  a.nombre_artistico AS artista,
  g.nombre           AS genero,
  e.nombre           AS escenario,
  p.fecha,
  p.hora_inicio
FROM presentaciones p
INNER JOIN artistas   a ON p.id_artista   = a.id_artista
INNER JOIN generos    g ON a.id_genero    = g.id_genero
INNER JOIN escenarios e ON p.id_escenario = e.id_escenario;