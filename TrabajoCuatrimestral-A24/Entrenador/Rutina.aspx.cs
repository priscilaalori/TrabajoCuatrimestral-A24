using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_24A
{
    public partial class Rutina : System.Web.UI.Page
    {
        public bool MostrarAgregar { get; set; } = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            RutinaNegocio rutinaNegocio = new RutinaNegocio();

            //Recupera usuario logueado y valida el rol que sea ENTRENADOR
            Usuario usuario = null;


            if (Seguridad.SessionActivaEntrenador(Session["usuarioLogueado"]) == true)
                usuario = (Usuario)Session["usuarioLogueado"];
            else
                Response.Redirect("Error.aspx");
            //Hasta acá validación usuario.

            try
            {
                if (Request.QueryString["id"] != null)
                {
                    OcultarAccionesColumnas();
                    // Si la URL trae un ID oculto para agregar rutinas de entrenador
                    btnAgregarRutina.Visible = false; 
                    //si viene con id de deportista entonces solo muestra la columna agregar
                    MostrarAgregar = true;
                    DeportistaNegocio deportistaNegocio = new DeportistaNegocio();
                    Deporte deporte = new Deporte();

                    int idDeportista = int.Parse(Request.QueryString["id"].ToString());

                    deporte = deportistaNegocio.ObtenerDeportePrincipal(idDeportista);
                    List<Dominio.Rutina> listaRutina = rutinaNegocio.Listar(usuario.IdUsuario);
                    listaRutina = listaRutina.FindAll(x => x.Deporte.IdDeporte == deporte.IdDeporte);
                    
                    dgvlistRutinas.DataSource = listaRutina;
                    dgvlistRutinas.DataBind();
                }
                else
                {
                    MostrarAccionesColumnas();
                    dgvlistRutinas.DataSource = rutinaNegocio.Listar(usuario.IdUsuario);
                    dgvlistRutinas.DataBind();

                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
            {

            }
        }

        protected void btnAgregarRutina_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarRutina.aspx");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioEntrenador.aspx", false);
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

                else if (e.CommandName == "AgregarRutinaADeportista")
                {
                    int idRutina = Convert.ToInt32(e.CommandArgument);

                    //recupero el id de deportista que viene de la página de deportista
                    if (Request.QueryString["id"] != null)
                    {
                        int idDeportista = int.Parse(Request.QueryString["id"].ToString());

                        DeportistaNegocio deportistaNegocio = new DeportistaNegocio();
                        deportistaNegocio.AsociarRutinaDepostista(idRutina, idDeportista);

                        Response.Redirect("vistaEntrenadorDeportista.aspx?id=" + idDeportista);

                    }
                }
            }
            catch (SqlException ex)
            {
                Session.Add("Error", "Esta rutina ya fue agregada");
                Response.Redirect("Error.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        protected void dgvlistRutinas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    // Buscar el botón
                    LinkButton btnAgregar = (LinkButton)e.Row.FindControl("btnAgregarRutinaAlumno");

                    // Ver si la URL trae el parámetro "id"
                    bool vieneId = Request.QueryString["id"] != null;

                    // Si viene id → ocultar el botón
                    // Si no viene id → mostrar
                    btnAgregar.Visible = vieneId;
                }


            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        protected void OcultarAccionesColumnas()
        {
            bool modoAlumno = !string.IsNullOrEmpty(Request.QueryString["id"]);
            ViewState["ModoAlumno"] = modoAlumno;

            btnAgregarRutina.Visible = !modoAlumno;

            if (modoAlumno)
            {
                // oculto modificar elminar y ejercicios
                dgvlistRutinas.Columns[5].Visible = false;
                dgvlistRutinas.Columns[6].Visible = false;
                dgvlistRutinas.Columns[7].Visible = false;

                // mostrar agregar
                dgvlistRutinas.Columns[8].Visible = true;
            }

        }

        protected void MostrarAccionesColumnas()
        {

                // mostrar todo menos el agregar
                dgvlistRutinas.Columns[5].Visible = true;
                dgvlistRutinas.Columns[6].Visible = true;
                dgvlistRutinas.Columns[7].Visible = true;
                dgvlistRutinas.Columns[8].Visible = false;
            

        }

    }
}