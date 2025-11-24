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

            DeportistaNegocio DeportistaNegocio = new DeportistaNegocio();
            Usuario usuario = null;

            if (Seguridad.SessionActivaDeportista(Session["usuarioLogueado"]) == true)
                usuario = (Usuario)Session["usuarioLogueado"];
            else
                Response.Redirect("Error.aspx");

            if(usuario != null)
            {

            }

            

        }

        protected void BtnGuardarPerfil_Click(object sender, EventArgs e)
        {

        }

        protected void BtnConfigraciones_Click(object sender, EventArgs e)
        {
            Response.Redirect("configuraciondelaCuenta.aspx"); 
               
        }
    }
}