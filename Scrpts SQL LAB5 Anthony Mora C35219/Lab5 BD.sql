--CREATE DATABASE LABORATORIO5

--USE LABORATORIO5

-- CREATE SCHEMA BIBLIOTECA


-- CREACION DE TABLAS

CREATE TABLE BIBLIOTECA.AUTOR
(
 CODIGO INT PRIMARY KEY NOT NULL --MANERA 1
,NOMBRE VARCHAR(30) NOT NULL
)  

CREATE TABLE BIBLIOTECA.LIBRO
(
 CODIGO_LIBRO INT PRIMARY KEY NOT NULL --MANERA 1
,TITULO       VARCHAR(50) NOT NULL
,ISBN         VARCHAR(15) NOT NULL
,PAGINAS      INT NOT NULL
,EDITORIAL    VARCHAR(50)
)

CREATE TABLE BIBLIOTECA.LOCALIZACION
(
ID_LOCALIZACION INT PRIMARY KEY NOT NULL
,RECINTO VARCHAR(25) NOT NULL
)

CREATE TABLE BIBLIOTECA.EJEMPLAR
(
CODIGO_EJEMPLAR INT PRIMARY KEY NOT NULL
,LOCALIZACION   INT
,FOREIGN KEY (LOCALIZACION) REFERENCES BIBLIOTECA.LOCALIZACION(ID_LOCALIZACION)
)

CREATE TABLE BIBLIOTECA.USUARIO
(
 CODIGO_USUARIO INT PRIMARY KEY NOT NULL
,NOMBRE         VARCHAR(20) NOT NULL
,APELLIDOS      VARCHAR(40) NOT NULL
,TELEFONO       VARCHAR(10) NULL
,DIRECCION      VARCHAR(100) NOT NULL
,CARRERA        VARCHAR(40) NOT NULL
,LOCALIZACION   INT NOT NULL
,FOREIGN KEY (LOCALIZACION) REFERENCES BIBLIOTECA.LOCALIZACION(ID_LOCALIZACION)
)


CREATE TABLE BIBLIOTECA.AUTOR_LIBRO
(
 CODIGO_AUTOR INT NOT NULL
,CODIGO_LIBRO INT NOT NULL
--,PRIMARY KEY(CODIGO_AUTOR,CODIGO_LIBRO) --MANERA 2
,CONSTRAINT PK_AUTOR_LIBRO PRIMARY KEY (CODIGO_AUTOR,CODIGO_LIBRO) --MANERA 3
,FOREIGN KEY (CODIGO_AUTOR) REFERENCES BIBLIOTECA.AUTOR(CODIGO)
,FOREIGN KEY (CODIGO_LIBRO) REFERENCES BIBLIOTECA.LIBRO(CODIGO_LIBRO)
)


CREATE TABLE BIBLIOTECA.LIBRO_EJEMPLAR
(
 CODIGO_LIBRO    INT NOT NULL
,CODIGO_EJEMPLAR INT NOT NULL
,CONSTRAINT PK_LIBRO_EJEMPLAR PRIMARY KEY (CODIGO_LIBRO,CODIGO_EJEMPLAR)
,FOREIGN KEY (CODIGO_LIBRO) REFERENCES BIBLIOTECA.LIBRO(CODIGO_LIBRO)
,FOREIGN KEY (CODIGO_EJEMPLAR) REFERENCES BIBLIOTECA.EJEMPLAR(CODIGO_EJEMPLAR)
)


-- Relacion de Usuarios y Prestamos
CREATE TABLE BIBLIOTECA.PRESTAMOS
(
    ID_PRESTAMO INT IDENTITY(1,1) PRIMARY KEY, -- Nueva clave primaria con incremento autom�tico
    CODIGO_USUARIO INT NOT NULL,
    CODIGO_EJEMPLAR INT NOT NULL,
    FECHA_PRESTAMO DATETIME NOT NULL,
    FECHA_DEVOLUCION DATE NOT NULL,
    FOREIGN KEY (CODIGO_EJEMPLAR) REFERENCES BIBLIOTECA.EJEMPLAR(CODIGO_EJEMPLAR),
    FOREIGN KEY (CODIGO_USUARIO) REFERENCES BIBLIOTECA.USUARIO(CODIGO_USUARIO)
)


