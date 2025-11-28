using Negocio;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_24A
{
    public partial class AdministrarUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Seguridad.SessionActivaAdmin(Session["usuarioLogueado"]))
            {
                Session["Error"] = "No tenés permiso para acceder a esta sección.";
                Response.Redirect("~/Error.aspx");
                return;
            }

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
                Button btnActivar = (Button)e.Row.FindControl("btnActivar");
                Button btnEliminar = (Button)e.Row.FindControl("btnEliminar");

                bool activo = (bool)DataBinder.Eval(e.Row.DataItem, "Activo");

                if (btnActivar != null)
                    btnActivar.Visible = !activo;

                if (btnEliminar != null)
                    btnEliminar.Visible = activo;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/InicioAdmin.aspx");
        }

        protected void btnExportarTxt_Click(object sender, EventArgs e)
        {
            CargarUsuarios(); 

            StringBuilder sb = new StringBuilder();

            sb.AppendLine("Listado de Usuarios");
            sb.AppendLine("------------------------------");
            sb.AppendLine();

            gvUsuarios.AllowPaging = false;
            gvUsuarios.DataBind();

            foreach (GridViewRow row in gvUsuarios.Rows)
            {
                for (int i = 0; i < gvUsuarios.Columns.Count; i++)
                {
                    string header = gvUsuarios.Columns[i].HeaderText;
                    string value = ObtenerTextoCelda(row.Cells[i]);
                    sb.AppendLine(header + ": " + value);
                }

                sb.AppendLine("------------------------------");
            }

            Response.Clear();
            Response.ContentType = "text/plain";
            Response.AddHeader("content-disposition", "attachment;filename=Usuarios.txt");
            Response.Write(sb.ToString());
            Response.End();
        }

        private string ObtenerTextoCelda(TableCell celda)
        {
           
            string texto = celda.Text.Replace("&nbsp;", "").Trim();
            if (!string.IsNullOrEmpty(texto))
                return texto;

           
            foreach (Control control in celda.Controls)
            {
                if (control is Label lbl)
                    return lbl.Text;

                if (control is Literal lit)
                    return lit.Text;

                if (control is LinkButton lbtn)
                    return lbtn.Text;

                if (control is Button btn)
                    return btn.Text;

                if (control is CheckBox chk)
                    return chk.Checked ? "Sí" : "No";
            }

            return "";
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            
        }


    }


}