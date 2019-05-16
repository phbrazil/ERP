<!--**
 *
 * @author paulo.bezerra
 *-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<%
    HttpSession sessao = request.getSession();
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ERP Portable</title>
        <meta name="google" content="notranslate">

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <link href="css/notification/notification.css" rel="stylesheet">
        <link href="css/customAlert.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
        <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
        <link href="css/buttonbranco.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/tooltip.css" />

        <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
        <link rel="manifest" href="favicon/site.webmanifest">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">



    </head>
    <style>

        .tamanhofonte {
            font-size: small;
        }
    </style>



    <body id="page-top">

        <p></p>
        <div align ="center">
            <!--img class="mb-4" src="img/mci_logo.png" alt="logo MCI" style="width: 20%; height: 20%"-->
            <div align ="center">
                <div class="col-md-7 order-md-1">
                    <div class="row">

                        <div class="col-md-4 mb-3">


                            <h4 class="text-muted">Olá 
                                <span style = "color: #add8e6"><c:out value="${nomecomp}"/></span>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>

            <style>

                .content
                {
                    width: xpx;
                    margin: 0 auto;
                }
                .inner
                {
                    display:inline-block;
                }
            </style>
            <div align="center">
                <div class="col-md-12 order-md-1">
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <form name = "ActionHome" action="${pageContext.request.contextPath}/ActionHome" method="POST">
                                <div class="card" style="width: 70%; height: 10%">
                                    <img class="card-img-top" src="img/newClient.png" style="width: 70px; height: 60px;" alt="Cliente">
                                    <div class="card-body">
                                        <h5 class="text-muted">Cadastrar Fornecedor</h5>
                                        <input  type="hidden" name = "action" value = "newVendor">
                                        <button  type="submit" class = "btn btn-info">Ir</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-4 mb-3">
                            <form name = "ActionHome" action="${pageContext.request.contextPath}/ActionHome" method="POST">
                                <div class="card" style="width: 80%; height: 10%">
                                    <img class="card-img-top" src="img/newProduct.png" style="width: 60px; height: 60px;" alt="Produto">
                                    <div class="card-body">
                                        <h5 class="text-muted">Cadastrar Produto</h5>
                                        <input  type="hidden" name = "action" value = "newProduct">
                                        <button  type="submit" name = "type" class = "btn btn-info">Ir</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="col-md-4 mb-3">
                            <form name = "ActionHome" action="${pageContext.request.contextPath}/ActionHome" method="POST">
                                <div class="card" style="width: 80%; height: 10%">
                                    <img class="card-img-top" src="img/newRequest.png" style="width: 60px; height: 60px;" alt="Scorecard">
                                    <div class="card-body">
                                        <h5 class="text-muted">Novo Pedido de Compra</h5>
                                        <input  type="hidden" name = "action" value = "newRequest">
                                        <button  type="submit" name = "type" class = "btn btn-info">Ir</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-4 mb-3">
                            <form name = "ActionHome" action="${pageContext.request.contextPath}/ListarPedidoCompra" method="POST">
                                <div class="card" style="width: 80%; height: 10%">
                                    <img class="card-img-top" src="img/pendingApproval.png" style="width: 60px; height: 60px;" alt="Scorecard">
                                    <div class="card-body">
                                        <h5 class="text-muted">Pedidos Pendentes</h5>
                                        <input  type="hidden" name = "action" value = "pendingApproval">
                                        <button  type="submit" name = "type" class = "btn btn-info">Ir</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-4 mb-3">
                            <form name = "ActionHome" action="${pageContext.request.contextPath}/ActionHome" method="POST">
                                <div class="card" style="width: 80%; height: 10%">
                                    <img class="card-img-top" src="img/sair.png" style="width: 60px; height: 60px;" alt="Scorecard">
                                    <div class="card-body">
                                        <h5 class="text-muted">Sair</h5>
                                        <input  type="hidden" name = "action" value = "Sair">
                                        <button  type="submit" name = "type" class = "btn btn-info">Ir</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>



            <footer class="my-5 pt-5 text-muted text-center text-small">
                <p class="mb-0">Session
                    <span class="text-primary"><c:out value="${sessaoid}"/></span>
                </p>
                <p class="mb-0">&copy; 9ember Devs</p>
            </footer>
    </body>

    <script src="js/jquery.js"></script>
    <script src="js/customAlert.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <!-- Icons -->
    <script src="js/feather.min.js"></script>
    <script>
        feather.replace()
    </script>

    <script>

        function Dash() {
            var dash = document.getElementsByName('dash');
            dash[0].submit(); //form submission

        }

    </script>

    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>




</html>