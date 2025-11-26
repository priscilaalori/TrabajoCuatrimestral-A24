using Dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class HistorialNegocio
    {
        public void agregar(Dominio.Historial nuevo, int idRutina, int idUsuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("insert into Historial ( IdRutina , FechaRegistro, Completado, Sensacion, Esfuerzo, Comentario, IdUsuario) values (@IdRutina, @FechaRegistro, @Completado, @Sensacion, @Esfuerzo, @Comentario, @IdUsuario)");
                datos.setearParametro("@IdRutina", idRutina);
                datos.setearParametro("@FechaRegistro", nuevo.FechaRegistro);
                datos.setearParametro("@Completado", nuevo.Completado);
                datos.setearParametro("@Sensacion", nuevo.Sensacion);
                datos.setearParametro("@Esfuerzo", nuevo.Esfuerzo);
                datos.setearParametro("@Comentario", nuevo.Comentario);
                datos.setearParametro("@IdUsuario", idUsuario);
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (SqlException sqlEx)
            {
                throw new HistorialException("Error al registrar el historial. Verifica que la rutina y el usuario existan.", sqlEx);
            }
            catch (Exception ex)
            {
                throw new HistorialException("Ocurrió un error inesperado al guardar el historial.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public class HistorialException : Exception
        {
            public HistorialException(string mensaje, Exception inner = null)
                : base(mensaje, inner)
            {
            }
        }

        public Dominio.Historial ObtenerHistorial(int idUsuario, int idRutina)
        {
            AccesoDatos datos = new AccesoDatos();
            Dominio.Historial nuevoHistorial= null;


            try
            {
                datos.setearConsulta("  select Completado, Sensacion, Esfuerzo, Comentario, FechaRegistro from Historial " +
                    "where IdRutina = @IdRutina and IdUsuario = @IdUsuario;");
                datos.setearParametro("@IdRutina", idRutina);
                datos.setearParametro("@IdUsuario", idUsuario);

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    nuevoHistorial = new Dominio.Historial
                    {
                        Completado = Convert.ToBoolean(datos.Lector["Completado"]),
                        Sensacion = Convert.ToInt32(datos.Lector["Sensacion"]),
                        Esfuerzo = Convert.ToInt32(datos.Lector["Esfuerzo"]),
                        Comentario = datos.Lector["Comentario"].ToString()
                    };
                }

               
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }



            return nuevoHistorial;
        }

        
    }
}