--INSERTS

INSERT INTO BIBLIOTECA.LOCALIZACION
(
[ID_LOCALIZACION]
, [RECINTO]
)
VALUES
(1,'Turrialba')
,(2,'Paraiso')
,(3,'Guapiles')
,(4,'San Ramon')
,(5,'San Pedro')
,(6, 'Grecia')
,(7,'Liberia')
,(8,'Limon')

-- SELECT * FROM BIBLIOTECA.LOCALIZACION


-- AUTORES
insert into BIBLIOTECA.AUTOR (CODIGO, NOMBRE) values (1, 'Levi');
insert into BIBLIOTECA.AUTOR (CODIGO, NOMBRE) values (2, 'Elwin');
insert into BIBLIOTECA.AUTOR (CODIGO, NOMBRE) values (3, 'Jacqueline');
insert into BIBLIOTECA.AUTOR (CODIGO, NOMBRE) values (4, 'Tucker');
insert into BIBLIOTECA.AUTOR (CODIGO, NOMBRE) values (5, 'Tymon');
insert into BIBLIOTECA.AUTOR (CODIGO, NOMBRE) values (6, 'Barde');
insert into BIBLIOTECA.AUTOR (CODIGO, NOMBRE) values (7, 'Ashlie');
insert into BIBLIOTECA.AUTOR (CODIGO, NOMBRE) values (8, 'Dora');
insert into BIBLIOTECA.AUTOR (CODIGO, NOMBRE) values (9, 'Junina');
insert into BIBLIOTECA.AUTOR (CODIGO, NOMBRE) values (10, 'Pierette');

