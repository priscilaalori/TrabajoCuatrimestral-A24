using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webform_equipo_24A
{
    public partial class Historial : System.Web.UI.Page
    {
        Usuario usuario = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Seguridad.SessionActivaDeportista(Session["usuarioLogueado"]))
                {
                    usuario = (Usuario)Session["usuarioLogueado"];
                    CargarHistorial();
                }
                else
                {
                    Response.Redirect("Error.aspx");
                }
            }
        }

        private void CargarHistorial()
        {
            RutinaNegocio negocio = new RutinaNegocio();
            int idDeportista = usuario.IdUsuario;
            List<Dominio.Rutina> lista = negocio.listarHistorial(idDeportista);

            repHistorial.DataSource = lista;
            repHistorial.DataBind();
        }

        private string GetTextoEsfuerzo(int valor)
        {
            switch (valor)
            {
                case 1: return "Ninguno";
                case 2: return "Muy leve";
                case 3: return "Leve";
                case 4: return "Moderado";
                case 5: return "Algo duro";
                case 6: return "Difícil";
                case 7: return "Muy difícil";
                case 8: return "Demasiado duro";
                case 9: return "Máximo";
                case 10: return "Máximo";
                default: return "Desconocido";
            }
        }

        private string GetTextoSensacion(int valor)
        {
            switch (valor)
            {
                case 1: return "Muy débil";
                case 2: return "Débil";
                case 3: return "Normal";
                case 4: return "Fuerte";
                case 5: return "Muy fuerte";
                default: return "Desconocido";
            }
        }

        protected void repHistorialDetalle_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                dynamic registro = e.Item.DataItem;

                int esfuerzo = Convert.ToInt32(registro.Esfuerzo);
                int sensacion = Convert.ToInt32(registro.Sensacion);

                // Buscar literal controls dentro del item
                Literal litEsfuerzo = (Literal)e.Item.FindControl("litEsfuerzo");
                Literal litSensacion = (Literal)e.Item.FindControl("litSensacion");

                // Asignar valores convertidos
                litEsfuerzo.Text = GetTextoEsfuerzo(esfuerzo);
                litSensacion.Text = GetTextoSensacion(sensacion);
            }
        }

        protected void BtnVolverDeHistorial_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioDeportista.aspx");
        }
    }
}

