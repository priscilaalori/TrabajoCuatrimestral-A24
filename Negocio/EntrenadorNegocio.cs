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

        public List<Usuario> ListarPorDeporte(int idDeporte)
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
            SELECT U.IdUsuario, U.Nombre, U.Apellido, U.Email, U.DNI, U.TituloHabilitante
            FROM Usuarios U
            INNER JOIN EntrenadoresDeportes ED ON U.IdUsuario = ED.IdEntrenador
            WHERE U.Rol = 'Entrenador' AND ED.IdDeporte = @IdDeporte
        ");
                datos.setearParametro("@IdDeporte", idDeporte);

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario entrenador = new Usuario
                    {
                        IdUsuario = (int)datos.Lector["IdUsuario"],
                        Nombre = (string)datos.Lector["Nombre"],
                        Apellido = (string)datos.Lector["Apellido"],
                        Email = (string)datos.Lector["Email"],
                        DNI = datos.Lector["DNI"] != DBNull.Value ? (string)datos.Lector["DNI"] : null,
                        Titulo = datos.Lector["TituloHabilitante"] != DBNull.Value ? (string)datos.Lector["TituloHabilitante"] : null
                    };

                    lista.Add(entrenador);
                }

                return lista;
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

        public void agregar(Usuario nuevoEntrenador, int idDeporte)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
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

        public void AsignarProfesorADeportista(int idDeportista, int idEntrenador)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                // Verificar si ya está asignado (para evitar duplicaciones)
                datos.setearConsulta("SELECT COUNT(*) FROM EntrenadoresDeportistas WHERE IdDeportista = @IdDeportista");
                datos.setearParametro("@IdDeportista", idDeportista);
                int count = (int)datos.ejecutarEscalar();

                // Limpio los parámetros para evitar el error
                datos.limpiarParametros();

                if (count > 0)
                {
                    // Actualizamos el profesor asignado si ya había uno
                    datos.setearConsulta("UPDATE EntrenadoresDeportistas SET IdEntrenador = @IdEntrenador WHERE IdDeportista = @IdDeportista");
                }
                else
                {
                    // Asignar un profesor nuevo al deportista
                    datos.setearConsulta("INSERT INTO EntrenadoresDeportistas (IdEntrenador, IdDeportista) VALUES (@IdEntrenador, @IdDeportista)");
                }

                datos.setearParametro("@IdEntrenador", idEntrenador);
                datos.setearParametro("@IdDeportista", idDeportista);

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


        public void EliminarAsignacionDeDeportista(int idDeportista)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DELETE FROM EntrenadoresDeportistas WHERE IdDeportista = @IdDeportista");
                datos.setearParametro("@IdDeportista", idDeportista);
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
