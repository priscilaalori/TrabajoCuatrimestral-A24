using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_24A.Entrenador
{
    public partial class EliminarRutinaEntrenador : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = null;


            if (Seguridad.SessionActivaEntrenador(Session["usuarioLogueado"]) == true)
                usuario = (Usuario)Session["usuarioLogueado"];
            else
                Response.Redirect("Error.aspx");


            if (Session["usuarioLogueado"] != null)
            {
                usuario = (Usuario)Session["usuarioLogueado"];
            }
            else
            {
                Response.Redirect("Error.aspx");
            }


            try
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());

                    RutinaNegocio rutinaNegocio = new RutinaNegocio();
                    List<Dominio.Rutina> rutinas = rutinaNegocio.Listar(usuario.IdUsuario);
                    Dominio.Rutina rutinaGuardada = rutinas.Find(x => x.IdRutina == id);

                    lblRutina.Text = rutinaGuardada.Nombre;
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"].ToString());
            RutinaNegocio rutinaEliminar = new RutinaNegocio();

            rutinaEliminar.Eliminar(id);
            Response.Redirect("Rutina.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rutina.aspx");
        }
    }
}