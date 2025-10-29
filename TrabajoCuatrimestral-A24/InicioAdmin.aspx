<%@ Page Title="Panel de Administración" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="InicioAdmin.aspx.cs" Inherits="TrabajoCuatrimestral.InicioAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-container {
            padding: 20px;
        }

        .table-section {
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        .table-section h2 {
            margin-bottom: 15px;
        }

        .table {
            margin-bottom: 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin-container">
        <div class="table-section">
            <h2>Usuarios registrados</h2>
            <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Rol" HeaderText="Rol" />
                </Columns>
            </asp:GridView>
        </div>

    </div>
</asp:Content>