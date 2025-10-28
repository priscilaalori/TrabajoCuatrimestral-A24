<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="SeleccionDeporte.aspx.cs" Inherits="tp_webform_equipo_24A.SeleccionDeporte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .video-container {
            position: relative;
            padding-bottom: 56.25%; /* 16:9 */
            height: 0;
            overflow: hidden;
            max-width: 100%;
        }

            .video-container iframe {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <asp:Panel ID="pnlDisciplinas" runat="server">

    <h1>SELECCIONE DISCIPLINAS</h1>

    <asp:CheckBox ID="chkCiclismo" runat="server" Text="Ciclismo" />
    <br />
    <asp:CheckBox ID="chkNatacion" runat="server" Text="Natación" />
    <br />
    <asp:CheckBox ID="chkRunning" runat="server" Text="Running" />
    <br /><br />

    <h1>DISPONIBILIDAD</h1>

    <asp:CheckBoxList ID="chkDias" runat="server">
        <asp:ListItem Text="Lunes" Value="Lunes"></asp:ListItem>
        <asp:ListItem Text="Martes" Value="Martes"></asp:ListItem>
        <asp:ListItem Text="Miércoles" Value="Miércoles"></asp:ListItem>
        <asp:ListItem Text="Jueves" Value="Jueves"></asp:ListItem>
        <asp:ListItem Text="Viernes" Value="Viernes"></asp:ListItem>
        <asp:ListItem Text="Sábado" Value="Sábado"></asp:ListItem>
        <asp:ListItem Text="Domingo" Value="Domingo"></asp:ListItem>
    </asp:CheckBoxList>
       </asp:Panel>
         <br />

     <asp:Button OnClick="btnGuardar_Click"  ID="btnGuardar" runat="server" Text="Guardar"  CssClass="btn btn-dark btn-lg"/>
      

        <br />
  

    <div class="video-container">
        <iframe width="320" height="180"
            src="https://www.youtube.com/embed/7vw9c8dIAko"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen></iframe>
    </div>


    




</asp:Content>
