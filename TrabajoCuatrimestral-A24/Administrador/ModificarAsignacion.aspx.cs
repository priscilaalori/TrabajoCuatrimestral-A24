using System;
using Dominio;
using Negocio;

namespace tp_webform_equipo_24A.Administrador
{
    public partial class ModificarAsignacion : System.Web.UI.Page
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
                if (Session["IdDeportistaSeleccionado"] == null)
                {
                    lblMensaje.Text = "No se ha seleccionado ningún deportista.";
                    return;
                }

                int idDeportista = (int)Session["IdDeportistaSeleccionado"];

                CargarDatosDeportista(idDeportista);
                CargarEntrenadores(idDeportista);
            }
        }

        private void CargarDatosDeportista(int idDeportista)
        {
            DeportistaNegocio negocio = new DeportistaNegocio();
            Dominio.Deportista deportista = negocio.ObtenerPorId(idDeportista);

            if (deportista != null)
            {
                lblNombreDeportista.Text = $"Deportista: {deportista.Nombre} {deportista.Apellido}";
            }
            else
            {
                lblMensaje.Text = "Error: deportista no encontrado.";
            }
        }

        private void CargarEntrenadores(int idDeportista)
        {
            EntrenadorNegocio negocio = new EntrenadorNegocio();
            DeportistaNegocio depon = new DeportistaNegocio();
           Dominio.Deportista deportista = depon.ObtenerPorIdDatosExtendidos(idDeportista);

            // Obtener deporte del deportista
            var deporte = deportista.Deporte?.Count > 0 ? deportista.Deporte[0] : null;
            if (deporte == null)
            {
                lblMensaje.Text = "Este deportista no tiene deporte asignado.";
                ddlEntrenadores.Enabled = false;
                return;
            }

            // Cargar entrenadores de ese deporte
            ddlEntrenadores.DataSource = negocio.ListarPorDeporte(deporte.IdDeporte);
            ddlEntrenadores.DataTextField = "NombreCompleto";
            ddlEntrenadores.DataValueField = "IdUsuario";
            ddlEntrenadores.DataBind();

            // Seleccionar entrenador actual si existe
            if (deportista.Entrenador != null)
            {
                ddlEntrenadores.SelectedValue = deportista.Entrenador.IdUsuario.ToString();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                int idDeportista = (int)Session["IdDeportistaSeleccionado"];
                int idEntrenadorNuevo = int.Parse(ddlEntrenadores.SelectedValue);

                EntrenadorNegocio negocio = new EntrenadorNegocio();
                negocio.AsignarProfesorADeportista(idDeportista, idEntrenadorNuevo);

                lblMensaje.Text = "Profesor actualizado correctamente.";

                // Redirigir después de unos segundos o directo
                Response.Redirect("Asignacion.aspx");
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al guardar los cambios: " + ex.Message;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Asignacion.aspx");
        }
    }
}
