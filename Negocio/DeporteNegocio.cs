using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Negocio;

namespace Negocio
{
    public  class DeporteNegocio
    {

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
            catch (Exception ex)
            {
                throw ex;
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
            catch (Exception ex)
            {
                throw ex;
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
            catch (Exception ex)
            {
                throw ex;
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
            catch (Exception ex)
            {
                throw ex;
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
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
