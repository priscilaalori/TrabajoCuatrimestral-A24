<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="InicioDeportista.aspx.cs" Inherits="tp_webform_equipo_24A.InicioEntrenador" %>

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
    top:0;
    left:0;
    width:100%;
    height:100%;
}
 </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>

        <h1>¡Bienvenido!</h1>
        <p>¿Que entrenamos hoy?</p>
    </div>

        <div class="video-container">
            <iframe width="320" height="180"
                src="https://www.youtube.com/embed/j-WwXEK2zNc?autoplay=1&mute=1"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen>
            </iframe>
        </div>


    <div>
        <button type="button" class="btn btn-primary btn-lg">Ver Rutinas</button>
    </div>




</asp:Content>
