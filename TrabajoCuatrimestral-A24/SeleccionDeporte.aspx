<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="SeleccionDeporte.aspx.cs" Inherits="tp_webform_equipo_24A.InicioEntrenador" %>

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

    <div>

        <h1>SELECCIONE DISCPLINAS </h1>

    <div class="form-check">
        <input class="form-check-input" type="checkbox" id="ciclismo">
        <label class="form-check-label" for="ciclismo">Ciclismo</label>
    </div>
    <div class="form-check">
        <input class="form-check-input" type="checkbox" id="natacion">
        <label class="form-check-label" for="natacion">Natación</label>
    </div>
    <div class="form-check">
        <input class="form-check-input" type="checkbox" id="running">
        <label class="form-check-label" for="running">Running</label>
    </div>
        <br />

        <div>
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
        </div>
        <br
        
    <div>
<button type="button" class="btn btn-dark btn-lg" onclick="window.location.href='InicioDeportista.aspx'">Guardar</button>  

    </div>

        <br />
    </div>

    <div class="video-container">
        <iframe width="320" height="180"
            src="https://www.youtube.com/embed/j-WwXEK2zNc?autoplay=1&mute=1"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen></iframe>
    </div>


    




</asp:Content>
