
CREATE DATABASE primera_entrega


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
  N_documento VARCHAR(30) NOT NULL,
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



CREATE TRIGGER log_actualizacion_precio BEFORE UPDATE ON mercaderia
FOR EACH ROW
IF NEW.precio <> OLD.precio THEN
    INSERT INTO log_actualizacion_de_precios_mercaderia (id_mercaderia, precio_nuevo, precio_viejo, fecha, hora)
    VALUES (NEW.id, NEW.precio, OLD.precio, CURRENT_DATE(), CURRENT_TIME());
END IF;


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

