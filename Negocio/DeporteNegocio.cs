using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public  class DeporteNegocio
    {
        public class DeporteException : Exception
        {
            public DeporteException() { }
            public DeporteException(string message) : base(message) { }
            public DeporteException(string message, Exception inner) : base(message, inner) { }
        }


        public List<Deporte> Listar()
        {

            List<Deporte> listaDeportes = new List<Deporte>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select * from Deportes");
                datos.ejecutarLectura();


                while (datos.Lector.Read())
                {
                    Deporte deporteAuxiliar = new Deporte();
                    deporteAuxiliar.IdDeporte = (int)datos.Lector["IdDeporte"];
                    deporteAuxiliar.Nombre = (string)datos.Lector["Nombre"];
                    deporteAuxiliar.Estado = (bool)datos.Lector["Estado"];
                   

                    listaDeportes.Add(deporteAuxiliar);
                }

                return listaDeportes;
            }
            catch (SqlException ex)
            {
                throw new DeporteException("Error SQL al listar deportes.", ex);
            }
            catch (Exception ex)
            {
                throw new DeporteException("Error inesperado al listar deportes.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<Deporte> ListarActivos()
        {

            List<Deporte> listaDeportes = new List<Deporte>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select * from Deportes where Estado = 1");
                datos.ejecutarLectura();


                while (datos.Lector.Read())
                {
                    Deporte deporteAuxiliar = new Deporte();
                    deporteAuxiliar.IdDeporte = (int)datos.Lector["IdDeporte"];
                    deporteAuxiliar.Nombre = (string)datos.Lector["Nombre"];
                    deporteAuxiliar.Estado = (bool)datos.Lector["Estado"];


                    listaDeportes.Add(deporteAuxiliar);
                }

                return listaDeportes;
            }
            catch (SqlException ex)
            {
                throw new DeporteException("Error SQL al listar deportes activos.", ex);
            }
            catch (Exception ex)
            {
                throw new DeporteException("Error inesperado al listar deportes activos.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void EliminarDeporteLogico(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Deportes SET Estado = 0 WHERE IdDeporte = @IdDeporte");
                datos.setearParametro("@IdDeporte", id);
                datos.ejecutarAccion();
            }
            catch (SqlException ex)
            {
                throw new DeporteException("Error SQL al eliminar lógicamente el deporte.", ex);
            }
            catch (Exception ex)
            {
                throw new DeporteException("Error inesperado al eliminar lógicamente el deporte.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public void ActivarDeporteLogico(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Deportes SET Estado = 1 WHERE IdDeporte = @IdDeporte");
                datos.setearParametro("@IdDeporte", id);
                datos.ejecutarAccion();
            }
       

            catch (SqlException ex)
             {
                         throw new DeporteException("Error SQL al activar lógicamente el deporte.", ex);
                     }
             catch (Exception ex)
             {
                         throw new DeporteException("Error inesperado al activar lógicamente el deporte.", ex);
                     }
             finally
             {
                datos.cerrarConexion();
            }
        }

        public Deporte ObtenerPorId(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT IdDeporte, Nombre, Estado FROM Deportes WHERE IdDeporte = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    return new Deporte
                    {
                        IdDeporte = (int)datos.Lector["IdDeporte"],
                        Nombre = (string)datos.Lector["Nombre"],
                        Estado = (bool)datos.Lector["Estado"]
                    };
                }

                return null;
            }
            catch (SqlException ex)
            {
                throw new Exception($"Error SQL al obtener el deporte con ID {id}.", ex);
            }
            catch (InvalidCastException ex)
            {
                throw new Exception("Error de conversión al obtener el deporte por ID.", ex);
            }
            catch
            {
                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void Modificar(Deporte d)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Deportes SET Nombre = @nombre, Estado = @estado WHERE IdDeporte = @id");
                datos.setearParametro("@nombre", d.Nombre);
                datos.setearParametro("@estado", d.Estado);
                datos.setearParametro("@id", d.IdDeporte);
                datos.ejecutarAccion();
            }
            catch (SqlException ex)
            {
                throw new Exception($"Error SQL al modificar el deporte con ID {d.IdDeporte}.", ex);
            }
            catch
            {
                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void Agregar(Deporte deporte)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Deportes (Nombre, Estado) VALUES (@nombre, @estado)");
                datos.setearParametro("@nombre", deporte.Nombre);
                datos.setearParametro("@estado", deporte.Estado);
                datos.ejecutarAccion();
            }
            catch (SqlException ex)
            {
                throw new Exception("Error SQL al agregar un nuevo deporte.", ex);
            }
            catch
            {
                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
