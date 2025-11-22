using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_24A.Entrenador
{
    public partial class EliminarEjercicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = null;

            if (Seguridad.SessionActivaEntrenador(Session["usuarioLogueado"]) == true)
                usuario = (Usuario)Session["usuarioLogueado"];
            else
                Response.Redirect("Error.aspx");

            if (!IsPostBack)
            {
                if (Session["IdEjercicioSeleccionado"] == null)
                {
                    Response.Redirect("MisEjercicios.aspx");
                    return;
                }

                int id = (int)Session["IdEjercicioSeleccionado"];
                //CargarDatos(id);
            }

        }

        protected void btnElimanarejercicio_Click(object sender, EventArgs e)
        {

            EjercicioNegocio ejercicioNegocio = new EjercicioNegocio();

            if (Session["IdEjercicioSeleccionado"] == null)
            {
                Response.Redirect("MisEjercicios.aspx");
                return;
            }

            int id = (int)Session["IdEjercicioSeleccionado"];
            ejercicioNegocio.Eliminar(id);
            Response.Redirect("MisEjercicios.aspx");

        }

        protected void btnCancelarejercicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("MisEjercicios.aspx");
        }
    }
}