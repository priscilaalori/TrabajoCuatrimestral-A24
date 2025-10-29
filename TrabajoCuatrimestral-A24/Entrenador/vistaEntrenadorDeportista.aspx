<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="vistaEntrenadorDeportista.aspx.cs" Inherits="tp_webform_equipo_24A.vistaEntrenadorDeportista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Perfil de Alumno  </h1>
    <p>Acá va el perfil de un alumno y ver el historial de rutinas y puede agregarle una. </p>

    <div>

        <asp:Button ID="btmAgregarRutina" Style="margin-top: 10px;" class="btn btn-primary btn-lg" runat="server" Text="Agregar rutina" />

    </div>

    <div>
        <asp:Button Style="margin-top: 10px;" ID="btnVolver" OnClick="btnVolver_Click" runat="server" Text="Volver" CssClass="btn btn-primary btn-sm" />
    </div>



</asp:Content>
