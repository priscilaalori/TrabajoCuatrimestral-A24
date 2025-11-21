<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AgregarEjercicio.aspx.cs" Inherits="tp_webform_equipo_24A.AgregarEjercicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuExtra" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Agregar un nuevo ejercicio </h1>
    <br />
    <div class="mb-3">
        <label class="form-label">Nombre</label>
        <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>

        <br />

    </div>

    <div class="mb-3">
        <label class="form-label">Descripción</label>

        <div>
            <asp:TextBox TextMode="MultiLine" ID="txtDescipcion" CssClass="form-control" Rows="3" runat="server"></asp:TextBox>
        </div>

        <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" />

    </div>

    <div class="mb-3">
        <label class="form-label">Adjunte Video</label>
        <asp:TextBox ID="txtVideo" CssClass="form-control" runat="server"></asp:TextBox>
        <br />

        <asp:Button OnClick="btnGuardarEjercicio_click" ID="btnGuardarEjercicio" runat="server" Text="Guardar Ejercicio" CssClass="btn btn-dark btn-lg" />
    </div>
</asp:Content>
