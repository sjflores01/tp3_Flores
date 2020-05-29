<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="WebApplication1.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Tranquilo! Nada puede malir sal!</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row"></div>
            <div class="row mb-4 mt-4">
                <div class="col-4">
                    <img class="img-fluid" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx7yGp1y3hulPz3cIfBaAvMR2iCAl_C45Es-fozrkJB_Dz2yWr&s" alt="Alternate Text" />
                </div>
                <div class="col-5">
                    <h4 class="display-3 text-info">Error!</h4>
                    <p class="text-info">Esta es la pagina de Error donde nada puede malir sal...</p>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                <a href="Home.aspx" class="btn btn-outline-info">Ir a la Home</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
