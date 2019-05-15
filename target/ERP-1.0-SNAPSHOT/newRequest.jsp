<!--**
 *
 * @author paulo.bezerra
 *-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    HttpSession sessao = request.getSession();

%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <!-- Bootstrap core CSS -->
        <!--link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

        <meta name="google" content="notranslate">
        <link rel="stylesheet" type="text/css" href="css/button.css">
        <link rel="stylesheet" type="text/css" href="css/buttondelete.css">
        <link rel="stylesheet" type="text/css" href="css/gravar.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />
        <link rel="stylesheet" type="text/css" href="css/tooltip.css" />
        <link rel="stylesheet" type="text/css" href="css/collapse_button.css" />
        <link rel="stylesheet" type="text/css" href="css/customAlert.css" />
        <link rel="stylesheet" type="text/css" href="css/buttonvoltar.css" />

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
        <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">

        <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
        <link rel="manifest" href="favicon/site.webmanifest">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">

        <title>Novo pedido de Compra</title>

    </head>
    <body id="page-top">

        <br>

        <div align ="center">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <form name ="voltar">
                            <button  formaction="Home.jsp" class = "buttonvoltar" value="Voltar"><span data-feather="home">Voltar</button>
                        </form>
                    </div>
                    <div class="col-md-4 mb-3">
                        <h4 class="text-muted">Novo Pedido de Compra</h4>
                    </div>
                </div>

                <br>
                <h5 class="mb-0">
                    <span class="text-primary">Informações do Pedido</span>
                </h5>
                <br>
            </div>
            <form name = "createPedidoCompra" id ='createPedidoCompra' action="${pageContext.request.contextPath}/createPedidoCompra" method="POST">
                <div class="row" style="width: 70%;">
                    <div class="col-md-6 mb-3" data-toggle="tooltip" title='Nome do Fornecedor'>
                        <label>Nome do Fornecedor <strong style="color: red;">***</strong></label>
                        <div class="input-group">
                            <input autocomplete="off" onchange="naBaseFornecedor(this.value)" autofocus name="razaosocial" type="text" class="form-control" id="razaosocial" placeholder=""   maxlength ="60" required>
                            <div class="invalid-feedback">
                                Nome necessário
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 mb-3" data-toggle="tooltip" title='Nome do produto'>
                        <label>Nome do Produto <strong style="color: red;">***</strong></label>
                        <div class="input-group">

                            <input required autocomplete="off" onchange="naBaseProduto(this.value)" data-toggle="tooltip"  class="form-control form-control-dark w-100" id="nomeprod" type="text"  aria-label="Search" name ="nomeprod"/>

                        </div>
                    </div>

                    <div class="col-md-3 mb-3" data-toggle="tooltip" title='Quantidade a ser comprada'>
                        <label>Quantidade <strong style="color: red;">***</strong></label>
                        <div class="input-group">
                            <input autocomplete="off" name="qtd" type="number" class="form-control" id="qtd" placeholder="" value ='1' min='1' required>
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label>Parcelamento</label>
                        <select name = "parcelamento" data-toggle="tooltip" title="Parcelamento da compra" data-placement="bottom" class="custom-select d-block w-100" id="parcelamento"  required>
                            <option>1X</option>
                            <option>2X</option>
                            <option>3X</option>
                            <option>4X</option>
                            <option>5X</option>
                            <option>6X</option>
                            <option>7X</option>
                            <option>8X</option>
                            <option>9X</option>
                            <option>10X</option>
                        </select>
                        <div class="invalid-feedback">
                            Favor selecionar uma categoria..
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label>Entrega</label>
                        <select name = "entrega" data-toggle="tooltip" title="Entrega da compra" data-placement="bottom" class="custom-select d-block w-100" id="entrega"  required>
                            <option>À retirar</option>
                            <option>Entrega sem acréscimo</option>
                            <option>Entrega com frete</option>
                        </select>
                        <div class="invalid-feedback">
                            Favor selecionar uma categoria..
                        </div>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label>Prioridade</label>
                        <select name = "prioridade" data-toggle="tooltip" title="Prioridade da compra" data-placement="bottom" class="custom-select d-block w-100" id="prioridade"  required>
                            <option>Baixa</option>
                            <option>Média</option>
                            <option>Alta</option>
                        </select>
                        <div class="invalid-feedback">
                            Favor selecionar uma categoria..
                        </div>
                    </div>
                    <div class="col-md-12 mb-3">
                        <label>Observações</label>
                        <div align ="center">
                            <textarea onkeydown="charactersCount('obsCount', this.value)" maxlength="200" id='obs' name ='obs' class="col-md-5 mb-3"></textarea>     
                        </div>
                        <input type='text' readonly id='obsCount' style='border: none; color: red'>
                    </div>
                </div>
                <button class="btn btn-lg btn-outline-success" type="submit" onclick="{
                            return confirmCompleteCliente();
                        }" name = "gravarcliente"><span data-feather="save"></span> Salvar</button>
            </form>
            <footer class="my-5 pt-5 text-muted text-center text-small">
                <p class="mb-1">&copy; 9ember Devs</p>
            </footer>
        </div>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

        <script src="js/tamanhodata.js"></script>
        <script src="js/formatarMoeda.js"></script>
        <script src="js/collapse_button.js"></script>

        <script>
                    // Example starter JavaScript for disabling form submissions if there are invalid fields
                    (function () {
                        'use strict';
                        window.addEventListener('load', function () {
                            // Fetch all the forms we want to apply custom Bootstrap validation styles to
                            var forms = document.getElementsByClassName('needs-validation');
                            // Loop over them and prevent submission
                            var validation = Array.prototype.filter.call(forms, function (form) {
                                form.addEventListener('submit', function (event) {
                                    if (form.checkValidity() === false) {
                                        event.preventDefault();
                                        event.stopPropagation();
                                    }
                                    form.classList.add('was-validated');
                                }, false);
                            });
                        }, false);
                    }
                    )();
        </script>


        <script>
            webshims.setOptions('forms-ext', {
                replaceUI: 'auto',
                types: 'number'
            });
            webshims.polyfill('forms forms-ext');
        </script>


        <script src="js/jquery.js"></script>
        <script src="js/jquery.autocomplete.js"></script>
        <script src="js/jquery.maskMoney.js"></script>
        <script src="js/customAlert.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <script src="js/produto/charactersCount.js"></script>

        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>


        <script>

            $("#razaosocial").autocomplete({
                source: $("#razaosocial").autocomplete("getdataVendors.jsp")});

            function naBaseFornecedor(val) {
                var source = $("#razaosocial").autocomplete("getdataVendors.jsp");

                var length = source.length;
                for (var i = 0; i < length; i++) {
                    if (source[i] != val) {
                        document.getElementById('razaosocial').value = "";
                        document.getElementById('razaosocial').placeholder = "Fornecedor não cadastrado na base";
                    }
                }
            }


        </script>

        <script>

            $("#nomeprod").autocomplete({
                source: $("#nomeprod").autocomplete("getdataProducts.jsp")});

            function naBaseProduto(val) {
                var source = $("#nomeprod").autocomplete("getdataProducts.jsp");

                var length = source.length;
                for (var i = 0; i < length; i++) {
                    if (source[i] != val) {
                        document.getElementById('nomeprod').value = "";
                        document.getElementById('nomeprod').placeholder = "Produto não cadastrado na base";
                    }
                }
            }


        </script>


        <script>

            // if (window.confirm('Lembre-se de criar o projeto também no Sharepoint \n e atualize o campo "Caminho na rede".\n Cancele caso já tenha criado')) {
            //    window.open('https://mci.sharepoint.com/sites/yuzu/Pages/Projects.aspx');
            // }
            // ;
        </script>

        <script src="js/feather.min.js"></script>
        <script>
            feather.replace()
        </script>

        <script>
            $('.panel-collapse').collapse({
                toggle: true
            });
        </script>
        <script>
            $('#element').tooltip('show');
        </script>

    </body>
</html>
