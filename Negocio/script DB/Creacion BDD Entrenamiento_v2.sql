CREATE DATABASE EntrenamientoDB;
GO

USE EntrenamientoDB;
GO

/* ==============================
   TABLA: Usuarios
   ============================== */
CREATE TABLE Usuarios (
    IdUsuario INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    Rol NVARCHAR(20) CHECK (Rol IN ('Administrador', 'Entrenador', 'Deportista')) NOT NULL,
    Activo BIT NOT NULL DEFAULT 1,
    DNI NVARCHAR(20) NULL,
    TituloHabilitante NVARCHAR(100) NULL,
    FechaNacimiento DATE NULL,
    CONSTRAINT CK_TituloHabilitante_Entrenador 
        CHECK (Rol <> 'Entrenador' OR TituloHabilitante IS NOT NULL)
);
GO

/* ==============================
   TABLA: Deportes
   ============================== */
CREATE TABLE Deportes (
    IdDeporte INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
	Estado BIT NOT NULL DEFAULT 1
);
GO

/* ==============================
   TABLA INTERMEDIA: ProfesoresDeportes
   (Relación muchos a muchos)
   ============================== */
CREATE TABLE EntrenadoresDeportes (
    IdEntrenador INT NOT NULL,
    IdDeporte INT NOT NULL,
    PRIMARY KEY (IdEntrenador, IdDeporte),
    FOREIGN KEY (IdEntrenador) REFERENCES Usuarios(IdUsuario),
    FOREIGN KEY (IdDeporte) REFERENCES Deportes(IdDeporte)
);
GO

/* ==============================
   TABLA INTERMEDIA: ProfesorDeportistas
   (Un profesor puede tener muchos deportistas)
   ============================== */
CREATE TABLE EntrenadoresDeportistas (
    IdEntrenador INT NOT NULL,
    IdDeportista INT NOT NULL,
    PRIMARY KEY (IdEntrenador, IdDeportista),
    FOREIGN KEY (IdEntrenador) REFERENCES Usuarios(IdUsuario),
    FOREIGN KEY (IdDeportista) REFERENCES Usuarios(IdUsuario)
);
GO

/* ==============================
   TABLA INTERMEDIA: DeportistaDeportes
   (Un Deportista puede tener muchos deporte)
   ============================== */
CREATE TABLE DeportistaDeportes (
    IdDeportista INT NOT NULL,
    IdDeporte INT NOT NULL,
    PRIMARY KEY (IdDeportista, IdDeporte),
    FOREIGN KEY (IdDeportista) REFERENCES Usuarios(IdUsuario),
    FOREIGN KEY (IdDeporte) REFERENCES Deportes(IdDeporte)
);
GO

/* ==============================
   TABLA: Rutinas
   ============================== */
CREATE TABLE Rutinas (
    IdRutina INT IDENTITY(1,1) PRIMARY KEY,
    IdEntrenador INT NOT NULL,
    IdDeporte INT NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Nivel NVARCHAR(20) CHECK (Nivel IN ('Principiante', 'Intermedio', 'Avanzado')) NOT NULL,
    Descripcion NVARCHAR(MAX),
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaInicio DATETIME NOT NULL,
    FechaFin DATETIME NOT NULL,
    Activa BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (IdEntrenador) REFERENCES Usuarios(IdUsuario),
    FOREIGN KEY (IdDeporte) REFERENCES Deportes(IdDeporte)
);
GO

/* ==============================
   TABLA: Ejercicios
   ============================== */
CREATE TABLE Ejercicios (
    IdEjercicio INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(MAX),
    UrlVideo NVARCHAR(255), --URL video o imagen
);
GO

/* ==============================
   TABLA INTERMEDIA: RutinaEjercicios
   (Relación muchos a muchos)
   ============================== */
CREATE TABLE RutinaEjercicios (
    IdRutina INT NOT NULL,
    IdEjercicio INT NOT NULL,
    PRIMARY KEY (IdRutina, IdEjercicio),
    FOREIGN KEY (IdRutina) REFERENCES Rutinas(IdRutina),
    FOREIGN KEY (IdEjercicio) REFERENCES Ejercicios(IdEjercicio)
);
GO

/* ==============================
   TABLA INTERMEDIA: DeportistaRutinas
   (Relación muchos a muchos)
   ============================== */
CREATE TABLE DeportistaRutinas (
    IdDeportista INT NOT NULL,
    IdRutina INT NOT NULL,
    PRIMARY KEY (IdDeportista, IdRutina),
    FOREIGN KEY (IdDeportista) REFERENCES Usuarios(IdUsuario),
    FOREIGN KEY (IdRutina) REFERENCES Rutinas(IdRutina)
);
GO

/* ==============================
   TABLA: Observaciones
   ============================== */
