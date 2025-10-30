<%@ Page Title="Principal - Proyecto Gimnasio" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="TrabajoCuatrimestral.Principal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

         body {
            background-color: #0a0a0a !important;
            color: #fff;
        }

        .contact-section {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background-color: #000;
        }

        .contact-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            width: 100%;
            max-width: 1200px;
            background-color: #0f0f0f;
        }

        .contact-image {
            background: url('images/gym-contact.jpg') center center/cover no-repeat;
            min-height: 500px;
        }

        .contact-form {
            padding: 60px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .contact-form h2 {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 25px;
            color: #ff6600;
        }

        .contact-form label {
            margin-top: 10px;
            font-weight: 500;
        }

        .contact-form input,
        .contact-form textarea {
            width: 100%;
            margin-top: 5px;
            padding: 12px 15px;
            border: none;
            border-radius: 6px;
            background-color: #1a1a1a;
            color: #fff;
            outline: none;
        }

        .contact-form input:focus,
        .contact-form textarea:focus {
            background-color: #222;
            border: 1px solid #ff6600;
        }

        .btn-enviar {
            background-color: #ff6600;
            border: none;
            padding: 12px 20px;
            color: #fff;
            border-radius: 6px;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        .btn-enviar:hover {
            background-color: #e65c00;
        }

        @media (max-width: 768px) {
            .contact-container {
                grid-template-columns: 1fr;
            }

            .contact-image {
                height: 250px;
            }

            .contact-form {
                padding: 40px 25px;
            }
        }
    </style>

          
</asp:Content>

<asp:Content ID="MenuContent" ContentPlaceHolderID="MenuExtra" runat="server">
    <li class="nav-item"><a class="nav-link" href="Inicio.aspx">Acceder</a></li>
    <li class="nav-item"><a class="nav-link" href="Planes.aspx">Planes</a></li>
    <li class="nav-item"><a class="nav-link" href="Contacto.aspx">Contacto</a></li>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <section class="contact-section">
        <div class="contact-container">

            <div class="contact-image"></div>

            <div class="contact-form">
                <h2>Contactanos</h2>
                <p>Dejanos tus datos y nos comunicaremos con vos.</p>

                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre completo"></asp:TextBox>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Teléfono"></asp:TextBox>
                <asp:TextBox ID="txtMensaje" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" placeholder="Mensaje"></asp:TextBox>

                <asp:Button ID="btnEnviar" runat="server" Text="Enviar mensaje" CssClass="btn-enviar" />
            </div>
        </div>
    </section>



</asp:Content>