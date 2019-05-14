<!--**
 *
 * @author paulo.bezerra
 *-->
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>

<%-- 
    Created on : june 20, 2018, 11:13:17 PM
    Author     : paulo.bezerra
--%>
<!doctype html>
<html lang="en">
    <head>

        <meta name="google" content="notranslate">

        <meta charset="utf-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>9ember ERP</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/loading.css"/>
        <link rel="stylesheet" type="text/css" href="css/loading-btn.css"/>

        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">

        <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
        <link rel="manifest" href="favicon/site.webmanifest">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">
    </head>

    <body class="text-center" style="background-color: white;">
        <form class="form-signin" action="Login"  method="POST">

            <style>
                img{
                    max-width: 100%;
                    /*border: 20px solid #ff0080;
                    padding: 20px;*/

                }

            </style>

            <br>
            <br>
            <br>
            <img class="mb-4" src="img/senac_logo.png" alt="logo ERP">
            <h5 class="mb-0">Welcome to
                <span style = "color: #add8e6">ERP Portable</span>
            </h5>
            <br>
            <label for="inputEmail" class="sr-only">Email</label>
            <input type="email" autocomplete="off" id="inputEmail" class="form-control" placeholder="Email address" name = "emailuser" required autofocus>
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" autocomplete="off" id="inputPassword" class="form-control" placeholder="Senha" name = "password" required>
            <div id = 'entrar' class="btn btn-default ld-ext-bottom">
                <button class="btn btn-lg btn-secondary btn-block" onclick="loading()" type="submit">Enter</button>
                <div class="ld ld-ring ld-spin-fast"></div>
            </div>
            <p></p>
            <label>
                <a href ="ForgotPassword.jsp">Esqueci a Senha</a>
            </label>

            <p class="mt-5 mb-3 text-muted">&copy; 9ember Devs</p>
        </form>
    </body>
    <script src="js/jquery.js"></script>

    <script>

                  function loading() {

                      $('#entrar').addClass('running');

                  }
    </script>

</html>
