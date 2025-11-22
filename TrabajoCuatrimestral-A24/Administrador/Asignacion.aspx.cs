using Negocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_24A
{
    public partial class AsignacionManual : System.Web.UI.Page
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
                CargarDeportistas();
            }
        }

        private void CargarDeportistas()
        {
            DeportistaNegocio negocio = new DeportistaNegocio();
            gvAlumnos.DataSource = negocio.Listar();

            gvAlumnos.DataBind();
        }

        protected void gvAlumnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int idDeportista = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Modificar")
            {
                

                // Guardamos el ID en la sesión
                Session["IdDeportistaSeleccionado"] = idDeportista;

                // Redirigimos sin parámetros
                Response.Redirect("ModificarAsignacion.aspx");
            }
            else if (e.CommandName == "Eliminar")
            {

                try
                {
                    EntrenadorNegocio negocio = new EntrenadorNegocio();
                    negocio.EliminarAsignacionDeDeportista(idDeportista);

                    // Volvemos a cargar la grilla para ver reflejado el cambio
                    CargarDeportistas();
                }
                catch (Exception ex)
                {
                    // lblMensaje.Text = "Error al eliminar la asignación: " + ex.Message;
                }
            }
            else if (e.CommandName == "Auto")
            {

                try
                {
                    EntrenadorNegocio entrenadorNeg = new EntrenadorNegocio();
                    DeportistaNegocio depNeg = new DeportistaNegocio();

                    // Busco deporte del deportista
                    var deporte = depNeg.ObtenerDeportePrincipal(idDeportista);

                    if (deporte == null)
                    {
                        lblMensaje.Text = "El deportista no tiene deporte asignado.";
                        return;
                    }

                    // Busco el entrenador con menos alumnos para ese deporte
                    var entrenador = entrenadorNeg.ObtenerEntrenadorConMenosAlumnos(deporte.IdDeporte);

                    if (entrenador == null)
                    {
                        lblMensaje.Text = "No hay entrenadores disponibles para este deporte.";
                        return;
                    }

                    // Asignar
                    entrenadorNeg.AsignarProfesorADeportista(idDeportista, entrenador.IdUsuario);

                    lblMensaje.ForeColor = System.Drawing.Color.Green;
                    lblMensaje.Text = $"Asignado automáticamente: {entrenador.Nombre} {entrenador.Apellido}";

                    // Recargar grilla
                    CargarDeportistas();
                }
                catch (Exception ex)
                {
                    lblMensaje.Text = "Error al asignar automáticamente: " + ex.Message;
                }
            }
        }


        protected string ObtenerNombreDeporte(object deportesObj)
        {
            var deportes = deportesObj as List<Deporte>;
            return (deportes != null && deportes.Count > 0) ? deportes[0].Nombre : "Sin deporte";
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
       
                Response.Redirect("~/InicioAdmin.aspx");
            
        }

        protected void btnEliminarTodo_Click(object sender, EventArgs e)
        {
            EntrenadorNegocio negocio = new EntrenadorNegocio();
            negocio.EliminarTodasLasAsignaciones();

            CargarDeportistas();
            lblMensaje.Text = "Se eliminaron todas las asignaciones.";
        }

        protected void btnAsignarTodo_Click(object sender, EventArgs e)
        {
            try
            {
                EntrenadorNegocio entNeg = new EntrenadorNegocio();
                entNeg.AsignarATodosLosDeportistasSinAsignar();

                CargarDeportistas(); 
                lblMensaje.Text = "Asignación masiva completada.";
                lblMensaje.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error en asignación masiva: " + ex.Message;
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}