<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="RutinasFuturas.aspx.cs" Inherits="tp_webform_equipo_24A.Deportista.RutinasFuturas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuExtra" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<asp:DropDownList 
    ID="ddlDeporte" 
    runat="server" 
    CssClass="form-control"
    AutoPostBack="true"
    OnSelectedIndexChanged="ddlDeporte_SelectedIndexChanged">
</asp:DropDownList>



<asp:Repeater ID="rptRutinas" runat="server">
    <HeaderTemplate>
        <ul class="list-group">
    </HeaderTemplate>

    <ItemTemplate>
        <li class="list-group-item">

            <h5><strong><%# Eval("Nombre") %></strong></h5>
            <p><%# Eval("Descripcion") %></p>
            <p><strong>Nivel:</strong> <%# Eval("Nivel") %></p>
            <p><strong>Fecha inicio:</strong> <%# Eval("FechaInicio", "{0:dd/MM/yyyy}") %></p>
            <p><strong>Fecha fin:</strong> <%# Eval("FechaFin", "{0:dd/MM/yyyy}") %></p>

            <!-- REPEATER DE EJERCICIOS -->
            <asp:Repeater ID="rptEjercicios" runat="server">
                <HeaderTemplate>
                    <ul class="list-group mt-2">
                </HeaderTemplate>

                <ItemTemplate>
                    <li class="list-group-item">
                        <strong><%# Eval("Nombre") %></strong><br />
                        <%# Eval("Descripcion") %><br />

                        <%-- Si tiene video --%>
                        <asp:PlaceHolder runat="server" Visible='<%# !string.IsNullOrEmpty(Eval("UrlVideo") as string) %>'>
                            <a href='<%# Eval("UrlVideo") %>' target="_blank">Ver video</a>
                        </asp:PlaceHolder>
                    </li>
                </ItemTemplate>

                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>

        </li>
    </ItemTemplate>

    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>
    <asp:Button OnClick="BtnVolverDeRf_Click" ID="BtnVolverDeRf" runat="server" CssClass="btn btn-dark btn-short" Text="Volver" />

</asp:Content>
