<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ConfiguraciondelaCuenta.aspx.cs" Inherits="tp_webform_equipo_24A.Deportista.ConfiguraciondelaCuenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style>
  .btn-short {
    width: 150px !important;
    display: inline-block !important;
    white-space: nowrap;
    text-align: center;
    padding-left: 12px;
    padding-right: 12px;
  }
  input.btn-short, button.btn-short { width:150px !important; display:inline-block !important; }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuExtra" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1> Configuraciones de tu cuenta </h1>

    
        <asp:Label Text="Email:" runat="server" />
        <asp:TextBox ID="txtMail" runat="server" CssClass="form-control"></asp:TextBox><br />

        <asp:Label Text="Contraseña actual:" runat="server" />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox><br />

        <asp:Label Text="Nueva contraseña (opcional):" runat="server" />
        <asp:TextBox ID="txtPasswordNueva" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox><br />
        <asp:Button  OnClick="btnGuardarPerfil_Click"  ID="btnGuardarPerfil" runat="server" Text="Guardar" CssClass="btn btn-dark btn-short"/> 
    <br />
        <asp:Button  OnClick="Btnvolver_Click"  ID="Btnvolver" runat="server" Text="Volver" CssClass="btn btn-dark btn-short"/>

</asp:Content>
