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
    public partial class RutinasFuturas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarDeportes();
            }
        }

        private void cargarDeportes()
        {
            try
            {
                DeporteNegocio negocio = new DeporteNegocio();
                List<Deporte> lista = negocio.ListarActivos();

                ddlDeporte.DataSource = lista;
                ddlDeporte.DataTextField = "Nombre";
                ddlDeporte.DataValueField = "IdDeporte";
                ddlDeporte.DataBind();

                ddlDeporte.Items.Insert(0, new ListItem("--Seleccione un deporte--", ""));
            }
            catch (Exception ex)
            {
                //lblMensaje.Text = "Error al cargar los deportes: " + ex.Message;
                //lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ddlDeporte_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idDeporte = Convert.ToInt32(ddlDeporte.SelectedValue);
            int idDeportista = 6; // O tu Session

            RutinaNegocio negocio = new RutinaNegocio();
            List<Dominio.Rutina> rutinas = negocio.ListarRutinasDeUsuarioPorDeporte(idDeportista, idDeporte);

            if (rutinas != null)
            {
                rutinas = rutinas.Where(r => r.FechaInicio > DateTime.Today).OrderBy(r => r.FechaInicio).ToList();
                rptRutinas.DataSource = rutinas;
                rptRutinas.DataBind();

                // Ahora bindear ejercicios dentro de cada rutina
                foreach (RepeaterItem item in rptRutinas.Items)
                {
                    Repeater rptEj = (Repeater)item.FindControl("rptEjercicios");
                    Dominio.Rutina rutina = rutinas[item.ItemIndex];

                    if (rutina.Ejercicios != null)
                    {
                        rptEj.DataSource = rutina.Ejercicios;
                        rptEj.DataBind();
                    }
                }
            }
        }


    }
}