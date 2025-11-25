<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CambiarContraseña.aspx.cs" Inherits="tp_webform_equipo_24A.Deportista.CambiarContraseña" %>
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

      input.btn-short, button.btn-short {
          width: 150px !important;
          display: inline-block !important;
      }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuExtra" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label Text="Contraseña actual:" runat="server" />
<asp:TextBox ID="txtContraseñaActual" runat="server" CssClass="form-control"></asp:TextBox><br />

    <asp:Label Text="Nueva Contraseña:" runat="server" />
<asp:TextBox ID="txtContraseñaNueva" runat="server" CssClass="form-control"></asp:TextBox><br />

    <asp:Label Text="Repetir nueva contraseña:" runat="server" />
<asp:TextBox ID="txtRepetir" runat="server" CssClass="form-control"></asp:TextBox><br />

    <asp:Label ID="lblExito" runat="server" ForeColor="Green" Visible="false"></asp:Label><br />
    <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false"></asp:Label>

            <asp:Button OnClick="btnContraseñaGuardar_Click"  ID="btnContraseñaGuardar" runat="server" Text="Guardar" CssClass="btn btn-dark btn-short"/><br />
    <asp:Button OnClick="BtnContraseñaCancelar_Click"  ID="BtnContraseñaCancelar" runat="server" Text="Cancelar" CssClass="btn btn-dark btn-short "/> 

  

    
</asp:Content>
