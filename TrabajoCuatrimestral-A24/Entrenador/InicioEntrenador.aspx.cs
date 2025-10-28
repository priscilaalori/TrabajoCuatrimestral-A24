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
            DeportistaNegocio deportistaNegocio = new DeportistaNegocio();

           // dgvlistAlumnos.DataSource = deportistaNegocio.Listar();
            //dgvlistAlumnos.DataBind();  
        }

        protected void btnAgregarAlumno_Click(object sender, EventArgs e)
        {
        }

        protected void btnVerRutinas_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rutina.aspx");
        }
    }
}