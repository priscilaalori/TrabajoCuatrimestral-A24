using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_24A
{
    public partial class AgregarEjercicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = null;

            if (Seguridad.SessionActivaEntrenador(Session["usuarioLogueado"]) == true)
                usuario = (Usuario)Session["usuarioLogueado"];
            else
                Response.Redirect("Error.aspx");
        }
        protected void btnGuardarEjercicio_click(object sender, EventArgs e)
        {
            Ejercicio nuevo = new Ejercicio();
            EjercicioNegocio ejercicioNegocio = new EjercicioNegocio(); 

            if (string.IsNullOrWhiteSpace(txtNombre.Text)||
                string.IsNullOrWhiteSpace(txtDescipcion.Text))
                {
                lblMensaje.Text = "El nombre y la descripcion son obligatorios.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            nuevo.Nombre= txtNombre.Text;
            nuevo.Descripcion= txtDescipcion.Text;
            nuevo.UrlVideo = txtVideo.Text;

            ejercicioNegocio.agregar(nuevo);
            lblMensaje.Text = "✅ ¡Ejercicio agregado con éxito!";
            lblMensaje.ForeColor = System.Drawing.Color.Green;

            Response.Redirect("MisEjercicios.aspx");

        }

    } 
}