-- LIBROS
INSERT INTO BIBLIOTECA.LIBRO (CODIGO_LIBRO, TITULO, ISBN, PAGINAS, EDITORIAL) VALUES 
(1, 'El amor en los tiempos del c�lera', '978-123-4567890', 348, 'Editorial Alfaguara'),
(2, 'La sombra del viento', '978-234-5678901', 565, 'Editorial Planeta'),
(3, 'Rayuela', '978-345-6789012', 600, 'Editorial Sudamericana'),
(4, 'La casa de los esp�ritus', '978-456-7890123', 490, 'Editorial Plaza & Jan�s'),
(5, 'El Aleph', '978-567-8901234', 157, 'Emec� Editores'),
(6, 'Los detectives salvajes', '978-678-9012345', 609, 'Editorial Anagrama'),
(7, 'Pedro P�ramo', '978-789-0123456', 124, 'Fondo de Cultura Econ�mica'),
(8, 'El t�nel', '978-890-1234567', 160, 'Editorial Sur'),
(9, 'Ficciones', '978-901-2345678', 224, 'Emec� Editores'),
(10, 'El oto�o del patriarca', '978-012-3456789', 271, 'Editorial Diana'),
(11, 'Siddhartha', '978-112-3456789', 152, 'Editorial Suramericana'),
(12, 'El principito', '978-113-3456789', 96, 'Editorial Gallimard'),
(13, 'Cr�nica de una muerte anunciada', '978-114-3456789', 122, 'Editorial Oveja Negra'),
(14, 'Donde los �rboles cantan', '978-115-3456789', 477, 'Editorial SM'),
(15, 'Los juegos del hambre', '978-116-3456789', 374, 'Editorial Molino'),
(16, 'Harry Potter y la piedra filosofal', '978-117-3456789', 309, 'Editorial Salamandra'),
(17, 'El nombre del viento', '978-118-3456789', 872, 'Editorial Plaza & Jan�s'),
(18, 'Mujercitas', '978-119-3456789', 442, 'Editorial Molino'),
(19, 'Orgullo y prejuicio', '978-120-3456789', 352, 'Editorial Penguin Books'),
(20, 'Frankenstein', '978-121-3456789', 280, 'Editorial Norton'),
(21, 'Dr�cula', '978-122-3456789', 418, 'Editorial Archibald Constable and Company'),
(22, 'La vuelta al mundo en 80 d�as', '978-123-3456789', 204, 'Editorial Pierre-Jules Hetzel'),
(23, 'El extra�o caso del Dr. Jekyll y Mr. Hyde', '978-124-3456789', 144, 'Editorial Longmans'),
(24, 'Matar a un ruise�or', '978-125-3456789', 336, 'J.B. Lippincott & Co.'),
(25, 'Cumbres borrascosas', '978-126-3456789', 416, 'Thomas Cautley Newby'),
(26, 'El conde de Montecristo', '978-127-3456789', 1312, 'Editorial Baudry'),
(27, 'Las aventuras de Tom Sawyer', '978-128-3456789', 274, 'American Publishing Company'),
(28, 'Moby Dick', '978-129-3456789', 635, 'Harper & Brothers'),
(29, 'Las aventuras de Sherlock Holmes', '978-130-3456789', 307, 'George Newnes'),
(30, 'Alicia en el pa�s de las maravillas', '978-131-3456789', 200, 'Macmillan Publishers'),
(31, 'Cien a�os de soledad', '978-132-3456789', 417, 'Editorial Sudamericana'),
(32, 'El proceso', '978-133-3456789', 272, 'Verlag Die Schmiede'),
(33, '1984', '978-134-3456789', 328, 'Secker & Warburg'),
(34, 'Rebeli�n en la granja', '978-135-3456789', 112, 'Secker & Warburg'),
(35, 'Fahrenheit 451', '978-136-3456789', 194, 'Ballantine Books'),
(36, 'La isla del tesoro', '978-137-3456789', 240, 'Cassell & Co.'),
(37, 'Los pilares de la Tierra', '978-138-3456789', 1076, 'Editorial Plaza & Jan�s'),
(38, 'El se�or de los anillos', '978-139-3456789', 1216, 'George Allen & Unwin'),
(39, 'Dune', '978-140-3456789', 412, 'Chilton Books'),
(40, 'El c�digo Da Vinci', '978-141-3456789', 689, 'Doubleday'),
(41, 'La historia interminable', '978-142-3456789', 416, 'Thienemann-Esslinger Verlag'),
(42, 'It', '978-143-3456789', 1138, 'Viking Press'),
(43, 'Cementerio de animales', '978-144-3456789', 374, 'Doubleday'),
(44, 'Carrie', '978-145-3456789', 199, 'Doubleday'),
(45, 'La torre oscura', '978-146-3456789', 845, 'Grant Publishers'),
(46, 'El resplandor', '978-147-3456789', 447, 'Doubleday'),
(47, 'Los miserables', '978-148-3456789', 1463, 'A. Lacroix, Verboeckhoven & Cie'),
(48, 'La divina comedia', '978-149-3456789', 798, 'Johann Numeister'),
(49, 'El principito', '978-150-3456789', 96, 'Editorial Gallimard'),
(50, 'La metamorfosis', '978-151-3456789', 201, 'Kurt Wolff Verlag');


-- USUARIOS

--INSERCION DE DATOS (ESTUDIANTES NUEVOS)
INSERT INTO BIBLIOTECA.USUARIO
(
  [CODIGO_USUARIO]
, [NOMBRE]
, [APELLIDOS]
, [TELEFONO]
, [DIRECCION]
, [CARRERA]
, [LOCALIZACION]
)
VALUES
(
10000
,'Aracely'
,'Soto'
,'84848484'
,'Cartago, Turrialba'
,'Informatica'
,1
)
,(
10001
,'Fabricio'
,'Castillo'
,'25529696'
,'San Jose,San Pedro, Calle 2'
,'Direccion Empresas'
,5
)
,(
10002
,'Michelle'
,'Molina'
,'85658565'
,'Cartago, Central, Oriental'
,'Turismo'
,2
),
(
10003
,'Yareth'
,'Fernandez'
,'25547896'
,'Siquirres, Calle 23'
,'Informatica'
,8
)

