<%@ Import Namespace="Dominio" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Asignacion.aspx.cs" Inherits="tp_webform_equipo_24A.AsignacionManual" %>

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
        
        .btn-asignar {
            background-color: #f1c40f;  
            color: #000;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            font-weight: 600;
        }
        
        .btn-asignar:hover {
            background-color: #d4ac0d; 
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
            <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">
                <h2 style="margin: 0;">Asignación de recursos</h2>
            
                <div>
                    <asp:Button ID="btnAsignarTodo" runat="server" Text="Asignar *"
                        CssClass="btn-asignar me-2 btn-accion" OnClick="btnAsignarTodo_Click" />
            
                    <asp:Button ID="btnEliminarTodo" runat="server" Text="Eliminar *"
                        CssClass="btn-eliminar me-2 btn-accion" OnClick="btnEliminarTodo_Click" />
                </div>
            </div>


<asp:GridView ID="gvAlumnos" runat="server" AutoGenerateColumns="false"
    CssClass="table table-striped table-hover"
    OnRowCommand="gvAlumnos_RowCommand">
    <Columns>
        <asp:BoundField DataField="IdUsuario" HeaderText="ID" />
        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
        <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        

        <asp:TemplateField HeaderText="Deporte">
            <ItemTemplate>
              <%# ObtenerNombreDeporte(Eval("Deporte")) %>
            </ItemTemplate>
        </asp:TemplateField>


        <asp:TemplateField HeaderText="Entrenador Asignado">
            <ItemTemplate>
                <%# Eval("Entrenador") != null ? Eval("Entrenador.Nombre") : "Sin Asignar" %>
            </ItemTemplate>
        </asp:TemplateField>



<asp:TemplateField>
    <ItemTemplate>
        <asp:Button ID="btnModificar" runat="server" Text="Modificar"
            CommandName="Modificar"
            CssClass="btn-modificar me-2 btn-accion"
            CommandArgument='<%# Eval("IdUsuario") %>' />

        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar"
            CommandName="Eliminar"
            CssClass="btn-eliminar me-2 btn-accion"
            CommandArgument='<%# Eval("IdUsuario") %>'
            OnClientClick="return confirm('¿Estás seguro de eliminar este profesor asignado?');" />

        <asp:Button ID="btnAsignarAuto" runat="server" Text="Asignar Autom"
            CommandName="Auto"
            CssClass="btn-asignar me-2 btn-accion"
            CommandArgument='<%# Eval("IdUsuario") %>' />
    </ItemTemplate>
</asp:TemplateField>

    </Columns>
</asp:GridView>

            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" />
        </div>
    </div>
</asp:Content>