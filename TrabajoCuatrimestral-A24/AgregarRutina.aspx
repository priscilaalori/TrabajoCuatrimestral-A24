﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AgregarRutina.aspx.cs" Inherits="tp_webform_equipo_24A.AgregarRutina" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <h1>Nueva rutina</h1>

        <div class="mb-3">
            <label class="form-label">Nombre</label>
            <input type="text" class="form-control" id="txtNombre">
        </div>

        <div>
            <label class="form-label">Descripción</label>

            <asp:TextBox Rows="3" ID="TxtDescripción" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>

    <div>
        <asp:Button Style="margin-top: 10px;" ID="btnAgregarRutina" runat="server" Text="Agregar" CssClass="btn btn-primary btn-sm" />
    </div>
    <div>
        <asp:Button OnClick="cancelarRutina_Click" Style="margin-top: 10px;" ID="cancelarRutina" runat="server" Text="Cancelar" CssClass="btn btn-primary btn-sm" />
    </div>


</asp:Content>
