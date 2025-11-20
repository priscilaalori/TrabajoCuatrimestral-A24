<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PerfilDeportista.aspx.cs" Inherits="tp_webform_equipo_24A.Deportista.PerfilDeportista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuExtra" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h2>Perfil de Usuario</h2>

    <div class="form-group">

        <asp:Label Text="Nombre:" runat="server" />
        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox><br />

        <asp:Label Text="Apellido:" runat="server" />
        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox><br />

        <asp:Label Text="Peso (kg):" runat="server" />
        <asp:TextBox ID="txtPeso" runat="server" CssClass="form-control"></asp:TextBox><br />

        <asp:Label Text="Altura (cm):" runat="server" />
        <asp:TextBox ID="txtAltura" runat="server" CssClass="form-control"></asp:TextBox><br />

        <asp:Label Text="Profesor asignado:" runat="server" />
        <asp:TextBox ID="txtProfesorId" runat="server" CssClass="form-control"></asp:TextBox><br />

        <div class="form-group">
            <label for="txtFechaDeNacimiento">Fecha de Nacimiento</label>
            <asp:TextBox ID="txtFechaDeNacimiento" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
        </div>


       
        <br />

        <br />

        <asp:Button OnClick="BtnGuardarPerfil_Click" ID="BtnGuardarPerfil" runat="server" Text="Guardar" CssClass="btn btn-dark btn-short" />
         <asp:Button OnClick="BtnConfigraciones_Click"  ID="BtnConfigraciones" runat="server" Text="Configuraciones" CssClass="btn btn-dark btn-short" />



    </div>

</asp:Content>
