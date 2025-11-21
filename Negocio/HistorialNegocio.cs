using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class HistorialNegocio
    {
        public void agregar(Dominio.Historial nuevo, int idRutina)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("insert into Historial ( IdRutina , FechaRegistro, Completado, Sensacion, Esfuerzo, Comentario) values (@IdRutina, @FechaRegistro, @Completado, @Sensacion, @Esfuerzo, @Comentario)");
                datos.setearParametro("@IdRutina", idRutina);
                datos.setearParametro("@FechaRegistro", nuevo.FechaRegistro);
                datos.setearParametro("@Completado", nuevo.Completado);
                datos.setearParametro("@Sensacion", nuevo.Sensacion);
                datos.setearParametro("@Esfuerzo", nuevo.Esfuerzo);
                datos.setearParametro("@Comentario", nuevo.Comentario);
                datos.ejecutarAccion();
                datos.cerrarConexion();
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
