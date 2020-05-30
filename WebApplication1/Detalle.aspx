<%@ Page Title="Detalle" Language="C#" MasterPageFile="~/ArticulosMaster.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="WebApplication1.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="alert-danger" role="alert" style="width: 400px">
        <asp:Label CssClass="alert-danger" ID="lblCompletar" Visible="false" Text="Completa la cantidad!" runat="server" />
    </div>
    <div class="container">
        <div class="card mb-6">
            <div class="row no-gutters">
                <div class="col-md-8">
                    <img src="<% = articulo.Imagen %>" class="card-img" alt="...">
                </div>
                <div class="col-md-4">
                    <div class="card-body">
                        <h5 class="card-title"><% = articulo.Nombre %></h5>
                        <h6 class="card-title"><% = articulo.Marca.Descripcion %></h6>
                        <p class="card-text"><% = articulo.Descripcion %></p>
                        <p class="card-text"><small class="text-muted"><% = articulo.Categoria.Descripcion %></small></p>
                        <h6>
                            <asp:Label Text="Precio: $" CssClass="card-title" ID="lblTxtPrecio" runat="server" />
                            <asp:Label Text="" CssClass="card-title" ID="lblPrecio" runat="server" />
                        </h6>
                        <div class="row form-inline">
                            <div class="col align-content-center">
                                <asp:Label Text="Cantidad" CssClass="card-text" runat="server" />
                                <asp:TextBox CssClass="card-text form-control mb-2" Columns="2" MaxLength="3" ID="txtBoxCantidad" Text="1" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md">
                        <asp:Button Text="Agregar Articulo" CssClass="btn btn-primary" ID="btnAgregarArticulo" runat="server" OnClick="btnAgregarArticulo_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
