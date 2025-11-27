using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_24A.Deportista
{
    public partial class ConfiguraciondelaCuenta : System.Web.UI.Page
    {
        Usuario usuario = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            //Acá debería preguntar si es deportista o entrenador para que traiga datos distinos. 

            if (Seguridad.SessionActivaDeportista(Session["usuarioLogueado"]) == true || Seguridad.SessionActivaEntrenador(Session["usuarioLogueado"]) == true)
                usuario = (Usuario)Session["usuarioLogueado"];
            else
                Response.Redirect("Error.aspx");

            if (usuario != null)
            {
                Usuario datos = usuarioNegocio.ObtenerPorId(usuario.IdUsuario);
                txtMail.Text = datos.Email;

            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        protected void Btnvolver_Click(object sender, EventArgs e)
        {
            //Acá deberá preguntar quien tiene la sesión abierta

            var usuario = Session["usuarioLogueado"] as Usuario;
            if (usuario == null)
            {
                Response.Redirect("Error.aspx");

                return;
            }

            if (usuario.Rol == "Deportista")
            {
                Response.Redirect("PerfilDeportista.aspx");

            }
            else if (usuario.Rol  == "Entrenador")
            {
                Response.Redirect("~/Entrenador/InicioEntrenador.aspx");
            }

        }

        protected void btnGuardarPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("CambiarContraseña.aspx");
        }
    }
}