INSERT INTO BIBLIOTECA.USUARIO (CODIGO_USUARIO, NOMBRE, APELLIDOS, TELEFONO, DIRECCION, CARRERA, LOCALIZACION) VALUES 
(10041, 'Carlos', 'Ram�rez', '83001234', 'San Jos�, Avenida Central', 'Ingenier�a', 1), -- Turrialba
(10042, 'Ana', 'Jim�nez', '88004567', 'Cartago, Taras', 'Medicina', 2), -- Para�so
(10043, 'Luis', 'Fern�ndez', '85006789', 'Heredia, Santo Domingo', 'Derecho', 3), -- Gu�piles
(10044, 'Mar�a', 'Gonz�lez', '87002345', 'Alajuela, San Carlos', 'Biolog�a', 4), -- San Ram�n
(10005, 'Pedro', 'Solano', '84007890', 'Puntarenas, Barranca', 'Turismo', 5), -- San Pedro
(10006, 'Jos�', 'S�nchez', '81004561', 'San Jos�, Escaz�', 'Administraci�n', 6), -- Grecia
(10007, 'Laura', 'Rodr�guez', '85009123', 'Cartago, Para�so', 'Qu�mica', 7), -- Liberia
(10008, 'Sof�a', 'Mart�nez', '89001234', 'Guanacaste, Liberia', 'Historia', 8), -- Lim�n
(10009, 'Andr�s', 'Vargas', '83006789', 'Lim�n, Cahuita', 'Filosof�a', 1), -- Turrialba
(10010, 'Gloria', 'Mora', '86004567', 'Heredia, San Isidro', 'Matem�ticas', 2), -- Para�so
(10011, 'Fernanda', 'Hern�ndez', '88007890', 'San Jos�, Pavas', 'Estad�stica', 3), -- Gu�piles
(10012, 'Diego', 'Valverde', '85003456', 'Cartago, Oreamuno', 'Sociolog�a', 4), -- San Ram�n
(10013, 'Isabel', 'Rivera', '81001234', 'Alajuela, Naranjo', 'Psicolog�a', 5), -- San Pedro
(10014, 'Ricardo', 'Montero', '84005678', 'San Jos�, Tib�s', 'Computaci�n', 6), -- Grecia
(10015, 'M�nica', 'Cordero', '87008901', 'Cartago, El Guarco', 'Educaci�n', 7), -- Liberia
(10016, 'Daniela', 'Castro', '83004567', 'Puntarenas, Chacarita', 'Turismo', 8), -- Lim�n
(10017, 'Rodrigo', 'Quesada', '86001234', 'Heredia, Bel�n', 'Ciencias Pol�ticas', 1), -- Turrialba
(10018, 'Ver�nica', 'Zamora', '89007890', 'San Jos�, Moravia', 'Relaciones Internacionales', 2), -- Para�so
(10019, 'Marcos', 'Ulloa', '88005678', 'Cartago, Pacayas', 'Geograf�a', 3), -- Gu�piles
(10020, 'Roc�o', 'Campos', '81003456', 'Alajuela, Grecia', 'Derecho', 4), -- San Ram�n
(10021, 'Javier', 'Vargas', '85008901', 'Guanacaste, Nicoya', 'Administraci�n', 5), -- San Pedro
(10022, 'Carmen', 'Soto', '84001234', 'Lim�n, Siquirres', 'Educaci�n F�sica', 6), -- Grecia
(10023, 'Fabio', 'Alvarado', '87004567', 'San Jos�, La Sabana', 'Matem�ticas', 7), -- Liberia
(10024, 'Diana', 'P�rez', '83007890', 'Cartago, Tejar', 'Psicolog�a', 8), -- Lim�n
(10025, 'Natalia', 'Chaves', '86003456', 'Alajuela, Palmares', 'Qu�mica', 1), -- Turrialba
(10026, 'Luis', 'Araya', '81007890', 'Heredia, Barva', 'Filosof�a', 2), -- Para�so
(10027, 'Marta', 'Villalobos', '85001234', 'San Jos�, Desamparados', 'Computaci�n', 3), -- Gu�piles
(10028, 'Cristina', 'Espinoza', '88004561', 'Puntarenas, Monteverde', 'Biolog�a', 4), -- San Ram�n
(10029, 'Francisco', 'L�pez', '89003456', 'Cartago, Tierra Blanca', 'Historia', 5), -- San Pedro
(10030, 'Vanessa', 'Guzm�n', '84008901', 'San Jos�, Escalante', 'Medicina', 6), -- Grecia
(10031, 'Gustavo', 'Carvajal', '87001234', 'Heredia, San Rafael', 'Ingenier�a', 7), -- Liberia
(10032, 'Patricia', 'C�spedes', '83005678', 'Alajuela, San Ram�n', 'Derecho', 8), -- Lim�n
(10033, 'Ra�l', 'Brenes', '86007890', 'Guanacaste, Santa Cruz', 'Administraci�n', 1), -- Turrialba
(10034, 'Sergio', 'Arias', '81004567', 'Lim�n, Gu�cimo', 'Qu�mica', 2), -- Para�so
(10035, 'Andrea', 'Sol�s', '85001234', 'San Jos�, Curridabat', 'Filosof�a', 3), -- Gu�piles
(10036, 'Elena', 'Leiva', '88006789', 'Cartago, Cot', 'Sociolog�a', 4), -- San Ram�n
(10037, 'Fabi�n', 'Salazar', '89004561', 'Puntarenas, C�bano', 'Turismo', 5), -- San Pedro
(10038, 'Mariela', 'Vega', '84007890', 'Heredia, San Joaqu�n', 'Computaci�n', 6), -- Grecia
(10039, 'Enrique', 'Campos', '87008901', 'San Jos�, Guadalupe', 'Historia', 7), -- Liberia
(10040, 'Gabriela', 'Herrera', '83001234', 'Alajuela, Zarcero', 'Psicolog�a', 8); -- Lim�n


