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
    }
}
