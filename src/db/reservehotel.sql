/*Workbench DATABASE by MV*/
CREATE DATABASE ReserveHotel;

USE ReserveHotel;

-- Cada tabla está creada segun el funcionamiento de una aplicacion de reserva de Hotel
-- Faltan mejoras, es solo un ejemplo de como sería su funcionamiento.

-- Tabla Hotel
CREATE TABLE Hotel (
    HotelID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Dirección VARCHAR(255) NOT NULL,
    Ciudad VARCHAR(100) NOT NULL,
    País VARCHAR(100) NOT NULL,
    Teléfono VARCHAR(10),
    Email VARCHAR(100),
    Estrellas INT,
    Descripción VARCHAR(500)
);

-- Tabla Habitación
CREATE TABLE Habitación (
    HabitaciónID INT AUTO_INCREMENT PRIMARY KEY,
    HotelID INT,
    Número VARCHAR(50) NOT NULL,
    Tipo VARCHAR(50),
    Descripción VARCHAR(500),
    Precio_por_noche DECIMAL(10, 2) NOT NULL,
    Capacidad INT NOT NULL,
    Estado VARCHAR(50),
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);

-- Tabla Cliente
CREATE TABLE Cliente (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Teléfono VARCHAR(10),
    Dirección VARCHAR(255)
    FOREIGN KEY (UserID) REFERENCES CuentaUsuario(UserID)
);

-- Tabla Reserva
CREATE TABLE Reserva (
    ReservaID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    HabitaciónID INT,
    Fecha_de_inicio DATE NOT NULL,
    Fecha_de_fin DATE NOT NULL,
    Estado VARCHAR(50),
    Método_de_pago VARCHAR(50),
    Monto_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (HabitaciónID) REFERENCES Habitación(HabitaciónID)
);

-- Tabla Pago
CREATE TABLE Pago (
    PagoID INT AUTO_INCREMENT PRIMARY KEY,
    ReservaID INT,
    ClienteID INT,
    Fecha_de_pago DATE NOT NULL,
    Monto DECIMAL(10, 2) NOT NULL,
    Método_de_pago VARCHAR(50),
    FOREIGN KEY (ReservaID) REFERENCES Reserva(ReservaID),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

-- Tabla Servicio
CREATE TABLE Servicio (
    ServicioID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripción VARCHAR(500),
    Precio DECIMAL(10, 2) NOT NULL
);

-- Tabla Cuenta de Usuario
CREATE TABLE CuentaUsuario (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    NombreUsuario VARCHAR(100) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL,
    Contraseña VARCHAR(255) NOT NULL,
    FechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Ejemplo de datos en las tablas, es una simulación esta se va a mejorar para obtener buenos resultados
-- Inserción de datos en la tabla Hotel
INSERT INTO Hotel (Nombre, Dirección, Ciudad, País, Teléfono, Email, Estrellas, Descripción)
VALUES ('Hotel Oro Verde', 'av malecón', 'Manta', 'Ecuador', '1875445611', 'oroverde@gmail.com', 4, 'Hotel de manta con todas las comodidades necesarias.');

-- Inserción de datos en la tabla Habitación
INSERT INTO Habitación (HotelID, Número, Tipo, Descripción, Precio_por_noche, Capacidad, Estado)
VALUES (1, '101', 'Doble', 'Habitación con cama doble y baño privado', 100.00, 2, 'Disponible');

-- Inserción de datos en la tabla Cliente
INSERT INTO Cliente (Nombre, Apellido, Email, Teléfono, Dirección)
VALUES ('Marlon', 'Vera', 'marlon@gmail.com', '1234567890', 'av malecón');

-- Inserción de datos en la tabla Reserva
INSERT INTO Reserva (ClienteID, HabitaciónID, Fecha_de_inicio, Fecha_de_fin, Estado, Método_de_pago, Monto_total)
VALUES (1, 1, '2024-07-01', '2024-07-05', 'Confirmada', 'Tarjeta de crédito', 500.00);

-- Inserción de datos en la tabla Pago
INSERT INTO Pago (ReservaID, Fecha_de_pago, Monto, Método_de_pago)
VALUES (1, '2024-07-01', 500.00, 'Tarjeta de crédito');

-- Inserción de datos en la tabla Servicio
INSERT INTO Servicio (Nombre, Descripción, Precio)
VALUES ('Wi-Fi', 'Conexión a internet de alta velocidad', 10.00);

-- Inserción de datos en la tabla Cuenta de Usuario
INSERT INTO CuentaUsuario (NombreUsuario, CorreoElectronico, Contraseña)
VALUES ('Marlon Vera', 'marlon@gmail.com', 'sincontraseña24');

