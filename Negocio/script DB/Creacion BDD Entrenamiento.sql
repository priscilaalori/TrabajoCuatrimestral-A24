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
    Rol NVARCHAR(20) CHECK (Rol IN ('Administrador', 'Profesor', 'Deportista')) NOT NULL,
    Activo BIT NOT NULL DEFAULT 1
);
GO

/* ==============================
   TABLA: Deportes
   ============================== */
CREATE TABLE Deportes (
    IdDeporte INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL
);
GO

/* ==============================
   TABLA INTERMEDIA: ProfesoresDeportes
   (Relación muchos a muchos)
   ============================== */
CREATE TABLE ProfesoresDeportes (
    IdProfesor INT NOT NULL,
    IdDeporte INT NOT NULL,
    PRIMARY KEY (IdProfesor, IdDeporte),
    FOREIGN KEY (IdProfesor) REFERENCES Usuarios(IdUsuario),
    FOREIGN KEY (IdDeporte) REFERENCES Deportes(IdDeporte)
);
GO

/* ==============================
   TABLA INTERMEDIA: ProfesorDeportistas
   (Un profesor puede tener muchos deportistas)
   ============================== */
CREATE TABLE ProfesorDeportistas (
    IdProfesor INT NOT NULL,
    IdDeportista INT NOT NULL,
    PRIMARY KEY (IdProfesor, IdDeportista),
    FOREIGN KEY (IdProfesor) REFERENCES Usuarios(IdUsuario),
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
    IdDeportista INT NOT NULL,
    IdProfesor INT NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Nivel NVARCHAR(20) CHECK (Nivel IN ('Principiante', 'Intermedio', 'Avanzado')) NOT NULL,
    Descripcion NVARCHAR(MAX),
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    Activa BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (IdDeportista) REFERENCES Usuarios(IdUsuario),
    FOREIGN KEY (IdProfesor) REFERENCES Usuarios(IdUsuario)
);
GO

/* ==============================
   TABLA: Ejercicios
   ============================== */
CREATE TABLE Ejercicios (
    IdEjercicio INT IDENTITY(1,1) PRIMARY KEY,
    IdRutina INT NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(MAX),
    Series INT,
    Repeticiones INT,
    Duracion NVARCHAR(50),
    Referencia NVARCHAR(255), --URL video o imagen
    FOREIGN KEY (IdRutina) REFERENCES Rutinas(IdRutina)
);
GO

/* ==============================
   TABLA: Observaciones
   ============================== */
CREATE TABLE Observaciones (
    IdObservacion INT IDENTITY(1,1) PRIMARY KEY,
    IdRutina INT NOT NULL,
    IdProfesor INT NOT NULL,
    Comentario NVARCHAR(MAX) NOT NULL,
    Fecha DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (IdRutina) REFERENCES Rutinas(IdRutina),
    FOREIGN KEY (IdProfesor) REFERENCES Usuarios(IdUsuario)
);
GO

/* ==============================
   TABLA: Reservas de Clases
   ============================== */
CREATE TABLE ReservasDeClase (
    IdReserva INT IDENTITY(1,1) PRIMARY KEY,
    IdProfesor INT NOT NULL,
    IdDeportista INT NOT NULL,
    FechaHora DATETIME NOT NULL,
    TipoEntrenamiento NVARCHAR(100),
    Descripcion NVARCHAR(MAX),
    Estado NVARCHAR(20) CHECK (Estado IN ('Pendiente','Aceptada','Rechazada','Realizada','Cancelada')) DEFAULT 'Pendiente',
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    Ubicacion NVARCHAR(150),
    FOREIGN KEY (IdProfesor) REFERENCES Usuarios(IdUsuario),
    FOREIGN KEY (IdDeportista) REFERENCES Usuarios(IdUsuario)
);
GO

/* ==============================
   TABLA: Agenda del Profesor
   ============================== */
CREATE TABLE Agenda (
    IdAgenda INT IDENTITY(1,1) PRIMARY KEY,
    IdProfesor INT NOT NULL,
    Fecha DATE NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
    Disponible BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (IdProfesor) REFERENCES Usuarios(IdUsuario)
);
GO

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