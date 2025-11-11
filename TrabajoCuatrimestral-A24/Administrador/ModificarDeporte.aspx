<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarDeporte.aspx.cs" MasterPageFile="~/Master.Master" Inherits="tp_webform_equipo_24A.ModificarDeporte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 70vh;
        }

        .form-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            width: 100%;
            max-width: 400px;
            padding: 2rem;
        }

        h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #000;
        }

        .btn-primary {
            background-color: #000;
            border: none;
        }

        .btn-primary:hover {
            background-color: #333;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <div class="form-card">
            <h2>Modificar Deporte</h2>

            <div class="form-group">
                <label for="txtNombre">Nombre</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group mt-3">
                <label for="ddlEstado">Estado</label>
                <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Activo" Value="True"></asp:ListItem>
                    <asp:ListItem Text="Inactivo" Value="False"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="mt-4 text-center">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary ms-2" PostBackUrl="~/AdministrarDeportes.aspx" />
            </div>

            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" CssClass="mt-3 d-block text-center" />
        </div>
    </div>
</asp:Content>