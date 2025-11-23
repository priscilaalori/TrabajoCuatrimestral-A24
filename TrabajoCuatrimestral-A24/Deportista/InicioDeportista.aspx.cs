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
    public partial class InicioDeportista1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            DeportistaNegocio DeportistaNegocio = new DeportistaNegocio();
            Usuario usuario = null;

            if (Seguridad.SessionActivaDeportista(Session["usuarioLogueado"]) == true)
                usuario = (Usuario)Session["usuarioLogueado"];
            else
                Response.Redirect("Error.aspx");

            lblNombreDeportista.Text = usuario.Nombre;

            //dgvlistAlumnos.DataSource = entrenadorNegocio.ListarDeportistasPorEntrenador(4);
            //dgvlistAlumnos.DataBind();

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


        protected void BtnSiguiente_Click(object sender, EventArgs e)
        {
            Session["idDeporteSeleccionado"] = ddlDeporte.SelectedValue;
            Response.Redirect("RutinaDeportista.aspx");
        }

        protected void btnHistorial_Click(object sender, EventArgs e)
        {
            Response.Redirect("Historial.aspx");
        }

        protected void btnRutinasFuturas_Click(object sender, EventArgs e)
        {
            Response.Redirect("RutinasFuturas.aspx");
        }

        protected void btnPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("PerfilDeportista.aspx");
        }
    }
}