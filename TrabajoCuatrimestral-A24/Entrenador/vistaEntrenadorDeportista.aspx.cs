using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace tp_webform_equipo_24A
{
    public partial class vistaEntrenadorDeportista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Request.QueryString["id"] != null)
                {
                    int idDeportista = int.Parse(Request.QueryString["id"].ToString());
                    DeportistaNegocio deportistaNegocio = new DeportistaNegocio();
                    Deportista deportista = new Deportista();
                    deportista = deportistaNegocio.ObtenerPorId(idDeportista);



                    lblNombre.Text = deportista.Nombre + " " + deportista.Apellido;



                    RutinaNegocio rutinaNegocio = new RutinaNegocio();
                    List<Dominio.Rutina> rutinas = rutinaNegocio.ListarRutinasPorDeportista(idDeportista);

                    dgvRutinasAlumno.DataSource = rutinas;
                    dgvRutinasAlumno.DataBind();


                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioEntrenador.aspx");
        }
    }
}