CREATE TABLE Observaciones (
    IdObservacion INT IDENTITY(1,1) PRIMARY KEY,
    IdRutina INT NOT NULL,
    IdEntrenador INT NOT NULL,
    Comentario NVARCHAR(MAX) NOT NULL,
    Fecha DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (IdRutina) REFERENCES Rutinas(IdRutina),
    FOREIGN KEY (IdEntrenador) REFERENCES Usuarios(IdUsuario)
);
GO

/* ==============================
   TABLA: Reservas de Clases
   ============================== */
--CREATE TABLE ReservasDeClase (
--    IdReserva INT IDENTITY(1,1) PRIMARY KEY,
--    IdEntrenador INT NOT NULL,
--    IdDeportista INT NOT NULL,
--    FechaHora DATETIME NOT NULL,
--    TipoEntrenamiento NVARCHAR(100),
--    Descripcion NVARCHAR(MAX),
--    Estado NVARCHAR(20) CHECK (Estado IN ('Pendiente','Aceptada','Rechazada','Realizada','Cancelada')) DEFAULT 'Pendiente',
--    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
--    Ubicacion NVARCHAR(150),
--    FOREIGN KEY (IdEntrenador) REFERENCES Usuarios(IdUsuario),
--    FOREIGN KEY (IdDeportista) REFERENCES Usuarios(IdUsuario)
--);
--GO

/* ==============================
   TABLA: Agenda del Profesor
   ============================== */
--CREATE TABLE Agenda (
--    IdAgenda INT IDENTITY(1,1) PRIMARY KEY,
--    IdEntrenador INT NOT NULL,
--    Fecha DATE NOT NULL,
--    HoraInicio TIME NOT NULL,
--    HoraFin TIME NOT NULL,
--    Disponible BIT NOT NULL DEFAULT 1,
--    FOREIGN KEY (IdEntrenador) REFERENCES Usuarios(IdUsuario)
--);
--GO

/* ==============================
   TABLA: Historial
   ============================== */
CREATE TABLE Historial (
    IdHistorial INT IDENTITY(1,1) PRIMARY KEY,
    IdDeportista INT NOT NULL,
    FechaRegistro DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (IdDeportista) REFERENCES Usuarios(IdUsuario)
);
GO

/* ==============================
   TABLA INTERMEDIA: HistorialRutinas
   (Asocia las rutinas al historial)
   ============================== */
CREATE TABLE HistorialRutinas (
    IdHistorial INT NOT NULL,
    IdRutina INT NOT NULL,
    PRIMARY KEY (IdHistorial, IdRutina),
    FOREIGN KEY (IdHistorial) REFERENCES Historial(IdHistorial),
    FOREIGN KEY (IdRutina) REFERENCES Rutinas(IdRutina)
);
GO

/* ==============================
   TABLA INTERMEDIA: HistorialObservaciones
   (Asocia las observaciones al historial)
   ============================== */
CREATE TABLE HistorialObservaciones (
    IdHistorial INT NOT NULL,
    IdObservacion INT NOT NULL,
    PRIMARY KEY (IdHistorial, IdObservacion),
    FOREIGN KEY (IdHistorial) REFERENCES Historial(IdHistorial),
    FOREIGN KEY (IdObservacion) REFERENCES Observaciones(IdObservacion)
);
GO


/* ====================================
   1. DROPS de tablas intermedias
   ==================================== */
DROP TABLE HistorialObservaciones;
DROP TABLE Observaciones;
DROP TABLE HistorialRutinas;

/* ====================================
   2. AGREGAR NUEVAS COLUMNAS EN HISTORIAL
   ==================================== */
ALTER TABLE Historial
ADD Completado BIT CONSTRAINT DF_Historial_Completado DEFAULT 0,
    Sensacion INT,
    Esfuerzo INT,
    Comentario VARCHAR(100),
    IdRutina INT,
    CONSTRAINT FK_Historial_Rutina FOREIGN KEY (IdRutina) REFERENCES Rutinas(IdRutina);

/* ====================================
   3. ELIMINAR FK DE IdDeportista
   (Buscamos el nombre real de la FK)
   ==================================== */
DECLARE @fk NVARCHAR(200);

SELECT @fk = name
FROM sys.foreign_keys
WHERE parent_object_id = OBJECT_ID('Historial');

EXEC('ALTER TABLE Historial DROP CONSTRAINT ' + @fk);

/* ====================================
   4. ELIMINAR COLUMNA IdDeportista
   ==================================== */
ALTER TABLE Historial
DROP COLUMN IdDeportista;

/* ====================================
   AGREGAR NUEVA COLUMNAS EN HISTORIAL
   ==================================== */
ALTER TABLE Historial
ADD IdUsuario INT,
    CONSTRAINT FK_Historial_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario);