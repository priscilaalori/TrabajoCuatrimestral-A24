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
    public partial class RutinaDeportista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarRutinaDeportista();
        }

        private void CargarRutinaDeportista()
        {
            int idDeporte = Convert.ToInt32(Session["idDeporteSeleccionado"]);
            int idDeportista = 6; // o tomalo desde Session["IdUsuario"] si ya lo tenés guardado 
            RutinaNegocio negocio = new RutinaNegocio();
            Dominio.Rutina rutina = negocio.ListarRutinaDelDiaDeUsuarioPorDeporte(idDeportista , idDeporte, DateTime.Today);
            if(rutina != null)
            {
                List<Ejercicio> listaEjercicio = rutina.Ejercicios.ToList();
                rptEjercicios.DataSource = listaEjercicio;
                descripcionRutina.Text = rutina.Descripcion;
                nombreRutina.Text = rutina.Nombre;
                rptEjercicios.DataBind();
            }
            else
            {

            }
        }

        protected void btn_guardarHistorial_Click(object sender, EventArgs e)
        {
            // Si usás runat="server" en el input: slEsfuerzo es control server y tiene Value
            int nivelEsfuerzoPercibido = 5;
            if (!string.IsNullOrEmpty(slEsfuerzo.Value))
                nivelEsfuerzoPercibido = Convert.ToInt32(slEsfuerzo.Value);

            // ej: guardás en BD
            // GuardarHistorial(idUsuario, idRutina, nivelEsfuerzoPercibido, chkOpcion1.Checked, txtNombre.Text);

            // feedback
            // Response.Redirect("InicioDeportista.aspx");
        }

    }
}