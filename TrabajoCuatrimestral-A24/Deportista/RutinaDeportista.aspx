<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="RutinaDeportista.aspx.cs" Inherits="tp_webform_equipo_24A.RutinaDeportista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1> Trabajo de hoy</h1>
    <h2> Hola! estos son los ejecicios a realizar el dia de hoy</h2>
    <br />
    <asp:Label ID="lblNombre" runat="server" Text="Aca vamos a mostrar los ejecicios que deba hacer." />

    <h2>¿Pudiste completar?</h2>
    <asp:CheckBox ID="chkOpcion1" runat="server" Text="SI LOGRE COMPLETAR" />
   <asp:CheckBox ID="chkOpcion2" runat="server" Text="CASI LO TERMINO" />
   <asp:CheckBox ID="CheckBox1" runat="server" Text="NO LOGRE COMPLETAR" />

    <br />

    <h2>¿Puedes medir cuento esfuerzo te costo el ejercicio?</h2>
   <asp:CheckBox ID="CheckBox2" runat="server" Text="POCO ESFUERZO" />
   <asp:CheckBox ID="CheckBox3" runat="server" Text="LO SENTI UN POCO" />
   <asp:CheckBox ID="CheckBox4" runat="server" Text="ME COSTO MUCHO" />

    <br />

    <h3> Haz un promedio del de ritmo sobre el valor total de kilometros que corriste</h3>
    <asp:TextBox ID="txtNombre" runat="server" />






</asp:Content>
