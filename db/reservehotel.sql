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

-- Tabla Cuenta de Usuario
CREATE TABLE CuentaUsuario (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    NombreUsuario VARCHAR(100) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL,
    Contraseña VARCHAR(255) NOT NULL,
    FechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Cliente
CREATE TABLE Cliente (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    UserID int,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Teléfono VARCHAR(10),
    Dirección VARCHAR(255),
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



-- Ejemplo de datos en las tablas, es una simulación esta se va a mejorar para obtener buenos resultados
-- Inserciones para la tabla Hotel
INSERT INTO Hotel (Nombre, Dirección, Ciudad, País, Teléfono, Email, Estrellas, Descripción)
VALUES
('Hotel Paradise', '123 Beach Ave', 'Cancún', 'México', '9981234567', 'contact@paradise.com', 5, 'Un lujoso hotel frente al mar.'),
('Hotel Mountain View', '456 Hill St', 'Aspen', 'USA', '9701234567', 'info@mountainview.com', 4, 'Ubicado en las montañas con vistas impresionantes.'),
('City Center Hotel', '789 Main Blvd', 'Madrid', 'España', '911123456', 'reservas@citycenter.com', 3, 'En el corazón de la ciudad con fácil acceso a todo.'),
('Hotel Sunshine', '101 Sunny Road', 'Miami', 'USA', '3051234567', 'bookings@sunshine.com', 4, 'Perfecto para vacaciones familiares cerca de la playa.'),
('Hotel Royal', '102 King St', 'Londres', 'Reino Unido', '2071234567', 'royal@hotelroyal.com', 5, 'Experiencia de lujo con servicio de primera clase.');

-- Inserciones para la tabla Habitación
INSERT INTO Habitación (HotelID, Número, Tipo, Descripción, Precio_por_noche, Capacidad, Estado)
VALUES
(1, '101', 'Suite', 'Vista al mar, cama king-size', 200.00, 2, 'Disponible'),
(1, '102', 'Doble', 'Vista al jardín, dos camas', 150.00, 2, 'Disponible'),
(2, '201', 'Suite', 'Vista a la montaña, cama king-size', 250.00, 2, 'Ocupada'),
(3, '301', 'Individual', 'Cama individual, centro de la ciudad', 100.00, 1, 'Disponible'),
(4, '401', 'Doble', 'Vista a la piscina, dos camas', 180.00, 2, 'Disponible');

-- Inserciones para la tabla CuentaUsuario
INSERT INTO CuentaUsuario (NombreUsuario, CorreoElectronico, Contraseña)
VALUES
('johndoe', 'johndoe@example.com', 'password123'),
('janedoe', 'janedoe@example.com', 'password456'),
('alexsmith', 'alexsmith@example.com', 'password789'),
('maryjane', 'maryjane@example.com', 'password012'),
('petertaylor', 'petertaylor@example.com', 'password345');

-- Inserciones para la tabla Cliente
INSERT INTO Cliente (UserID, Nombre, Apellido, Email, Teléfono, Dirección)
VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '5551234567', '123 Elm St'),
(2, 'Jane', 'Doe', 'janedoe@example.com', '5559876543', '456 Oak St'),
(3, 'Alex', 'Smith', 'alexsmith@example.com', '5556789012', '789 Pine St'),
(4, 'Mary', 'Jane', 'maryjane@example.com', '5555432167', '101 Maple St'),
(5, 'Peter', 'Taylor', 'petertaylor@example.com', '5556543210', '102 Birch St');

-- Inserciones para la tabla Reserva
INSERT INTO Reserva (ClienteID, HabitaciónID, Fecha_de_inicio, Fecha_de_fin, Estado, Método_de_pago, Monto_total)
VALUES
(1, 1, '2024-07-01', '2024-07-07', 'Confirmada', 'Tarjeta de crédito', 1400.00),
(2, 2, '2024-08-01', '2024-08-05', 'Pendiente', 'PayPal', 600.00),
(3, 3, '2024-09-15', '2024-09-20', 'Confirmada', 'Tarjeta de débito', 1250.00),
(4, 4, '2024-10-10', '2024-10-12', 'Cancelada', 'Transferencia bancaria', 200.00),
(5, 5, '2024-11-05', '2024-11-10', 'Confirmada', 'Efectivo', 900.00);

-- Inserciones para la tabla Pago
INSERT INTO Pago (ReservaID, ClienteID, Fecha_de_pago, Monto, Método_de_pago)
VALUES
(1, 1, '2024-07-01', 1400.00, 'Tarjeta de crédito'),
(2, 2, '2024-08-01', 600.00, 'PayPal'),
(3, 3, '2024-09-15', 1250.00, 'Tarjeta de débito'),
(4, 4, '2024-10-09', 200.00, 'Transferencia bancaria'),
(5, 5, '2024-11-05', 900.00, 'Efectivo');

-- Inserciones para la tabla Servicio
INSERT INTO Servicio (Nombre, Descripción, Precio)
VALUES
('Desayuno buffet', 'Desayuno tipo buffet disponible todas las mañanas.', 15.00),
('Spa', 'Acceso al spa y masajes.', 50.00),
('Gimnasio', 'Acceso al gimnasio del hotel.', 20.00),
('Transporte al aeropuerto', 'Transporte de ida y vuelta al aeropuerto.', 30.00),
('Servicio a la habitación', 'Servicio de comidas y bebidas en la habitación.', 10.00);
