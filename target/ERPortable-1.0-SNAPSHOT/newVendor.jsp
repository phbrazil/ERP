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
                        <h4 class="text-muted">Cadastrar novo Fornecedor</h4>
                    </div>
                </div>

                <br>
                <h5 class="mb-0">
                    <span class="text-primary">Informação do Fornecedor</span>
                </h5>
                <br>
            </div>
            <form name = "createVendor" id ='createVendor' action="${pageContext.request.contextPath}/createVendor" method="POST">
                <div class="row" style="width: 70%;">
                    <div class="col-md-7 mb-3" data-toggle="tooltip" title='Campo obrigatório'>
                        <label>Razão Social <strong style="color: red;">***</strong></label>
                        <div class="input-group">
                            <input autocomplete="off" autofocus name="razaosocial" type="text" class="form-control" id="razaosocial" placeholder=""   maxlength ="60" required>
                            <div class="invalid-feedback">
                                CardName necessário
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 mb-3" data-toggle="tooltip" title='Favor informar o CNPJ real do cliente'>
                        <label>CNPJ <strong style="color: red;">***</strong></label>
                        <div class="input-group">

                            <input required autocomplete="off" data-toggle="tooltip"  class="form-control form-control-dark w-100" id="cnpj" type="text" aria-label="Search" name ="cnpj"/>

                        </div>
                    </div>

                    <div class="col-md-7 mb-3" data-toggle="tooltip" title='Campo obrigatório'>
                        <label>Nome Fantasia <strong style="color: red;">***</strong></label>
                        <div class="input-group">
                            <input autocomplete="off" name="nomefantasia" type="text" class="form-control" id="nomefantasia" placeholder="" maxlength ="60" required>
                            <div class="invalid-feedback">
                                Primeiro nome necessário
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3" data-toggle="tooltip" title='Campo obrigatório'>
                        <label>Website <strong style="color: red;">***</strong></label>
                        <div class="input-group">
                            <input autocomplete="off" name="website" type="text" class="form-control" id="website" placeholder="example www.senac.com.br"  required maxlength ="50">
                            <div class="invalid-feedback">
                                Site necessário
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 mb-3">
                        <label>Industry Sector</label>
                        <select name = "industrysector" data-toggle="tooltip" title="Indústria do cliente" data-placement="bottom" class="custom-select d-block w-100" id="industrysector"  required>
                            <option>Agriculture & Chemical</option>
                            <option>Apparel, Fashion & Textiles </option>
                            <option>Art & Design</option>
                            <option>Automotive and Auto Parts</option>
                            <option>Aviation, Defence & Space </option>
                            <option>Banking, Finance and Investment Services </option>
                            <option>Consumer & Household Products (FMCG)</option>
                            <option>Education & Social Services</option>
                            <option>Energy, Environmental, Oil and Gas</option>
                            <option>Food, Beverages, Food Retailing</option>
                            <option>Gambling & Casinos </option>
                            <option>Gaming </option>
                            <option>Government </option>
                            <option>Healthcare, Pharmaceuticals, Biotechnology, Life Science, Medical Devices</option>
                            <option>Hotels & Hospitality & Travel </option>
                            <option>Industrial Goods and Services</option>
                            <option>Information Technology, Hardware & Software </option>
                            <option>Insurance </option>
                            <option>Legal </option>
                            <option>Luxury Goods & Jewellery</option>
                            <option>Media & Publishing </option>
                            <option>Mineral Resources, Materials and Mining</option>
                            <option>Multi-level Marketing</option>
                            <option>Professional Services & Business Services </option>
                            <option>Real Estate, Architecture, Construction & Building</option>
                            <option>Recreation, Entertainment, Film & Music</option>
                            <option>Retailing, Department Stores</option>
                            <option>Science, Engineering & Mathematics </option>
                            <option>Sports & Athletics </option>
                            <option>Telecommunications</option>
                            <option>Tobacco</option>
                            <option>Transport and Logistics</option>
                            <option>Utilities, Water and Electric</option>
                        </select>

                        <div class="invalid-feedback">
                            Favor selecionar uma categoria..
                        </div>
                    </div>
                    <div class="col-md-3 mb-3" data-toggle="tooltip" title='Campo obrigatório'>
                        <label>Phone1 / DDD <strong style="color: red;">***</strong></label>
                        <input onkeydown="javascript: fMasc(this, mTel);" name = "phone1" type="text" class="form-control" id="phone1" placeholder="(xx)xxxxx-xxxx" maxlength="20" required>
                        <div class="invalid-feedback">
                            Telefone obrigatório
                        </div>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label>Phone2 / DDD</label>
                        <input onkeydown="javascript: fMasc(this, mTel);" name ="phone2" type="text" class="form-control" id="phone2" placeholder="(xx)xxxxx-xxxx" maxlength="20">
                        <div class="invalid-feedback">
                            Telefone obrigatório
                        </div>
                    </div>
                    <div class="col-md-5 mb-3" data-toggle="tooltip" title='Contato no Cliente obrigatório'>
                        <label>Pessoa de contato <strong style="color: red;">***</strong></label>
                        <div class="input-group">
                            <input autocomplete="off" name="contato" type="text" class="form-control" id="contato" placeholder="" maxlength ="60" required>
                            <div class="invalid-feedback">
                                Contato necessário
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Cargo pessoa de contato</label>
                        <div class="input-group">
                            <input autocomplete="off" name="cargo" type="text" class="form-control" id="cargo" placeholder="" maxlength ="60">
                            <div class="invalid-feedback">
                                Contato necessário
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 mb-3" data-toggle="tooltip" title='Email do Cliente obrigatório'>
                        <label for="email">Email <strong style="color: red;">***</strong></label>
                        <input autocomplete="off" name ="email" type="email" class="form-control" id="email" placeholder="cliente@exemplo.com" maxlength ="100" required>
                        <div class="invalid-feedback">
                            Favor inserir um email válido.
                        </div>
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
        <script src="js/CEP.js"></script>
        <script src="js/mascaraCNPJ.js"></script>
        <script src="js/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <!--script src="js/jquery-1.2.6.pack.js"></script-->
        <script src="js/jquery.maskedinput-1.1.4.pack.js"></script>
        <script src="js/confirmCompleteCliente.js"></script>
        <script src="js/jquery.autocomplete.js"></script>

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

        <script type="text/javascript">
            $(document).ready(function () {
                $("#cnpj").mask("99.999.999/9999-99");
            });
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
