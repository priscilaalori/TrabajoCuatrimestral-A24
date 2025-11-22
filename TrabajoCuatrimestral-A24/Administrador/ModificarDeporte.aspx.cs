using Negocio;
using Dominio;
using System;
using System.Web.UI;

namespace tp_webform_equipo_24A
{
    public partial class ModificarDeporte : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.SessionActivaAdmin(Session["usuarioLogueado"]))
            {
                Session["Error"] = "No tenés permiso para acceder a esta sección.";
                Response.Redirect("~/Error.aspx");
                return;
            }

            if (!IsPostBack)
            {
                if (Session["IdDeporteSeleccionado"] == null)
                {
                    Response.Redirect("AdministrarDeportes.aspx");
                    return;
                }

                int id = (int)Session["IdDeporteSeleccionado"];
                CargarDatos(id);
            }
        }

        private void CargarDatos(int id)
        {
            DeporteNegocio negocio = new DeporteNegocio();
            Deporte dep = negocio.ObtenerPorId(id);

            if (dep != null)
            {
                txtNombre.Text = dep.Nombre;
                ddlEstado.SelectedValue = dep.Estado ? "True" : "False";
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int id = (int)Session["IdDeporteSeleccionado"];
            DeporteNegocio negocio = new DeporteNegocio();

            Deporte dep = new Deporte
            {
                IdDeporte = id,
                Nombre = txtNombre.Text.Trim(),
                Estado = ddlEstado.SelectedValue == "True"
            };

            try
            {
                negocio.Modificar(dep);
                Session["MensajeExito"] = "Deporte modificado correctamente.";
                Response.Redirect("AdministrarDeportes.aspx");
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al guardar los cambios: " + ex.Message;
            }
        }
    }
}