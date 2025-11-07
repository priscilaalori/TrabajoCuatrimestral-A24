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
    <img src="https://w7.pngwing.com/pngs/607/314/png-transparent-dumbbell-computer-icons-weight-training-dumbbell-angle-physical-fitness-text.png" alt="Mancuerna" style="width:200px;"/>
    <h2>Modifica los datos</h2>
    </div>
    <div class="row"></div>
        <div class="col-2"></div>
        <br class="col">
            

    <div class="form-group">
        <label for="txtNombre">Nombre</label>
        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
        <asp:RegularExpressionValidator ErrorMessage="Solo letras permitidas" ControlToValidate="txtNombre" ValidationExpression="^[a-zA-Z]+$" runat="server" 
 ForeColor="Red" Display="Dynamic" />
    </div>

    <div class="form-group">
        <label for="txtApellido">Apellido</label>
        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" />
        <asp:RegularExpressionValidator ErrorMessage="Solo letras permitidas" ControlToValidate="txtApellido" ValidationExpression="^[a-zA-Z]+$" runat="server" 
ForeColor="Red" Display="Dynamic" />
    </div>

    <div class="form-group">
        <label for="txtEmail">Email</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" type="email" />
        <asp:RegularExpressionValidator ErrorMessage="Formato incorrecto" ControlToValidate="txtEmail" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" runat="server" 
            ForeColor="Red" Display="Dynamic"/>
    </div>


    <div class="form-group">
        <label for="txtRol">Rol</label>
        <asp:TextBox ID="txtRol" runat="server" CssClass="form-control" Enabled="false"/>
        <asp:RegularExpressionValidator ErrorMessage="Solo letras permitidas" ControlToValidate="txtRol" ValidationExpression="^[a-zA-Z]+$" runat="server" 
ForeColor="Red" Display="Dynamic" />
    </div>

    <div class="form-group">
    <label for="txtPassword">Contraseña</label>
    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="SingleLine" />
    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
        ControlToValidate="txtPassword"
        ErrorMessage="La contraseña es obligatoria"
        ForeColor="Red"
        Display="Dynamic" />
    <asp:RegularExpressionValidator ID="revPassword" runat="server"
        ControlToValidate="txtPassword"
        ErrorMessage="La contraseña debe tener al menos 6 caracteres"
        ValidationExpression="^.{6,}$"
        ForeColor="Red"
        Display="Dynamic" />
</div>

    <div class="form-group">

    <br>
    <asp:Button ID="btnAceptar" runat="server" Text="Modificar" CssClass="btn btn-primary" OnClick="btnAceptar_Click"/>
    </div>

    <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" />


    
        <div class="col-2"></div>



    
</asp:Content>