-- Relaci�n entre autores y libros en la tabla AUTOR_LIBRO
INSERT INTO BIBLIOTECA.AUTOR_LIBRO (CODIGO_AUTOR, CODIGO_LIBRO) VALUES
-- Autor 1 (Levi) relacionado con los libros 1 a 5
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
-- Autor 2 (Elwin) relacionado con los libros 6 a 10
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
-- Autor 3 (Jacqueline) relacionado con los libros 11 a 15
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
-- Autor 4 (Tucker) relacionado con los libros 16 a 20
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(4, 20),
-- Autor 5 (Tymon) relacionado con los libros 21 a 25
(5, 21),
(5, 22),
(5, 23),
(5, 24),
(5, 25),
-- Autor 6 (Barde) relacionado con los libros 26 a 30
(6, 26),
(6, 27),
(6, 28),
(6, 29),
(6, 30),
-- Autor 7 (Ashlie) relacionado con los libros 31 a 35
(7, 31),
(7, 32),
(7, 33),
(7, 34),
(7, 35),
-- Autor 8 (Dora) relacionado con los libros 36 a 40
(8, 36),
(8, 37),
(8, 38),
(8, 39),
(8, 40),
-- Autor 9 (Junina) relacionado con los libros 41 a 45
(9, 41),
(9, 42),
(9, 43),
(9, 44),
(9, 45),
-- Autor 10 (Pierette) relacionado con los libros 46 a 50
(10, 46),
(10, 47),
(10, 48),
(10, 49),
(10, 50);



--Inserci�n de 150 ejemplares en la tabla EJEMPLAR
INSERT INTO BIBLIOTECA.EJEMPLAR (CODIGO_EJEMPLAR, LOCALIZACION) VALUES 
 --Ejemplares para los libros 1 a 50, con 3 ejemplares cada uno
