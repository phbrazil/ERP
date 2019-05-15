<!--**
 *
 * @author paulo.bezerra
 *-->

<%
    HttpSession sessao = request.getSession();

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <!-- Bootstrap core CSS -->
        <!--link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
        <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />
        <link rel="stylesheet" type="text/css" href="css/tooltip.css" />
        <link rel="stylesheet" type="text/css" href="css/customAlert.css" />
        <link rel="stylesheet" type="text/css" href="css/buttonvoltar.css" />


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">

        <title>Cadastrar Cliente</title>

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
                        <h4 class="text-muted">Cadastrar novo Produto</h4>
                    </div>
                </div>

                <br>
                <h5 class="mb-0">
                    <span class="text-primary">Informação do Produto</span>
                </h5>
                <br>
            </div>
            <form name = "createProduct" id ='newProduct' action="${pageContext.request.contextPath}/createProduct" method="POST">
                <div class="row" style="width: 70%;">
                    <div class="col-md-7 mb-3" data-toggle="tooltip" title='Nome do Produto'>
                        <label>Nome do Produto <strong style="color: red;">***</strong></label>
                        <div class="input-group">
                            <input autocomplete="off" autofocus name="nomeprod" type="text" class="form-control" id="nomeprod" placeholder=""   maxlength ="60" required>
                            <div class="invalid-feedback">
                                Nome necessário
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 mb-3" data-toggle="tooltip" title='Código de barras do produto'>
                        <label>Código do Fabricante <strong style="color: red;">***</strong></label>
                        <div class="input-group">

                            <input required autocomplete="off" data-toggle="tooltip"  class="form-control form-control-dark w-100" id="codfab" type="text"  aria-label="Search" name ="codfab"/>

                        </div>
                    </div>

                    <div class="col-md-7 mb-3" data-toggle="tooltip" title='Controle interno'>
                        <label>Código Interno <strong style="color: red;">***</strong></label>
                        <div class="input-group">
                            <input autocomplete="off" name="codint" type="text" class="form-control" id="codint" placeholder="" maxlength ="60" required>
                            <div class="invalid-feedback">
                                Primeiro nome necessário
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Situação do Produto</label>
                        <select name = "situacao" data-toggle="tooltip" title="Situação do produto" data-placement="bottom" class="custom-select d-block w-100" id="situacao"  required>
                            <option>Ativo</option>
                            <option>Inativo </option>
                        </select>
                        <div class="invalid-feedback">
                            Favor selecionar uma categoria..
                        </div>
                    </div>
                    <div class="col-md-12 mb-3">
                        <label>Descrição</label>
                        <div align ="center">
                            <textarea onkeydown="charactersCount('descricaoProd', this.value)" maxlength="200" id='descricao' name ='descricao' class="col-md-5 mb-3"></textarea>     
                        </div>
                        <input type='text' readonly id='descricaoProd' style='border: none; color: red'>
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
        <script src="js/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <!--script src="js/jquery-1.2.6.pack.js"></script-->
        <script src="js/jquery.maskedinput-1.1.4.pack.js"></script>
        <script src="js/confirmCompleteCliente.js"></script>
        <script src="js/jquery.autocomplete.js"></script>
        <script src="js/produto/charactersCount.js"></script>

        <script>
                        $(document).ready(function () {
                            $('[data-toggle="tooltip"]').tooltip();
                        });
        </script>


        <!--script src="js/jquery.js"></script-->

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

        <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
        <script src="js/customAlert.js"></script>
        <script>
            feather.replace();
        </script>
        <script>
            $('#element').tooltip('show')
        </script>
    </body>
</html>
