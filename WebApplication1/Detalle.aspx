<%@ Page Title="Detalle" Language="C#" MasterPageFile="~/ArticulosMaster.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="WebApplication1.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card mb-3"%>
            <img src="<% = articulo.Imagen %>"  class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><% = articulo.Nombre %></h5>
                <h7 class="card-title"><% = articulo.Marca.Descripcion %></h7>
                <p class="card-text"><% = articulo.Descripcion %></p>
                <p class="card-text"><small class="text-muted"><% = articulo.Categoria.Descripcion %></small></p>
                <div class="form-group row">
                    <asp:Label Text="Precio: $" CssClass="card-title" ID="lblTxtPrecio" runat="server" />
                    <asp:Label Text="" CssClass="card-text" ID="lblPrecio" runat="server" />
                </div>
                <div class="form-group row">
                        <asp:Label Text="Cantidad" CssClass="col-sm-2 col-form-label" runat="server" />
                    <div class="col-auto">
                        <asp:TextBox CssClass="form-text" ID="txtBoxCantidad" Text="1" runat="server" />  
                    </div>
                </div>
                <div class="col-md">
                    <asp:Button Text="Agregar Articulo" CssClass="btn btn-primary" ID="btnAgregarArticulo" runat="server" OnClick="btnAgregarArticulo_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
