<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PRUEBASII.Forms.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Resources/css/estilo_login.css" rel="stylesheet" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
    
<script type="text/javascript">
    function login() {
        swal({
            title: "Login",
            text: "Usuario o Contraseña Invalido!",
            icon: "error",
            button: "OK",
        });
    }

    function loginvacio() {
        swal({
            title: "Login",
            text: "Los Campos no deben estar vacios!",
            icon: "error",
            button: "OK",
        });
    }

    function nobackbutton() {

        window.location.hash = "no-back-button";

        window.location.hash = "Again-No-back-button" //chrome

        window.onhashchange = function () { window.location.hash = "no-back-button"; }

    }
</script>
<body>
    <form id="form1" runat="server">
        <div class="body"></div>
        <div class="grad"></div>
        <div class="header">
            <div>Prueba<span>SII</span></div>
        </div>
        <br>
        <div class="login">
            <input type="text" placeholder="Usuario" runat="server" id="txbuser" /><br>
            <input type="password" placeholder="Contraseña" runat="server" id="txbcontra" /><br>
            <input type="button" value="Login" id="btnlogin" runat="server" onserverclick="btnlogin_ServerClick" />
        </div>
    </form>
</body>
</html>
