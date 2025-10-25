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
('Juan', 'Pérez', 'juan.perez@entrenador.com', 'prof123', 'Profesor', 1),
('Carla', 'Gómez', 'carla.gomez@entrenador.com', 'prof456', 'Profesor', 1),
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
INSERT INTO ProfesoresDeportes (IdProfesor, IdDeporte)
VALUES (4, 1), (4, 3);

-- Carla enseña Ciclismo y Running (IdProfesor=5)
INSERT INTO ProfesoresDeportes (IdProfesor, IdDeporte)
VALUES (5, 2), (5, 3);
GO

/* ==============================
   4. PROFESOR-DEPORTISTAS
   ============================== */
-- Juan entrena a Mariano (6) y Lucía (7)
INSERT INTO ProfesorDeportistas (IdProfesor, IdDeportista)
VALUES (4, 6), (4, 7);

-- Carla entrena a Diego (8)
INSERT INTO ProfesorDeportistas (IdProfesor, IdDeportista)
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
INSERT INTO Rutinas (IdDeportista, IdProfesor, Nombre, Nivel, Descripcion)
VALUES
(6, 4, 'Natación - Técnica de brazada', 'Intermedio', 'Mejorar eficiencia y resistencia en piscina'),
(7, 4, 'Running - Fondo', 'Principiante', 'Carreras suaves para mejorar fondo'),
(8, 5, 'Ciclismo - Potencia y resistencia', 'Avanzado', 'Entrenamiento por intervalos');
GO

/* ==============================
   7. EJERCICIOS CON REFERENCIAS (VIDEOS)
   ============================== */
INSERT INTO Ejercicios (IdRutina, Nombre, Descripcion, Series, Repeticiones, Duracion, Referencia)
VALUES
-- Rutina 1: Natación
(1, 'Brazada técnica', '50m con énfasis en técnica', 4, 1, '10 min', 'https://youtu.be/brazada'),
(1, 'Patada con tabla', 'Patada libre con tabla', 3, 2, '8 min', 'https://youtu.be/patada'),

-- Rutina 2: Running
(2, 'Trote suave', 'Correr 30 minutos a ritmo cómodo', 1, 1, '30 min', 'https://youtu.be/trote'),
(2, 'Estiramientos', 'Estiramientos de piernas post-running', 1, 1, '10 min', 'https://youtu.be/estirar'),

-- Rutina 3: Ciclismo
(3, 'Rodillo alta cadencia', '5 min calentamiento + 10x1 min intervalos', 10, 1, '45 min', 'https://youtu.be/rodillo'),
(3, 'Sprints cortos', '8 sprints de 30 segundos al 90%', 8, 1, '15 min', 'https://youtu.be/sprint');
GO

/* ==============================
   8. OBSERVACIONES
   ============================== */
INSERT INTO Observaciones (IdRutina, IdProfesor, Comentario)
VALUES
(1, 4, 'Buena técnica, mantener ritmo respiratorio constante.'),
(2, 4, 'Controlar la pisada, evitar impacto fuerte en rodillas.'),
(3, 5, 'Excelente rendimiento, mejorar final.');
GO

/* ==============================
   9. RESERVAS DE CLASES
   ============================== */
INSERT INTO ReservasDeClase (IdProfesor, IdDeportista, FechaHora, TipoEntrenamiento, Descripcion, Estado, Ubicacion)
VALUES
(4, 6, '2025-10-25 10:00:00', 'Natación personalizada', 'Técnica avanzada de brazada', 'Pendiente', 'Piscina Olímpica Central'),
(4, 7, '2025-10-27 18:00:00', 'Running', 'Sesión de control de ritmo', 'Aceptada', 'Parque Sarmiento'),
(5, 8, '2025-10-26 09:00:00', 'Ciclismo', 'Ruta larga de entrenamiento', 'Realizada', 'Circuito Panamericano');
GO

/* ==============================
   10. AGENDA
   ============================== */
INSERT INTO Agenda (IdProfesor, Fecha, HoraInicio, HoraFin, Disponible)
VALUES
(4, '2025-10-25', '09:00', '12:00', 0),
(4, '2025-10-27', '17:00', '19:00', 0),
(5, '2025-10-26', '08:00', '10:30', 0),
(5, '2025-10-29', '08:00', '10:00', 1);
GO

/* ==============================
   11. HISTORIAL
   ============================== */
INSERT INTO Historial (IdDeportista)
VALUES (6), (7), (8);
GO

/* ==============================
   12. HISTORIAL-RUTINAS
   ============================== */
INSERT INTO HistorialRutinas (IdHistorial, IdRutina)
VALUES
(1, 1),
(2, 2),
(3, 3);
GO

/* ==============================
   13. HISTORIAL-OBSERVACIONES
   ============================== */
INSERT INTO HistorialObservaciones (IdHistorial, IdObservacion)
VALUES
(1, 1),
(2, 2),
(3, 3);
GO