<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PerfilDeportista.aspx.cs" Inherits="tp_webform_equipo_24A.Deportista.PerfilDeportista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuExtra" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h2>Perfil de Usuario</h2>

    <div class="form-group">

        <asp:Label Text="Nombre:" runat="server" />
        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" ReadOnly="true" />

        <asp:Label Text="Apellido:" runat="server" />
       <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" ReadOnly="true" />

        <asp:Label Text="DNI (kg):" runat="server" />
        <asp:TextBox ID="txtPeso" runat="server" CssClass="form-control" ReadOnly="true" />

        <asp:Label Text="Rol asignado:" runat="server" />
             <asp:TextBox ID="txtProfesorId" runat="server" CssClass="form-control" ReadOnly="true" />

            </div>
        <div class="form-group">
            <label for="txtFechaDeNacimiento">Fecha de Nacimiento</label>
            <asp:TextBox ID="txtFechaDeNacimiento" runat="server" CssClass="form-control" TextMode="Date" ReadOnly="true" />

        </div>

        <div>
       
        <br />

        <br />

        <asp:Button OnClick="BtnGuardarPerfil_Click" ID="BtnGuardarPerfil" runat="server" Text="Volver" CssClass="btn btn-dark btn-short" />
         <asp:Button OnClick="BtnConfigraciones_Click"  ID="BtnConfigraciones" runat="server" Text="Configuraciones" CssClass="btn btn-dark btn-short" />
            </div>




</asp:Content>
