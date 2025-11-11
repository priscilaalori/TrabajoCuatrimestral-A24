<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EliminarRutinaEntrenador.aspx.cs" Inherits="tp_webform_equipo_24A.Entrenador.EliminarRutinaEntrenador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .confirm-container {
            max-width: 420px;
            margin: 40px auto;
            padding: 28px;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            background: #f9fafb;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0,0,0,.06)
        }

        .confirm-title {
            font-size: 1.5rem;
            margin: 0 0 8px;
            color: #111827
        }

        .confirm-text {
            margin: 0 0 16px;
            color: #4b5563
        }

        .label-rutina {
            display: block;
            font-weight: 600;
            color: #2563eb;
            margin: 6px 0 22px
        }

        .btn-row {
            display: flex;
            justify-content: center;
            gap: 12px
        }

        .btn {
            border: none;
            border-radius: 8px;
            padding: 8px 16px;
            cursor: pointer;
            font-size: .95rem
        }

        .btn-primary {
            background: #2563eb;
            color: #fff
        }

            .btn-primary:hover {
                background: #1e40af
            }

        .btn-cancel {
            background: #6b7280;
            color: #fff
        }

            .btn-cancel:hover {
                background: #4b5563
            }
        /* Si usás Bootstrap, estas clases conviven sin problema */
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuExtra" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="confirm-container" role="dialog" aria-labelledby="ttlEliminar" aria-describedby="txtEliminar">
        <h1 ID="ttlEliminar" class="confirm-title" > Eliminar Rutina </h1>
        <p id="txtEliminar" class="confirm-text" >Estás por eliminar una rutina, ¿desea continuar?</p>
        <asp:Label ID="lblRutina" runat="server" Text="Seleccionar" CssClass="label-rutina" ></asp:Label>

        <div class="btn-row" >
            <asp:Button ID="btnAceptarElimanar" Style="margin-top: 10px" CssClass="btn btn-primary btn-sm" runat="server" OnClick="btnAceptar_Click" Text="Aceptar" />
        </div>


        <div>
            <asp:Button Style="margin-top: 10px;" ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-primary btn-sm" OnClick="btnCancelar_Click" />
        </div>

    </div>


</asp:Content>
