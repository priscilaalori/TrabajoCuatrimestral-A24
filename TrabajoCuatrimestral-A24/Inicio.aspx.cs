using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrabajoCuatrimestral
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                lblMensaje.Text = "Debe ingresar email ";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            switch (email)
            {
                case "Deportista":
                    Response.Redirect("Deportista/InicioDeportista.aspx");
                    break;
                case "Profesor":
                    Response.Redirect("Entrenador/InicioEntrenador.aspx");
                    break;
                case "Administrador":
                    Response.Redirect("InicioAdmin.aspx");
                    break;
                default:
                    lblMensaje.Text = "Rol desconocido";
                    break;
            }
        }
    }
}