<%@ Page Title="Home" Language="C#" MasterPageFile="~/ArticulosMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row text-info justify-content-between">
            <div class="col-4">
                <h1 class="display-2">Bienvenido!</h1>
            </div>
            <div class="col-1 align-self-baseline mt-4 mr-5">
                <div class="btn-group">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg class="bi bi-cart3" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                        </svg>
                    </button>
                    <div class="dropdown-menu">
                        <%
                            if (listaCarro != null)
                            {
                                foreach (var item in listaCarro)
                                {%>
                                  <p class="dropdown-item" ><% = item.Nombre%> - (<% = item.Cantidad %>) </p>
                                <%} %>
                        <% } %>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="Carrito.aspx">Ir al Carrito</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row text-info">
            <div class="col">
                <h1 class="display-4">Estos son nuestros articulos</h1>
            </div>
        </div>
        <div class="row form-inline mb-2">
            <asp:TextBox CssClass="form-control mr-sm-2" Columns="140" MaxLength="100" ID="txtBoxBuscar" placeholder="Buscar..." runat="server" />
            <asp:Button Text="Buscar" ID="btnBuscar" CssClass="btn btn-outline-info" runat="server" OnClick="btnBuscar_Click" />
        </div>

        <div class="row">
            <div class="card-deck">
                <%foreach (var item in listaArticulos)
                    {
                        if (listaArticulos.Count < 3)
                        {
                        //El warning es por esta linea que agregue para que no me rompa la vista si hay menos de 3 unidades
                       %><div class="col-6"> 
                       <%}
                        else
                        {
                    %><div class="col-4">
                        <%
                        }%>
                        <div class="card border-info mb-3" style="width: 18rem;">
                            <img src="<%= item.Imagen %>" class="card-img-top" alt="...">
                            <div class="card-body text-dark">
                                <h5 class="card-title"><% = item.Nombre %></h5>
                                <p class="card-text"><% = item.Descripcion %></p>
                                <a href="Detalle.aspx?cArt=<%= item.Codigo %>" class="btn btn-info">Ver Articulo</a>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
            <div class="row">
                <asp:Label Text="Todavia no tenemos ese producto... =(" CssClass="display-4" Visible="false" ID="lblNoLoTenemos" runat="server" />
            </div>
        </div>
</asp:Content>
