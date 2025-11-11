using Dominio;
using Negocio;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace tp_webform_equipo_24A
{
    public partial class AgregarDeporte : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            DeporteNegocio negocio = new DeporteNegocio();
            Deporte nuevo = new Deporte();

            try
            {
                nuevo.Nombre = txtNombre.Text.Trim();
                nuevo.Estado = chkActivo.Checked;

                if (string.IsNullOrEmpty(nuevo.Nombre))
                {
                    lblMensaje.CssClass = "text-danger";
                    lblMensaje.Text = "El nombre no puede estar vacío.";
                    return;
                }

                negocio.Agregar(nuevo);

                Session["MensajeExito"] = "Deporte agregado exitosamente.";
                Response.Redirect("AdministrarDeportes.aspx", false);

                Response.Redirect("AdministrarDeportes.aspx");

                txtNombre.Text = "";
                chkActivo.Checked = true;
            }
            catch (Exception ex)
            {
                lblMensaje.CssClass = "text-danger";
                lblMensaje.Text = "Error al agregar el deporte: " + ex.Message;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministrarDeportes.aspx");
        }
    }
}