<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="RutinaAgregarEjercicios.aspx.cs" Inherits="tp_webform_equipo_24A.Entrenador.RutinaAgregarEjercicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuExtra" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .oculto {
            display: none;
        }

        .btn-short {
            width: 150px !important;
            display: inline-block !important;
            white-space: nowrap;
            text-align: center;
            padding-left: 12px;
            padding-right: 12px;
        }

        input.btn-short, button.btn-short {
            width: 150px !important;
            display: inline-block !important;
        }

            .banner-container {
            position: relative;
            width: 100%;
            height: 220px; 
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .banner-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(70%); 
        }

        .banner-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 32px;
            font-weight: 600;
            text-shadow: 0 0 8px rgba(0,0,0,0.7);
        }
    </style>
    <div>

    <div class="banner-container">
        <img class="banner-img" src="/Images/banner-gym.jpg" alt="Banner">
        <div class="banner-text">
            
        </div>
    </div>
        <h1>
            <asp:Label ID="lblNombre" runat="server"></asp:Label>
        </h1>

    </div>
    <div>
        <h2>Ejercicios actuales</h2>
        <asp:GridView ID="dgvEjerciciosRutina" CssClass="table" OnRowCommand="dgvEjerciciosRutina_RowCommand" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField HeaderText="IdEjercicio" DataField="IdEjercicio" HeaderStyle-CssClass="oculto" ItemStyle-CssClass="oculto" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                <asp:BoundField HeaderText="Instructivo" DataField="UrlVideo" />
                <asp:TemplateField HeaderText="Acción">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEliminar" runat="server" Text="Eliminar"
                            CssClass="btn btn-eliminar"
                            CommandName="Eliminar"
                            CommandArgument='<%# Eval("IdEjercicio") %>'
                            CausesValidation="false" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>


    <div>
        <h3 style="margin-top: 10px">Elija los ejercicios de la lista</h3>
        <asp:GridView ID="dgvEjerciciosNuevos" CssClass="table" OnRowCommand="dgvEjerciciosNuevos_RowCommand" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField HeaderText="IdEjercicio" DataField="IdEjercicio" HeaderStyle-CssClass="oculto" ItemStyle-CssClass="oculto" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                <asp:BoundField HeaderText="Instructivo" DataField="UrlVideo" />
                <asp:TemplateField HeaderText="Acción">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnAgregar" runat="server" Text="Agregar"
                            CommandName="AgregarEjercicio"
                            CssClass="btn btn-agregar"
                            CommandArgument='<%# Eval("IdEjercicio") %>'
                            CausesValidation="false" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <div>
        <asp:Button Style="margin-top: 10px;" ID="btnVolver" CssClass="btn btn-dark btn-short" CausesValidation="false" OnClick="btnVolver_Click" runat="server" Text="Volver a mis rutinas" />
    </div>



</asp:Content>

