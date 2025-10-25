--Ver usuarios y roles
SELECT 
    IdUsuario,
    Nombre + ' ' + Apellido AS NombreCompleto,
    Email,
    Rol,
    CASE WHEN Activo = 1 THEN 'Activo' ELSE 'Inactivo' END AS Estado
FROM Usuarios;

--Ver Profesores y los deportes que enseñan
SELECT 
    U.IdUsuario AS IdProfesor,
    U.Nombre + ' ' + U.Apellido AS Profesor,
    D.Nombre AS Deporte
FROM ProfesoresDeportes PD
JOIN Usuarios U ON U.IdUsuario = PD.IdProfesor
JOIN Deportes D ON D.IdDeporte = PD.IdDeporte
ORDER BY Profesor;

--Ver Profesores y sus alumnos (deportistas)
SELECT 
    P.IdProfesor,
    Profesor = UP.Nombre + ' ' + UP.Apellido,
    --A.IdDeportista,
    Deportista = UA.Nombre + ' ' + UA.Apellido
FROM ProfesorDeportistas P
JOIN Usuarios UP ON P.IdProfesor = UP.IdUsuario
JOIN Usuarios UA ON P.IdDeportista = UA.IdUsuario
ORDER BY Profesor, Deportista;

--Rutinas asignadas a cada alumno con profesor y deporte
SELECT 
    R.IdRutina,
    R.Nombre AS Rutina,
    R.Nivel,
    R.Descripcion,
    Deportista = D.Nombre + ' ' + D.Apellido,
    Profesor = P.Nombre + ' ' + P.Apellido,
    STRING_AGG(DEP.Nombre, ', ') AS Deportes,
    R.FechaCreacion,
    CASE WHEN R.Activa = 1 THEN 'Activa' ELSE 'Inactiva' END AS Estado
FROM Rutinas R
JOIN Usuarios D ON D.IdUsuario = R.IdDeportista
JOIN Usuarios P ON P.IdUsuario = R.IdProfesor
LEFT JOIN ProfesoresDeportes PD ON PD.IdProfesor = P.IdUsuario
LEFT JOIN Deportes DEP ON DEP.IdDeporte = PD.IdDeporte
GROUP BY R.IdRutina, R.Nombre, R.Nivel, R.Descripcion, D.Nombre, D.Apellido, P.Nombre, P.Apellido, R.FechaCreacion, R.Activa;

--Ejercicios dentro de cada rutina
SELECT 
    R.IdRutina,
    R.Nombre AS Rutina,
    E.Nombre AS Ejercicio,
    E.Descripcion,
    E.Series,
    E.Repeticiones,
    E.Duracion,
    E.Referencia
FROM Ejercicios E
JOIN Rutinas R ON R.IdRutina = E.IdRutina
ORDER BY R.IdRutina;

--Observaciones de profesores sobre las rutinas
SELECT 
    O.IdObservacion,
    Rutina = R.Nombre,
    Profesor = U.Nombre + ' ' + U.Apellido,
    O.Comentario,
    O.Fecha
FROM Observaciones O
JOIN Rutinas R ON R.IdRutina = O.IdRutina
JOIN Usuarios U ON U.IdUsuario = O.IdProfesor
ORDER BY O.Fecha DESC;

--Reservas de clases privadas (alumno ↔ profesor)
SELECT 
    RC.IdReserva,
    Deportista = A.Nombre + ' ' + A.Apellido,
    Profesor = P.Nombre + ' ' + P.Apellido,
    RC.FechaHora,
    RC.TipoEntrenamiento,
    RC.Descripcion,
    RC.Ubicacion,
    RC.Estado,
    RC.FechaCreacion
FROM ReservasDeClase RC
JOIN Usuarios P ON P.IdUsuario = RC.IdProfesor
JOIN Usuarios A ON A.IdUsuario = RC.IdDeportista
ORDER BY RC.FechaHora;

--Agenda de disponibilidad de profesores
SELECT 
    A.IdAgenda,
    Profesor = U.Nombre + ' ' + U.Apellido,
    A.Fecha,
    A.HoraInicio,
    A.HoraFin,
    CASE WHEN A.Disponible = 1 THEN 'Disponible' ELSE 'Ocupado' END AS Estado
FROM Agenda A
JOIN Usuarios U ON U.IdUsuario = A.IdProfesor
ORDER BY A.Fecha, A.HoraInicio;

--Historial de rutinas y observaciones de cada deportista
SELECT 
    H.IdHistorial,
    Deportista = U.Nombre + ' ' + U.Apellido,
    R.Nombre AS Rutina,
    O.Comentario AS Observacion
FROM Historial H
JOIN Usuarios U ON U.IdUsuario = H.IdDeportista
LEFT JOIN HistorialRutinas HR ON HR.IdHistorial = H.IdHistorial
LEFT JOIN Rutinas R ON R.IdRutina = HR.IdRutina
LEFT JOIN HistorialObservaciones HO ON HO.IdHistorial = H.IdHistorial
LEFT JOIN Observaciones O ON O.IdObservacion = HO.IdObservacion
ORDER BY U.Nombre;

--Vista general completa (todo junto)

SELECT 
    P.Nombre + ' ' + P.Apellido AS Profesor,
    D.Nombre + ' ' + D.Apellido AS Deportista,
    R.Nombre AS Rutina,
    E.Nombre AS Ejercicio,
    E.Series,
    E.Repeticiones,
    E.Duracion,
    O.Comentario AS Observacion,
    RC.FechaHora AS ProximaReserva
FROM Rutinas R
JOIN Usuarios D ON D.IdUsuario = R.IdDeportista
JOIN Usuarios P ON P.IdUsuario = R.IdProfesor
LEFT JOIN Ejercicios E ON E.IdRutina = R.IdRutina
LEFT JOIN Observaciones O ON O.IdRutina = R.IdRutina
LEFT JOIN ReservasDeClase RC ON RC.IdDeportista = D.IdUsuario AND RC.IdProfesor = P.IdUsuario
ORDER BY Profesor, Deportista, Rutina;



-- Este select muestra todo, osea alumno y profe, rutina, etc

SELECT 
    P.Nombre + ' ' + P.Apellido AS Profesor,
    D.Nombre + ' ' + D.Apellido AS Deportista,
    R.Nombre AS Rutina,
    STRING_AGG(E.Nombre, ', ') AS Ejercicios,
    STRING_AGG(E.Series, ', ') AS Series,
    STRING_AGG(E.Repeticiones, ', ') AS Repeticiones,
    STRING_AGG(E.Duracion, ', ') AS Duracion,
    O.Comentario AS Observacion,
    MIN(RC.FechaHora) AS ProximaReserva
FROM Rutinas R
JOIN Usuarios D ON D.IdUsuario = R.IdDeportista AND D.Rol = 'Deportista'
JOIN Usuarios P ON P.IdUsuario = R.IdProfesor AND P.Rol = 'Profesor'
LEFT JOIN Ejercicios E ON E.IdRutina = R.IdRutina
LEFT JOIN Observaciones O ON O.IdRutina = R.IdRutina
LEFT JOIN ReservasDeClase RC ON RC.IdDeportista = D.IdUsuario AND RC.IdProfesor = P.IdUsuario
GROUP BY P.Nombre, P.Apellido, D.Nombre, D.Apellido, R.Nombre, O.Comentario
ORDER BY Profesor, Deportista, Rutina;

select * from DeportistaDeportes;

select * from Deportes;

select * from usuarios;