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

            .banner-container {
        position: relative;
        width: 100%;
        height: 220px; 
        border-radius: 10px;
        overflow: hidden;
        margin-bottom: 20px;
    }

    .banner-img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        filter: brightness(70%); 
    }

    .banner-text {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: white;
        font-size: 32px;
        font-weight: 600;
        text-shadow: 0 0 8px rgba(0,0,0,0.7);
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="banner-container">
    <img class="banner-img" src="/Images/banner-rutinas.jpg" alt="Banner">
    <div class="banner-text">
        <h1>¡Hola
<asp:Label ID="lblNombreDeportista" Text="text" runat="server" />
!</h1>
    </div>
</div>
            

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
    <asp:Button OnClick="btnHistorial_Click" ID="btnHistorial" runat="server" Text="Mi Historial" CssClass="btn btn-dark btn-short" ValidationGroup="" CommandName="VerHistorial"
    CommandArgument='<%# Eval("IdDeportista") %>' />
    <br />
    <asp:Button OnClick="btnRutinasFuturas_Click" ID="btnRutinasFuturas" runat="server" Text="Rutinas futuras" CssClass="btn btn-dark btn-short" ValidationGroup="" />
</asp:Content>
