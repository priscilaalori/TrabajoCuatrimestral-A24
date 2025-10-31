<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="InicioDeportista.aspx.cs" Inherits="tp_webform_equipo_24A.InicioDeportista1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1> ¿QUE VAMOS A ENTRENAR HOY?</h1>



 <div class="form-group">
     <label for="ddlDeporte">Seleccioná tu deporte principal:</label>
     <asp:DropDownList ID="ddlDeporte" runat="server" CssClass="form-control">
         <asp:ListItem Text="--Seleccione un deporte--" Value="" />
         <asp:ListItem Text="Natación" Value="Natación" />
         <asp:ListItem Text="Running" Value="Running" />
         <asp:ListItem Text="Ciclismo" Value="Ciclismo" />
     </asp:DropDownList>

     <asp:RequiredFieldValidator ID="rfvDeporte" runat="server"
         ControlToValidate="ddlDeporte"
         InitialValue=""
         ErrorMessage="Debe seleccionar un deporte"
         ForeColor="Red"
         Display="Dynamic" />
 </div>


     <button type="button" class="btn btn-dark btn-lg" onclick="window.location.href='RutinaDeportista.aspx'">Siguiente</button> 

   
    <br />

    <button type="button" class="btn btn-dark btn-lg" onclick="window.location.href='Historial.aspx'">Ver Historial</button>  
</asp:Content>
