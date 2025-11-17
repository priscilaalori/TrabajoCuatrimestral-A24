<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdministrarUsuarios.aspx.cs" Inherits="tp_webform_equipo_24A.AdministrarUsuarios" %>

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

        .btn-container {
            display: flex;
            justify-content: center;  
            gap: 20px;                 
            margin-top: 20px;
        }
        
        .btn-agregar {
            background-color: #000;
            color: #fff;
            border: none;
            padding: 12px 24px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 220px;              
            text-align: center;
            transition: background-color 0.3s ease;
        }
        
        .btn-agregar:hover {
            background-color: #333;
        }

        .btn-accion {
            width: 100px; 
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
            <h2>Usuarios registrados</h2>

            <asp:Label ID="lblMensaje" runat="server" CssClass="text-success" />

            <asp:GridView ID="gvUsuarios" runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-striped table-bordered text-center"
                DataKeyNames="IdUsuario"
                OnRowCommand="gvUsuarios_RowCommand"
                OnRowDataBound="gvUsuarios_RowDataBound">

                <Columns>
                    <asp:BoundField DataField="IdUsuario" HeaderText="ID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Rol" HeaderText="Rol" />
                    <asp:BoundField DataField="DNI" HeaderText="DNI" />
                    <asp:BoundField DataField="Titulo" HeaderText="Título" />
                    <asp:BoundField DataField="FechaNacimiento" HeaderText="Fecha Nacimiento" 
                                    DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                    <asp:CheckBoxField DataField="Activo" HeaderText="Activo" />

                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:Button ID="btnModificar" runat="server" Text="Modificar"
                                CssClass="btn-modificar me-2 btn-accion"
                                CommandName="Modificar"
                                CommandArgument='<%# Eval("IdUsuario") %>' />

                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar"
                                CssClass="btn-eliminar btn-accion"
                                CommandName="Eliminar"
                                CommandArgument='<%# Eval("IdUsuario") %>'
                                OnClientClick="return confirm('¿Seguro que deseas eliminar este usuario?');" />

                            <asp:Button ID="btnActivar" runat="server" Text="Activar" 
                                CssClass="btn-activar" 
                                CommandName="Activar" 
                                CommandArgument='<%# Eval("IdUsuario") %>' 
                                OnClientClick="return confirm('¿Seguro que deseas activar este usuario?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="btn-container">
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar nuevo usuario" CssClass="btn-agregar" PostBackUrl="~/Registro.aspx" />
                <asp:Button ID="btnAgregarEntrenador" runat="server" Text="Agregar nuevo entrenador" CssClass="btn-agregar" PostBackUrl="~/Entrenador/RegistroEntrenador.aspx" />
            </div>
        </div>
    </div>
</asp:Content>