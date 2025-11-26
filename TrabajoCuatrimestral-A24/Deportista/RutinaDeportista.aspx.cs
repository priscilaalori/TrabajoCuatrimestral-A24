using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Negocio.HistorialNegocio;

namespace tp_webform_equipo_24A
{
    public partial class RutinaDeportista : System.Web.UI.Page
    {
        private int idRutina;
        private Usuario usuario = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            DeportistaNegocio DeportistaNegocio = new DeportistaNegocio();
           

            if (Seguridad.SessionActivaDeportista(Session["usuarioLogueado"]) == true)
                usuario = (Usuario)Session["usuarioLogueado"];
            else
                Response.Redirect("Error.aspx");

            if (usuario != null)
            {
                CargarRutinaDeportista();
            }
        }

        private void CargarRutinaDeportista()
        {
            int idDeporte = Convert.ToInt32(Session["idDeporteSeleccionado"]);
            int idDeportista = usuario.IdUsuario;
            HistorialNegocio historialnegocio = new HistorialNegocio(); 
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

                rutina.Historial = historialnegocio.ObtenerHistorial(idDeportista, idRutina);
                if(rutina.Historial != null)
                {
                    chkOpcion1.Checked = rutina.Historial.Completado;
                    rblEsfuerzo.SelectedValue = rutina.Historial.Sensacion.ToString();
                    slEsfuerzo.Value = rutina.Historial.Esfuerzo.ToString();
                    txtComentario.Text = rutina.Historial.Comentario;
                    btn_guardarHistorial.Enabled = false; 
                }
                
            }
            else
            {
                btn_guardarHistorial.Enabled = false;
                rblEsfuerzo.Visible = false; 
            }

            
        }

        protected void btn_guardarHistorial_Click(object sender, EventArgs e)
        {
            HistorialNegocio negocio = new HistorialNegocio();
            Dominio.Historial historial = new Dominio.Historial();

            historial.Completado = chkOpcion1.Checked;

            // Esfuerzo emocional (RadioButtonList)
            int esfuerzoEmocional;
            if (int.TryParse(rblEsfuerzo.SelectedValue, out esfuerzoEmocional))
                historial.Sensacion = esfuerzoEmocional;
            else
                historial.Sensacion = 0;

            // Esfuerzo físico percibido (Slider)
            int esfuerzoPercibido;
            if (int.TryParse(slEsfuerzo.Value, out esfuerzoPercibido))
                historial.Esfuerzo = esfuerzoPercibido;
            else
                historial.Esfuerzo = 0;

            // Comentario
            historial.Comentario = txtComentario.Text;
            historial.FechaRegistro = DateTime.Now;

            try
            {
                negocio.agregar(historial, idRutina, usuario.IdUsuario);
                LblMsg.Text = "Historial registrado correctamente.";
            }
            catch (HistorialException hex)
            {
                Session["Error"] = hex.Message;
                Response.Redirect("~/Error.aspx");
            }
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioDeportista.aspx");
        }
    }
}