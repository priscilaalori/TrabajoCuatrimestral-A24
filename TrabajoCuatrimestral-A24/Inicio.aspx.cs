using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrabajoCuatrimestral
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblMensaje.Text = "Debe ingresar email y contraseña.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario usuario = negocio.IniciarSesion(email, password);

            if (usuario != null)
            {
                // Guardar datos del usuario en sesión
                Session["UsuarioLogueado"] = usuario;
                Session["Nombre"] = usuario.Nombre;
                Session["Rol"] = usuario.Rol;

                // Redirección según rol
                switch (usuario.Rol)
                {
                    case "Deportista":
                        Response.Redirect("InicioDeportista.aspx");
                        break;
                    case "Profesor":
                        Response.Redirect("InicioEntrenador.aspx");
                        break;
                    case "Administrador":
                        Response.Redirect("InicioAdmin.aspx");
                        break;
                    default:
                        lblMensaje.Text = "Rol desconocido";
                        break;
                }
                //  Response.Redirect("Inicio.aspx");
            }
            else
            {
                lblMensaje.Text = "Email o contraseña incorrectos.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}