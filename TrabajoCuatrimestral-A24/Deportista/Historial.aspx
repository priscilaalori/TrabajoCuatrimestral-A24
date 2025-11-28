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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="historial-wrapper">
        <div class="banner-container">
    <img class="banner-img" src="/Images/banner-tiempo.jpg" alt="Banner">
    <div class="banner-text">
        <div class="historial-title">Historial de Rutinas</div>
    </div>
</div>

        

        <asp:Repeater ID="repHistorial" runat="server" OnItemDataBound="repHistorial_ItemDataBound">
            <ItemTemplate>

                <h3>Rutina: <%# Eval("Nombre") %></h3>
                <p><b>Descripción:</b> <%# Eval("Descripcion") %></p>
                <p><b>Fecha creación:</b> <%# Eval("FechaCreacion", "{0:dd/MM/yyyy}") %></p>

                <h4>Ejercicios</h4>
                <asp:Repeater ID="repEjercicios" runat="server" DataSource='<%# Eval("Ejercicios") %>'>
                    <ItemTemplate>
                        • <%# Eval("Nombre") %> - <%# Eval("Descripcion") %><br />
                    </ItemTemplate>
                </asp:Repeater>

                <!-- TABLA DE HISTORIAL (UN SOLO REGISTRO) -->
                <h3>Historial</h3>

                <asp:Panel ID="pnlHistorial" runat="server">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Fecha de Realización</th>
                                <th>Esfuerzo</th>
                                <th>Sensación</th>
                                <th>Comentario</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><asp:Literal ID="litFecha" runat="server"></asp:Literal></td>
                                <td><asp:Literal ID="litEsfuerzo" runat="server"></asp:Literal></td>
                                <td><asp:Literal ID="litSensacion" runat="server"></asp:Literal></td>
                                <td><asp:Literal ID="litComentario" runat="server"></asp:Literal></td>
                            </tr>
                        </tbody>
                    </table>
                </asp:Panel>

                <hr />
            </ItemTemplate>
        </asp:Repeater>

        <asp:Button OnClick="BtnVolverDeHistorial_Click" ID="BtnVolverDeHistorial" runat="server" CssClass="btn btn-dark btn-lg" Text="Volver" />

    </div>

</asp:Content>