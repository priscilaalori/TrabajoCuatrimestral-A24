<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" MasterPageFile="~/Master.Master" Inherits="TrabajoCuatrimestral.Registro" %>

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
    <h2>Ingresá tus datos</h2>
    </div>
    <div class="row"></div>
        <div class="col-2"></div>
        <div class="col">
            
        <div class="form-group">
        <label for="txtDni">DNI</label>
        <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" AutoPostBack="true" />
        <asp:RegularExpressionValidator ErrorMessage="Solo numeros" ControlToValidate="txtDni" ValidationExpression="^[0-9]+$" runat="server" ForeColor="Red" Display="Dynamic"/>
    </div>

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
        <label for="txtDireccion">Dirección</label>
        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" />
        <asp:Label ID="lblDireccionError" runat="server" CssClass="error" Text="Falta dirección." Visible="false"></asp:Label>
        <asp:RegularExpressionValidator ErrorMessage="Formato incorrecto" ControlToValidate="txtDireccion" ValidationExpression="^[A-Za-záéíóúÁÉÍÓÚñÑ\s]+ \d{1,5}$" runat="server" 
    ForeColor="Red" Display="Dynamic"/>
    </div>

    <div class="form-group">
        <label for="txtCiudad">Ciudad</label>
        <asp:TextBox ID="txtCiudad" runat="server" CssClass="form-control" />
        <asp:RegularExpressionValidator ErrorMessage="Formato incorrecto" ControlToValidate="txtCiudad" ValidationExpression="^[A-Za-záéíóúÁÉÍÓÚñÑ0-9\s]+$" runat="server" 
ForeColor="Red" Display="Dynamic"/>
    </div>

    <div class="form-group">
        <label for="txtCP">CP</label>
        <asp:TextBox ID="txtCP" runat="server" CssClass="form-control" />
        <asp:RegularExpressionValidator ErrorMessage="Solo numeros" ControlToValidate="txtCP" ValidationExpression="^[0-9]+$" runat="server" ForeColor="Red" Display="Dynamic"/>
    </div>

    <div class="form-group">
        <label for="ddlDeporte">Seleccioná tu deporte principal:</label>
        <asp:DropDownList ID="ddlDeporte" runat="server" CssClass="form-control">
            <asp:ListItem Text="--Seleccione un deporte--" Value="" />
            <asp:ListItem Text="Gimnasio" Value="Gimnasio" />
            <asp:ListItem Text="Atletismo" Value="Atletismo" />
            <asp:ListItem Text="Ciclismo" Value="Ciclismo" />
        </asp:DropDownList>

        <asp:RequiredFieldValidator ID="rfvDeporte" runat="server"
            ControlToValidate="ddlDeporte"
            InitialValue=""
            ErrorMessage="Debe seleccionar un deporte"
            ForeColor="Red"
            Display="Dynamic" />
     </div>

    <div class="form-group">
        <asp:CheckBox ID="chkAcepto" runat="server" Text="Acepto los términos y condiciones." />
    </div>

    <div class="form-group">
    <asp:Button ID="btnAceptar" runat="server" Text="Registrarme" CssClass="btn btn-primary"/>
    </div>

    <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" />


        </div>
        <div class="col-2"></div>



    
</asp:Content>