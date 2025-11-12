<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MisEjercicios.aspx.cs" Inherits="tp_webform_equipo_24A.MisEjercicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuExtra" runat="server">
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Lista de Ejercicios </h1>




    <asp:Repeater ID="rptEjercicios" runat="server">

        <HeaderTemplate>
            <div class="ejercicios-listado">
        </HeaderTemplate>
        <ItemTemplate>
            <div class="ejercicio-item">

                <h3><%# Eval("Nombre") %></h3>
                <p><%# Eval("Descripcion") %></p>
                <a href='<%# Eval("UrlVideo") %>' target="_blank">Ver video</a>
                <br />
                <asp:Button OnClick="btnModificar_Click1" ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-dark btn-lg" CommandArgument='<%# Eval("IdEjercicio") %>'/>
                 <asp:Button  OnClick="BtnEliminar_Click1" ID="BtnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-dark btn-lg" CommandArgument='<%# Eval("IdEjercicio") %>'/>



                <input type="checkbox" name="ejercicioSeleccionado" value='<%# Eval("IdEjercicio") %>' />


            </div>
        </ItemTemplate>

        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>
    <br />
    <asp:Button OnClick="btnGuardarSeleccion_click" ID="btnGuardarSeleccion" runat="server" Text="Guardar Seleccion" CssClass="btn btn-dark btn-lg" />
    <br />

    <asp:Button OnClick="btnAgregarEjercicio_click" ID="btnAgregarEjercicio" runat="server" Text="Agregar Ejercicio" CssClass="btn btn-dark btn-lg" />





</asp:Content>
