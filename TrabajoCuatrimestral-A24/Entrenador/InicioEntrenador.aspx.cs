using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace tp_webform_equipo_24A
{
    public partial class InicioEntrenador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EntrenadorNegocio entrenadorNegocio = new EntrenadorNegocio();


            dgvlistAlumnos.DataSource = entrenadorNegocio.ListarDeportistasPorEntrenador(4);
            dgvlistAlumnos.DataBind();

            //dgvlistRutinas.DataSource = rutinaNegocio.Listar();
            //dgvlistRutinas.DataBind();


        }

        protected void btnAgregarAlumno_Click(object sender, EventArgs e)
        {
        }

        protected void btnVerRutinas_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rutina.aspx");
        }

        protected void btnPerfilAlumno_Click(object sender, EventArgs e)
        {
            Response.Redirect("vistaEntrenadorDeportista.aspx");
        }

        protected void dgvlistAlumnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Rutinas")
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    Response.Redirect("vistaEntrenadorDeportista.aspx?id=" + id, false);
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}