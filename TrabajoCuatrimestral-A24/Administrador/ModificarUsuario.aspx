<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarUsuario.aspx.cs" MasterPageFile="~/Master.Master" Inherits="TrabajoCuatrimestral.ModificarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

.register-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 70vh;
}

.register-card {
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    width: 100%;
    max-width: 400px;
    padding: 2rem;
}

.register-card h2 {
    font-weight: 700;
    color: #000000; 
    text-align: center;
    margin-bottom: 1.5rem;
}

.btn-primary {
    background-color: #000000;
    border: none;
}

.btn-primary:hover {
    background-color: #333333;
}
       
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center mb-3">
        <img src="https://w7.pngwing.com/pngs/607/314/png-transparent-dumbbell-computer-icons-weight-training-dumbbell-angle-physical-fitness-text.png"
             alt="Mancuerna" style="width:200px;" />
        <h2>Modificá los datos del usuario</h2>
    </div>

    <div class="register-container">
        <div class="register-card">
            
            <div class="form-group mb-3">
                <label for="txtNombre">Nombre</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group mb-3">
                <label for="txtApellido">Apellido</label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group mb-3">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" type="email" />
            </div>

            <div class="form-group mb-3">
                <label for="txtRol">Rol</label>
                <asp:TextBox ID="txtRol" runat="server" CssClass="form-control" Enabled="false" />
            </div>

            <div class="form-group mb-3">
                <label for="txtDNI">DNI</label>
                <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group mb-3">
                <label for="txtTitulo">Título habilitante (solo entrenadores)</label>
                <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group mb-3">
                <label for="txtFechaNacimiento">Fecha de nacimiento</label>
                <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="form-control" TextMode="Date" />
            </div>

            <div class="form-group mb-3">
                <label for="txtPassword">Contraseña</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="SingleLine" />
            </div>

            <div class="form-group text-center mt-4">
                <asp:Button ID="btnAceptar" runat="server" Text="Guardar cambios" CssClass="btn btn-primary" OnClick="btnAceptar_Click" />
                <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary ms-2" OnClick="btnVolver_Click" />
            </div>

            <asp:Label ID="lblMensaje" runat="server" CssClass="mt-3 d-block text-center fw-bold" />

        </div>
    </div>
</asp:Content>