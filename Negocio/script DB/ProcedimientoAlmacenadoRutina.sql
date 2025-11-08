
CREATE procedure [dbo].[sp_AgregarRutina](
@IdEntrenador int, 
@IdDeporte int,
@Nombre varchar(100), 
@Nivel varchar(20), 
@Descripcion nvarchar(max),
@FechaInicio datetime,
@FechaFin datetime
)
as

begin try

insert into Rutinas (IdEntrenador,IdDeporte, Nombre,Nivel,Descripcion, FechaInicio, FechaFin)
values (@IdEntrenador,@IdDeporte, @Nombre, @Nivel, @Descripcion,@FechaInicio,@FechaFin)

end try

begin catch
PRINT ERROR_MESSAGE()

end catch

GO
create procedure sp_ModificarRutina(
@IdRutina int,
@IdDeporte int, 
@Nombre  nvarchar(100),
@Nivel nvarchar(20),
@Descripcion nvarchar(max),
@FechaInicio datetime,
@FechaFin datetime

)
as
begin try

UPDATE Rutinas SET IdDeporte = @IdDeporte,  Nombre = @Nombre, Nivel = @Nivel, Descripcion = @Descripcion, FechaInicio = @FechaInicio, FechaFin = @FechaFin        
WHERE idRutina = @IdRutina
end try 

begin catch
PRINT ERROR_MESSAGE()
end catch
