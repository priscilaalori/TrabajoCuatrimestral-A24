using Dominio;
using System;
using System.Collections.Generic;

namespace Negocio
{
    public class EntrenadorNegocio
    {

        public List<Deportista> Listar()
        {

            List<Deportista> listaDeportista = new List<Deportista>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select U.IdUsuario, U.Nombre, U.Apellido from DeportistaDeportes DD inner join Usuarios U on U.IdUsuario = DD.IdDeportista");
                datos.ejecutarLectura();


                while (datos.Lector.Read())
                {
                    Deportista deportistaAuxiliar = new Deportista();
                    deportistaAuxiliar.IdUsuario = (int)datos.Lector["IdUsuario"];
                    deportistaAuxiliar.Nombre = (string)datos.Lector["Nombre"];
                    deportistaAuxiliar.Apellido = (string)datos.Lector["Apellido"];

                    listaDeportista.Add(deportistaAuxiliar);
                }

                return listaDeportista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void agregar(Usuario nuevoEntrenador, string nombreDeporte)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                // 1️⃣ Insertar el nuevo entrenador en la tabla Usuarios
                datos.setearConsulta(@"
                                      INSERT INTO Usuarios 
                                      (Nombre, Apellido, Email, PasswordHash, Rol, Activo, DNI, TituloHabilitante, FechaNacimiento)
                                      VALUES 
                                      (@Nombre, @Apellido, @Email, @PasswordHash, 'Entrenador', 1, @DNI, @TituloHabilitante, @FechaNacimiento);
                                      SELECT SCOPE_IDENTITY();");

                datos.setearParametro("@Nombre", nuevoEntrenador.Nombre);
                datos.setearParametro("@Apellido", nuevoEntrenador.Apellido);
                datos.setearParametro("@Email", nuevoEntrenador.Email);
                datos.setearParametro("@PasswordHash", nuevoEntrenador.Contrasenia);
                datos.setearParametro("@DNI", (object)nuevoEntrenador.DNI ?? DBNull.Value);
                datos.setearParametro("@TituloHabilitante", (object)nuevoEntrenador.Titulo ?? DBNull.Value);
                datos.setearParametro("@FechaNacimiento", (object)nuevoEntrenador.FechaNacimiento ?? DBNull.Value);

                int idEntrenador = Convert.ToInt32(datos.ejecutarEscalar());

        
                datos.setearConsulta("SELECT IdDeporte FROM Deportes WHERE Nombre = @NombreDeporte");
                datos.setearParametro("@NombreDeporte", nombreDeporte);
                int idDeporte = Convert.ToInt32(datos.ejecutarEscalar());

             
                datos.setearConsulta("INSERT INTO EntrenadoresDeportes (IdEntrenador, IdDeporte) VALUES (@IdEntrenador, @IdDeporte)");
                datos.setearParametro("@IdEntrenador", idEntrenador);
                datos.setearParametro("@IdDeporte", idDeporte);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
    
}
