using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_24A
{
    public partial class AdministrarUsuarios : System.Web.UI.Page
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


                CargarUsuarios();
            }
        }
        private void CargarUsuarios()
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            gvUsuarios.DataSource = negocio.ListarUsuarios();

            gvUsuarios.DataBind();
        }

        protected void gvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Modificar")
            {
                int idUsuario = Convert.ToInt32(e.CommandArgument);
                Session["IdUsuarioSeleccionado"] = idUsuario;
                Response.Redirect("ModificarUsuario.aspx", false);
            }

            if (e.CommandName == "Eliminar")
            {
                int idUsuario = Convert.ToInt32(e.CommandArgument);
                UsuarioNegocio negocio = new UsuarioNegocio();
                try
                {
                    negocio.EliminarUsuarioLogico(idUsuario);
                    Session["MensajeExito"] = "Usuario eliminado correctamente.";
                }
                catch (Exception ex)
                {
                    Session["MensajeExito"] = "Error al eliminar usuario: " + ex.Message;
                }

                Response.Redirect("AdministrarUsuarios.aspx", false);
            }

            if (e.CommandName == "Activar")
            {
                int idUsuario = Convert.ToInt32(e.CommandArgument);
                UsuarioNegocio negocio = new UsuarioNegocio();
                try
                {
                    negocio.ActivarUsuarioLogico(idUsuario);
                    Session["MensajeExito"] = "Usuario activado correctamente.";
                }
                catch (Exception ex)
                {
                    Session["MensajeExito"] = "Error al activar usuario: " + ex.Message;
                }

                Response.Redirect("AdministrarUsuarios.aspx", false);
            }

        }

        protected void gvUsuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
               
                var dataItem = e.Row.DataItem;
                bool activo = Convert.ToBoolean(DataBinder.Eval(dataItem, "Activo"));

            
                Button btnEliminar = (Button)e.Row.FindControl("btnEliminar");
                Button btnActivar = (Button)e.Row.FindControl("Button1");

                if (activo)
                {
                    btnActivar.Enabled = false;
                    btnActivar.Text = "Activo";
                    btnActivar.CssClass = "btn-activar disabled";
                }
                else
                {
                    btnEliminar.Enabled = false;
                    btnEliminar.Text = "Eliminado";
                    btnEliminar.CssClass = "btn-eliminar disabled";
                }
            }
        }

    }


}