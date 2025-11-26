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
   TABLA INTERMEDIA: EntrenadoresDeportes
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
   TABLA INTERMEDIA: EntrenadoresDeportistas
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
    UrlVideo NVARCHAR(255),
    Estado BIT NOT NULL DEFAULT 1
);
GO

/* ==============================
   TABLA INTERMEDIA: RutinaEjercicios
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
   TABLA: Historial (VERSION NUEVA)
   ============================== */
CREATE TABLE Historial (
    IdHistorial INT IDENTITY(1,1) PRIMARY KEY,
    FechaRegistro DATETIME NOT NULL DEFAULT GETDATE(),
    Completado BIT NOT NULL DEFAULT 0,
    Sensacion INT,
    Esfuerzo INT,
    Comentario VARCHAR(100),
    IdRutina INT,
    IdUsuario INT,
    FOREIGN KEY (IdRutina) REFERENCES Rutinas(IdRutina),
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
);
GO
