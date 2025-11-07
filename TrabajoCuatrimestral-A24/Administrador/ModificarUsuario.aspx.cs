using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TrabajoCuatrimestral
{
    public partial class ModificarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IdUsuarioSeleccionado"] != null)
                {
                    int id = (int)Session["IdUsuarioSeleccionado"];
                    UsuarioNegocio negocio = new UsuarioNegocio();
                    Usuario usuario = negocio.ObtenerPorId(id);

                    if (usuario != null)
                    {
                        txtNombre.Text = usuario.Nombre;
                        txtApellido.Text = usuario.Apellido;
                        txtEmail.Text = usuario.Email;
                        txtRol.Text = usuario.Rol;
                        //txtPassword.Text = usuario.Contrasenia;
                    }
                }
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                int id = (int)Session["IdUsuarioSeleccionado"];
                Usuario usuario = new Usuario
                {
                    IdUsuario = id,
                    Nombre = txtNombre.Text,
                    Apellido = txtApellido.Text,
                    Email = txtEmail.Text,
                    Rol = txtRol.Text
                };

                if (!string.IsNullOrWhiteSpace(txtPassword.Text))
                    usuario.Contrasenia = txtPassword.Text;

                UsuarioNegocio negocio = new UsuarioNegocio();
                negocio.ModificarUsuario(usuario);

                Session["MensajeExito"] = "Usuario modificado con éxito.";

                Response.Redirect("AdministrarUsuarios.aspx", false);
            }
            catch (Exception ex)
            {
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                lblMensaje.Text = "Error al modificar usuario: " + ex.Message;
            }

}
    }
}