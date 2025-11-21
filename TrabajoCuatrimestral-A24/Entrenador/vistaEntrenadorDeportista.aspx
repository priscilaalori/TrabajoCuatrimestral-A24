<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="vistaEntrenadorDeportista.aspx.cs" Inherits="tp_webform_equipo_24A.vistaEntrenadorDeportista" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>

        <asp:Label ID="lblNombre" runat="server"></asp:Label>
    </h1>
    <p>Rutinas Actuales </p>
    <asp:GridView ID="dgvRutinasAlumno" CssClass="table" AutoGenerateColumns="false" runat="server">

        <Columns>
            <asp:BoundField HeaderText="idRutina" DataField="IdRutina" HeaderStyle-CssClass="oculto" ItemStyle-CssClass="oculto" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Nivel" DataField="Nivel" />
            <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
            <asp:BoundField HeaderText="Deporte" DataField="Deporte" />
        </Columns>
    </asp:GridView>

    <div>

        <asp:Button ID="btmAgregarRutina" Style="margin-top: 10px;" class="btn btn-dark btn-short" OnClick="btmAgregarRutina_Click" runat="server" Text="Agregar rutina" />

    </div>

    <div>
        <asp:Button Style="margin-top: 10px;" ID="btnVolver" OnClick="btnVolver_Click" runat="server" Text="Volver" CssClass="btn btn-dark btn-short" />
    </div>



</asp:Content>