(1, 1), (2, 2), (3, 3),  -- Libro 1
(4, 4), (5, 5), (6, 6),  -- Libro 2
(7, 7), (8, 8), (9, 1),  -- Libro 3
(10, 2), (11, 3), (12, 4),  -- Libro 4
(13, 5), (14, 6), (15, 7),  -- Libro 5
(16, 8), (17, 1), (18, 2),  -- Libro 6
(19, 3), (20, 4), (21, 5),  -- Libro 7
(22, 6), (23, 7), (24, 8),  -- Libro 8
(25, 1), (26, 2), (27, 3),  -- Libro 9
(28, 4), (29, 5), (30, 6),  -- Libro 10
(31, 7), (32, 8), (33, 1),  -- Libro 11
(34, 2), (35, 3), (36, 4),  -- Libro 12
(37, 5), (38, 6), (39, 7),  -- Libro 13
(40, 8), (41, 1), (42, 2),  -- Libro 14
(43, 3), (44, 4), (45, 5),  -- Libro 15
(46, 6), (47, 7), (48, 8),  -- Libro 16
(49, 1), (50, 2), (51, 3),  -- Libro 17
(52, 4), (53, 5), (54, 6),  -- Libro 18
(55, 7), (56, 8), (57, 1),  -- Libro 19
(58, 2), (59, 3), (60, 4),  -- Libro 20
(61, 5), (62, 6), (63, 7),  -- Libro 21
(64, 8), (65, 1), (66, 2),  -- Libro 22
(67, 3), (68, 4), (69, 5),  -- Libro 23
(70, 6), (71, 7), (72, 8),  -- Libro 24
(73, 1), (74, 2), (75, 3),  -- Libro 25
(76, 4), (77, 5), (78, 6),  -- Libro 26
(79, 7), (80, 8), (81, 1),  -- Libro 27
(82, 2), (83, 3), (84, 4),  -- Libro 28
(85, 5), (86, 6), (87, 7),  -- Libro 29
(88, 8), (89, 1), (90, 2),  -- Libro 30
(91, 3), (92, 4), (93, 5),  -- Libro 31
(94, 6), (95, 7), (96, 8),  -- Libro 32
(97, 1), (98, 2), (99, 3),  -- Libro 33
(100, 4), (101, 5), (102, 6),  -- Libro 34
(103, 7), (104, 8), (105, 1),  -- Libro 35
(106, 2), (107, 3), (108, 4),  -- Libro 36
(109, 5), (110, 6), (111, 7),  -- Libro 37
(112, 8), (113, 1), (114, 2),  -- Libro 38
(115, 3), (116, 4), (117, 5),  -- Libro 39
(118, 6), (119, 7), (120, 8),  -- Libro 40
(121, 1), (122, 2), (123, 3),  -- Libro 41
(124, 4), (125, 5), (126, 6),  -- Libro 42
(127, 7), (128, 8), (129, 1),  -- Libro 43
(130, 2), (131, 3), (132, 4),  -- Libro 44
(133, 5), (134, 6), (135, 7),  -- Libro 45
(136, 8), (137, 1), (138, 2),  -- Libro 46
(139, 3), (140, 4), (141, 5),  -- Libro 47
(142, 6), (143, 7), (144, 8),  -- Libro 48
(145, 1), (146, 2), (147, 3),  -- Libro 49
(148, 4), (149, 5), (150, 6);  -- Libro 50





