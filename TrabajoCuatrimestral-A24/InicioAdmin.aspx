<%@ Page Title="Panel de Administración" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="InicioAdmin.aspx.cs" Inherits="TrabajoCuatrimestral.InicioAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
                body {
            background: linear-gradient(to bottom right, #f3f3f3, #dcdcdc);
        }

        .admin-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 120px);
        }

        .cards-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
            max-width: 900px;
            width: 100%;
            padding: 20px;
        }

        .admin-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            padding: 40px 30px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.15);
            transition: all 0.3s ease;
        }

        .admin-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.25);
        }

        .admin-card h4 {
            font-size: 1.6rem;
            font-weight: 600;
            color: #222;
            margin-bottom: 15px;
        }

        .admin-card p {
            font-size: 1rem;
            color: #555;
            margin-bottom: 20px;
        }

        .admin-card a {
            text-decoration: none;
        }

        .btn-card {
            background-color: #0d6efd;
            color: #fff;
            padding: 10px 25px;
            border-radius: 6px;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-card:hover {
            background-color: #0b5ed7;
        }

        @media (max-width: 768px) {
            .cards-grid {
                grid-template-columns: 1fr;
            }
        }

        .admin-card {
    position: relative;
    background-size: cover;
    background-position: center;
    border-radius: 12px;
    padding: 40px 30px;
    color: #fff; /* ✅ texto blanco */
    text-align: center; /* ✅ centrado horizontal */
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0,0,0,0.25);
    transition: all 0.3s ease;
    min-height: 300px;
    display: flex; /* ✅ centrado vertical */
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.admin-card::before {
    content: "";
    position: absolute;
    inset: 0;
    background: rgba(0, 0, 0, 0.6); /* ✅ capa oscura para contraste */
    border-radius: 12px;
}

.admin-card h4,
.admin-card p,
.admin-card a {
    position: relative;
    z-index: 1; /* para estar por encima del overlay */
}

.admin-card h4 {
    color: #fff;
    font-size: 1.6rem;
    font-weight: bold;
    margin-bottom: 10px;
}

.admin-card p {
    color: #f0f0f0;
    font-size: 1rem;
    margin-bottom: 20px;
}

.btn-card {
    background-color: #ff6600;
    color: #fff;
    padding: 10px 18px;
    border-radius: 6px;
    text-decoration: none;
    font-weight: 500;
    transition: background-color 0.3s ease;
}

.btn-card:hover {
    background-color: #e65c00;
}

.admin-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.4);
}

        
        .card-usuarios {
            background-image: url('images/admin-usuarios.jpg');
        }
        
        .card-deportes {
            background-image: url('images/admin-deportes.jpg');
        }
        
        .card-config {
            background-image: url('images/admin-config.jpg');
        }
        
        .card-profes {
            background-image: url('images/admin-profes.jpg');
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin-container">
        <div class="cards-grid">
            <div class="admin-card card-usuarios">
                <h4>Usuarios</h4>
                <p>Gestioná altas, bajas y modificaciones de socios.</p>
                <a href="Administrador/AdministrarUsuarios.aspx" class="btn-card">Administrar</a>
            </div>

            <div class="admin-card card-profes">
                <h4>Otra funcionalidad</h4>
                <p>¿Que vamos a cambiar acá?.</p>
                <a href="Profesores.aspx" class="btn-card">Administrar</a>
            </div>

            <div class="admin-card card-deportes">
                <h4>Deportes</h4>
                <p>Creá o modificá deportes.</p>
                <a href="Administrador/AdministrarDeportes.aspx" class="btn-card">Ver Deportes</a>
            </div>

            <div class="admin-card card-config">
                <h4>Configuración</h4>
                <p>Actualizá información del sistema, accesos y parámetros.</p>
                <a href="Config.aspx" class="btn-card">Configurar</a>
            </div>

        </div>
    </div>
</asp:Content>