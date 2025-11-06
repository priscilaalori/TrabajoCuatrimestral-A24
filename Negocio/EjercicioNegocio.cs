using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class EjercicioNegocio
    {


        public List<Ejercicio> Listar()
        {
            List<Ejercicio> listaEjercicios = new List<Ejercicio>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select idEjercicio , Nombre , Descripcion, UrlVideo From Ejercicios");
                datos.ejecutarLectura();


                while (datos.Lector.Read())
                {
                    Ejercicio Ejercicio = new Ejercicio();
                   Ejercicio.IdEjercicio = (int)datos.Lector["IdEjercicio"];
                    // rutinaAuxiliar.IdEntrenador = (int)datos.Lector["IdEntrenador"];//  que es esto?
                    Ejercicio.Nombre = (string)datos.Lector["Nombre"];
                    Ejercicio.Descripcion = (string)datos.Lector["Descripcion"];
                    Ejercicio.UrlVideo = (string)datos.Lector["UrlVideo"];
                   



                    

                    listaEjercicios.Add(Ejercicio);
                }

                return listaEjercicios;
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

