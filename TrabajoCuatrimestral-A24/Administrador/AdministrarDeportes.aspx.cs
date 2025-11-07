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
        }


    }
}