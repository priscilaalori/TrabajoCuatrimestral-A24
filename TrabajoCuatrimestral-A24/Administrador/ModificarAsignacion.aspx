<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarAsignacion.aspx.cs" MasterPageFile="~/Master.Master" Inherits="tp_webform_equipo_24A.Administrador.ModificarAsignacion" %>


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
            max-width: 500px;
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
            margin-top: 1rem;
        }

        .btn-primary:hover {
            background-color: #333;
        }

        .text-center {
            text-align: center;
        }

        .volver-container {
            margin-bottom: 15px;
        }
        


    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="volver-container">
        <asp:Button ID="btnVolver"
                    runat="server"
                    Text="Volver"
                    CssClass="btnVolver"
                    OnClick="btnVolver_Click" />
    </div>
    <div class="form-container">
        <div class="form-card">
            <h2>Modificar Profesor Asignado</h2>

            <div class="text-center mb-3">
                <asp:Label ID="lblNombreDeportista" runat="server" Text="" Font-Bold="True" />
            </div>

            <div class="form-group mb-3">
                <asp:Label ID="lblProfesor" runat="server" Text="Seleccioná el nuevo entrenador:" />
                <asp:DropDownList ID="ddlEntrenadores" runat="server" CssClass="form-control" />
            </div>

            <div class="text-center">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                <br />
                <asp:Label ID="lblMensaje" runat="server" Text="" ForeColor="Green" CssClass="mt-3 d-block" />
            </div>
        </div>
    </div>
</asp:Content>
