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
    public partial class InicioAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.SessionActivaAdmin(Session["usuarioLogueado"]))
            {
                Session["Error"] = "No tenés permiso para acceder a esta sección.";
                Response.Redirect("Error.aspx");
                return;
            }

            Usuario usuario = (Usuario)Session["usuarioLogueado"];

            lblMensaje.Text = "Bienvenido " + usuario.Nombre;

        }
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Inicio.aspx");
        }

    }
}