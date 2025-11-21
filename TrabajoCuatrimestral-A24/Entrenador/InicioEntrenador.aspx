<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="InicioEntrenador.aspx.cs" Inherits="tp_webform_equipo_24A.InicioEntrenador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>¡Hola <asp:Label ID="lblNombreEntrenador" Text="text" runat="server" /> !</h1>
        <p>Mis estudiantes</p>
    </div>
    <div>
        <asp:GridView  ID="dgvlistAlumnos" OnRowCommand="dgvlistAlumnos_RowCommand" CssClass="table" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                <asp:TemplateField HeaderText="Detalle">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnVerPerfil" runat="server" Text="Ver"
                            CommandName="DetalleDeportista"
                            CommandArgument='<%# Eval("IdUsuario") %>'
                            CausesValidation="false" />
                    </ItemTemplate>

                </asp:TemplateField>
            </Columns>

        </asp:GridView>
    </div>

    <div>
        <asp:Button Style="margin-top: 10px;" ID="btnVerRutinas" OnClick="btnVerRutinas_Click" runat="server" Text="Ver rutinas" CssClass="btn btn-primary btn-sm" />
    </div>

<%--    <div>
        <asp:Button Style="margin-top: 10px;" ID="btnPerfilAlumno" OnClick="btnPerfilAlumno_Click" runat="server" Text="Ver alumno" CssClass="btn btn-primary btn-sm" />
    </div>--%>


</asp:Content>
