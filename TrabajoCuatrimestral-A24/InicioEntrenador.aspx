<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="InicioEntrenador.aspx.cs" Inherits="tp_webform_equipo_24A.InicioEntrenador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>

        <h1>¡Hola Entrenador!</h1>
        <p>Mis estudiantes</p>
    </div>


    <div>
        <asp:GridView ID="listAlumnos" runat="server"></asp:GridView>
        <table class="table" border="1">
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
        </table>
    </div>

    <div>

        <button type="button" class="btn btn-primary btn-lg">Agregar Alumno</button>
    </div> 
    <div>
        <button style="margin-top: 10px;" type="button" class="btn btn-primary btn-lg">Ver Rutinas </button>
    </div>


</asp:Content>
