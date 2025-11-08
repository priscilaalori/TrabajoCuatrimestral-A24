using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class RutinaNegocio
    {
        public List<Rutina> Listar()
        {
            List<Rutina> listaRutinas = new List<Rutina>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select R.IdRutina, R.IdEntrenador, R.IdDeporte, D.Nombre as Deporte, R.Nombre, R.Nivel, R.Descripcion, R.FechaCreacion, R.FechaInicio,R.FechaFin from Rutinas R inner join Deportes D on D.IdDeporte = R.IdDeporte");
                datos.ejecutarLectura();


                while (datos.Lector.Read())
                {
                    Rutina rutinaAuxiliar = new Rutina();
                    rutinaAuxiliar.IdRutina = (int)datos.Lector["IdRutina"];
                   // rutinaAuxiliar.IdEntrenador = (int)datos.Lector["IdEntrenador"];
                    rutinaAuxiliar.Nombre = (string)datos.Lector["Nombre"];
                    rutinaAuxiliar.Nivel = (string)datos.Lector["Nivel"];
                    rutinaAuxiliar.Descripcion = (string)datos.Lector["Descripcion"];
                    rutinaAuxiliar.FechaCreacion = (DateTime)datos.Lector["FechaCreacion"];
                    rutinaAuxiliar.FechaInicio = (DateTime)datos.Lector["FechaInicio"];
                    rutinaAuxiliar.FechaFin = (DateTime)datos.Lector["FechaFin"];

                    rutinaAuxiliar.Deporte = new Deporte();

                    rutinaAuxiliar.Deporte.IdDeporte = (int)datos.Lector["IdDeporte"];
                    rutinaAuxiliar.Deporte.Nombre = (string)datos.Lector["Deporte"];


                    //deportistaAuxiliar.IdUsuario = (int)datos.Lector["IdUsuario"];
                    //deportistaAuxiliar.Nombre = (string)datos.Lector["Nombre"];
                    //deportistaAuxiliar.Apellido = (string)datos.Lector["Apellido"];

                   listaRutinas.Add(rutinaAuxiliar);
                }

                return listaRutinas;
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

        public void Agregar(Rutina rutina)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearProcedimiento("sp_AgregarRutina");
                
                accesoDatos.setearParametro("@IdEntrenador", 1);
                accesoDatos.setearParametro("@IdDeporte", rutina.Deporte.IdDeporte);
                accesoDatos.setearParametro("@Nombre", rutina.Nombre);
                accesoDatos.setearParametro("@Nivel", rutina.Nivel);
                accesoDatos.setearParametro("@Descripcion", rutina.Descripcion);
                accesoDatos.setearParametro("@FechaInicio", rutina.FechaInicio);
                accesoDatos.setearParametro("@FechaFin", rutina.FechaFin);


                accesoDatos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        public void ModificarSP(Rutina rutina)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearProcedimiento("sp_ModificarRutina");

                accesoDatos.setearParametro("@IdRutina", rutina.IdRutina);
                accesoDatos.setearParametro("@IdDeporte", rutina.Deporte.IdDeporte);
                accesoDatos.setearParametro("@Nombre", rutina.Nombre);
                accesoDatos.setearParametro("@Nivel", rutina.Nivel);
                accesoDatos.setearParametro("@Descripcion", rutina.Descripcion);
                accesoDatos.setearParametro("@FechaInicio", rutina.FechaInicio);
                accesoDatos.setearParametro("@FechaFin", rutina.FechaFin);


                accesoDatos.ejecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

    }

  
}

