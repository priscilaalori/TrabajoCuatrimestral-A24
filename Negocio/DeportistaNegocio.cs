using Dominio;
using System;
using System.Collections.Generic;

namespace Negocio
{
    public class DeportistaNegocio
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

        public void agregar(Deportista nuevoDeportista, int idDeporte)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
            
                datos.setearConsulta(@"
                      INSERT INTO Usuarios 
                      (Nombre, Apellido, Email, PasswordHash, Rol, Activo, DNI, FechaNacimiento)
                      VALUES 
                      (@Nombre, @Apellido, @Email, @Contrasenia, 'Deportista', 1, @DNI, @FechaNacimiento);
                      SELECT SCOPE_IDENTITY();");

                datos.setearParametro("@Nombre", nuevoDeportista.Nombre);
                datos.setearParametro("@Apellido", nuevoDeportista.Apellido);
                datos.setearParametro("@Email", nuevoDeportista.Email);
                datos.setearParametro("@Contrasenia", nuevoDeportista.Contrasenia);
                datos.setearParametro("@DNI", nuevoDeportista.DNI ?? (object)DBNull.Value);
                datos.setearParametro("@FechaNacimiento", nuevoDeportista.FechaNacimiento ?? (object)DBNull.Value);

                int idUsuario = Convert.ToInt32(datos.ejecutarEscalar());


                datos.setearConsulta("INSERT INTO DeportistaDeportes (IdDeportista, IdDeporte) VALUES (@IdDeportista, @IdDeporte)");
                datos.setearParametro("@IdDeportista", idUsuario);
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
