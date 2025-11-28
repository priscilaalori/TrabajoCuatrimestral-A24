<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="InicioEntrenador.aspx.cs" Inherits="tp_webform_equipo_24A.InicioEntrenador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
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
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="banner-container">
            <img class="banner-img" src="/Images/banner-gym.jpg" alt="Banner">
            <div class="banner-text">
                ¡Hola <asp:Label ID="lblNombreEntrenador" Text="Entrenador" runat="server" />!
            </div>
        </div>
        <div>
            <asp:Button Style="margin-top: 10px;" CssClass="btn btn-dark btn-short" ID="btnMiPerfil" runat="server"  OnClick="btnMiPerfil_Click" Text="Mi perfil" />
        </div>
        <p  style="margin-top:10px;">Mis estudiantes </p>
    </div> 
    <div>
        <asp:GridView ID="dgvlistAlumnos" OnRowCommand="dgvlistAlumnos_RowCommand" CssClass="table" AutoGenerateColumns="false" runat="server">
            <Columns>

                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                <asp:BoundField HeaderText="Deporte" DataField="DeportePrincipal.Nombre" />

                <asp:TemplateField HeaderText="Detalle">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnVerPerfil" runat="server" Text="Ver"
                            CssClass="btn btn-ver"
                            CommandName="DetalleDeportista"
                            CommandArgument='<%# Eval("IdUsuario") %>'
                            CausesValidation="false" />
                    </ItemTemplate>

                </asp:TemplateField>
            </Columns>

        </asp:GridView>
    </div>

    <div>
        <asp:Button Style="margin-top: 10px;" ID="btnVerRutinas" OnClick="btnVerRutinas_Click" runat="server" Text="Ver rutinas" CssClass="btn btn-dark btn-short" />
    </div>


</asp:Content>
