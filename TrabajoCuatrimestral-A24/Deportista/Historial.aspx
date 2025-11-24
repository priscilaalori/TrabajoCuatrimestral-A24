<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Historial.aspx.cs" Inherits="tp_webform_equipo_24A.Historial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <style>
        .historial-wrapper {
            max-width: 900px;
            margin: 0 auto;
            margin-top: 30px;
        }

        .historial-title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .card-rutina {
            background: #fff;
            border-radius: 12px;
            padding: 18px 22px;
            margin-bottom: 18px;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.08);
            transition: transform .15s ease;
            border-left: 6px solid #007bff;
        }

            .card-rutina:hover {
                transform: translateY(-3px);
            }

        .rutina-fecha {
            font-size: 14px;
            color: #666;
        }

        .rutina-nombre {
            font-size: 20px;
            font-weight: 600;
            margin-top: 4px;
            margin-bottom: 8px;
        }

        .rutina-ejercicio {
            margin-left: 12px;
            font-size: 14px;
        }

        .rutina-subtitulo {
            font-weight: 600;
            margin-top: 10px;
        }

        .badge-esfuerzo {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            color: white;
        }

        .esf-1 {
            background: #007bff;
        }

        .esf-2 {
            background: #28a745;
        }

        .esf-3 {
            background: #ffc107;
            color: #333;
        }

        .esf-4 {
            background: #fd7e14;
        }

        .esf-5 {
            background: #dc3545;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="historial-wrapper">

        <div class="historial-title">Historial de Rutinas</div>

        <asp:Repeater ID="repHistorial" runat="server">
            <ItemTemplate>
                <h3>Rutina: <%# Eval("Nombre") %></h3>
                <p><b>Descripción:</b> <%# Eval("Descripcion") %></p>
                <p><b>Fecha creación:</b> <%# Eval("FechaCreacion", "{0:dd/MM/yyyy}") %></p>

                <!-- Ejercicios -->
                <h4>Ejercicios</h4>
                <asp:Repeater ID="repEjercicios" runat="server" DataSource='<%# Eval("Ejercicios") %>'>
                    <ItemTemplate>
                        • <%# Eval("Nombre") %> - <%# Eval("Descripcion") %><br />
                    </ItemTemplate>
                </asp:Repeater>

                <!-- Historial -->
                <h3>Historial</h3>
                <asp:Repeater ID="repHistorialDetalle" runat="server" DataSource= '<%# Eval("Historial")%>'
                    OnItemDataBound="repHistorialDetalle_ItemDataBound">
                    <HeaderTemplate>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Fecha de Realizacion</th>
                                    <th>Esfuerzo</th>
                                    <th>Sensación</th>
                                    <th>Comentario</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("FechaRegistro", "{0:dd/MM/yyyy}") %></td>
                            <td>
                                <asp:Literal ID="litEsfuerzo" runat="server"></asp:Literal></td>
                            <td>
                                <asp:Literal ID="litSensacion" runat="server"></asp:Literal></td>

                            <td><%# Eval("Comentario") %></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                </table>
                    </FooterTemplate>
                </asp:Repeater>

                <hr />
            </ItemTemplate>
        </asp:Repeater>

      <asp:Button OnClick="BtnVolverDeHistorial_Click"  ID="BtnVolverDeHistorial" runat="server" CssClass="btn btn-dark btn-lg" Text="Volver"/>

    </div>

</asp:Content>




