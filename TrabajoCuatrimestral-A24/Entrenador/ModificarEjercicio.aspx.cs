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
    public partial class ModificarEjercicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

             Usuario usuario = null;


            if (Seguridad.SessionActivaEntrenador(Session["usuarioLogueado"]) == true)
                usuario = (Usuario)Session["usuarioLogueado"];
            else
                Response.Redirect("Error.aspx");
            //Hasta acá validación usuario.

            if (!IsPostBack)
            {
                if (Session["IdEjercicioSeleccionado"] == null)
                {
                    Response.Redirect("MisEjercicios.aspx");
                    return;
                }

                int id = (int)Session["IdEjercicioSeleccionado"];
                CargarDatos(id);
            }


        }

        protected void CargarDatos (int id)
        {
            EjercicioNegocio ejercicioNegocio = new EjercicioNegocio();

            Ejercicio ejercicio = ejercicioNegocio.obtenerPorId(id);

            txtNombre.Text = ejercicio.Nombre;
            txtDescripcion.Text = ejercicio.Descripcion;
            txtUrlVideo.Text = ejercicio.UrlVideo;



        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Ejercicio ejercicioModificado = new Ejercicio();
            EjercicioNegocio ejercicioNegocio = new EjercicioNegocio();


            ejercicioModificado.Nombre = txtNombre.Text;
            ejercicioModificado.Descripcion= txtDescripcion.Text;
            ejercicioModificado.UrlVideo= txtUrlVideo.Text;
            ejercicioModificado.IdEjercicio=(int)Session["IdEjercicioSeleccionado"];

            ejercicioNegocio.Modificar(ejercicioModificado);

            Response.Redirect("MisEjercicios.aspx");

        }
    }
}
