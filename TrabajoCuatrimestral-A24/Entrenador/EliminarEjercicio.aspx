<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EliminarEjercicio.aspx.cs" Inherits="tp_webform_equipo_24A.Entrenador.EliminarEjercicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuExtra" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="confirm-container" role="dialog" aria-labelledby="ttlEliminar" aria-describedby="txtEliminar">
    <h1 ID="ttlEliminar" class="confirm-title" > Eliminar Ejercicio </h1>
    <p id="txtEliminar" class="confirm-text" >Estás por eliminar este ejercicio, ¿desea continuar?</p>
    <asp:Label ID="lblRutina" runat="server" Text="Seleccionar" CssClass="label-rutina" ></asp:Label>

    <div class="btn-row" >
        <asp:Button OnClick="btnElimanarejercicio_Click" ID="btnElimanarejercicio" Style="margin-top: 10px" CssClass="btn btn-primary btn-sm" runat="server"  Text="Aceptar"  />
    </div>


    <div>
        <asp:Button OnClick="btnCancelarejercicio_Click" Style="margin-top: 10px;" ID="btnCancelarejercicio" runat="server" Text="Cancelar" CssClass="btn btn-primary btn-sm" />
    </div>

</div>
</asp:Content>
