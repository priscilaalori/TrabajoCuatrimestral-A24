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
            if (!IsPostBack)
            {
                if (Session["Mensaje"] != null)
                {
                    lblMensaje.Text = Session["Mensaje"].ToString();
                    lblMensaje.ForeColor = System.Drawing.Color.FromName(Session["ColorMensaje"].ToString());

                    // limpiar para que no se repita al refrescar
                    Session.Remove("Mensaje");
                    Session.Remove("ColorMensaje");
                }
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                lblMensaje.Text = "Debe ingresar email ";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            //Acá se genera el login 

            Usuario usuario;
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            
            usuario = usuarioNegocio.IniciarSesion(email,password);

            Session.Add("usuarioLogueado", usuario);

            switch (usuario.Rol)
            {
                case TipoUsuario.DEPORTISTA:
                    Response.Redirect("Deportista/InicioDeportista.aspx");
                    break;
                case TipoUsuario.ENTRENADOR:
                    Response.Redirect("Entrenador/InicioEntrenador.aspx");
                    break;
                case TipoUsuario.ADMIN:
                    Response.Redirect("InicioAdmin.aspx");
                    break;
                default:
                    lblMensaje.Text = "Rol desconocido";
                    break;
            }
        }
    }
}