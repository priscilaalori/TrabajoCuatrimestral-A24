<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Rutina.aspx.cs" Inherits="tp_webform_equipo_24A.Rutina" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <h1>Rutinas
        </h1>
        <p>Acá va auna grilla con las rutinas: puede ver o modificar</p>
    </div>
    <div class="table" border="1">
        <table>
            <tr>
                <td></td>
            </tr>
        </table>
    </div>
    
    <div>
        <button style="margin-top: 10px;" type="button" class="btn btn-primary btn-lg">Agregar rutina </button>
    </div>


</asp:Content>
