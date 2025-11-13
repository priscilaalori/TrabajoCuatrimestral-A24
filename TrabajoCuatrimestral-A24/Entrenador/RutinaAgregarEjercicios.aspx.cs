using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace tp_webform_equipo_24A.Entrenador
{
    public partial class RutinaAgregarEjercicios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());

                    RutinaNegocio rutinaNegocio = new RutinaNegocio();
                    List<Dominio.Rutina> rutinas = rutinaNegocio.Listar();
                    Dominio.Rutina rutinaGuardada = rutinas.Find(x => x.IdRutina == id);

                    lblNombre.Text = rutinaGuardada.Nombre;

                    dgvEjerciciosRutina.DataSource = rutinaNegocio.ListarEjericiosRutina(id);
                    dgvEjerciciosRutina.DataBind();

                    EjercicioNegocio ejercicioNegocio = new EjercicioNegocio();
                    dgvEjerciciosNuevos.DataSource = ejercicioNegocio.Listar();
                    dgvEjerciciosNuevos.DataBind();


                }

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        //Eliminar ejercicio de rutina
        protected void dgvEjerciciosRutina_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

        }

        protected void dgvEjerciciosNuevos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
        }
    }
}