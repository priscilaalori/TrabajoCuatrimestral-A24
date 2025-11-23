<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="InicioDeportista.aspx.cs" Inherits="tp_webform_equipo_24A.InicioDeportista1" %>

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
            <h1>¡Hola
            <asp:Label ID="lblNombreDeportista" Text="text" runat="server" />
            !</h1>

    <asp:Button OnClick="btnPerfil_Click" ID="btnPerfil" runat="server" Text="Mi Perfil" CssClass="btn btn-dark btn-short" ValidationGroup="" />


    <h3>¿Que vamos a entrenador hoy?</h3>



    <div class="form-group">
        <label for="ddlDeporte">Seleccioná tu deporte principal:</label>
        <asp:DropDownList ID="ddlDeporte" runat="server" CssClass="form-control">
        </asp:DropDownList>

        <asp:RequiredFieldValidator ID="rfvDeporte" runat="server"
            ControlToValidate="ddlDeporte"
            InitialValue=""
            ErrorMessage="Debe seleccionar un deporte"
            ForeColor="Red"
            Display="Dynamic"
            ValidationGroup="GrupoSiguiente" />
    </div>
    <asp:Button OnClick="BtnSiguiente_Click" ID="BtnSiguiente" runat="server" Text="Siguiente" CssClass="btn btn-dark btn-short" ValidationGroup="GrupoSiguiente" />
    <br />
    <asp:Button OnClick="btnHistorial_Click" ID="btnHistorial" runat="server" Text="Mi Historial" CssClass="btn btn-dark btn-short" ValidationGroup="" />
    <br />
    <asp:Button OnClick="btnRutinasFuturas_Click" ID="btnRutinasFuturas" runat="server" Text="Rutinas futuras" CssClass="btn btn-dark btn-short" ValidationGroup="" />
</asp:Content>
