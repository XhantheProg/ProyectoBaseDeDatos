DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa CHARACTER SET utf8mb4;
USE empresa;

CREATE TABLE departamento (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    presupuesto DOUBLE UNSIGNED NOT NULL,
    gastos DOUBLE UNSIGNED NOT NULL
);

CREATE TABLE empleado (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(9) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100),
    id_departamento INT UNSIGNED,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

CREATE TABLE proyecto (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    id_departamento INT UNSIGNED,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

CREATE TABLE tarea (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    id_proyecto INT UNSIGNED,
    FOREIGN KEY (id_proyecto) REFERENCES proyecto(id)
);

CREATE TABLE asignacion_tarea (
    id_empleado INT UNSIGNED,
    id_tarea INT UNSIGNED,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id),
    FOREIGN KEY (id_tarea) REFERENCES tarea(id),
    PRIMARY KEY (id_empleado, id_tarea)
);

CREATE TABLE cliente (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    id_departamento INT UNSIGNED,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

-- Inserción de datos de ejemplo
INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);

INSERT INTO proyecto VALUES(1, 'Proyecto A', 'Descripción del Proyecto A', 1);
INSERT INTO proyecto VALUES(2, 'Proyecto B', 'Descripción del Proyecto B', 2);
INSERT INTO proyecto VALUES(3, 'Proyecto C', 'Descripción del Proyecto C', 3);
INSERT INTO proyecto VALUES(4, 'Proyecto D', 'Descripción del Proyecto D', 4);
INSERT INTO proyecto VALUES(5, 'Proyecto E', 'Descripción del Proyecto E', 5);
INSERT INTO proyecto VALUES(6, 'Proyecto F', 'Descripción del Proyecto F', 6);

INSERT INTO tarea VALUES(1, 'Tarea 1', 'Descripción de la Tarea 1', 1);
INSERT INTO tarea VALUES(2, 'Tarea 2', 'Descripción de la Tarea 2', 2);
INSERT INTO tarea VALUES(3, 'Tarea 3', 'Descripción de la Tarea 3', 3);
INSERT INTO tarea VALUES(4, 'Tarea 4', 'Descripción de la Tarea 4', 4);
INSERT INTO tarea VALUES(5, 'Tarea 5', 'Descripción de la Tarea 5', 5);
INSERT INTO tarea VALUES(6, 'Tarea 6', 'Descripción de la Tarea 6', 6);

INSERT INTO asignacion_tarea VALUES(1, 1);
INSERT INTO asignacion_tarea VALUES(2, 2);
INSERT INTO asignacion_tarea VALUES(3, 3);
INSERT INTO asignacion_tarea VALUES(4, 4);
INSERT INTO asignacion_tarea VALUES(5, 5);
INSERT INTO asignacion_tarea VALUES(6, 6);


INSERT INTO cliente VALUES(1, 'Cliente A', 'Dirección Cliente A', 1);
INSERT INTO cliente VALUES(2, 'Cliente B', 'Dirección Cliente B', 2);
INSERT INTO cliente VALUES(3, 'Cliente C', 'Dirección Cliente C', 3);
INSERT INTO cliente VALUES(4, 'Cliente D', 'Dirección Cliente D', 4);
INSERT INTO cliente VALUES(5, 'Cliente E', 'Dirección Cliente E', 5);
INSERT INTO cliente VALUES(6, 'Cliente F', 'Dirección Cliente F', 6);
