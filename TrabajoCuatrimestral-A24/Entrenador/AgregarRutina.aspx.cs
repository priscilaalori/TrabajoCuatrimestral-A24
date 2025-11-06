using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

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
                    ddlDeporte.DataValueField = "IdDeporte";
                    ddlDeporte.DataTextField = "Nombre";
                    ddlDeporte.DataBind();

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        protected void cancelarRutina_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rutina.aspx");
        }

        protected void btnAgregarRutina_Click(object sender, EventArgs e)
        {
            try
            {
                Dominio.Rutina rutinaNueva = new Dominio.Rutina();
                rutinaNueva.Nombre = txtNombre.Text;
                rutinaNueva.Descripcion = txtDescipcion.Text;
                rutinaNueva.FechaInicio = DateTime.Parse(txtFechaInicio.Text);
                rutinaNueva.FechaFin = DateTime.Parse(txtFechaFin.Text);    
                
                rutinaNueva.Deporte = new Deporte();

                rutinaNueva.Deporte.IdDeporte = 1;
                rutinaNueva.Deporte.Nombre = ddlDeporte.DataTextField;

             

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}