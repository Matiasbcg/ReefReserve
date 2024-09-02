DROP TABLE Reporte;
DROP TABLE Reserva;
DROP TABLE Trabajador_Hotel;
DROP TABLE Pago;
DROP TABLE Usuario_Administrador;
DROP TABLE Cliente;
DROP TABLE Habitacion;

-- Creacion de tablas
CREATE TABLE Cliente (
    Id_Cliente NUMBER PRIMARY KEY,
    P_Nombre VARCHAR2(50),
    S_Nombre VARCHAR2(50),
    P_Apellido VARCHAR2(50),
    M_Apellido VARCHAR2(50),
    Correo_Electronico VARCHAR2(100) UNIQUE,
    Telefono VARCHAR2(20),
    Nacionalidad VARCHAR2(50),
    Idioma_Preferencial VARCHAR2(50)
);

CREATE TABLE Pago (
    Id_Pago NUMBER PRIMARY KEY,
    Monto NUMBER(10),
    Fecha_Pago DATE,
    Metodo_Pago VARCHAR2(50)
);

CREATE TABLE Reserva (
    Id_Reserva NUMBER PRIMARY KEY,
    Fecha_Inicio DATE,
    Fecha_Fin DATE,
    Estado_Reserva VARCHAR2(20),
    Monto_Total NUMBER(10),
    Pago_Anticipado NUMBER(10, 2),
    Ticket_Reserva VARCHAR2(50),
    Id_Cliente NUMBER,
    CONSTRAINT FK_Reserva_Cliente FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente)
);

CREATE TABLE Habitacion (
    Id_Habitacion NUMBER PRIMARY KEY,
    Numero VARCHAR2(10),
    Categoria VARCHAR2(50),
    Precio_Diario NUMBER(10),
    Capacidad NUMBER,
    Descripcion VARCHAR2(255),
    Equipamiento VARCHAR2(255),
    Piso NUMBER,
    Estado VARCHAR2(20),
    Tamano NUMBER,
    Tipo_Cama VARCHAR2(50),
    Vista VARCHAR2(50),
    Accesibilidad VARCHAR2(20),
    Foto VARCHAR2(255),
    Servicios_Adicionales VARCHAR2(255),
    Fecha_Ultima_Limpieza DATE,
    Numeros_Camas NUMBER,
    Balcon VARCHAR2(5),
    Caja_Fuerte VARCHAR2(5),
    Mini_Bar VARCHAR2(5),
    Aire_Acondicionado VARCHAR2(5),
    Wifi VARCHAR2(5),
    Tv VARCHAR2(5),
    Numeros_Banos NUMBER,
    Nota VARCHAR2(255)
);

CREATE TABLE Trabajador_Hotel (
    Id_Trabajador NUMBER PRIMARY KEY,
    P_Nombre_Trabajador VARCHAR2(50),
    S_Nombre_Trabajador VARCHAR2(50),
    P_Apellido_Trabajador VARCHAR2(50),
    M_Apellido_Trabajador VARCHAR2(50),
    Correo_Electronico_Trabajador VARCHAR2(100) UNIQUE,
    Rol VARCHAR2(50),
    Estado VARCHAR2(20)
);

CREATE TABLE Usuario_Administrador (
    Id_Admin NUMBER PRIMARY KEY,
    P_Nombre_Admin VARCHAR2(50),
    S_Nombre_Admin VARCHAR2(50),
    P_Apellido_Admin VARCHAR2(50),
    Correo_Electronico_Admin VARCHAR2(100) UNIQUE,
    Contrasena_Admin VARCHAR2(100)
);

CREATE TABLE Reporte (
    Id_Reporte NUMBER PRIMARY KEY,
    Tipo_Reporte VARCHAR2(50),
    Fecha_Generacion DATE,
    Detalle_Reporte VARCHAR2(255),
    Id_Reserva NUMBER,
    CONSTRAINT FK_Reporte_Reserva FOREIGN KEY (Id_Reserva) REFERENCES Reserva(Id_Reserva)
);

ALTER TABLE Reserva
ADD CONSTRAINT FK_Reserva_Habitacion FOREIGN KEY (Id_Reserva) REFERENCES Habitacion(Id_Habitacion);

-- Demostracion del CRUD

-- Create: Insertar datos
INSERT INTO Cliente (Id_Cliente, P_Nombre, S_Nombre, P_Apellido, M_Apellido, Correo_Electronico, Telefono, Nacionalidad, Idioma_Preferencial) VALUES (1, 'Sergio', 'Antonio', 'Martinez', 'Morales', 'ser.martinezm@duocuc.cl', '+56978723986', 'Chile', 'Espanol');

-- Read: Leer datos
SELECT * FROM Cliente;

-- Update: Actualizar datos
UPDATE Cliente SET Idioma_Preferencial = 'Ingles' WHERE Id_Cliente = 1;

-- Verificar cambio
SELECT * FROM Cliente;

-- Delete: Borrar datos
DELETE FROM Cliente WHERE Id_Cliente = 1;

-- Verificar cambio
SELECT * FROM Cliente;