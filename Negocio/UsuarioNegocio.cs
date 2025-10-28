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
    }
}
