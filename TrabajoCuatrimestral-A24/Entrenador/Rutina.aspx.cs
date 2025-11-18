using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_24A
{
    public partial class Rutina : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RutinaNegocio rutinaNegocio = new RutinaNegocio();

            dgvlistRutinas.DataSource = rutinaNegocio.Listar();
            dgvlistRutinas.DataBind();
          
        }

        protected void btnAgregarRutina_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarRutina.aspx");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioEntrenador.aspx",false);
        }

        protected void dgvlistRutinas_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = dgvlistRutinas.SelectedRow.Cells[0].Text;
            Response.Redirect("AgregarRutina.aspx?id=" + id);
        }

        protected void dgvlistRutinas_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            try
            {
                if (e.CommandName == "Eliminar")
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    Response.Redirect("EliminarRutinaEntrenador.aspx?id=" + id, false);

                }

                else if (e.CommandName == "AgregarEjercicio")
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    Response.Redirect("RutinaAgregarEjercicios.aspx?id=" + id, false);

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
   
        }
    }
}