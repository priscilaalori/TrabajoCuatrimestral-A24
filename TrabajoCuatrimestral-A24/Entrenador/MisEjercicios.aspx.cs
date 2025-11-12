using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace tp_webform_equipo_24A
{
    public partial class MisEjercicios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarEjercicios();
            }
        }

        private void cargarEjercicios()
        {
            EjercicioNegocio ejercicio = new EjercicioNegocio();
            List<Ejercicio> listaEjercicio = ejercicio.Listar();
            rptEjercicios.DataSource = listaEjercicio;
            rptEjercicios.DataBind();
        }
        protected void btnGuardarSeleccion_click(object sender, EventArgs e)
        {

        }
        protected void btnAgregarEjercicio_click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarEjercicio.aspx");
        }


        protected void btnModificar_Click1(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = int.Parse(btn.CommandArgument);

            Session["idEjercicioSeleccionado"] = id;
            Response.Redirect("ModificarEjercicio.aspx", false);
        }
    }
}
