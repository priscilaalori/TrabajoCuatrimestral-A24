using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_24A
{
    public partial class AdministrarDeportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["MensajeExito"] != null)
                {
                    lblMensaje.Text = Session["MensajeExito"].ToString();
                    lblMensaje.ForeColor = System.Drawing.Color.Green;
                    Session.Remove("MensajeExito"); 
                }


                cargarDeportes();
            }
        }

        private void cargarDeportes()
        {
            DeporteNegocio negocio = new DeporteNegocio();
            gvDeportes.DataSource = negocio.Listar();

            gvDeportes.DataBind();
        }

        protected void gvDeportes_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            DeporteNegocio negocio = new DeporteNegocio();

            if (e.CommandName == "Modificar")
            {
                Session["idDeporteSeleccionado"] = id;
                Response.Redirect("ModificarDeporte.aspx", false);
            }
            else if (e.CommandName == "Eliminar")
            {
                negocio.EliminarDeporteLogico(id);
                lblMensaje.Text = "Deporte dado de baja correctamente.";
                cargarDeportes();
            }
            else if (e.CommandName == "Activar")
            {
                negocio.ActivarDeporteLogico(id);
                lblMensaje.Text = "Deporte activado correctamente.";
                cargarDeportes();
            }
        }

        protected void gvDeportes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                bool estado = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "Estado"));

                Button btnEliminar = (Button)e.Row.FindControl("btnEliminar");
                Button btnActivar = (Button)e.Row.FindControl("btnActivar");

                if (estado)
                {
                    btnActivar.Enabled = false;
                    btnActivar.Text = "Activo";
                    btnActivar.CssClass = "btn-activar disabled";
                }
                else
                {
                    btnEliminar.Enabled = false;
                    btnEliminar.Text = "Inactivo";
                    btnEliminar.CssClass = "btn-eliminar disabled";
                }
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarDeporte.aspx", false);
        }


    }
}