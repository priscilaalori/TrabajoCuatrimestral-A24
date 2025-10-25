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
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>

        <h1>SELECCIONE UNA DISCPLINA</h1>
        <p>Elias sos un gato, te voy a cambiar todo. </p>

        <div class="form-group">
            <label for="ddlDeporte">Seleccioná tu deporte principal:</label>
            <asp:DropDownList ID="ddlDeporte" runat="server" CssClass="form-control">
                <asp:ListItem Text="--Seleccione un deporte--" Value="" />
                <asp:ListItem Text="Natación" Value="Natación" />
                <asp:ListItem Text="Running" Value="Running" />
                <asp:ListItem Text="Ciclismo" Value="Ciclismo" />
            </asp:DropDownList>

            <asp:RequiredFieldValidator ID="rfvDeporte" runat="server"
                ControlToValidate="ddlDeporte"
                InitialValue=""
                ErrorMessage="Debe seleccionar un deporte"
                ForeColor="Red"
                Display="Dynamic" />
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
        <button type="button" class="btn btn-dark btn-lg"> Guardar</button>
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
