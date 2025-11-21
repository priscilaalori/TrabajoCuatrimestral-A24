using System;
using System.CodeDom;
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
                datos.setearConsulta("select R.IdRutina, R.IdEntrenador, R.IdDeporte, D.Nombre as Deporte, R.Nombre, R.Nivel, R.Descripcion, R.FechaCreacion, R.FechaInicio,R.FechaFin from Rutinas R inner join Deportes D on D.IdDeporte = R.IdDeporte where Activa = 1");
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

        public List<Rutina> ListarRutinasDeUsuarioPorDeporte(int IdDeportista, int IdDeporte)
        {
            List<Rutina> Listarutinas = new List<Rutina>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT r.IdRutina, r.Nombre AS NombreRutina, r.Nivel, r.Descripcion AS DescripcionRutina, r.FechaCreacion, r.FechaInicio, r.FechaFin,  " +
               "e.IdEjercicio, e.Nombre AS NombreEjercicio, e.Descripcion AS DescripcionEjercicio, e.UrlVideo, e.Estado " +
               "FROM DeportistaRutinas dr " +
               "INNER JOIN Rutinas r ON dr.IdRutina = r.IdRutina " +
               "INNER JOIN RutinaEjercicios re ON r.IdRutina = re.IdRutina " +
               "INNER JOIN Ejercicios e ON re.IdEjercicio = e.IdEjercicio " +
               "WHERE dr.IdDeportista = @IdDeportista AND r.IdDeporte = @IdDeporte");

                datos.setearParametro("@IdDeportista", IdDeportista);
                datos.setearParametro("@IdDeporte", IdDeporte);
                datos.ejecutarLectura();


                while (datos.Lector.Read())
                {
                    int idRutina = (int)datos.Lector["IdRutina"];

                    Rutina rutina = Listarutinas.FirstOrDefault(r => r.IdRutina == idRutina);

                    if (rutina == null)
                    {
                        rutina = new Rutina
                        {
                            IdRutina = idRutina,
                            Nombre = datos.Lector["NombreRutina"].ToString(),
                            Nivel = datos.Lector["Nivel"].ToString(),
                            Descripcion = datos.Lector["DescripcionRutina"].ToString(),
                            FechaCreacion = (DateTime)datos.Lector["FechaCreacion"],
                            FechaInicio = (DateTime)datos.Lector["FechaInicio"],
                            FechaFin = (DateTime)datos.Lector["FechaFin"],
                            Ejercicios = new List<Ejercicio>()
                        };

                        Listarutinas.Add(rutina);
                    }

                    Ejercicio ejercicio = new Ejercicio
                    {
                        IdEjercicio = (int)datos.Lector["IdEjercicio"],
                        Nombre = datos.Lector["NombreEjercicio"].ToString(),
                        Descripcion = datos.Lector["DescripcionEjercicio"].ToString(),
                        UrlVideo = datos.Lector["UrlVideo"].ToString(),

                    };

                    rutina.Ejercicios.Add(ejercicio);
                }

                return Listarutinas;
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

        public Rutina ListarRutinaDelDiaDeUsuarioPorDeporte(int IdDeportista, int IdDeporte, DateTime fechaHoy)
        {
            Rutina rutina = null; 
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT r.IdRutina, r.Nombre AS NombreRutina, r.Nivel, r.Descripcion AS DescripcionRutina, r.FechaCreacion, " +
                   "e.IdEjercicio, e.Nombre AS NombreEjercicio, e.Descripcion AS DescripcionEjercicio, e.UrlVideo, e.Estado " +
                   "FROM DeportistaRutinas dr " +
                   "INNER JOIN Rutinas r ON dr.IdRutina = r.IdRutina " +
                   "INNER JOIN RutinaEjercicios re ON r.IdRutina = re.IdRutina " +
                   "INNER JOIN Ejercicios e ON re.IdEjercicio = e.IdEjercicio " +
                   "WHERE dr.IdDeportista = @IdDeportista AND r.IdDeporte = @IdDeporte AND r.FechaInicio = @fechaInicio");

                datos.setearParametro("@IdDeportista", IdDeportista);
                datos.setearParametro("@IdDeporte", IdDeporte);
                datos.setearParametro("@fechaInicio", fechaHoy);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    int idRutina = (int)datos.Lector["IdRutina"];

                    if (rutina == null)
                    {
                        rutina = new Rutina
                        {
                            IdRutina = idRutina,
                            Nombre = datos.Lector["NombreRutina"].ToString(),
                            Nivel = datos.Lector["Nivel"].ToString(),
                            Descripcion = datos.Lector["DescripcionRutina"].ToString(),
                            FechaCreacion = (DateTime)datos.Lector["FechaCreacion"],
                            Ejercicios = new List<Ejercicio>()
                        };
                    }

                    rutina.Ejercicios.Add(new Ejercicio
                    {
                        IdEjercicio = (int)datos.Lector["IdEjercicio"],
                        Nombre = datos.Lector["NombreEjercicio"].ToString(),
                        Descripcion = datos.Lector["DescripcionEjercicio"].ToString(),
                        UrlVideo = datos.Lector["UrlVideo"].ToString()
                    });
                }

                return rutina;
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


        public List<Ejercicio> ListarEjericiosRutina(int idRutina)
        {
            List<Ejercicio> listaEjercicios = new List<Ejercicio>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearParametro("@IdRutina", idRutina);
                datos.setearConsulta("select E.IdEjercicio, E.Nombre, E.Descripcion, E.UrlVideo from Ejercicios E inner join RutinaEjercicios RE on E.IdEjercicio = RE.IdEjercicio where RE.IdRutina = @IdRutina");

                datos.ejecutarLectura();


                while (datos.Lector.Read())
                {
                    Ejercicio ejercicioAuxiliar = new Ejercicio();
                    ejercicioAuxiliar.IdEjercicio = (int)datos.Lector["IdEjercicio"];
                    ejercicioAuxiliar.Nombre = (string)datos.Lector["Nombre"];
                    ejercicioAuxiliar.Descripcion = (string)datos.Lector["Descripcion"];
                    ejercicioAuxiliar.UrlVideo = (string)datos.Lector["UrlVideo"];



                    listaEjercicios.Add(ejercicioAuxiliar);
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

        public List<Rutina> ListarRutinasPorDeportista(int idDeportista)
        {

            List<Rutina> listaRutinas = new List<Rutina>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select R.IdRutina, R.IdEntrenador, R.IdDeporte, D.Nombre as Deporte, R.Nombre, R.Nivel, R.Descripcion, R.FechaCreacion, R.FechaInicio,R.FechaFin from Rutinas R inner join Deportes D on D.IdDeporte = R.IdDeporte inner join DeportistaRutinas DR on DR.IdRutina = R.IdRutina where R.Activa = 1 and DR.IdDeportista = @idDeportista");
                datos.setearParametro("@idDeportista", idDeportista);
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
                // Acá se envia como idEntrenador 1 pero se tiene que ajustar a quien esté logueado. 
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

        public void Eliminar(int idRutina)
        {

            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta("Update Rutinas set Activa = 0 where idRutina = @IdRutina");

                accesoDatos.setearParametro("@IdRutina", idRutina);

                accesoDatos.ejecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void EliminarEjercicioRutina(int idRutina, int idEjercicio)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta("DELETE FROM RutinaEjercicios WHERE IdRutina = @IdRutina AND IdEjercicio = @IdEjercicio;");

                accesoDatos.setearParametro("@IdRutina", idRutina);
                accesoDatos.setearParametro("@IdEjercicio", idEjercicio);

                accesoDatos.ejecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void AgregarEjercicioRutina(int idRutina, int idEjercicio)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta("Insert into RutinaEjercicios(IdRutina, IdEjercicio) values(@IdRutina, @IdEjercicio)");
                accesoDatos.setearParametro("@IdRutina", idRutina);
                accesoDatos.setearParametro("@IdEjercicio", idEjercicio);

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
    }

}

