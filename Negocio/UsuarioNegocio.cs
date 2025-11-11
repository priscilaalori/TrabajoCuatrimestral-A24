using Dominio;
using System;
using System.Collections.Generic;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public Usuario IniciarSesion(string email, string password)
        {
            AccesoDatos datos = new AccesoDatos();
            Usuario usuario = null;

            try
            {
                datos.setearConsulta("SELECT IdUsuario, Nombre, Apellido, Rol FROM Usuarios WHERE Email = @Email AND PasswordHash = @Password AND Activo = 1");
                datos.setearParametro("@Email", email);
                datos.setearParametro("@Password", password);

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    usuario = new Usuario
                    {
                        IdUsuario = Convert.ToInt32(datos.Lector["IdUsuario"]),
                        Nombre = datos.Lector["Nombre"].ToString(),
                        Apellido = datos.Lector["Apellido"].ToString(),
                        Rol = datos.Lector["Rol"].ToString()
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

        public List<Usuario> ListarUsuarios()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Usuario> usuarios = new List<Usuario>();

            try
            {

                //datos.setearConsulta("SELECT IdUsuario, Nombre, Apellido, Email, Rol FROM Usuarios WHERE Activo = 1");
                datos.setearConsulta("SELECT IdUsuario, Nombre, Apellido, Email, Rol, Activo, DNI, TituloHabilitante, FechaNacimiento FROM Usuarios ");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario u = new Usuario
                    {
                        IdUsuario = Convert.ToInt32(datos.Lector["IdUsuario"]),
                        Nombre = datos.Lector["Nombre"].ToString(),
                        Apellido = datos.Lector["Apellido"].ToString(),
                        Email = datos.Lector["Email"].ToString(),
                        Rol = datos.Lector["Rol"].ToString(),
                        Activo = (bool)datos.Lector["Activo"],
                        DNI = datos.Lector["DNI"] != DBNull.Value ? datos.Lector["DNI"].ToString() : null,
                        Titulo = datos.Lector["TituloHabilitante"] != DBNull.Value ? datos.Lector["TituloHabilitante"].ToString() : null,
                        FechaNacimiento = datos.Lector["FechaNacimiento"] != DBNull.Value
                        ? Convert.ToDateTime(datos.Lector["FechaNacimiento"])
                        : (DateTime?)null

                    };
                    usuarios.Add(u);
                }

                return usuarios;
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

        public Usuario ObtenerPorId(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            Usuario usuario = null;

            try
            {
                datos.setearConsulta("SELECT IdUsuario, Nombre, Apellido, Email, PasswordHash, Rol, Activo, DNI, TituloHabilitante, FechaNacimiento FROM Usuarios WHERE IdUsuario = @IdUsuario");
                datos.setearParametro("@IdUsuario", id);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    usuario = new Usuario
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

        public void ModificarUsuario(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string query = "UPDATE Usuarios SET Nombre = @Nombre, Apellido = @Apellido, Email = @Email, DNI = @DNI, FechaNacimiento = @FechaNacimiento";

                if (usuario.Rol == "Entrenador")
                    query += ", TituloHabilitante = @TituloHabilitante";

                if (!string.IsNullOrEmpty(usuario.Contrasenia))
                    query += ", PasswordHash = @PasswordHash";

                query += " WHERE IdUsuario = @IdUsuario";

                datos.setearConsulta(query);
                datos.setearParametro("@Nombre", usuario.Nombre);
                datos.setearParametro("@Apellido", usuario.Apellido);
                datos.setearParametro("@Email", usuario.Email);
                datos.setearParametro("@DNI", usuario.DNI);
                datos.setearParametro("@FechaNacimiento", usuario.FechaNacimiento);

                if (usuario.Rol == "Entrenador")
                    datos.setearParametro("@TituloHabilitante", usuario.Titulo);

                datos.setearParametro("@IdUsuario", usuario.IdUsuario);

                // Si el usuario ingresó una nueva contraseña, se actualiza
                if (!string.IsNullOrEmpty(usuario.Contrasenia))
                    datos.setearParametro("@PasswordHash", usuario.Contrasenia);

                datos.ejecutarAccion();
            }
            finally
            {
                datos.cerrarConexion();
            }


        }

        public void EliminarUsuarioLogico(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Usuarios SET Activo = 0 WHERE IdUsuario = @IdUsuario");
                datos.setearParametro("@IdUsuario", id);
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

        public void ActivarUsuarioLogico(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Usuarios SET Activo = 1 WHERE IdUsuario = @IdUsuario");
                datos.setearParametro("@IdUsuario", id);
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

        public void RegistrarUsuario(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string query = @"INSERT INTO Usuarios 
                        (Nombre, Apellido, Email, PasswordHash, Rol, Activo, DNI, TituloHabilitante, FechaNacimiento)
                        VALUES (@Nombre, @Apellido, @Email, @PasswordHash, @Rol, @Activo, @DNI, @TituloHabilitante, @FechaNacimiento)";

                datos.setearConsulta(query);

                datos.setearParametro("@Nombre", usuario.Nombre);
                datos.setearParametro("@Apellido", usuario.Apellido);
                datos.setearParametro("@Email", usuario.Email);
                datos.setearParametro("@PasswordHash", usuario.Contrasenia);
                datos.setearParametro("@Rol", usuario.Rol);
                datos.setearParametro("@Activo", usuario.Activo);
                datos.setearParametro("@DNI", (object)usuario.DNI ?? DBNull.Value);
                datos.setearParametro("@TituloHabilitante", (object)usuario.Titulo ?? DBNull.Value);
                datos.setearParametro("@FechaNacimiento", (object)usuario.FechaNacimiento ?? DBNull.Value);

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


    }
}
