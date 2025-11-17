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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarDeportes();
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Deportista nuevo = new Deportista();
            DeportistaNegocio negocio = new DeportistaNegocio();

            if (
                string.IsNullOrWhiteSpace(txtNombre.Text) ||
                string.IsNullOrWhiteSpace(txtApellido.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(ddlDeporte.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text) ||
                !chkAcepto.Checked)
            {
                lblMensaje.Text = "Todos los campos son obligatorios.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }


            nuevo.Nombre = txtNombre.Text;
            nuevo.Apellido = txtApellido.Text;
            nuevo.Email = txtEmail.Text;
            nuevo.Contrasenia = txtPassword.Text;
            nuevo.DNI = txtdni.Text;
            nuevo.FechaNacimiento = DateTime.TryParse(txtFechaDeNacimiento.Text, out DateTime fecha) ? fecha : (DateTime?)null;
            nuevo.Rol = "Deportista";
            nuevo.Activo = true;


            try
            {
                negocio.agregar(nuevo, int.Parse(ddlDeporte.SelectedValue));
                Session["Mensaje"] = "Registro completado con éxito.";
                Session["ColorMensaje"] = "Green";
            }
            catch (Exception)
            {
                Session["Mensaje"] = "Ocurrió un error al registrar el usuario.";
                Session["ColorMensaje"] = "Red";
            }

            Response.Redirect("Inicio.aspx");
        }


        //Esta funcion trae el listado de deportes de la base.
        private void cargarDeportes()
        {
            try
            {
                DeporteNegocio negocio = new DeporteNegocio();
                List<Deporte> lista = negocio.ListarActivos();

                ddlDeporte.DataSource = lista;
                ddlDeporte.DataTextField = "Nombre";   
                ddlDeporte.DataValueField = "IdDeporte"; 
                ddlDeporte.DataBind();

                ddlDeporte.Items.Insert(0, new ListItem("--Seleccione un deporte--", "")); 
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al cargar los deportes: " + ex.Message;
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}