<%@ Page Title="Login - Proyecto Gimnasio" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="TrabajoCuatrimestral.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 70vh;
        }

        .login-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 400px;
            padding: 2rem;
        }

        .login-card h2 {
            font-weight: 700;
            color: #000000; 
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .form-control:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }

        .btn-primary {
            background-color: #000000;
            border: none;
        }

        .btn-primary:hover {
            background-color: #333333;
        }

        .login-footer {
            text-align: center;
            margin-top: 1rem;
            font-size: 0.9rem;
        }

        .login-footer a {
            color: #0d6efd;
            text-decoration: none;
        }

        .login-footer a:hover {
            text-decoration: underline;
        }

        .gym-img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 10px 10px 0 0;
            margin-bottom: 1rem;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <div class="login-card">
            <img src="https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=800&q=80"
                 alt="Gym" class="gym-img" />

            <h2>Iniciar sesión</h2>

            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="tuemail@ejemplo.com"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="txtPassword" class="form-label">Contraseña</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="••••••••"></asp:TextBox>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Ingresar" CssClass="btn btn-primary w-100" />

            <div class="login-footer">
                <p>¿No tienes cuenta? <a href="Registro.aspx">Regístrate</a></p>
            </div>
        </div>
    </div>


</asp:Content>