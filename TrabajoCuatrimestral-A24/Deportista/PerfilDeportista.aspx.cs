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
    public partial class PerfilDeportista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            DeportistaNegocio DeportistaNegocio = new DeportistaNegocio();
            Usuario usuario = null;

            if (Seguridad.SessionActivaDeportista(Session["usuarioLogueado"]) == true)
                usuario = (Usuario)Session["usuarioLogueado"];
            else
                Response.Redirect("Error.aspx");

            if(usuario != null)
            {
                Usuario datos = usuarioNegocio.ObtenerPorId(usuario.IdUsuario);
                txtNombre.Text = datos.Nombre;
                txtApellido.Text = datos.Apellido;
                txtPeso.Text = datos.DNI;
                txtProfesorId.Text = datos.Rol.ToString();

                if (datos.FechaNacimiento != null)
                    txtFechaDeNacimiento.Text = datos.FechaNacimiento.Value.ToString("yyyy-MM-dd");

            }

            

        }

        protected void BtnGuardarPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioDeportista.aspx"); 
        }

        protected void BtnConfigraciones_Click(object sender, EventArgs e)
        {
            Response.Redirect("configuraciondelaCuenta.aspx"); 
               
        }
    }
}