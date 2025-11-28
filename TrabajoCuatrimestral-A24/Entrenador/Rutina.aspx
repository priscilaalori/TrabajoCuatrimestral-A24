<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Rutina.aspx.cs" Inherits="tp_webform_equipo_24A.Rutina" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .oculto {
            display: none;
        }

        .btn-short {
            width: 150px !important;
            display: inline-block !important;
            white-space: nowrap;
            text-align: center;
            padding-left: 12px;
            padding-right: 12px;
        }

        input.btn-short, button.btn-short {
            width: 150px !important;
            display: inline-block !important;
        }

         .banner-container {
             position: relative;
             width: 100%;
             height: 220px; 
             border-radius: 10px;
             overflow: hidden;
             margin-bottom: 20px;
         }

         .banner-img {
             width: 100%;
             height: 100%;
             object-fit: cover;
             filter: brightness(70%); 
         }

         .banner-text {
             position: absolute;
             top: 50%;
             left: 50%;
             transform: translate(-50%, -50%);
             color: white;
             font-size: 32px;
             font-weight: 600;
             text-shadow: 0 0 8px rgba(0,0,0,0.7);
         }
    </style>


    <div class="banner-container">
        <img class="banner-img" src="/Images/banner-gym.jpg" alt="Banner">
        <div class="banner-text">
            <h1>Mis rutinas</h1>
        </div>
    </div>


    <div>
        <asp:GridView ID="dgvlistRutinas" OnRowCommand="dgvlistRutinas_RowCommand" CssClass="table" OnSelectedIndexChanged="dgvlistRutinas_SelectedIndexChanged" OnRowDataBound="dgvlistRutinas_RowDataBound" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField HeaderText="idRutina" DataField="IdRutina" HeaderStyle-CssClass="oculto" ItemStyle-CssClass="oculto" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Nivel" DataField="Nivel" />
                <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                <asp:BoundField HeaderText="Deporte" DataField="Deporte" />


                <asp:TemplateField HeaderText="Acción">
                    <ItemTemplate>
                        <asp:LinkButton 
                            ID="btnModificar" 
                            runat="server" 
                            Text="Modificar" 
                            CommandName="Select"
                            CssClass="btn btn-modificar" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ejercicios">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnAgregarEjercicio" runat="server" Text="Ver"
                            CommandName="AgregarEjercicio"
                            CssClass="btn btn-ver"
                            CommandArgument='<%# Eval("IdRutina") %>'
                            CausesValidation="false" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Eliminar">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEliminar" runat="server" Text="Eliminar"
                            CommandName="Eliminar"
                            CssClass="btn btn-eliminar"
                            CommandArgument='<%# Eval("IdRutina") %>'
                            CausesValidation="false" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Agregar">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnAgregarRutinaAlumno" runat="server" Text="Agregar"
                            CommandName="AgregarRutinaADeportista"
                            CommandArgument='<%# Eval("IdRutina") %>'
                            CssClass="btn btn-agregar"
                            CausesValidation="false" />

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>

    <div>
        <asp:Button Style="margin-top: 10px;" ID="btnAgregarRutina" OnClick="btnAgregarRutina_Click" runat="server" Text="Agregar rutina" CssClass="btn btn-dark btn-short" />
    </div>

    <div>
        <asp:Button Style="margin-top: 10px;" ID="btnVolver" OnClick="btnVolver_Click" runat="server" Text="Volver" CssClass="btn btn-dark btn-short" CausesValidation="false" />
    </div>

</asp:Content>
