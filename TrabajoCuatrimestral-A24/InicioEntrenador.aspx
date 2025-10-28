<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="InicioEntrenador.aspx.cs" Inherits="tp_webform_equipo_24A.InicioEntrenador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>

        <h1>¡Hola Entrenador!</h1>
        <p>Mis estudiantes</p>
    </div>


    <div>
        <asp:GridView ID="dgvlistAlumnos" CssClass="container text-center" AutoGenerateColumns ="false" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                <asp:CheckBoxField HeaderText="Rol" DataField="Rol" />
            </Columns>
  
        </asp:GridView>

        <%--        <table class="table" border="1">
            <tr>
                <th>Nombre y apellido</th>
                <th>Perfil</th>
            </tr>
            <tr>
                <td>Juan</td>
                <td>Ver Perfil </td>
            </tr>
            <tr>
                <td>Pedro</td>
                <td>Ver perfil</td>
            </tr>
            <tr>
                <td>Toni</td>
                <td>Ver Perfil</td>
            </tr>
        </table>--%>
    </div>

    <%--<div>
        <asp:Button ID="btnAgregarAlumno" OnClick="btnAgregarAlumno_Click" runat="server" Text="Agregar alumno" CssClass="btn btn-primary btn-lg" />
    </div> --%>
    <div>
        <asp:Button Style="margin-top: 10px;" ID="btnVerRutinas" OnClick="btnVerRutinas_Click" runat="server" Text="Ver rutinas" CssClass="btn btn-primary btn-sm" />
    </div>


</asp:Content>
