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
            if (e.CommandName == "Modificar")
            {
                int idDeportista = Convert.ToInt32(e.CommandArgument);

                // Guardamos el ID en la sesión
                Session["IdDeportistaSeleccionado"] = idDeportista;

                // Redirigimos sin parámetros
                Response.Redirect("ModificarAsignacion.aspx");
            }
            else if (e.CommandName == "Eliminar")
            {
                int idDeportista = Convert.ToInt32(e.CommandArgument);

                try
                {
                    EntrenadorNegocio negocio = new EntrenadorNegocio();
                    negocio.EliminarAsignacionDeDeportista(idDeportista);

                    // Volvemos a cargar la grilla para ver reflejado el cambio
                    CargarDeportistas();
                }
                catch (Exception ex)
                {
                    // Mostrá si querés, el error en pantalla
                    // lblMensaje.Text = "Error al eliminar la asignación: " + ex.Message;
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




    }
}