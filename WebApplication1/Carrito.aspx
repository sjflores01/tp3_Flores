﻿<%@ Page Title="Carrito" Language="C#" MasterPageFile="~/ArticulosMaster.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="WebApplication1.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <asp:Label Text="Hola " CssClass="display-3 text-info" ID="lblBienvenida" runat="server" />
        </div>
    </div>
    <div class="container">
        <div class="row">
            <asp:Label Text="Tu carrito no tiene items! 
                   Que esperas!? Volvé a la home y agregá lo que quieras!"
                ID="lblCarritoVacio" CssClass="display-4 text-info" runat="server" />
        </div>
        <div class="row my-4">
            <table class="table text-secondary">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Cod.</th>
                        <th scope="col">Articulo</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Categoria</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col">Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <%foreach (var item in listaCarro)
                        {%>
                    <tr>
                        <th scope="row"><% = item.Codigo %></th>
                        <td><% = item.Nombre %></td>
                        <td><% = item.Descripcion %></td>
                        <td><% = item.Categoria.Descripcion %></td>
                        <td>
                            <a href="Carrito.aspx?cArt=<% = item.Codigo %>&cant=resta">
                                <svg class="bi bi-file-arrow-down" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M4 1h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H4z" />
                                    <path fill-rule="evenodd" d="M4.646 8.146a.5.5 0 0 1 .708 0L8 10.793l2.646-2.647a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z" />
                                    <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0v-6A.5.5 0 0 1 8 4z" />
                                </svg>
                            </a>
                            <% = item.Cantidad %>
                            <a href="Carrito.aspx?cArt=<% = item.Codigo %>&cant=suma">
                                <svg class="bi bi-file-arrow-up" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M4 1h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H4z" />
                                    <path fill-rule="evenodd" d="M4.646 7.854a.5.5 0 0 0 .708 0L8 5.207l2.646 2.647a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 0 0 0 .708z" />
                                    <path fill-rule="evenodd" d="M8 12a.5.5 0 0 0 .5-.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 0 .5.5z" />
                                </svg>
                            </a>
                        </td>
                        <td>
                            <a href="Carrito.aspx?cElim=<% = item.Codigo %>">
                                <svg class="bi bi-trash text-danger" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                                </svg>
                            </a>
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group font-weight-bold">
                    <asp:Label Text="Precio Final: $" ID="lblTextPrecio" Visible="false" runat="server" />
                    <asp:Label Text="" ID="lblPrecioFinal"  Visible="false" runat="server" />
                </div>
            </div>
        </div>
        <div class="row">
            <asp:Button Text="Volver a Home" CssClass="btn btn-primary" ID="btnVolver" runat="server" OnClick="btnVolver_Click" PostBackUrl="~/Home.aspx" />
        </div>
    </div>
</asp:Content>
