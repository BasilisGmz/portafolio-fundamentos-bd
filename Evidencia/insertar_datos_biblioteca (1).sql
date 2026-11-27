USE `Biblioteca`;

-- =====================================
-- AJUSTES AL ESQUEMA
-- =====================================
-- 1) El taller pide "nacionalidad" en Autores y tu tabla no la tiene
ALTER TABLE Autores ADD COLUMN nacionalidad VARCHAR(45) NULL;

-- 2) El tipo YEAR solo acepta años entre 1901 y 2155.
--    Libros como Don Quijote (1605) o La Odisea (-700) darían error,
--    así que se cambia a SMALLINT, que sí acepta esos valores.
ALTER TABLE Libros MODIFY COLUMN año_publicacion SMALLINT NULL;

-- =====================================
-- AUTORES
-- =====================================
INSERT INTO Autores (nombre, apellido, nacionalidad) VALUES
('Gabriel','García Márquez','Colombia'),
('Isabel','Allende','Chile'),
('Mario','Vargas Llosa','Perú'),
('Julio','Cortázar','Argentina'),
('Carlos','Fuentes','México'),
('Laura','Esquivel','México'),
('Jorge Luis','Borges','Argentina'),
('Rosario','Castellanos','México'),
('Octavio','Paz','México'),
('Pablo','Neruda','Chile'),
('Miguel','de Cervantes','España'),
('Federico','García Lorca','España'),
('Juan','Rulfo','México'),
('Clara','Janés','España'),
('Antonio','Skármeta','Chile'),
('Homero','','Grecia'),
('Dante','Alighieri','Italia'),
('William','Shakespeare','Inglaterra'),
('Victor','Hugo','Francia'),
('Franz','Kafka','Alemania');

-- =====================================
-- ESTUDIANTES
-- =====================================
INSERT INTO Estudiantes (nombre, apellido, correo, carrera) VALUES
('Juan','Pérez','jperez@uni.com','Ingeniería'),
('María','García','mgarcia@uni.com','Derecho'),
('Luis','Martínez','lmartinez@uni.com','Arquitectura'),
('Ana','Rodríguez','arodriguez@uni.com','Medicina'),
('Pedro','López','plopez@uni.com','Ingeniería'),
('Lucía','Fernández','lfernandez@uni.com','Psicología'),
('Carlos','González','cgonzalez@uni.com','Informática'),
('Elena','Sánchez','esanchez@uni.com','Administración'),
('Diego','Ramírez','dramirez@uni.com','Ingeniería'),
('Paula','Torres','ptorres@uni.com','Contabilidad'),
('Andrés','Morales','amorales@uni.com','Ingeniería'),
('Sofía','Castillo','scastillo@uni.com','Medicina'),
('Ricardo','Ortega','rortega@uni.com','Informática'),
('Valeria','Suárez','vsuarez@uni.com','Psicología'),
('Fernando','Hernández','fhernandez@uni.com','Derecho'),
('Claudia','Jiménez','cjimenez@uni.com','Medicina'),
('Gabriel','Navarro','gnavarro@uni.com','Ingeniería'),
('Marta','Reyes','mreyes@uni.com','Arquitectura'),
('Jorge','Aguilar','jaguilar@uni.com','Contabilidad'),
('Patricia','Domínguez','pdominguez@uni.com','Informática');

-- =====================================
-- LIBROS (columna FK = idAutor)
-- =====================================
INSERT INTO Libros (titulo, año_publicacion, editorial, idAutor) VALUES
('Cien Años de Soledad',1967,'Sudamericana',1),
('La Casa de los Espíritus',1982,'Debolsillo',2),
('La Ciudad y los Perros',1963,'Seix Barral',3),
('Rayuela',1963,'Sudamericana',4),
('La Muerte de Artemio Cruz',1962,'Fondo de Cultura Económica',5),
('Como Agua para Chocolate',1989,'Planeta',6),
('Ficciones',1944,'Sur',7),
('Balún Canán',1957,'Fondo de Cultura Económica',8),
('El Laberinto de la Soledad',1950,'Fondo de Cultura Económica',9),
('Veinte Poemas de Amor',1924,'Editorial Nascimento',10),
('Don Quijote de la Mancha',1605,'Francisco de Robles',11),
('Bodas de Sangre',1933,'Editorial Cénit',12),
('Pedro Páramo',1955,'Fondo de Cultura Económica',13),
('Los Secretos del Bosque',2005,'Seix Barral',14),
('Ardiente Paciencia',1985,'Andrés Bello',15),
('La Odisea',-700,'Antigua Grecia',16),
('La Divina Comedia',1320,'Manuscrito',17),
('Hamlet',1603,'Nicolas Ling',18),
('Los Miserables',1862,'A. Lacroix',19),
('La Metamorfosis',1915,'Kurt Wolff',20);

-- =====================================
-- PRESTAMOS (columnas FK = idEstudiante, idLibro)
-- =====================================
INSERT INTO Prestamos (idEstudiante, idLibro, fecha_prestamo, fecha_devolucion) VALUES
(1,1,'2023-01-10','2023-01-25'),
(2,2,'2023-01-11','2023-01-26'),
(3,3,'2023-01-12','2023-01-27'),
(4,4,'2023-01-13','2023-01-28'),
(5,5,'2023-01-14','2023-01-29'),
(6,6,'2023-01-15','2023-01-30'),
(7,7,'2023-01-16','2023-01-31'),
(8,8,'2023-01-17','2023-02-01'),
(9,9,'2023-01-18','2023-02-02'),
(10,10,'2023-01-19','2023-02-03'),
(11,11,'2023-01-20','2023-02-04'),
(12,12,'2023-01-21','2023-02-05'),
(13,13,'2023-01-22','2023-02-06'),
(14,14,'2023-01-23','2023-02-07'),
(15,15,'2023-01-24','2023-02-08'),
(16,16,'2023-01-25','2023-02-09'),
(17,17,'2023-01-26','2023-02-10'),
(18,18,'2023-01-27','2023-02-11'),
(19,19,'2023-01-28','2023-02-12'),
(20,20,'2023-01-29','2023-02-13');

-- Verificación: cada tabla debe mostrar 20
SELECT (SELECT COUNT(*) FROM Autores)     AS autores,
       (SELECT COUNT(*) FROM Estudiantes) AS estudiantes,
       (SELECT COUNT(*) FROM Libros)      AS libros,
       (SELECT COUNT(*) FROM Prestamos)   AS prestamos;
