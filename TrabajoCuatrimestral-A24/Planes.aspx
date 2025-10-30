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

        .floating-cards .card {
                border-radius: 12px;
                backdrop-filter: blur(8px);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
         }
         
         .floating-cards .card:hover {
             transform: translateY(-6px);
             box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);
         }
         
         .floating-cards .card-body {
             padding: 30px;
         }
         
         .floating-cards .card-title {
             font-size: 1.6rem;
             font-weight: 600;
         }
         
         .floating-cards .card-text {
             font-size: 1.1rem;
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

        </div>

        <div class="carousel-item">
            <img src="images/gym2.jpg" class="d-block w-100" alt="Equipamiento moderno">

        </div>

        <div class="carousel-item">
            <img src="images/gym3.jpg" class="d-block w-100" alt="Clases grupales">

        </div>

    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
    </button>

<div class="floating-cards position-absolute top-50 start-50 translate-middle w-100 d-flex justify-content-center flex-wrap px-3">


    <div class="card plan-card m-3">
        <div class="card-header text-center bg-gradient text-black plan-plus-header">
            <h4>PLAN PLUS</h4>
        </div>
        <div class="card-body text-center d-flex flex-column justify-content-center">
            <h2 class="text-dark fw-bold mb-3">$60.000 <span class="fs-5 text-secondary">/ mes</span></h2>
            <p class="text-muted mb-3">Administrá tu membresía</p>
            <ul class="list-unstyled fs-5 text-start mx-auto" style="max-width: 270px;">
                <li>✅ Acceso libre a todas las sedes</li>
                <li>✅ +800 sedes disponibles</li>
                <li>🏋️ Clases grupales incluidas</li>
                <li>📱 App exclusiva</li>
            </ul>
            <button class="btn btn-dark mt-3 px-4 py-2 rounded-pill shadow-sm">Elegir plan</button>
        </div>
    </div>


    <div class="card plan-card m-3">
        <div class="card-header text-center bg-gradient text-black plan-gold-header">
            <h4 class="mb-0 fw-bold">PLAN GOLD</h4>
        </div>
        <div class="card-body text-center d-flex flex-column justify-content-center">
            <h2 class="text-dark fw-bold mb-3">$44.000 <span class="fs-5 text-secondary">/ mes</span></h2>
            <p class="text-muted mb-3">Administrá tu membresía</p>
            <ul class="list-unstyled fs-5 text-start mx-auto" style="max-width: 270px;">
                <li>✅ Acceso libre a sedes Flex</li>
                <li>💸 Costo adicional en Plus y Total</li>
                <li>🏋️ +550 sedes disponibles</li>
                <li>📱 App exclusiva</li>
            </ul>
            <button class="btn btn-dark mt-3 px-4 py-2 rounded-pill shadow-sm">Elegir plan</button>
        </div>
    </div>

</div>

</div>



</asp:Content>