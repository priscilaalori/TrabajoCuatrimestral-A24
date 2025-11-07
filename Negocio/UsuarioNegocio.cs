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
                datos.setearConsulta("SELECT IdUsuario, Nombre, Apellido, Email, Rol FROM Usuarios WHERE Activo = 1");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario u = new Usuario
                    {
                        IdUsuario = Convert.ToInt32(datos.Lector["IdUsuario"]),
                        Nombre = datos.Lector["Nombre"].ToString(),
                        Apellido = datos.Lector["Apellido"].ToString(),
                        Email = datos.Lector["Email"].ToString(),
                        Rol = datos.Lector["Rol"].ToString()
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
                datos.setearConsulta("SELECT IdUsuario, Nombre, Apellido, Email, PasswordHash, Rol FROM Usuarios WHERE IdUsuario = @IdUsuario");
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

        public void ModificarUsuario(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string query = "UPDATE Usuarios SET Nombre = @Nombre, Apellido = @Apellido, Email = @Email";

                if (!string.IsNullOrEmpty(usuario.Contrasenia))
                    query += ", PasswordHash = @PasswordHash";

                query += " WHERE IdUsuario = @IdUsuario";

                datos.setearConsulta(query);
                datos.setearParametro("@Nombre", usuario.Nombre);
                datos.setearParametro("@Apellido", usuario.Apellido);
                datos.setearParametro("@Email", usuario.Email);
                datos.setearParametro("@IdUsuario", usuario.IdUsuario);

                //Si pusieron algo en el campo contraseña modificamos el campo en la bdd
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


    }
}
