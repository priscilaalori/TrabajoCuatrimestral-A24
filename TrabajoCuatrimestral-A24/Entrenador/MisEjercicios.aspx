<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MisEjercicios.aspx.cs" Inherits="tp_webform_equipo_24A.MisEjercicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuExtra" runat="server">
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Lista de Ejercicios </h1>

    <table class="table">
        <thead>

            <tr>
                <th>Nombre </th>
                <th>Descripcion </th>
                <th>Video </th>
                <th>Accion </th>
            
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="rptEjercicios" runat="server">
                <ItemTemplate>
            <tr>
                <td><%# Eval("Nombre") %> </td>
                <td><%# Eval("Descripcion") %></td>
                <td><a href='<%# Eval("UrlVideo") %>' target="_blank">Ver video</a> </td>
                <td>
                    <asp:Button OnClick="btnModificar_Click1" ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-dark btn-lg" CommandArgument='<%# Eval("IdEjercicio") %>' />
                    <asp:Button OnClick="BtnEliminar_Click1" ID="BtnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-dark btn-lg" CommandArgument='<%# Eval("IdEjercicio") %>' />
                </td>
                <td>
                    
            </tr>
                     </ItemTemplate>
            </asp:Repeater>
        </tbody>

    </table>


    <br />
    <br />
    

    <asp:Button OnClick="btnAgregarEjercicio_click" ID="btnAgregarEjercicio" runat="server" Text="Agregar Ejercicio" CssClass="btn btn-dark btn-lg" />
    <br />
         <asp:Button OnClick="btnVolver_Click"  ID="btnVolver" runat="server" Text="Volver"  CssClass="btn btn-dark btn-lg" />





</asp:Content>
