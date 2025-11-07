<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Rutina.aspx.cs" Inherits="tp_webform_equipo_24A.Rutina" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <div>
            <h1>Mis rutinas</h1>
        </div>
        
   
        <asp:GridView ID="dgvlistRutinas" CssClass="table" AutoGenerateColumns ="false" runat="server">
            <Columns>
               <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Nivel" DataField="Nivel" />
                <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                <asp:BoundField HeaderText="Deporte" DataField="Deporte" />


            </Columns>
  
        </asp:GridView>

<%--        <table class="table" border="1">
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
                <td>Rutina 3</td>
                <td>Ver detalle</td>
                <td>Modificar</td>
            </tr>
        </table>--%>
    </div>

    <div>
        <asp:Button Style="margin-top: 10px;" ID="btnAgregarRutina" OnClick="btnAgregarRutina_Click" runat="server" Text="Agregar rutina" CssClass="btn btn-primary btn-sm" />
    </div>

    <div>
        <asp:Button Style="margin-top: 10px;" ID="btnVolver" OnClick="btnVolver_Click" runat="server" Text="Volver" CssClass="btn btn-primary btn-sm" />
    </div>

</asp:Content>
