<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Iniciar Sesion</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="display-4 text-info">
                Ingresá en tu cuenta para poder ver tu Carrito!
            </div>
            <div class="form-group mt-4">
                <label class="text-info">Nombre de Usuario</label>
                <asp:TextBox CssClass="form-control" Columns="90" MaxLength="80" ID="txtBoxUsuario" runat="server" />
            </div>
            <div class="form-group mt-2">
                <label  class="text-info">Contraseña</label>
                <asp:TextBox CssClass="form-control d-block" Columns="90" MaxLength="8" TextMode="Password" ID="txtBoxContraseña" runat="server" />
            </div>
            <div class="alert-danger my-4" role="alert" style="width:400px">
                <asp:Label CssClass="alert-danger" ID="lblCompletar"  Visible="false" Text="Completa todos los campos!" runat="server" />
            </div>
            <asp:Button Text="Ingresar" CssClass="btn btn-primary" ID="btnIngresar" runat="server" OnClick="btnIngresar_Click" />
        </div>


    </form>
</body>
</html>
