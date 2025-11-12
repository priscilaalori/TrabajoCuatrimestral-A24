<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ModificarEjercicio.aspx.cs" Inherits="tp_webform_equipo_24A.Entrenador.ModificarEjercicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuExtra" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 
    <h2>Modificar Ejercicio</h2>

<asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label><br /><br />

<asp:Label runat="server" Text="Nombre:" /><br />
<asp:TextBox ID="txtNombre" runat="server" Width="300px"></asp:TextBox><br /><br />

<asp:Label runat="server" Text="Descripción:" /><br />
<asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="3" Width="300px"></asp:TextBox><br /><br />

<asp:Label runat="server" Text="URL del video:" /><br />
<asp:TextBox ID="txtUrlVideo" runat="server" Width="300px"></asp:TextBox><br /><br />

<asp:Button OnClick="btnGuardar_Click" ID="btnGuardar" runat="server" Text="Guardar Cambios" CssClass="btn btn-dark btn-lg" />



</asp:Content>
