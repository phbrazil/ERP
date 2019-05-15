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
                        <h4 class="text-muted">Cadastrar novo Pedido de Compra</h4>
                    </div>
                </div>

                <br>
                <h5 class="mb-0">
                    <span class="text-primary">Informações do Pedido</span>
                </h5>
                <br>
            </div>
            <form name = "createRequest" id ='createRequest' action="${pageContext.request.contextPath}/createRequest" method="POST">
                <div class="row" style="width: 70%;">
                    <div class="col-md-7 mb-3" data-toggle="tooltip" title='Nome do Fornecedor'>
                        <label>Nome do Fornecedor <strong style="color: red;">***</strong></label>
                        <div class="input-group">
                            <input autocomplete="off" onchange="naBaseFornecedor(this.value)" autofocus name="razaosocial" type="text" class="form-control" id="razaosocial" placeholder=""   maxlength ="60" required>
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
                            <textarea onkeydown="charactersCount('descricaoProd', this.value)" maxlength="200" id='descricao' name ='descricao' class="col-md-5 mb-3">${respostasCriacao.obs}</textarea>     
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

        <script src="js/calcularProjeto.js"></script>
        <script src="js/tamanhodata.js"></script>
        <script src="js/searchSuggestProjectname.js"></script>
        <script src="js/searchSuggestProjectCode.js"></script>
        <script src="js/confirmCompleteProjeto.js"></script>
        <script src="js/Probability.js"></script>
        <script src="js/Localidade.js"></script>
        <script src="js/formatarMoeda.js"></script>
        <script src="js/collapse_button.js"></script>
        <script src="js/StatusVSProbability.js"></script>

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
        <script src="js/AnoFiscal.js"></script>
        <script src="js/customAlert.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <script src="js/DorierValida.js"></script>
        <script src="js/lostReason.js"></script>
        <script src="js/codeUnique.js"></script>
        <script src="js/datasProjetoValida.js"></script>
        <script src="js/projects/ContatoMCI.js"></script>
        <script src="js/projects/therapyCluster.js"></script>

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