-- Relacionar los 150 ejemplares con los 50 libros en la tabla LIBRO_EJEMPLAR
INSERT INTO BIBLIOTECA.LIBRO_EJEMPLAR (CODIGO_LIBRO, CODIGO_EJEMPLAR) VALUES
-- Relacionando libro 1 con 3 ejemplares
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 13),
(5, 14),
(5, 15),
(6, 16),
(6, 17),
(6, 18),
(7, 19),
(7, 20),
(7, 21),
(8, 22),
(8, 23),
(8, 24),
(9, 25),
(9, 26),
(9, 27),
(10, 28),
(10, 29),
(10, 30),
(11, 31),
(11, 32),
(11, 33),
(12, 34),
(12, 35),
(12, 36),
(13, 37),
(13, 38),
(13, 39),
(14, 40),
(14, 41),
(14, 42),
(15, 43),
(15, 44),
(15, 45),
(16, 46),
(16, 47),
(16, 48),
(17, 49),
(17, 50),
(17, 51),
(18, 52),
(18, 53),
(18, 54),
(19, 55),
(19, 56),
(19, 57),
(20, 58),
(20, 59),
(20, 60),
(21, 61),
(21, 62),
(21, 63),
(22, 64),
(22, 65),
(22, 66),
(23, 67),
(23, 68),
(23, 69),
(24, 70),
(24, 71),
(24, 72),
(25, 73),
(25, 74),
(25, 75),
(26, 76),
(26, 77),
(26, 78),
(27, 79),
(27, 80),
(27, 81),
(28, 82),
(28, 83),
(28, 84),
(29, 85),
(29, 86),
(29, 87),
(30, 88),
(30, 89),
(30, 90),
(31, 91),
(31, 92),
(31, 93),
(32, 94),
(32, 95),
(32, 96),
(33, 97),
(33, 98),
(33, 99),
(34, 100),
(34, 101),
(34, 102),
(35, 103),
(35, 104),
(35, 105),
(36, 106),
(36, 107),
(36, 108),
(37, 109),
(37, 110),
(37, 111),
(38, 112),
(38, 113),
(38, 114),
(39, 115),
(39, 116),
(39, 117),
(40, 118),
(40, 119),
(40, 120),
(41, 121),
(41, 122),
(41, 123),
(42, 124),
(42, 125),
(42, 126),
(43, 127),
(43, 128),
(43, 129),
(44, 130),
(44, 131),
(44, 132),
(45, 133),
(45, 134),
(45, 135),
(46, 136),
(46, 137),
(46, 138),
(47, 139),
(47, 140),
(47, 141),
(48, 142),
(48, 143),
(48, 144),
(49, 145),
(49, 146),
(49, 147),
(50, 148),
(50, 149),
(50, 150);



-- Inserci�n de 15 registros de pr�stamos en la tabla USUARIO_EJEMPLAR
INSERT INTO BIBLIOTECA.PRESTAMOS (CODIGO_USUARIO, CODIGO_EJEMPLAR, FECHA_PRESTAMO, FECHA_DEVOLUCION) VALUES
(10041, 1, '2024-09-01 10:00:00', '2024-09-15'),
(10042, 2, '2024-09-02 11:00:00', '2024-09-16'),
(10043, 3, '2024-09-03 14:30:00', '2024-09-17'),
(10044, 4, '2024-09-04 09:00:00', '2024-09-18'),
(10005, 5, '2024-09-05 13:45:00', '2024-09-19'),
(10006, 6, '2024-09-06 15:20:00', '2024-09-20'),
(10007, 7, '2024-09-07 08:10:00', '2024-09-21'),
(10008, 8, '2024-09-08 12:00:00', '2024-09-22'),
(10009, 9, '2024-09-09 10:30:00', '2024-09-23'),
(10010, 10, '2024-09-10 14:00:00', '2024-09-24'),
(10011, 11, '2024-09-11 16:45:00', '2024-09-25'),
(10012, 12, '2024-09-12 09:15:00', '2024-09-26'),
(10013, 13, '2024-09-13 11:30:00', '2024-09-27'),
(10014, 14, '2024-09-14 15:00:00', '2024-09-28'),
(10015, 15, '2024-09-15 10:45:00', '2024-09-29');



-- -- CONSULTA USUARIOS/ESTUDIANTES
--SELECT 
--*
--FROM BIBLIOTECA.USUARIO

-- --CONSULTA AUTORES
--SELECT 
--*
--FROM BIBLIOTECA.AUTOR

-- -- CONSULTA LIBROS
--SELECT 
--*
--FROM BIBLIOTECA.LIBRO

-- -- CONSULTA PRESTAMOS
--SELECT 
--*
--FROM BIBLIOTECA.PRESTAMOS