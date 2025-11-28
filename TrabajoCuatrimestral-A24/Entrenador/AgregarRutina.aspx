<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AgregarRutina.aspx.cs" Inherits="tp_webform_equipo_24A.AgregarRutina" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .color-validaciones {
            color: indianred;
        }

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

    <div class="banner-container">
        <img class="banner-img" src="/Images/banner-gym.jpg" alt="Banner">
        <div class="banner-text">
            <div>
                <h1>Nueva rutina</h1>
            </div>
        </div>
    </div>

    

    <div class="mb-3">
        <label class="form-label">Nombre</label>
        <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ErrorMessage="El nombre es requerido" CssClass="color-validaciones" ControlToValidate="txtNombre" runat="server" />

    </div>

    <div class="form-group">
        <label for="ddlDNivel">Seleccioná el nivel:</label>
        <asp:DropDownList ID="ddlNivel" CssClass="form-control" runat="server">
            <asp:ListItem Text="Principiante" Value="Principiante"></asp:ListItem>
            <asp:ListItem Text="Intermedio" Value="Intermedio"></asp:ListItem>
            <asp:ListItem Text="Avanzado" Value="Avanzado"></asp:ListItem>
        </asp:DropDownList>
    </div>

    <div class="form-group">
        <label for="ddlDeporte">Seleccioná el deporte:</label>
        <asp:DropDownList ID="ddlDeporte" runat="server" CssClass="form-control">
        </asp:DropDownList>

        <asp:RequiredFieldValidator ID="rfvDeporte" runat="server"
            ControlToValidate="ddlDeporte"
            InitialValue=""
            ErrorMessage="Debe seleccionar un deporte"
            ForeColor="Red"
            Display="Dynamic" />
    </div>


    <div class="mb-3">
        <label class="form-label">Descripción</label>

        <div>
            <asp:TextBox TextMode="MultiLine" ID="txtDescipcion" CssClass="form-control" Rows="3" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ErrorMessage="La descripción es requerida" CssClass="color-validaciones" ControlToValidate="txtDescipcion" runat="server" />

        </div>

        <br />

        <div class="form-group">
            <label for="txtFechaInicio">Fecha de Inicio</label>
            <asp:TextBox ID="txtFechaInicio" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ErrorMessage="La fecha de inicio es requerida" CssClass="color-validaciones" ControlToValidate="txtFechaInicio" runat="server" />
        </div>

        <div class="form-group">
            <label for="txtFechaFin">Fecha de Fin</label>
            <asp:TextBox ID="txtFechaFin" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ErrorMessage="La fecha de cierre es requerida" CssClass="color-validaciones" ControlToValidate="txtFechaFin" runat="server" />
        </div>

    </div>


    <div class="d-grid gap-2 d-md-block">
        <asp:Button Style="margin-top: 10px;" ID="btnAgregarRutina" runat="server" Text="Agregar" CssClass="btn btn-dark btn-short" OnClick="btnAgregarRutina_Click" />
        
     </div>

    <div>
        <a href="Rutina.aspx" class="btn btn-dark btn-short" style="margin-top:10px">Cancelar</a>
    </div>



</asp:Content>
