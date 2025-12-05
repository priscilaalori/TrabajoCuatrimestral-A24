using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ProcesoNegocio

    {
        
        
        public void Agregar(int idUsuario, int idRutina, int idEjercicio, DateTime fecha, bool hecho)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(
                    "INSERT INTO RutinaEjercicioProgreso (IdUsuario, IdRutina, IdEjercicio, Fecha, Hecho) " +
                    "VALUES (@IdUsuario, @IdRutina, @IdEjercicio, @Fecha, @Hecho)"
                );

                datos.setearParametro("@IdUsuario", idUsuario);
                datos.setearParametro("@IdRutina", idRutina);
                datos.setearParametro("@IdEjercicio", idEjercicio);
                datos.setearParametro("@Fecha", fecha);
                datos.setearParametro("@Hecho", hecho);

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

        public void Actualizar(int idUsuario, int idRutina, int idEjercicio, DateTime fecha, bool hecho)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(
                    "UPDATE RutinaEjercicioProgreso " +
                    "SET Hecho = @Hecho " +
                    "WHERE IdUsuario = @IdUsuario AND IdRutina = @IdRutina AND IdEjercicio = @IdEjercicio AND Fecha = @Fecha"
                );

                datos.setearParametro("@IdUsuario", idUsuario);
                datos.setearParametro("@IdRutina", idRutina);
                datos.setearParametro("@IdEjercicio", idEjercicio);
                datos.setearParametro("@Fecha", fecha);
                datos.setearParametro("@Hecho", hecho);

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


        public bool ExisteRegistro(int idUsuario, int idRutina, int idEjercicio, DateTime fecha)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(
                    "SELECT COUNT(*) as Cantidad FROM RutinaEjercicioProgreso " +
                    "WHERE IdUsuario = @IdUsuario AND IdRutina = @IdRutina AND IdEjercicio = @IdEjercicio AND Fecha = @Fecha"
                );

                datos.setearParametro("@IdUsuario", idUsuario);
                datos.setearParametro("@IdRutina", idRutina);
                datos.setearParametro("@IdEjercicio", idEjercicio);
                datos.setearParametro("@Fecha", fecha);

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    int cantidad = (int)datos.Lector["Cantidad"];
                    return cantidad > 0;
                }

                return false;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}

    




