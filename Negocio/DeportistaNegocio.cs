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

        public void agregar(Deportista nuevoDeportista, string NombreDeporte)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {


                datos.setearConsulta("INSERT INTO Usuarios (Nombre, Apellido, Email, PasswordHash, Rol, Activo) VALUES (@Nombre, @Apellido, @Email, @Contrasenia , 'Deportista', 1); " +
                             "SELECT SCOPE_IDENTITY();");

                datos.setearParametro("@Nombre", nuevoDeportista.Nombre);
                datos.setearParametro("@Apellido", nuevoDeportista.Apellido);
                datos.setearParametro("@Email", nuevoDeportista.Email);
                datos.setearParametro("@Contrasenia", nuevoDeportista.Contrasenia);




                int idUsuario = Convert.ToInt32(datos.ejecutarEscalar()); // guarda el Id generado



                // 2️⃣ Obtener el IdDeporte según el valor seleccionado en el DropDown
                datos.setearConsulta("SELECT IdDeporte FROM Deportes WHERE Nombre = @NombreDeporte");
                datos.setearParametro("@NombreDeporte", NombreDeporte);
                int idDeporte = Convert.ToInt32(datos.ejecutarEscalar());
                //
                // // 3️⃣ Insertar en DeportistaDeportes
                datos.setearConsulta("INSERT INTO DeportistaDeportes (IdDeportista, IdDeporte) VALUES (@IdDeportista, @IdDeporte)");
                datos.setearParametro("@IdDeportista", idUsuario);
                datos.setearParametro("@IdDeporte", idDeporte);
                //
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

        ///  public void modificar(Marca marca)
        ///  {
        ///      AccesoDatos datos = new AccesoDatos();
        ///      try
        ///      {
        ///          datos.setearConsulta("UPDATE MARCAS SET DESCRIPCION = '" + marca.Descripcion + "' WHERE ID = " + marca.IdMarca);
        ///          datos.ejecutarAccion();
        ///      }
        ///      catch (Exception ex)
        ///      {
        ///          throw ex;
        ///      }
        ///      finally
        ///      {
        ///          datos.cerrarConexion();
        ///      }
        ///  }
        ///
        ///  public void eliminar(int id )
        ///  {
        ///      AccesoDatos datos = new AccesoDatos();
        ///      try
        ///      {
        ///          datos.setearConsulta("DELETE FROM MARCAS WHERE ID = " + id);
        ///          datos.ejecutarAccion(); 
        ///      }
        ///      catch (Exception ex)
        ///      {
        ///          throw ex ;
        ///      }
        ///      finally
        ///      {
        ///          datos.cerrarConexion(); 
        ///      }
        ///
        ///  }
    }
}
