<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="RutinaDeportista.aspx.cs" Inherits="tp_webform_equipo_24A.RutinaDeportista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Slider con gradiente */
        .esfuerzo-slider {
            width: 100%;
            height: 14px;
            border-radius: 8px;
            background: linear-gradient(to right, #007bff, #00ff62, #ff0000);
            outline: none;
            margin-bottom: 10px;
        }
        .esfuerzo-slider::-webkit-slider-thumb {
            -webkit-appearance: none;
            width: 18px;
            height: 18px;
            background: #fff;
            border-radius: 50%;
            border: 2px solid #000;
            cursor: pointer;
            margin-top: -3px;
        }
        .esfuerzo-slider::-moz-range-thumb {
            width: 18px;
            height: 18px;
            background: #fff;
            border-radius: 50%;
            border: 2px solid #000;
            cursor: pointer;
        }

        /* Contenedor de las descripciones (10 columnas iguales) */
        .scale-container {
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            gap: 6px;
            margin-top: 6px;
            align-items: start;
        }

        .scale-item {
            text-align: center;
            font-size: 0.85rem;
            padding: 6px 4px;
            border-radius: 6px;
            background: rgba(0,0,0,0.03);
            transition: transform 0.12s ease, background-color 0.12s ease;
            user-select: none;
        }

        .scale-item small {
            display: block;
            font-size: 0.75rem;
            color: #444;
        }

        /* Estado activo */
        .scale-item.active {
            background: rgba(0, 0, 0, 0.08);
            transform: translateY(-6px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.06);
            font-weight: 600;
        }

        /* Colores guía: se puede ajustar si querés que el texto cambie de color */
        .scale-item.low { color: #0b6ef6; }     /* azul */
        .scale-item.mid { color: #1a9d3a; }     /* verde */
        .scale-item.high { color: #c92a2a; }    /* rojo */

        /* Pequeña etiqueta del número */
        .scale-num {
            font-size: 0.95rem;
            color: #222;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="banner-container">
    <img class="banner-img" src="/Images/banner-rutinas.jpg" alt="Banner">
    <div class="banner-text">
        <h1>Trabajo de hoy</h1>
        <h3>Hola! estos son los ejercicios a realizar el día de hoy</h3>
    </div>
</div>

    
    <br />

    <asp:Button ID="btnExportarTxt" runat="server" Text="Descargar TXT"
    CssClass="btn btn-agregar btn-lg" OnClick="btnExportarTxt_Click" />

    <asp:Label ID="nombreRutina" runat="server"></asp:Label><br />
    <asp:Label ID="descripcionRutina" runat="server"></asp:Label>

    <asp:Repeater ID="rptEjercicios" runat="server">
        <HeaderTemplate>
            <ul class="list-group">
        </HeaderTemplate>

        <ItemTemplate>
            <li class="list-group-item">
                <strong><asp:Literal ID="LiteralNombre" runat="server" Text='<%# Eval("Nombre") %>' /></strong><br />
                <asp:Literal ID="LiteralDescripcion" runat="server" Text='<%# Eval("Descripcion") %>' /><br />
                <asp:Literal ID="LiteralUrl" runat="server" Text='<%# Eval("UrlVideo") %>' />
                <br />
            </li>
        </ItemTemplate>

        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>

    <div>
        <h4>¿Pudiste completar?</h4>
        <asp:CheckBox ID="chkOpcion1" runat="server" Text="SI, LOGRÉ COMPLETAR" />
        <br /><br />

        <h4>¿Cuánto esfuerzo te costó el ejercicio?</h4>

        <asp:RadioButtonList ID="rblEsfuerzo" runat="server" CssClass="form-check">
            <asp:ListItem Text="Muy débil" Value="1"></asp:ListItem>
            <asp:ListItem Text="Débil" Value="2"></asp:ListItem>
            <asp:ListItem Text="Normal" Value="3"></asp:ListItem>
            <asp:ListItem Text="Fuerte" Value="4"></asp:ListItem>
            <asp:ListItem Text="Muy fuerte" Value="5"></asp:ListItem>
        </asp:RadioButtonList>

        <h4>Nivel de esfuerzo percibido (1 a 10)</h4>

        <input
            type="range"
            id="slEsfuerzo"
            runat="server"
            name="slEsfuerzo"
            min="1" max="10" value="5"
            class="esfuerzo-slider" />

        <div class="scale-container" id="scaleContainer">
            <div class="scale-item low" data-value="1"><span class="scale-num">1</span><small>Ninguno</small></div>
            <div class="scale-item low" data-value="2"><span class="scale-num">2</span><small>Muy leve</small></div>
            <div class="scale-item low" data-value="3"><span class="scale-num">3</span><small>Leve</small></div>
            <div class="scale-item mid" data-value="4"><span class="scale-num">4</span><small>Moderado</small></div>
            <div class="scale-item mid" data-value="5"><span class="scale-num">5</span><small>Algo duro</small></div>
            <div class="scale-item mid" data-value="6"><span class="scale-num">6</span><small>Difícil</small></div>
            <div class="scale-item high" data-value="7"><span class="scale-num">7</span><small>Muy difícil</small></div>
            <div class="scale-item high" data-value="8"><span class="scale-num">8</span><small>Demasiado duro</small></div>
            <div class="scale-item high" data-value="9"><span class="scale-num">9</span><small>Máximo</small></div>
            <div class="scale-item high" data-value="10"><span class="scale-num">10</span><small>Máximo</small></div>
        </div>

        <br />

        <h5>Comentarios</h5>
        <asp:TextBox ID="txtComentario" runat="server" CssClass="form-control" />

        <br />

        <asp:Button ID="btn_guardarHistorial" runat="server" CssClass="btn btn-dark btn-lg"
            OnClick="btn_guardarHistorial_Click" Text="Guardar" />
        <asp:Button OnClick="BtnVolver_Click" ID="BtnVolver" runat="server" CssClass="btn btn-dark btn-lg" Text="Volver" />
    </div>

    <asp:Label ID="LblMsg" runat="server"></asp:Label><br />

    <script type="text/javascript">
        (function () {
            // Obtener el slider usando su ClientID (porque tiene runat="server")
            var slider = document.getElementById('<%= slEsfuerzo.ClientID %>');
            var scaleItems = document.querySelectorAll('#scaleContainer .scale-item');

            // Función que resalta el item correspondiente al valor
            function highlight(value) {
                scaleItems.forEach(function (el) {
                    if (el.getAttribute('data-value') === String(value)) {
                        el.classList.add('active');
                    } else {
                        el.classList.remove('active');
                    }
                });
            }

            // Inicial: resaltar según valor inicial del slider
            highlight(slider.value);

            // Al mover el slider: actualizar resaltado
            slider.addEventListener('input', function () {
                highlight(this.value);
            });

            // También permitir click sobre las etiquetas para posicionar el slider
            scaleItems.forEach(function (el) {
                el.addEventListener('click', function () {
                    var v = this.getAttribute('data-value');
                    slider.value = v;
                    // disparar evento input para que se actualice el highlight
                    var evt = new Event('input', { bubbles: true });
                    slider.dispatchEvent(evt);
                });
            });
        })();
    </script>

</asp:Content>
