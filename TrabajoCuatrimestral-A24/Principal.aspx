<%@ Page Title="Principal - Proyecto Gimnasio" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="TrabajoCuatrimestral.Principal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        .carousel-caption {
            background: rgba(0, 0, 0, 0.55);
            border-radius: 10px;
            padding: 20px;
        }

        .carousel-caption h2 {
            font-size: 2rem;
            font-weight: bold;
        }

        .carousel-caption p {
            font-size: 1.1rem;
        }

        .carousel-item img {
            width: 100%;
            height: 100vh;
            object-fit: cover;
            filter: brightness(0.8);
        }

        .info-section {
            margin-top: 50px;
            text-align: center;
        }

        .info-section h3 {
            font-size: 1.8rem;
            font-weight: 600;
        }

        .info-section p {
            max-width: 800px;
            margin: 10px auto;
            font-size: 1.1rem;
        }

        .btn-primary {
            background-color: #ff6600;
            border: none;
        }

        .btn-primary:hover {
            background-color: #e65c00;
         }

        #heroCarousel {
            width: 100vw;        
            height: 99vh;
            position: relative;
            left: 50%;
            right: 50%;
            margin-left: -50vw;    
            margin-right: -50vw;
            overflow: hidden;
        }

        #heroCarousel {
            margin-top: -20px;   
            margin-bottom: -20px; 
        }

        .info-section {
               position: absolute;           
               top: 50%;                     
               left: 50%;
               transform: translate(-50%, -50%); 
               z-index: 10;                  
               width: 100%;
               display: flex;
               justify-content: center;
               align-items: center;
           }

        .info-card {
               background: rgba(255, 255, 255, 0.9);
               border-radius: 10px;
               padding: 40px;
               max-width: 700px;
               box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
               text-align: center;
           }

        .info-card h3 {
               font-size: 1.8rem;
               font-weight: 600;
               margin-bottom: 15px;
           }

        .info-card p {
               font-size: 1.1rem;
               color: #333;
           }
           
    </style>
</asp:Content>

<asp:Content ID="MenuContent" ContentPlaceHolderID="MenuExtra" runat="server">
    <li class="nav-item"><a class="nav-link" href="Inicio.aspx">Acceder</a></li>
    <li class="nav-item"><a class="nav-link" href="Planes.aspx">Planes</a></li>
    <li class="nav-item"><a class="nav-link" href="Contacto.aspx">Contacto</a></li>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">

        <div class="carousel-item active">
            <img src="images/gym1.jpg" class="d-block w-100" alt="Entrenamiento personalizado">
            <div class="carousel-caption d-none d-md-block">
                <h2>Entrená con los mejores</h2>
                <p>Rutinas personalizadas y seguimiento profesional a tu medida.</p>
            </div>
        </div>

        <div class="carousel-item">
            <img src="images/gym2.jpg" class="d-block w-100" alt="Equipamiento moderno">
            <div class="carousel-caption d-none d-md-block">
                <h2>Equipamiento de primera</h2>
                <p>Entrená con tecnología de última generación.</p>
            </div>
        </div>

        <div class="carousel-item">
            <img src="images/gym3.jpg" class="d-block w-100" alt="Clases grupales">
            <div class="carousel-caption d-none d-md-block">
                <h2>Clases grupales</h2>
                <p>Viví la energía de entrenar acompañado.</p>
            </div>
        </div>

    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
    </button>
</div>

    <section class="info-section">
      <div class="info-card">
        <h3>Bienvenido a Net Durance</h3>
        <p>
            Tu plataforma integral de entrenamiento y bienestar. 
            Conectá con profesores certificados, accedé a rutinas adaptadas a tus objetivos 
            y reservá clases cuando quieras.
        </p>
        <a href="Inicio.aspx" class="btn btn-primary mt-3">Iniciar sesión</a>
      </div>
    </section>

</asp:Content>