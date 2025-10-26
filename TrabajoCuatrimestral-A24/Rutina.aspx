<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Rutina.aspx.cs" Inherits="tp_webform_equipo_24A.Rutina" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <asp:GridView ID="listAlumnos" runat="server"></asp:GridView>
        <table class="table" border="1">
            <tr>
                <th>Nombre </th>
                <th>Detalle</th>
                <th>Modificar</th>
            </tr>
            <tr>
                <td>Rutina 1</td>
                <td>Ver detalle </td>
                <td>Modificar</td> 
            </tr>
            <tr>
                <td>Rutina 2</td>
                <td>Ver detalle</td>
                <td>Modificar</td> 
            </tr>
            <tr>
                <td>Rutima 3</td>
                <td>Ver detalle</td>
                <td>Modificar</td> 
            </tr>
        </table>
    </div>

    <div>
        <button style="margin-top: 10px;" type="button" class="btn btn-primary btn-lg">Agregar rutina </button>
    </div>


</asp:Content>
