<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AgregarDeporte.aspx.cs" Inherits="tp_webform_equipo_24A.AgregarDeporte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            padding: 30px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 6px;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn-guardar {
            background-color: #198754;
            color: #fff;
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
            transition: background 0.2s ease;
            width: 100%;
        }

        .btn-guardar:hover {
            background-color: #157347;
        }

        .btn-volver {
            background-color: #6c757d;
            color: #fff;
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
            width: 100%;
            margin-top: 10px;
        }

        .btn-volver:hover {
            background-color: #565e64;
        }

        .text-success {
            color: #198754;
            text-align: center;
            display: block;
            margin-top: 15px;
        }

        .text-danger {
            color: #dc3545;
            text-align: center;
            display: block;
            margin-top: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2>Agregar Deporte</h2>

        <div class="form-group">
            <label for="txtNombre">Nombre del deporte</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label for="chkActivo">Activo</label>
            <asp:CheckBox ID="chkActivo" runat="server" Checked="true" />
        </div>

        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn-guardar" OnClick="btnGuardar_Click" />
        <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn-volver" OnClick="btnVolver_Click" />

        <asp:Label ID="lblMensaje" runat="server" CssClass="text-success" />
    </div>
</asp:Content>
