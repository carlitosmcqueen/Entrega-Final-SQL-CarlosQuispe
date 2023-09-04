
CREATE DATABASE primera_entrega

USE primera_entrega


-------------------------TABLAS ---------------------------

CREATE TABLE animal (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(30),
  tipo VARCHAR(30),
  raza VARCHAR(30),
  estado VARCHAR(30),
  descripcion VARCHAR(200),
  edad_meses INT,
  malestar VARCHAR(200),
  PRIMARY KEY (id)
);

CREATE TABLE cliente (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL,
  apellido VARCHAR(30) NOT NULL,
  tipo_de_documento VARCHAR(30) NOT NULL,
  N_documento INT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE provedor (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  fecha_relacion DATE NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE trabajadores (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL,
  apellido VARCHAR(30) NOT NULL,
  horarios VARCHAR(30) NOT NULL,
  sueldo DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tratamiento (
  id INT NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(30) NOT NULL,
  descripcion VARCHAR(300) NOT NULL,
  costo DECIMAL(9,2) NOT NULL,
  id_personal INT DEFAULT NULL,
  id_animal INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_animal) REFERENCES animal (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE mascotas (
  id INT NOT NULL AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  id_animal INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_cliente) REFERENCES cliente (id),
  FOREIGN KEY (id_animal) REFERENCES animal (id)
);

CREATE TABLE citas (
  id INT NOT NULL AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  id_animal INT NOT NULL,
  fecha_cita TIMESTAMP NOT NULL,
  observaciones VARCHAR(200),
  estado VARCHAR(20) DEFAULT 'pendiente',
  PRIMARY KEY (id),
  FOREIGN KEY (id_cliente) REFERENCES cliente (id),
  FOREIGN KEY (id_animal) REFERENCES animal (id)
);





CREATE TABLE cliente_contacto (
  id INT NOT NULL AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  email VARCHAR(50) NOT NULL,
  numero_area INT NOT NULL DEFAULT 54,
  numero INT NOT NULL,
  direccion VARCHAR(40) NOT NULL,
  ciudad VARCHAR(40) NOT NULL,
  provincia VARCHAR(40) DEFAULT NULL,
  pais VARCHAR(40) NOT NULL,
  codigo_postal INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_cliente) REFERENCES cliente (id)
);

CREATE TABLE especialidades (
  id INT NOT NULL AUTO_INCREMENT,
  especialidad VARCHAR(40) DEFAULT NULL,
  descripcion VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE especialidades_trabajador (
  id INT NOT NULL AUTO_INCREMENT,
  id_trabajador INT NOT NULL,
  id_especialidad INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_trabajador) REFERENCES trabajadores (id),
  FOREIGN KEY (id_especialidad) REFERENCES especialidades (id)
);


CREATE TABLE historial_tratamientos (
  id INT NOT NULL AUTO_INCREMENT,
  id_tratamiento INT NOT NULL,
  id_animal INT NOT NULL,
  fecha DATE DEFAULT NULL,
  hora TIME DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_tratamiento) REFERENCES tratamiento (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY (id_animal) REFERENCES animal (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);


CREATE TABLE mercaderia (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  stock INT NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  precio DECIMAL(9,2) NOT NULL,
  provedor INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (provedor) REFERENCES provedor (id)
);

CREATE TABLE personal_tratamiento (
  id INT NOT NULL AUTO_INCREMENT,
  id_tratamiento INT NOT NULL,
  id_trabajador INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_tratamiento) REFERENCES tratamiento (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_trabajador) REFERENCES trabajadores (id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE provedor_contacto (
  id INT NOT NULL AUTO_INCREMENT,
  id_provedor INT NOT NULL,
  email VARCHAR(50) DEFAULT NULL,
  numero_area INT NOT NULL DEFAULT 54,
  numero INT DEFAULT NULL,
  direccion VARCHAR(40) NOT NULL,
  ciudad VARCHAR(40) NOT NULL,
  provincia VARCHAR(40) DEFAULT NULL,
  pais VARCHAR(40) NOT NULL,
  codigo_postal INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_provedor) REFERENCES provedor (id)
);

CREATE TABLE ticket (
  id INT NOT NULL AUTO_INCREMENT,
  cliente INT DEFAULT NULL,
  subtotal DECIMAL(9,2) DEFAULT NULL,
  iva DECIMAL(9,2) DEFAULT NULL,
  total DECIMAL(9,2) DEFAULT NULL,
  fecha TIMESTAMP NULL DEFAULT NULL,
  id_trabajador INT DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_trabajador) REFERENCES trabajadores (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (cliente) REFERENCES cliente (id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE ticket_mercaderia (
  id INT NOT NULL AUTO_INCREMENT,
  id_ticket INT NOT NULL,
  id_mercaderia INT NOT NULL,
  precio_unidad DECIMAL(9,2) NOT NULL,
  cantidad INT NOT NULL,
  precio_total DECIMAL(9,2) NOT NULL,
  iva DECIMAL(9,2) NOT NULL,
  id_trabajador INT NOT NULL,
  subtotal DECIMAL(9,2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_trabajador) REFERENCES trabajadores (id),
  FOREIGN KEY (id_mercaderia) REFERENCES mercaderia (id),
  FOREIGN KEY (id_ticket) REFERENCES ticket (id)
);


CREATE TABLE ticket_tratamiento (
  id INT NOT NULL AUTO_INCREMENT,
  id_ticket INT NOT NULL,
  id_tratamiento INT NOT NULL,
  precio_unidad DECIMAL(9,2) NOT NULL,
  id_trabajador INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_trabajador) REFERENCES trabajadores (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_tratamiento) REFERENCES tratamiento (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_ticket) REFERENCES ticket (id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE ticket_venta_temporal (
  id INT NOT NULL AUTO_INCREMENT,
  id_trabajador INT DEFAULT NULL,
  id_mercaderia INT DEFAULT NULL,
  cantidad INT DEFAULT 1,
  id_tratamiento INT DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_mercaderia) REFERENCES mercaderia (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_trabajador) REFERENCES trabajadores (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_tratamiento) REFERENCES tratamiento (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE trabajadores_contacto (
  id INT NOT NULL AUTO_INCREMENT,
  id_trabajador INT NOT NULL,
  email VARCHAR(50) NOT NULL,
  numero_area INT NOT NULL DEFAULT 54,
  numero INT NOT NULL,
  direccion VARCHAR(40) NOT NULL,
  ciudad VARCHAR(40) NOT NULL,
  provincia VARCHAR(40) DEFAULT NULL,
  pais VARCHAR(40) NOT NULL,
  codigo_postal INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_trabajador) REFERENCES trabajadores (id)
);

CREATE TABLE log_actualizacion_de_precios_mercaderia (
  id INT NOT NULL AUTO_INCREMENT,
  id_mercaderia INT DEFAULT NULL,
  precio_nuevo DECIMAL(7,2) NOT NULL,
  precio_viejo DECIMAL(7,2) NOT NULL,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE log_ticket_nuevo (
  id INT NOT NULL AUTO_INCREMENT,
  subtotal DECIMAL(9,2) DEFAULT NULL,
  iva DECIMAL(9,2) DEFAULT NULL,
  fecha DATE DEFAULT NULL,
  hora TIME DEFAULT NULL,
  total DECIMAL(9,2) DEFAULT NULL,
  id_ticket INT DEFAULT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE log_venta_mercaderia (
  id INT NOT NULL AUTO_INCREMENT,
  id_mercaderia INT NOT NULL,
  precio_unidad DECIMAL(9,2) NOT NULL,
  cantidad INT NOT NULL,
  precio_total DECIMAL(9,2) NOT NULL,
  iva DECIMAL(9,2) NOT NULL,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE log_venta_tratamiento (
  id INT NOT NULL AUTO_INCREMENT,
  id_tratamiento INT NOT NULL,
  precio DECIMAL(9,2) DEFAULT NULL,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE log_nuevos_mercaderia (
  id INT NOT NULL AUTO_INCREMENT,
  cantidad_ingresada INT DEFAULT NULL,
  precio DECIMAL(9,2) DEFAULT NULL,
  provedor VARCHAR(50) DEFAULT NULL,
  fecha DATE DEFAULT NULL,
  hora TIME DEFAULT NULL,
  id_mercaderia INT DEFAULT NULL,
  mercaderia VARCHAR(70) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE log_nuevos_animales (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) DEFAULT NULL,
  tipo VARCHAR(50) NOT NULL,
  edad_meses INT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE log_nuevos_clientes (
  id INT NOT NULL AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  nombre VARCHAR(70) DEFAULT NULL,
  PRIMARY KEY (id)
);



CREATE TABLE trabajadores_pago (
  id INT NOT NULL AUTO_INCREMENT,
  id_trabajador INT NOT NULL,
  sueldo DECIMAL(9,2) NOT NULL,
  hora_extra INT NOT NULL,
  pago_total DECIMAL(9,2) NOT NULL,
  fecha DATE DEFAULT NULL,
  PRIMARY KEY (id),
  KEY id_trabajador (id_trabajador),
  CONSTRAINT fk_trabajadores_pago FOREIGN KEY (id_trabajador) REFERENCES trabajadores (id)
);


-------------------------------- FUNCIONES ----------------------------


DELIMITER $$

CREATE FUNCTION edad_anos(meses INT) RETURNS DECIMAL(9,2)
    DETERMINISTIC
BEGIN
    DECLARE anos_totales DECIMAL(9,2);
    SET anos_totales = meses / 12.0;
    RETURN anos_totales;
END $$

CREATE FUNCTION horas_extras_pago(id_trabajador INT, horas_extras INT) RETURNS DECIMAL(9,2)
    DETERMINISTIC
BEGIN
    DECLARE pago_extra DECIMAL(9,2);
    DECLARE sueldo_x_hora DECIMAL(9,2);
    SET sueldo_x_hora = ((SELECT sueldo FROM trabajadores WHERE id = id_trabajador)/30)/8;
    SET pago_extra = ( (sueldo_x_hora * horas_extras) * 2);
    RETURN pago_extra;
END $$


CREATE FUNCTION iva(monto DECIMAL) RETURNS DECIMAL(9,2)
    DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(9,2);
    DECLARE iva DECIMAL(9,2);
    SET iva = 0.21;
    SELECT monto * iva INTO TOTAL;
    RETURN total;
END $$

CREATE FUNCTION precio_total(subtotal DECIMAL(9,2)) RETURNS DECIMAL(9,2)
    DETERMINISTIC
BEGIN
    DECLARE iva DECIMAL(9,2);
    DECLARE total DECIMAL(9,2);
    SET iva = iva(subtotal);
    SET total = subtotal + iva;
    RETURN total;
END $$

DELIMITER ;




--------------------------- VISTAS ---------------------------------

CREATE VIEW view_animales_cliente AS
SELECT 
    c.nombre AS nombre,
    COUNT(m.id_animal) AS cantidad_mascotas
FROM
    cliente c
    JOIN mascotas m ON c.id = m.id_cliente
    JOIN animal a ON a.id = m.id_animal
GROUP BY c.nombre;


CREATE VIEW view_mercaderia AS
SELECT 
    m.nombre AS producto,
    SUM(m.stock) AS stock_total,
    SUM((m.precio * m.stock)) AS precio_total
FROM
    mercaderia m
GROUP BY m.nombre;

CREATE VIEW view_productos_vendidos AS
SELECT 
    m.id AS id_producto,
    m.nombre AS nombre,
    SUM(tm.cantidad) AS veces_vendido
FROM
    ticket_mercaderia tm
    JOIN mercaderia m ON tm.id_mercaderia = m.id
GROUP BY m.id, tm.id_mercaderia;


CREATE VIEW view_tickets_tratamiento AS
SELECT 
    tt.id_tratamiento AS id_tratamiento,
    t.cliente AS id_cliente,
    c.nombre AS nombre,
    COUNT(t.id) AS veces_usado_el_tratamiento,
    SUM(t.total) AS total
FROM
    ticket t
    JOIN ticket_tratamiento tt ON t.id = tt.id_ticket
    JOIN cliente c ON c.id = t.cliente
GROUP BY tt.id_tratamiento, t.cliente;


CREATE VIEW view_total_cliente AS
SELECT 
    c.id AS id_cliente,
    c.nombre AS nombre,
    SUM(t.total) AS precio_total
FROM
    cliente c
    JOIN ticket t ON c.id = t.cliente
GROUP BY c.id;


CREATE VIEW view_tratamiento_mascota AS
SELECT 
    a.nombre AS nombre,
    t.tipo AS tipo,
    a.descripcion AS descripcion
FROM
    animal a
    JOIN tratamiento t ON a.id = t.id_animal;

CREATE VIEW vw_animal_edades AS
SELECT 
    animal.nombre AS nombre,
    animal.tipo AS tipo,
    EDAD_ANOS(animal.edad_meses) AS años
FROM
    animal;


---------------------TRIGGERS-----------------------


CREATE TRIGGER log_ingreso_animal AFTER INSERT ON animal
FOR EACH ROW
INSERT INTO log_nuevos_animales(nombre, tipo, edad_meses)
VALUES (NEW.nombre, NEW.tipo, NEW.edad_meses);



CREATE TRIGGER log_ingreso_cliente AFTER INSERT ON cliente
FOR EACH ROW
    INSERT INTO log_nuevos_clientes(id_cliente, nombre, fecha, hora)
    VALUES (NEW.id, NEW.nombre, CURRENT_DATE(), CURRENT_TIME());


CREATE TRIGGER log_nuevos_mercaderia AFTER INSERT ON mercaderia
FOR EACH ROW
INSERT INTO log_nuevos_mercaderia(id, id_mercaderia, mercaderia, cantidad_ingresada, precio, provedor, fecha, hora)
VALUES (NULL, NEW.id, NEW.nombre, NEW.stock, NEW.precio, NEW.provedor, CURRENT_DATE(), CURRENT_TIME());

DELIMITER $$
CREATE TRIGGER log_actualizacion_precio BEFORE UPDATE ON mercaderia
FOR EACH ROW
BEGIN
    IF NEW.precio <> OLD.precio THEN
        INSERT INTO log_actualizacion_de_precios_mercaderia (id_mercaderia, precio_nuevo, precio_viejo, fecha, hora)
        VALUES (NEW.id, NEW.precio, OLD.precio, CURRENT_DATE(), CURRENT_TIME());
    END IF;
END;
$$
DELIMITER ;

CREATE TRIGGER log_ticket_nuevo AFTER UPDATE ON ticket
FOR EACH ROW
INSERT INTO log_ticket_nuevo(id, subtotal, iva, fecha, hora, total, id_ticket)
VALUES (NULL, NEW.subtotal, NEW.iva, CURRENT_DATE(), CURRENT_TIME(), NEW.total, NEW.id);


CREATE TRIGGER log_ticket_mercaderia AFTER INSERT ON ticket_mercaderia
FOR EACH ROW
INSERT INTO log_venta_mercaderia(id_mercaderia, precio_unidad, cantidad, precio_total, iva, fecha, hora)
VALUES (NEW.id_mercaderia, NEW.precio_unidad, NEW.cantidad, NEW.precio_total, NEW.iva, CURRENT_DATE(), CURRENT_TIME());

CREATE TRIGGER log_ticket_tratamiento AFTER INSERT ON ticket_tratamiento
FOR EACH ROW
INSERT INTO log_venta_tratamiento(id_tratamiento, precio, fecha, hora)
VALUES (NEW.id_tratamiento, NEW.precio_unidad, CURRENT_DATE(), CURRENT_TIME());


CREATE TRIGGER log_historial_tratamiento AFTER INSERT ON tratamiento
FOR EACH ROW
INSERT INTO historial_tratamientos(id_tratamiento, id_animal, fecha, hora)
VALUES (NEW.id, NEW.id_animal, CURRENT_DATE(), CURRENT_TIME());





------------------STORE PROCEDURE ------------------------

DELIMITER // 
CREATE PROCEDURE agregar_animal(IN nombre CHAR(20), IN tipo CHAR(20), IN raza CHAR(20), IN estado CHAR(20), IN descripcion CHAR(100), IN edad_meses INT, IN malestar CHAR(200))
BEGIN
    IF nombre = '' THEN
        SET nombre = NULL;
    END IF;
    IF raza = '' THEN
        SET raza = NULL;
    END IF;
    IF malestar = '' THEN
        SET malestar = NULL;
    END IF;

    INSERT INTO animal(nombre, tipo, raza, estado, descripcion, edad_meses, malestar)
    VALUES(nombre, tipo, raza, estado, descripcion, edad_meses, malestar);
    SELECT * FROM animal;
END //

CREATE PROCEDURE quitar_animal(IN id_animal INT)
BEGIN
    DELETE FROM animal WHERE id = id_animal; 
END //


CREATE PROCEDURE sp_paga_trabajadores(IN in_id_trabajador INT, IN in_horas_extras INT)
BEGIN
    DECLARE var_sueldo DECIMAL(9,2);
    SELECT sueldo FROM trabajadores WHERE id = in_id_trabajador INTO @var_sueldo;

    IF in_id_trabajador <= 0 OR in_horas_extras < 0 THEN
        SIGNAL SQLSTATE "42000"
        SET MESSAGE_TEXT = "todos los campos son requeridos";
    ELSE
        INSERT INTO trabajadores_pago
        VALUES(NULL, in_id_trabajador,@var_sueldo, in_horas_extras, horas_extras_pago(in_id_trabajador, in_horas_extras) + var_sueldo, CURRENT_DATE());
    END IF;
END //


CREATE PROCEDURE sp_venta_temporal_ticket_mercederia(IN in_id_trabajador INT, IN in_id_mercaderia INT, IN in_cantidad INT)
BEGIN
    DECLARE m_stock INT;

    SELECT stock INTO m_stock
    FROM mercaderia
    WHERE in_id_mercaderia = id;

    IF in_id_trabajador <= 0 OR in_id_mercaderia <= 0 OR in_cantidad <= 0 THEN
        SIGNAL SQLSTATE "42000"
        SET MESSAGE_TEXT = "todos los campos son requeridos";
    ELSEIF in_cantidad > m_stock THEN
        SIGNAL SQLSTATE "42000"
        SET MESSAGE_TEXT = "la cantidad deseada supera a la disponible";
    ELSE
        UPDATE mercaderia
        SET stock = stock - in_cantidad
        WHERE id = in_id_mercaderia;

        INSERT INTO ticket_venta_temporal (id_trabajador, id_mercaderia, cantidad)
        VALUES (in_id_trabajador, in_id_mercaderia, in_cantidad);
    END IF;
END //

CREATE PROCEDURE sp_venta_temporal_ticket_tratamiento(IN in_id_trabajador INT, IN in_id_tratamiento INT)
BEGIN
    IF in_id_trabajador <= 0 OR in_id_tratamiento <= 0 THEN
        SIGNAL SQLSTATE "42000"
        SET MESSAGE_TEXT = "todos los campos son requeridos";
    ELSE
        INSERT INTO ticket_venta_temporal (id_trabajador, id_tratamiento)
        VALUES (in_id_trabajador, in_id_tratamiento);
    END IF;
END //


CREATE PROCEDURE sp_venta_ticket(IN in_id_cliente INT, IN in_id_trabajador INT)
BEGIN
    DECLARE id_factura INT;
    DECLARE subtotal, iva, total DECIMAL(9,2);
    DECLARE precio_total_variable DECIMAL(10,2);
    DECLARE precio_total_variable2 DECIMAL(10,2);
    
    IF in_id_trabajador <= 0 OR in_id_cliente <= 0 THEN
        SIGNAL SQLSTATE "42000"
        SET MESSAGE_TEXT = "todos los campos son requeridos";
    ELSE
        INSERT INTO ticket
        VALUES (NULL, in_id_cliente, NULL, NULL, NULL, CURRENT_TIMESTAMP(), in_id_trabajador);
        
        SET @id_factura = LAST_INSERT_ID();
        
        INSERT INTO ticket_mercaderia (id_ticket, id_mercaderia, precio_unidad, cantidad, precio_total, iva, id_trabajador, subtotal)
        SELECT @id_factura, vt.id_mercaderia, m.precio, vt.cantidad, precio_total(vt.cantidad * m.precio), iva(vt.cantidad * m.precio), in_id_trabajador, vt.cantidad * m.precio
        FROM ticket_venta_temporal AS vt
        JOIN mercaderia AS m ON vt.id_mercaderia = m.id
        WHERE vt.id_trabajador = in_id_trabajador;
        
        INSERT INTO ticket_tratamiento (id_ticket, id_tratamiento, precio_unidad, id_trabajador)
        SELECT @id_factura, vt.id_tratamiento, t.costo, in_id_trabajador
        FROM ticket_venta_temporal AS vt
        JOIN tratamiento AS t ON vt.id_tratamiento = t.id
        WHERE vt.id_trabajador = in_id_trabajador;
        
        DELETE FROM ticket_venta_temporal WHERE id_trabajador = in_id_trabajador;
        
        CALL suma_totales_tablas('ticket_mercaderia', 'subtotal', @id_factura);
        SET precio_total_variable = @precio_total;
        IF precio_total_variable IS NULL THEN 
            SET precio_total_variable = 0;
        END IF;
        
        CALL suma_totales_tablas('ticket_tratamiento', 'precio_unidad', @id_factura);
        SET precio_total_variable2 = @precio_total;
        IF precio_total_variable2 IS NULL THEN 
            SET precio_total_variable2 = 0;
        END IF;
        
        SELECT (precio_total_variable + precio_total_variable2) INTO @subtotal;
        UPDATE ticket SET subtotal = @subtotal, iva = iva(@subtotal), total = precio_total(@subtotal) WHERE id = @id_factura;
    END IF;
END //


CREATE PROCEDURE st_paga_trabajadores(IN in_id_trabajador INT, IN in_horas_extras INT)
BEGIN
    DECLARE var_sueldo DECIMAL(9,2);
    SELECT sueldo FROM trabajadores WHERE id = in_id_trabajador INTO @var_sueldo;

    IF in_id_trabajador <= 0 OR in_horas_extras < 0 THEN
        SIGNAL SQLSTATE "42000"
        SET MESSAGE_TEXT = "todos los campos son requeridos";
    ELSE
        INSERT INTO trabajadores_pago
        VALUES (NULL, in_id_trabajador, @var_sueldo, in_horas_extras, horas_extras_pago(in_id_trabajador, in_horas_extras) + @var_sueldo, CURRENT_DATE());
    END IF;
END //


CREATE PROCEDURE suma_totales_tablas(tabla VARCHAR(30), columna VARCHAR(30), id_ticket_activo INT)
BEGIN

    IF tabla = '' OR columna = '' OR id_ticket_activo <= 0 THEN
        SIGNAL SQLSTATE '42000'
        SET MESSAGE_TEXT = 'todos los campos son requeridos';
    ELSE
        SET @sql = CONCAT('SELECT SUM(', columna, ') INTO @precio_total FROM ', tabla, ' WHERE id_ticket = ', id_ticket_activo);
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
        SELECT COALESCE(@precio_total, 0) AS precio_total;
    END IF;
END //


DELIMITER ;






---------VALORES ------------- (para demostrar que si se poner valores)

INSERT INTO animal
VALUES
    (1, 'vigotes', 'gato', 'egipcio', 'ok', 'buenardo', 2, 'lele pancha'),
    (2, 'copito', 'gato', NULL, 'ok', 'buenardo', 3, 'dolor de panza'),
    (3, 'bicho', 'gato', 'siames', 'enfermo', 'lindo gato', 22, 'dolor en la pata'),
    (4, 'pichu', 'perro', 'caniche', 'ok', 'es muy activo', 23, 'revision normal'),
    (5, 'lionel', 'loro', NULL, 'basado', 'verde brilante', 10, 'no para de hablar'),
    (6, 'tobi', 'perro', 'bulldog', 'dolor de panza', 'chiquito de color marron', 23, 'esta gordo'),
    (7, 'july', 'gato', NULL, 'vomitos', 'blanca con manchas negras', 32, 'indigestion'),
    (8, 'macaron', 'lagarto', NULL, 'sin apetito', 'verde-amarillento', 5, 'decaido'),
    (9, 'lucifer', 'gato', NULL, 'pata derecha lastimada', 'negro puro', 23, 'con dolor para caminar'),
    (10, 'fiumba', 'gato', 'lampiño', 'ok', 'gato barato', 44, 'come toda la comida'),
    (25, 'ciro', 'perro', 'galgo', 'lastimado', 'color marron', 12, 'herida cerca del ojo'),
    (26, 'coscu', 'loro', '', 'ok', 'loro verde marron', 17, 'muy hablador');


INSERT INTO cliente
VALUES
    (1, 'carlos', 'estrada', 'dni', 229018381),
    (2, 'jorge', 'vila', 'dni', 229018441),
    (3, 'maria', 'mamani', 'dni', 229018312),
    (4, 'Eliana Kramer', 'Leblanc', 'DNI', 64797408),
    (5, 'Graham Carney', 'Morrison', 'DNI', 49410967),
    (6, 'Jane Sparks', 'Sawyer', 'DNI', 76653954),
    (7, 'Chelsea Reyes', 'Ruiz', 'DNI', 21978572),
    (8, 'Stephanie Dillard', 'Byers', 'DNI', 20862220),
    (9, 'Mechelle Hammond', 'Bishop', 'DNI', 65368725),
    (10, 'Christian Herring', 'Roberts', 'DNI', 66193845),
    (11, 'Beatrice Stevens', 'Ortiz', 'DNI', 16844883),
    (12, 'Larissa Riggs', 'Solis', 'DNI', 91541684),
    (13, 'Autumn Holt', 'Richmond', 'DNI', 75682886),
    (15, 'Pepe', 'Argento', 'DNI', 12345678);

INSERT INTO provedor
VALUES
    (1, 'gato barato', 'comida para gato, gato barato dura un buen rato', '2023-01-22'),
    (4, 'Emery Hobbs', 'risus. Nulla eget metus eu erat semper rutrum. Fusce dolor', '2022-03-08'),
    (6, 'Harding Roth', 'tempor erat neque non quam. Pellentesque habitant morbi tristique senectus', '2022-02-19'),
    (8, 'Oleg Cohen', 'taciti sociosqu ad litora torquent per conubia nostra, per inceptos', '2024-12-24'),
    (9, 'Clementine Mills', 'rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed,', '2023-12-12');

INSERT INTO trabajadores
VALUES
    (1, 'ari', 'peres', 'lunes y jueves', 35000.00),
    (2, 'Kellie Pruitt', 'Hooper', 'martes y miercoles', 33000.00),
    (3, 'Uma Glass', 'Pearson', 'martes y miercoles', 36000.00),
    (4, 'Dexter Weaver', 'Higgins', 'viernes y sabados', 40000.00),
    (5, 'William Rivera', 'Barr', 'martes y miercoles', 30000.00),
    (6, 'Blake Mckinney', 'Phelps', 'martes y miercoles', 32000.00),
    (7, 'Evangeline Dean', 'Gibbs', 'martes y miercoles', 34000.00),
    (8, 'Katelyn Pitts', 'Hull', 'martes y miercoles', 34000.00),
    (9, 'Fatima Daniel', 'Chen', 'viernes y sabados', 31000.00),
    (10, 'Kelly Glass', 'Mays', 'martes y miercoles', 29000.00),
    (11, 'Cooper Pace', 'Santana', 'viernes y sabados', 35500.00);



INSERT INTO tratamiento
VALUES
    (6, 'tramiento a base de pastillas', 'pastillaz de inflavet para el dolor', 700.00, 2, 7),
    (7, 'enyesamiento', 'se pondra un lleso en la para lastimada', 1000.00, 3, 9),
    (9, 'control de conducta', 'conducta anormal en el animal, seguimiento', 2500.00, 5, 5),
    (10, 'control', 'Control rutinario', 1000.00, 6, 26),
    (11, 'Parasitos', 'Desparatizacion del animal', 1200.00, 11, 3);



INSERT INTO citas
VALUES
    (1, 3, 3, '2023-08-20 23:19:11', 'ninguna', 'pendiente'),
    (2, 2, 1, '2023-08-20 12:00:00', 'urgente', 'pendiente'),
    (3, 2, 6, '2023-08-24 15:00:00', 'rutina', 'cancelada'),
    (4, 6, 9, '2023-08-18 19:00:00', 'lleva bozal', 'terminado');






INSERT INTO cliente_contacto
VALUES
    (1, 1, 'cliente1@email.com', 54, 45617890, 'Calle A 1', 'CABA', NULL, 'Argentina', 1234),
    (2, 2, 'cliente2@email.com', 54, 98762543, 'Calle B 2', 'CABA', NULL, 'Argentina', 1235),
    (3, 3, 'cliente3@email.com', 54, 55544344, 'Calle C 3', 'CABA', NULL, 'Argentina', 1237),
    (4, 4, 'cliente4@email.com', 54, 22211141, 'Calle D 4', 'CABA', NULL, 'Argentina', 1523),
    (5, 5, 'cliente5@email.com', 54, 88899995, 'Calle E 5', 'CABA', NULL, 'Argentina', 5555),
    (6, 6, 'cliente6@email.com', 54, 33322226, 'Calle F 6', 'CABA', NULL, 'Argentina', 2342),
    (7, 7, 'cliente7@email.com', 54, 44455557, 'Calle G 7', 'CABA', NULL, 'Argentina', 3456),
    (8, 8, 'cliente8@email.com', 54, 77766866, 'Calle H 8', 'CABA', NULL, 'Argentina', 4567),
    (9, 9, 'cliente9@email.com', 54, 11122292, 'Calle I 9', 'CABA', NULL, 'Argentina', 5678),
    (10, 10, 'cliente10@email.com', 54, 99988188, 'Calle J 10', 'CABA', NULL, 'Argentina', 6789),
    (11, 11, 'cliente11@email.com', 54, 33344424, 'Calle K 11', 'CABA', NULL, 'Argentina', 7890),
    (12, 12, 'cliente12@email.com', 54, 66655553, 'Calle L 12', 'CABA', NULL, 'Argentina', 8901),
    (13, 13, 'cliente13@email.com', 54, 44433334, 'Calle M 13', 'CABA', NULL, 'Argentina', 9012),
    (14, 15, 'cliente14@email.com', 54, 11223344, 'Calle O 14', 'CABA', NULL, 'Argentina', 1406);




INSERT INTO especialidades
VALUES
    (1, 'cardiologia', 'experto en el uso de aparatos cardiovasculares'),
    (2, 'etologia', 'estudio de comportamineto animal'),
    (3, 'ortopedia', 'especialidad médica que involucra el tratamiento del sistema musculoesquelético'),
    (4, 'estetica canina', 'mensajes relajantes, baños personalizados y arreglo en general'),
    (5, 'cardioterapeuta', 'especialista en problemas de corazon'),
    (6, 'oftamologia', 'especialista en el cuidado de los ojos'),
    (7, 'dermatologia', 'especialista en el cuidado de la piel'),
    (8, 'cirujano', 'cirujano general de animales'),
    (9, 'medice general', 'atiende consultas en general sobre los animales');


INSERT INTO especialidades_trabajador
VALUES
    (1, 1, 1),
    (2, 4, 2),
    (3, 5, 7),
    (4, 5, 3),
    (5, 5, 3),
    (6, 10, 8),
    (7, 2, 3),
    (8, 8, 9),
    (9, 1, 2),
    (10, 10, 1),
    (11, 4, 2),
    (12, 7, 3),
    (13, 2, 2),
    (14, 1, 6),
    (15, 1, 3),
    (16, 7, 4);



INSERT INTO historial_tratamientos
VALUES
    (2, 6, 7, '2023-06-04', '04:18:08'),
    (3, 7, 9, '2023-06-12', '19:57:11'),
    (8, 10, 26, '2023-08-25', '17:46:03'),
    (9, 11, 3, '2023-08-25', '19:10:11');

INSERT INTO mascotas
VALUES
    (1, 2, 1),
    (2, 3, 3),
    (3, 2, 6),
    (4, 6, 9),
    (5, 1, 7),
    (6, 5, 7);


INSERT INTO mercaderia
VALUES
    (5, 'Donec', 8, 'scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis', 400.00, 1),
    (11, 'molestie', 8, 'velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod', 139.45, 1),
    (12, 'diam', 5, 'aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt,', 18.44, 1),
    (14, 'orci', 10, 'metus urna convallis erat, eget tincidunt dui augue eu tellus.', 952.21, 4),
    (16, 'purus.', 6, 'Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas', 746.41, 4),
    (17, 'tortor,', 3, 'Sed congue, elit sed consequat auctor, nunc nulla vulputate dui,', 541.06, 4),
    (18, 'sem', 2, 'fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh', 682.15, 1),
    (19, 'interdum.', 1, 'dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc', 178.52, 4),
    (20, 'magnis', 4, 'magnis pelotas', 260.00, 4),
    (21, 'Galletitas Kitty', 15, 'galletas para gatos', 300.00, 6),
    (22, 'Huesito Joy', 6, 'huesito de plastico para perro', 320.00, 8);


INSERT INTO personal_tratamiento
VALUES
    (2, 6, 4),
    (3, 7, 5),
    (5, 9, 8),
    (6, 7, 10),
    (7, 11, 2);


INSERT INTO provedor_contacto
VALUES
    (1, 1, 'correo1@ejemplo.com', 54, 12345671, 'calle falsa 1', 'CABA', NULL, 'Argentina', 1007),
    (2, 4, 'correo2@ejemplo.com', 54, 12345672, 'calle falsa 2', 'CABA', NULL, 'Argentina', 1007),
    (3, 6, 'correo3@ejemplo.com', 54, 12345673, 'calle falsa 3', 'CABA', NULL, 'Argentina', 1007),
    (4, 8, 'correo4@ejemplo.com', 54, 12345674, 'calle falsa 4', 'CABA', NULL, 'Argentina', 1007),
    (5, 9, 'correo5@ejemplo.com', 54, 12345675, 'calle falsa 5', 'CABA', NULL, 'Argentina', 1007);


INSERT INTO ticket
VALUES
    (123316, 1, 400.00, 84.00, 484.00, '2023-08-15 23:19:11', 1),
    (123317, 1, 541.06, 113.61, 654.67, '2023-08-16 00:19:43', 1),
    (123318, 1, 2500.00, 525.00, 3025.00, '2023-08-16 00:20:46', 2),
    (123319, 1, 1241.06, 260.61, 1501.67, '2023-08-16 00:39:34', 1),
    (123320, 2, 400.00, 84.00, 484.00, '2023-08-16 02:25:35', 1),
    (123321, 1, 1492.82, 313.53, 1806.35, '2023-08-16 02:44:05', 1),
    (123322, 1, 0.00, 0.00, 0.00, '2023-08-16 02:44:55', 1),
    (123323, 7, 700.00, 147.00, 847.00, '2023-08-16 02:48:17', 1),
    (123324, 7, 700.00, 147.00, 847.00, '2023-08-16 03:28:24', 2),
    (123325, 7, 1082.12, 227.22, 1309.34, '2023-08-16 21:59:53', 4),
    (123326, 11, 1520.00, 319.20, 1839.20, '2023-08-21 01:55:48', 7),
    (123327, 15, 1280.00, 268.80, 1548.80, '2023-08-21 01:58:26', 8),
    (123328, 8, 682.15, 143.22, 825.37, '2023-08-21 02:02:51', 8),
    (123331, 8, 0.00, 0.00, 0.00, '2023-08-21 02:52:09', 11),
    (123332, 1, 2500.00, 525.00, 3025.00, '2023-08-21 02:52:47', 5),
    (123333, 1, 400.00, 84.00, 484.00, '2023-08-25 21:08:23', 1),
    (123334, 1, 1000.00, 210.00, 1210.00, '2023-08-26 01:31:29', 7),
    (123335, 1, 400.00, 84.00, 484.00, '2023-08-28 04:31:28', 1);


INSERT INTO ticket_mercaderia
VALUES
    (110, 123316, 5, 400.00, 1, 484.00, 84.00, 1, 400.00),
    (111, 123317, 17, 541.06, 1, 654.67, 113.61, 1, 541.06),
    (112, 123319, 17, 541.06, 1, 654.67, 113.61, 1, 541.06),
    (113, 123320, 5, 400.00, 1, 484.00, 84.00, 1, 400.00),
    (114, 123321, 16, 746.41, 2, 1806.35, 313.53, 1, 1492.82),
    (115, 123325, 17, 541.06, 2, 1309.34, 227.22, 4, 1082.12),
    (116, 123326, 20, 260.00, 2, 629.20, 109.20, 7, 520.00),
    (117, 123327, 22, 320.00, 4, 1548.80, 268.80, 8, 1280.00),
    (118, 123328, 18, 682.15, 1, 825.37, 143.22, 8, 682.15),
    (119, 123333, 5, 400.00, 1, 484.00, 84.00, 1, 400.00),
    (120, 123335, 5, 400.00, 1, 484.00, 84.00, 1, 400.00);


INSERT INTO ticket_tratamiento
VALUES
    (63, 123318, 9, 2500.00, 2),
    (64, 123319, 6, 700.00, 1),
    (65, 123323, 6, 700.00, 1),
    (66, 123324, 6, 700.00, 2),
    (67, 123326, 7, 1000.00, 7),
    (68, 123332, 9, 2500.00, 5),
    (69, 123334, 7, 1000.00, 7);




INSERT INTO trabajadores_contacto
VALUES
    (1, 1, 'trabajador1@email.com', 54, 12345678, 'Calle A 123', 'CABA', NULL, 'Argentina', 1234),
    (2, 2, 'trabajador2@email.com', 54, 98765432, 'Calle B 456', 'CABA', NULL, 'Argentina', 2345),
    (3, 3, 'trabajador3@email.com', 54, 55544443, 'Calle C 789', 'CABA', NULL, 'Argentina', 3456),
    (4, 4, 'trabajador4@email.com', 54, 22211112, 'Calle D 012', 'CABA', NULL, 'Argentina', 4567),
    (5, 5, 'trabajador5@email.com', 54, 88899991, 'Calle E 345', 'CABA', NULL, 'Argentina', 5678),
    (6, 6, 'trabajador6@email.com', 54, 33322224, 'Calle F 678', 'CABA', NULL, 'Argentina', 6789),
    (7, 7, 'trabajador7@email.com', 54, 44455553, 'Calle G 901', 'CABA', NULL, 'Argentina', 7890),
    (8, 8, 'trabajador8@email.com', 54, 77766662, 'Calle H 234', 'CABA', NULL, 'Argentina', 8901),
    (9, 9, 'trabajador9@email.com', 54, 11122221, 'Calle I 567', 'CABA', NULL, 'Argentina', 9012),
    (10, 10, 'trabajador10@email.com', 54, 99988883, 'Calle J 890', 'CABA', NULL, 'Argentina', 123),
    (11, 11, 'trabajador12@email.com', 54, 33344449, 'Calle K 123', 'CABA', NULL, 'Argentina', 1234);


INSERT INTO trabajadores_pago
VALUES
    (1, 1, 35000.00, 1, 291.66, '2023-07-18'),
    (2, 1, 35000.00, 1, 35291.66, '2023-07-18'),
    (3, 3, 36000.00, 4, 37200.00, '2023-08-15'),
    (4, 4, 40000.00, 2, 40666.68, '2023-08-15'),
    (5, 5, 30000.00, 0, 30000.00, '2023-08-15'),
    (6, 6, 32000.00, 5, 33333.30, '2023-08-15'),
    (7, 7, 34000.00, 1, 34283.34, '2023-08-15'),
    (8, 8, 34000.00, 2, 34566.68, '2023-08-15'),
    (9, 9, 31000.00, 1, 31258.34, '2023-08-15'),
    (10, 10, 29000.00, 3, 29724.98, '2023-08-15'),
    (11, 11, 35500.00, 1, 35795.84, '2023-08-15'),
    (12, 5, 30000.00, 2, 30500.00, '2023-08-28');


