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
            cargar();
        }
        private void cargar()
        {
            Usuario usuario = null;

            if (Session["usuarioLogueado"] != null)
                usuario = (Usuario)Session["usuarioLogueado"];
            else
                Response.Redirect("Error.aspx");

            if(usuario.Rol != TipoUsuario.ENTRENADOR)
                Response.Redirect("Error.aspx");

            try
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());

                    RutinaNegocio rutinaNegocio = new RutinaNegocio();
                    List<Dominio.Rutina> rutinas = rutinaNegocio.Listar(usuario.IdUsuario);
                    Dominio.Rutina rutinaGuardada = rutinas.Find(x => x.IdRutina == id);

                    lblNombre.Text = rutinaGuardada.Nombre;

                    dgvEjerciciosRutina.DataSource = rutinaNegocio.ListarEjericiosRutina(id);
                    dgvEjerciciosRutina.DataBind();

                    EjercicioNegocio ejercicioNegocio = new EjercicioNegocio();
                    dgvEjerciciosNuevos.DataSource = ejercicioNegocio.ListarEjerciciosDisponibles(id);
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
            try
            {
                if (Request.QueryString["id"] != null)
                {
                    int idRutina = int.Parse(Request.QueryString["id"].ToString());

                    int idEjercicio = Convert.ToInt32(e.CommandArgument);

                    RutinaNegocio rutinaNegocio = new RutinaNegocio();
                    rutinaNegocio.EliminarEjercicioRutina(idRutina, idEjercicio);
                    cargar();


                    

                }
            }
            catch (Exception)
            {

                throw;
            }


        }

        protected void dgvEjerciciosNuevos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (Request.QueryString["id"] != null)
                {
                    int idRutina = int.Parse(Request.QueryString["id"].ToString());

                    int idEjercicio = Convert.ToInt32(e.CommandArgument);

                    RutinaNegocio rutinaNegocio = new RutinaNegocio();
                    rutinaNegocio.AgregarEjercicioRutina(idRutina, idEjercicio);
                    cargar();



                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rutina.aspx");
        }
    }
}