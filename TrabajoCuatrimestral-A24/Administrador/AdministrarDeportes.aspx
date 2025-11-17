<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdministrarDeportes.aspx.cs" Inherits="tp_webform_equipo_24A.AdministrarDeportes" %>

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

        .btn-modificar {
            background-color: #0d6efd;
            color: #fff;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
        }

        .btn-modificar:hover {
            background-color: #084298;
        }

        .btn-eliminar {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
        }

        .btn-eliminar:hover {
            background-color: #bb2d3b;
        }

        .btn-activar {
            background-color: #198754;
            color: #fff;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
        }

        .btn-activar:hover {
            background-color: #157347;
        }

        .btn-agregar {
            background-color: #198754;
            color: #fff;
            font-weight: 500;
            padding: 10px 18px;
            border: none;
            border-radius: 8px;
            transition: background 0.2s ease;
        }

        .btn-agregar:hover {
            background-color: #157347;
        }

        .btn-container {
            text-align: right;
            margin-top: 20px;
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
    <div class="admin-container">
        <div class="table-section">
            <h2>Deportes registrados</h2>

            <asp:Label ID="lblMensaje" runat="server" CssClass="text-success" />

            <asp:GridView ID="gvDeportes" runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-striped table-bordered text-center"
                DataKeyNames="IdDeporte"
                OnRowCommand="gvDeportes_RowCommand"
                OnRowDataBound="gvDeportes_RowDataBound">

                <Columns>
                    <asp:BoundField DataField="IdDeporte" HeaderText="ID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Estado" HeaderText="Activo" />

                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:Button ID="btnModificar" runat="server" Text="Modificar"
                                CssClass="btn-modificar me-2"
                                CommandName="Modificar"
                                CommandArgument='<%# Eval("IdDeporte") %>' />

                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar"
                                CssClass="btn-eliminar"
                                CommandName="Eliminar"
                                CommandArgument='<%# Eval("IdDeporte") %>'
                                OnClientClick="return confirm('¿Seguro que deseas dar de baja este deporte?');" />

                            <asp:Button ID="btnActivar" runat="server" Text="Activar"
                                CssClass="btn-activar"
                                CommandName="Activar"
                                CommandArgument='<%# Eval("IdDeporte") %>'
                                OnClientClick="return confirm('¿Seguro que deseas Activar este deporte?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="btn-container">
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar Deporte Nuevo" CssClass="btn-agregar" OnClick="btnAgregar_Click" />
            </div>
        </div>
    </div>
</asp:Content>