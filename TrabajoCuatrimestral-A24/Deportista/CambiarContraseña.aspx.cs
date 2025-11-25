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
    public partial class CambiarContraseña : System.Web.UI.Page
    {
        Usuario usuario = null;
        UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (Seguridad.SessionActivaDeportista(Session["usuarioLogueado"]) == true)
                usuario = (Usuario)Session["usuarioLogueado"];
            else
                Response.Redirect("Error.aspx");

        }

        protected void btnContraseñaGuardar_Click(object sender, EventArgs e)
        {
            lblError.Visible = false;
            lblExito.Visible = false;
            Usuario usuarioLogueado = (Usuario)Session["usuarioLogueado"];
            Usuario UsuarioBD = usuarioNegocio.ObtenerPorId(usuarioLogueado.IdUsuario);
            if( txtContraseñaActual.Text != UsuarioBD.Contrasenia)
            {
                lblError.Text = "La contraseña actual es incorrecta.";
                lblError.Visible = true;
                return;

            }

            if (string.IsNullOrEmpty(txtContraseñaNueva.Text) || string.IsNullOrEmpty(txtRepetir.Text))
            {
                lblError.Text = "Debe completar ambos campos.";
                lblError.Visible = true;
            }
            if(txtContraseñaNueva.Text != txtRepetir.Text)
            {
                lblError.Text = "Las contraseñas no coinciden.";
                lblError.Visible = true;
                return;
            }

            usuarioNegocio.ActualizarContraseña(UsuarioBD.IdUsuario, txtContraseñaNueva.Text);
            
            lblExito.Text = "¡La contraseña se cambió correctamente!";
            lblExito.Visible = true;
            
            txtContraseñaActual.Text = "";
            txtContraseñaNueva.Text = "";
            txtRepetir.Text = "";
            // esto hace que el redirect sea mas lento para poder leer el cartel de exito.
            string script = "setTimeout(function(){ window.location='PerfilDeportista.aspx'; }, 2500);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect", script, true);



        }

        protected void BtnContraseñaCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioDeportista.aspx");
        }
    }
}