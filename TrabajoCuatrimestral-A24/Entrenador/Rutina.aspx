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
    </style>

    <div>
        <h1>Mis rutinas</h1>
    </div>

    <div>
        <asp:GridView ID="dgvlistRutinas" OnRowCommand="dgvlistRutinas_RowCommand" CssClass="table" OnSelectedIndexChanged="dgvlistRutinas_SelectedIndexChanged" OnRowDataBound="dgvlistRutinas_RowDataBound" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField HeaderText="idRutina" DataField="IdRutina" HeaderStyle-CssClass="oculto" ItemStyle-CssClass="oculto" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Nivel" DataField="Nivel" />
                <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                <asp:BoundField HeaderText="Deporte" DataField="Deporte" />
                <asp:CommandField ShowSelectButton="true" SelectText="Modificar" HeaderText="Acción" />
                <asp:TemplateField HeaderText="Ejercicios">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnAgregarEjercicio" runat="server" Text="Ver"
                            CommandName="AgregarEjercicio"
                            CommandArgument='<%# Eval("IdRutina") %>'
                            CausesValidation="false" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Eliminar">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEliminar" runat="server" Text="Eliminar"
                            CommandName="Eliminar"
                            CommandArgument='<%# Eval("IdRutina") %>'
                            CausesValidation="false" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Agregar">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnAgregarRutinaAlumno" runat="server" Text="Agregar"
                            CommandName="AgregarRutinaADeportista"
                            CommandArgument='<%# Eval("IdRutina") %>'
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
