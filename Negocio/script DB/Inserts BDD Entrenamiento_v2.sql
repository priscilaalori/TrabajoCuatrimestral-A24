USE EntrenamientoDB;
GO

/* ==============================
   1. USUARIOS
   ============================== */
INSERT INTO Usuarios (Nombre, Apellido, Email, PasswordHash, Rol, Activo)
VALUES
('Elias', 'Lopez', 'elias.lopez@admin.com', 'admin123', 'Administrador', 1),
('Priscila', 'Alori', 'priscila.alori@admin.com', 'admin123', 'Administrador', 1),
('Pamela', 'Vizcarra', 'pamela.vizcarra@admin.com', 'admin123', 'Administrador', 1),
('Juan', 'Pérez', 'juan.perez@entrenador.com', 'prof123', 'Entrenador', 1),
('Carla', 'Gómez', 'carla.gomez@entrenador.com', 'prof456', 'Entrenador', 1),
('Mariano', 'López', 'mariano.lopez@deportista.com', 'dep123', 'Deportista', 1),
('Lucía', 'Fernández', 'lucia.fernandez@deportista.com', 'dep456', 'Deportista', 1),
('Diego', 'Santos', 'diego.santos@deportista.com', 'dep789', 'Deportista', 1);
GO

/* ==============================
   2. DEPORTES
   ============================== */
INSERT INTO Deportes (Nombre)
VALUES ('Natación'), ('Ciclismo'), ('Running');
GO

/* ==============================
   3. PROFESORES-DEPORTES
   ============================== */
-- Juan enseña Natación y Running (IdProfesor=4)
INSERT INTO EntrenadoresDeportes (IdEntrenador, IdDeporte)
VALUES (4, 1), (4, 3);

-- Carla enseña Ciclismo y Running (IdProfesor=5)
INSERT INTO EntrenadoresDeportes (IdEntrenador, IdDeporte)
VALUES (5, 2), (5, 3);
GO

/* ==============================
   4. PROFESOR-DEPORTISTAS
   ============================== */
-- Juan entrena a Mariano (6) y Lucía (7)
INSERT INTO EntrenadoresDeportistas (IdEntrenador, IdDeportista)
VALUES (4, 6), (4, 7);

-- Carla entrena a Diego (8)
INSERT INTO EntrenadoresDeportistas (IdEntrenador, IdDeportista)
VALUES (5, 8);
GO

/* ==============================
   5. DEPORTISTA-DEPORTES
   ============================== */
-- Mariano: Ciclismo
INSERT INTO DeportistaDeportes (IdDeportista, IdDeporte)
VALUES (6, 2);

-- Lucía: Running
INSERT INTO DeportistaDeportes (IdDeportista, IdDeporte)
VALUES (7, 3);

-- Diego: Ciclismo
INSERT INTO DeportistaDeportes (IdDeportista, IdDeporte)
VALUES (8, 2);
GO

/* ==============================
   6. RUTINAS
   ============================== */
INSERT INTO Rutinas (IdEntrenador,IdDeporte, Nombre, Nivel, Descripcion, FechaInicio, FechaFin)
VALUES
( 4,1, 'Natación - Técnica de brazada', 'Intermedio', 'Mejorar eficiencia y resistencia en piscina', getdate(), dateAdd(day,10,getdate())),
( 4,3, 'Running - Fondo', 'Principiante', 'Carreras suaves para mejorar fondo', getdate(), dateAdd(day,10,getdate())),
( 5,2, 'Ciclismo - Potencia y resistencia', 'Avanzado', 'Entrenamiento por intervalos', getdate(), dateAdd(day,10,getdate()));
GO

/* ==============================
   7. EJERCICIOS CON REFERENCIAS (VIDEOS)
   ============================== */
INSERT INTO Ejercicios ( Nombre, Descripcion, UrlVideo)
VALUES
-- Rutina 1: Natación
('Brazada técnica', '50m con énfasis en técnica', 'https://youtu.be/brazada'),
( 'Patada con tabla', 'Patada libre con tabla',  'https://youtu.be/patada'),

-- Rutina 2: Running
( 'Trote suave', 'Correr 30 minutos a ritmo cómodo',  'https://youtu.be/trote'),
( 'Estiramientos', 'Estiramientos de piernas post-running', 'https://youtu.be/estirar'),

-- Rutina 3: Ciclismo
( 'Rodillo alta cadencia', '5 min calentamiento + 10x1 min intervalos',  'https://youtu.be/rodillo'),
( 'Sprints cortos', '8 sprints de 30 segundos al 90%',  'https://youtu.be/sprint');
GO

