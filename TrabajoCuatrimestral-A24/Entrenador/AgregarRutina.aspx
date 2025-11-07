<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AgregarRutina.aspx.cs" Inherits="tp_webform_equipo_24A.AgregarRutina" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <h1>Nueva rutina</h1>

        <div class="mb-3">
            <label class="form-label">Nombre</label>
            <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>

        </div>

        <div class="mb-3">
            <label class="form-label">Nivel</label>
            <asp:TextBox ID="txtNivel" CssClass="form-control" runat="server"></asp:TextBox>

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
            </div>

            <div class="form-group">
                <label for="txtFechaInicio">Fecha de Inicio</label>
                <asp:TextBox ID="txtFechaInicio" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtFechaFin">Fecha de Fin</label>
                <asp:TextBox ID="txtFechaFin" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>

        </div>

    </div>


    <div class="d-grid gap-2 d-md-block">
        <asp:Button Style="margin-top: 10px;" ID="btnAgregarRutina" runat="server" Text="Agregar" CssClass="btn btn-primary btn-sm" OnClick="btnAgregarRutina_Click" />
        <asp:Button OnClick="cancelarRutina_Click" Style="margin-top: 10px;" ID="cancelarRutina" runat="server" Text="Cancelar" CssClass="btn btn-primary btn-sm" />
    </div>



</asp:Content>
