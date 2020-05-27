<%@ Page Title="Home" Language="C#" MasterPageFile="~/ArticulosMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class ="container">
    <h1 class="display-2">Bienvenido!</h1>
    <h1 class="display-4">Estos son nuestros articulos</h1>
    <asp:TextBox CssClass="form-control mr-sm-2" ID="txtBoxBuscar" placeholder="Buscar..." runat="server" />
    <asp:Button Text="Buscar" class="btn btn-outline-success my-2 my-sm-0" ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" />
    </div>
    <div class="container">
        <div class="row">
             <%foreach (var item in listaArticulos)
            {%>
        <div class="col-4">
            <div class="card" style="width: 18rem;">
                <img src="<%= item.Imagen %>" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><% = item.Nombre %></h5>
                    <p class="card-text"><% = item.Descripcion %></p>
                    <a href="Detalle.aspx?cArt=<%= item.Codigo %>" class="btn btn-primary">Ver Articulo</a>
                </div>
            </div>
        </div>
           <%}%>
        </div>
        <div class="row">
            <asp:Label Text="Todavia no tenemos ese producto... =(" CssClass="display-4" Visible="false" ID="lblNoLoTenemos" runat="server" />
        </div>
    </div>
</asp:Content>
