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
        private int idRutina;

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
                idRutina = rutina.IdRutina;
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
            HistorialNegocio negocio = new HistorialNegocio();
            Dominio.Historial historial = new Dominio.Historial();

            historial.Completado = chkOpcion1.Checked;
            historial.Sensacion = Convert.ToInt32(rblEsfuerzo.SelectedValue);
            historial.Esfuerzo = Convert.ToInt32(slEsfuerzo.Value);
            historial.Comentario = txtComentario.Text;
            historial.FechaRegistro = DateTime.Now;

            negocio.agregar(historial, idRutina);


            // feedback
            // Response.Redirect("InicioDeportista.aspx");
        }

    }
}