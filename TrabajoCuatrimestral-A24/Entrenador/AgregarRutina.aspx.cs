using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_24A
{
    public partial class AgregarRutina : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DeporteNegocio deporteNegocio = new DeporteNegocio();

            try
            {
                if (!IsPostBack)
                {
                    ddlDeporte.DataSource = deporteNegocio.Listar();
                    ddlDeporte.DataBind();

                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        protected void cancelarRutina_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rutina.aspx");
        }
    }
}