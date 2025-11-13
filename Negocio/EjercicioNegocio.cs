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
                datos.setearConsulta("select idEjercicio , Nombre , Descripcion, UrlVideo From Ejercicios WHERE Estado = 1");
                datos.ejecutarLectura();


                while (datos.Lector.Read())
                {
                    Ejercicio Ejercicio = new Ejercicio();
                    Ejercicio.IdEjercicio = (int)datos.Lector["IdEjercicio"];
                  
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
        public void agregar(Ejercicio nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {

                datos.setearConsulta("insert into Ejercicios ( Nombre , Descripcion, UrlVideo) values (@Nombre, @Descripcion, @UrlVideo)");
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Descripcion", nuevo.Descripcion);
                datos.setearParametro("@UrlVideo", nuevo.UrlVideo);
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

        public void Modificar(Ejercicio ejercicio)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {


                accesoDatos.setearConsulta("UPDATE Ejercicios SET Nombre = @Nombre, Descripcion = @Descripcion, UrlVideo = @UrlVideo WHERE IdEjercicio = @IdEjercicio");
                accesoDatos.setearParametro("@Nombre", ejercicio.Nombre);
                accesoDatos.setearParametro("@Descripcion", ejercicio.Descripcion);
                accesoDatos.setearParametro("@UrlVideo", ejercicio.UrlVideo);
                accesoDatos.setearParametro("@IdEjercicio", ejercicio.IdEjercicio);
                accesoDatos.ejecutarAccion();

                accesoDatos.cerrarConexion();




            }
            catch (Exception ex)
            {

                throw ex;
            }

        }


        public Ejercicio obtenerPorId(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            Ejercicio ejercicio = new Ejercicio();

            datos.setearConsulta("SELECT Nombre, Descripcion, UrlVideo FROM Ejercicios WHERE IdEjercicio = @IdEjercicio");
            datos.setearParametro("@IdEjercicio", id);
            datos.ejecutarLectura();

            if (datos.Lector.Read())
            {
                ejercicio.IdEjercicio = id;
                ejercicio.Nombre = datos.Lector["Nombre"].ToString();
                ejercicio.Descripcion = datos.Lector["Descripcion"].ToString();
                ejercicio.UrlVideo = datos.Lector["UrlVideo"].ToString();
            }

            datos.cerrarConexion();
            return ejercicio;
        }
        public void Eliminar(int id)
        {

            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta("Update Ejercicios set Estado = 0 where idEjercicio = @IdEjercicio");

                accesoDatos.setearParametro("@IdEjercicio", id);

                accesoDatos.ejecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        
        public List<Ejercicio> ListarEjerciciosDisponibles(int idRutina)
        {
            List<Ejercicio> listaEjercicios = new List<Ejercicio>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT e.IdEjercicio, e.Nombre, e.Descripcion, e.UrlVideo FROM Ejercicios e WHERE e.Estado = 1 AND e.IdEjercicio NOT IN (SELECT IdEjercicio FROM RutinaEjercicios WHERE idRutina = @idRutina);");
                datos.setearParametro("@idRutina", idRutina);
                datos.ejecutarLectura();


                while (datos.Lector.Read())
                {
                    Ejercicio Ejercicio = new Ejercicio();
                    Ejercicio.IdEjercicio = (int)datos.Lector["IdEjercicio"];

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


    

