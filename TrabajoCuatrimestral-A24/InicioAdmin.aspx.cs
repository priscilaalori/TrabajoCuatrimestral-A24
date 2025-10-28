﻿using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrabajoCuatrimestral
{
    public partial class InicioAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
            }
        }



        private void CargarUsuarios()
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            gvUsuarios.DataSource = negocio.ListarUsuarios();
            gvUsuarios.DataBind();
        }
    }
}