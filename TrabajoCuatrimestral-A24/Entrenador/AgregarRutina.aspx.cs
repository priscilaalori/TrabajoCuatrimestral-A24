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
    public partial class AgregarRutina : System.Web.UI.Page
    {
        private Usuario usuario = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            DeporteNegocio deporteNegocio = new DeporteNegocio();

            //Recupera usuario logueado y valida el rol que sea ENTRENADOR
            
            if (Session["usuarioLogueado"] != null)
                usuario = (Usuario)Session["usuarioLogueado"];
            else
                Response.Redirect("Error.aspx");

            if (usuario.Rol != TipoUsuario.ENTRENADOR)
                Response.Redirect("Error.aspx");
            //Hasta acá validación usuario.

            try
            {
                //pregunta si es la primera vez que se recarga la pantalla
                if (!IsPostBack)
                {
                    ddlDeporte.DataSource = deporteNegocio.Listar();
                    ddlDeporte.DataValueField = "IdDeporte";
                    ddlDeporte.DataTextField = "Nombre";
                    ddlDeporte.DataBind();



                    //Modificar
                    if (Request.QueryString["id"] != null)
                    {
                        int id = int.Parse(Request.QueryString["id"].ToString());

                        RutinaNegocio rutinaNegocio = new RutinaNegocio();
                        List<Dominio.Rutina> rutinas = rutinaNegocio.Listar(usuario.IdUsuario);
                        Dominio.Rutina rutinaGuardada = rutinas.Find(x => x.IdRutina == id);

                        txtNombre.Text = rutinaGuardada.Nombre;
                        txtDescipcion.Text = rutinaGuardada.Descripcion;
                        txtFechaInicio.Text = rutinaGuardada.FechaFin.ToString("yyyy-MM-dd");
                        txtFechaFin.Text = rutinaGuardada.FechaFin.ToString("yyyy-MM-dd");

                        ddlNivel.SelectedValue = rutinaGuardada.Nivel;
                        ddlDeporte.SelectedValue = rutinaGuardada.Deporte.IdDeporte.ToString();

                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        protected void cancelarRutina_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rutina.aspx");
        }

        protected void btnAgregarRutina_Click(object sender, EventArgs e)
        {
            RutinaNegocio rutinaNego = new RutinaNegocio();
            try
            {
                Dominio.Rutina rutinaNueva = new Dominio.Rutina();
                rutinaNueva.Nombre = txtNombre.Text;
                rutinaNueva.Descripcion = txtDescipcion.Text;
                rutinaNueva.Nivel = ddlNivel.SelectedItem.Text;
                rutinaNueva.FechaInicio = DateTime.Parse(txtFechaInicio.Text);
                rutinaNueva.FechaFin = DateTime.Parse(txtFechaFin.Text);
                rutinaNueva.IdEntrenador = usuario.IdUsuario;

                rutinaNueva.Deporte = new Deporte();

                rutinaNueva.Deporte.IdDeporte = int.Parse(ddlDeporte.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    rutinaNueva.IdRutina = int.Parse(Request.QueryString["id"].ToString());
                    rutinaNego.ModificarSP(rutinaNueva);

                }
                else rutinaNego.Agregar(rutinaNueva);


                Response.Redirect("Rutina.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        protected void btnAgregarEjer_Click(object sender, EventArgs e)
        {
            Response.Redirect("MisEjercicios.aspx");
        }
    }
}