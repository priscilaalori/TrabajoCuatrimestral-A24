using Dominio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace Negocio
{
    public class DeportistaNegocio
    {

        public List<Deportista> Listar()
        {

            List<Deportista> lista = new List<Deportista>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT u.IdUsuario, u.Nombre, u.Apellido, u.Email,d.Nombre AS Deporte, e.Nombre + ' ' + e.Apellido AS Entrenador FROM Usuarios u " +
                    "INNER JOIN DeportistaDeportes dd ON dd.IdDeportista = u.IdUsuario INNER JOIN Deportes d ON d.IdDeporte = dd.IdDeporte LEFT JOIN EntrenadoresDeportistas ed ON ed.IdDeportista = u.IdUsuario " +
                    "LEFT JOIN Usuarios e ON e.IdUsuario = ed.IdEntrenador WHERE u.Rol = 'Deportista'");


                datos.ejecutarLectura();


                while (datos.Lector.Read())
                {
                    Deportista dep = new Deportista
                    {
                        IdUsuario = (int)datos.Lector["IdUsuario"],
                        Nombre = (string)datos.Lector["Nombre"],
                        Apellido = (string)datos.Lector["Apellido"],
                        Email = (string)datos.Lector["Email"],
                        Deporte = new List<Deporte> {
                    new Deporte { Nombre = datos.Lector["Deporte"].ToString() }
                },
                        Entrenador = !DBNull.Value.Equals(datos.Lector["Entrenador"])
                            ? new Entrenador { Nombre = datos.Lector["Entrenador"].ToString() }
                            : null
                    };

                    lista.Add(dep);
                }

                return lista;
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

        public void agregar(Deportista nuevoDeportista, int idDeporte)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {

                datos.setearConsulta(@"
                      INSERT INTO Usuarios 
                      (Nombre, Apellido, Email, PasswordHash, Rol, Activo, DNI, FechaNacimiento)
                      VALUES 
                      (@Nombre, @Apellido, @Email, @Contrasenia, 'Deportista', 1, @DNI, @FechaNacimiento);
                      SELECT SCOPE_IDENTITY();");

                datos.setearParametro("@Nombre", nuevoDeportista.Nombre);
                datos.setearParametro("@Apellido", nuevoDeportista.Apellido);
                datos.setearParametro("@Email", nuevoDeportista.Email);
                datos.setearParametro("@Contrasenia", nuevoDeportista.Contrasenia);
                datos.setearParametro("@DNI", nuevoDeportista.DNI ?? (object)DBNull.Value);
                datos.setearParametro("@FechaNacimiento", nuevoDeportista.FechaNacimiento ?? (object)DBNull.Value);

                int idUsuario = Convert.ToInt32(datos.ejecutarEscalar());


                datos.setearConsulta("INSERT INTO DeportistaDeportes (IdDeportista, IdDeporte) VALUES (@IdDeportista, @IdDeporte)");
                datos.setearParametro("@IdDeportista", idUsuario);
                datos.setearParametro("@IdDeporte", idDeporte);
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

        public void AsociarRutinaDepostista(int IdRutina, int IdDeportista)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta("INSERT INTO DeportistaRutinas (IdRutina, IdDeportista) VALUES (@IdRutina, @IdDeportista);");
                accesoDatos.setearParametro("@IdRutina", IdRutina);
                accesoDatos.setearParametro("@IdDeportista", IdDeportista);
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
        public Deportista ObtenerPorId(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            Deportista usuario = null;

            try
            {
                datos.setearConsulta("SELECT IdUsuario, Nombre, Apellido, Email, PasswordHash, Rol, Activo, DNI, TituloHabilitante, FechaNacimiento FROM Usuarios WHERE IdUsuario = @IdUsuario");
                datos.setearParametro("@IdUsuario", id);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    usuario = new Deportista
                    {
                        IdUsuario = Convert.ToInt32(datos.Lector["IdUsuario"]),
                        Nombre = datos.Lector["Nombre"].ToString(),
                        Apellido = datos.Lector["Apellido"].ToString(),
                        Email = datos.Lector["Email"].ToString(),
                        Contrasenia = datos.Lector["PasswordHash"].ToString(),
                        Rol = datos.Lector["Rol"].ToString(),
                        Activo = Convert.ToBoolean(datos.Lector["Activo"]),
                        DNI = datos.Lector["DNI"] != DBNull.Value ? datos.Lector["DNI"].ToString() : null,
                        Titulo = datos.Lector["TituloHabilitante"] != DBNull.Value ? datos.Lector["TituloHabilitante"].ToString() : null,
                        FechaNacimiento = datos.Lector["FechaNacimiento"] != DBNull.Value
                        ? Convert.ToDateTime(datos.Lector["FechaNacimiento"])
                        : (DateTime?)null
                    };
                }

                return usuario;
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

        public Deportista ObtenerPorIdDatosExtendidos(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            Deportista usuario = null;

            try
            {
                datos.setearConsulta(@"
            SELECT u.IdUsuario, u.Nombre, u.Apellido, u.Email, u.PasswordHash, u.Rol, u.Activo,
                   u.DNI, u.TituloHabilitante, u.FechaNacimiento,
                   d.IdDeporte, d.Nombre AS DeporteNombre,
                   e.IdUsuario AS EntrenadorId, e.Nombre + ' ' + e.Apellido AS EntrenadorNombre
            FROM Usuarios u
            LEFT JOIN DeportistaDeportes dd ON dd.IdDeportista = u.IdUsuario
            LEFT JOIN Deportes d ON d.IdDeporte = dd.IdDeporte
            LEFT JOIN EntrenadoresDeportistas ed ON ed.IdDeportista = u.IdUsuario
            LEFT JOIN Usuarios e ON e.IdUsuario = ed.IdEntrenador
            WHERE u.IdUsuario = @IdUsuario
        ");
                datos.setearParametro("@IdUsuario", id);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    usuario = new Deportista
                    {
                        IdUsuario = Convert.ToInt32(datos.Lector["IdUsuario"]),
                        Nombre = datos.Lector["Nombre"].ToString(),
                        Apellido = datos.Lector["Apellido"].ToString(),
                        Email = datos.Lector["Email"].ToString(),
                        Contrasenia = datos.Lector["PasswordHash"]?.ToString(),
                        Rol = datos.Lector["Rol"].ToString(),
                        Activo = datos.Lector["Activo"] != DBNull.Value ? Convert.ToBoolean(datos.Lector["Activo"]) : true,
                        DNI = datos.Lector["DNI"] != DBNull.Value ? datos.Lector["DNI"].ToString() : null,
                        Titulo = datos.Lector["TituloHabilitante"] != DBNull.Value ? datos.Lector["TituloHabilitante"].ToString() : null,
                        FechaNacimiento = datos.Lector["FechaNacimiento"] != DBNull.Value
                            ? Convert.ToDateTime(datos.Lector["FechaNacimiento"])
                            : (DateTime?)null,
                        Deporte = (datos.Lector["IdDeporte"] != DBNull.Value)
                            ? new List<Deporte> { new Deporte { IdDeporte = Convert.ToInt32(datos.Lector["IdDeporte"]), Nombre = datos.Lector["DeporteNombre"].ToString() } }
                            : new List<Deporte>()
                    };

                    if (datos.Lector["EntrenadorId"] != DBNull.Value)
                    {
                        usuario.Entrenador = new Entrenador
                        {
                            IdUsuario = Convert.ToInt32(datos.Lector["EntrenadorId"]),
                            Nombre = datos.Lector["EntrenadorNombre"].ToString()
                        };
                    }
                }

                return usuario;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public Deporte ObtenerDeportePrincipal(int idDeportista)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                                        SELECT TOP 1 D.IdDeporte, D.Nombre
                                        FROM DeportistaDeportes DD
                                        INNER JOIN Deportes D ON D.IdDeporte = DD.IdDeporte
                                        WHERE DD.IdDeportista = @dep");

                datos.setearParametro("@dep", idDeportista);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    return new Deporte
                    {
                        IdDeporte = (int)datos.Lector["IdDeporte"],
                        Nombre = datos.Lector["Nombre"].ToString()
                    };
                }

                return null;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<Deportista> ListarSinEntrenador()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Deportista> lista = new List<Deportista>();

            try
            {
                datos.setearConsulta(
                    "SELECT u.IdUsuario, u.Nombre, u.Apellido, u.Email, u.DNI, u.FechaNacimiento " +
                    "FROM Usuarios u " +
                    "WHERE u.Rol = 'Deportista' AND NOT EXISTS (" +
                        "SELECT 1 FROM EntrenadoresDeportistas ed " +
                        "WHERE ed.IdDeportista = u.IdUsuario)"
                );

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Deportista dep = new Deportista();

                    dep.IdUsuario = (int)datos.Lector["IdUsuario"];
                    dep.Nombre = datos.Lector["Nombre"].ToString();
                    dep.Apellido = datos.Lector["Apellido"].ToString();
                    dep.Email = datos.Lector["Email"].ToString();
                    dep.DNI = datos.Lector["DNI"] != DBNull.Value ? datos.Lector["DNI"].ToString() : null;
                    dep.FechaNacimiento = datos.Lector["FechaNacimiento"] != DBNull.Value
                        ? (DateTime)datos.Lector["FechaNacimiento"]
                        : (DateTime?)null;

                    lista.Add(dep);
                }

                return lista;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void AsignarATodosLosDeportistasSinAsignar()
        {
            DeportistaNegocio depNeg = new DeportistaNegocio();
            EntrenadorNegocio entrenadorNegocio = new EntrenadorNegocio();
            List<Deportista> listaSinEntrenador = depNeg.ListarSinEntrenador();

            foreach (var dep in listaSinEntrenador)
            {
                try
                {
                    // Obtener datos extendidos del deportista (deporte)
                    Deportista deportista = depNeg.ObtenerPorIdDatosExtendidos(dep.IdUsuario);
                    if (deportista == null) continue;

                    var deporte = deportista.Deporte?.FirstOrDefault();
                    if (deporte == null) continue; 

                    int idDeporte = deporte.IdDeporte;

                    // Obtener el entrenador con menos alumnos para ese deporte
                    Entrenador entrenador = entrenadorNegocio.ObtenerEntrenadorConMenosAlumnos(idDeporte);

                    if (entrenador == null)
                        continue; 

                   
                    entrenadorNegocio.AsignarProfesorADeportista(deportista.IdUsuario, entrenador.IdUsuario);
                }
                catch
                {
                    
                    continue;
                }
            }
        }





    }

}
