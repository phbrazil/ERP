<!--**
 *
 * @author paulo.bezerra
 *-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
        <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="topodapagina.css" rel="stylesheet">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">
        <title>Editar Cliente</title>

    </head>

    <body id="page-top">

        <form name = "CadastrarClientes" action="${pageContext.request.contextPath}/EditarClienteGravar" method="POST">

            <div id="includedContent"></div>

            <%@include  file="navbar.jsp" %>
            <br>

            <div align ="center">
                <div class="container">
                    <div align = "center" >
                        <h4 class="text-muted">Edit Client</h4>
                    </div>
                    <br>
                    <h5 class="mb-0">
                        <span class="text-primary">Client Information</span>
                    </h5>
                    <br>
                </div>


                <div class="col-md-8 order-md-1">
                    <div class="row">

                        <div class="col-md-2 mb-3">
                            <label>Cliente ID</label>
                            <input  type="text"  readonly class="form-control" id="projectid" name="clienteid" value="${clientes.clienteid}" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>Creation Date</label>
                            <input  type="text"  readonly class="form-control" id="projectid" name="datacadastro" value="${clientes.datacadastro}" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Created by:</label>
                            <input  type="text"  readonly class="form-control" id="emailuser" name="emailuser" value="${clientes.emailuser}" required>
                        </div>
                    </div>
                </div>


                <div class="col-md-8 order-md-1">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>CardName / Razão Social</label>
                            <div class="input-group">
                                <input name="razaosocial" type="text" class="form-control" id="cardname" placeholder="" value="${clientes.razaosocial}"  maxlength ="60" required>
                                <div class="invalid-feedback">
                                    CardName necessário
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>CardCode / CNPJ ou CPF</label>
                            <div class="input-group">
                                <input onkeydown="javascript: fMasc(this, mCNPJ());" type="text" class="form-control" id="cnpjcpf" name="cnpjcpf" maxlength="20" value = "${clientes.cnpjcpf}" placeholder="0000.000.00000">
                                <div class="invalid-feedback" style="width: 100%;">
                                    CNPJ obrigatório.
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>Card Foreign Name / Nome Fantasia</label>
                            <div class="input-group">
                                <input name="nomefantasia" type="text" class="form-control" id="nomefantasia" placeholder="" value="${clientes.nomefantasia}"  maxlength ="60" required>
                                <div class="invalid-feedback">
                                    Primeiro nome necessário
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Website</label>
                            <div class="input-group">
                                <input name="site" type="text" class="form-control" id="nomefantasia" placeholder="" value="${clientes.site}"  maxlength ="50" required>
                                <div class="invalid-feedback">
                                    Site necessário
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Industry Sector</label>
                            <select name = "industrysector" data-toggle="tooltip" title="Indústria do cliente" data-placement="bottom" class="custom-select d-block w-100" id="industrysector"  required>
                                <option>${clientes.industrysector}</option>
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
                        <div class="col-md-3 mb-3">
                            <label>Phone 1 / DDD</label>
                            <input onkeydown="javascript: fMasc(this, mTel);" name = "phone1" type="text" class="form-control" id="tel" placeholder="(xx)xxxxx-xxxx" maxlength="14" value = "${clientes.phone1}">
                            <div class="invalid-feedback">
                                Telefone obrigatório
                            </div>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label>Phone 2 / DDD</label>
                            <input onkeydown="javascript: fMasc(this, mTel);" name ="phone2" type="text" class="form-control" id="cel" placeholder="(xx)xxxxx-xxxx" maxlength="14" value = "${clientes.phone2}" >
                            <div class="invalid-feedback">
                                Telefone obrigatório
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Main Contact name / Pessoa de contato</label>
                            <div class="input-group">
                                <input name="contato" type="text" class="form-control" id="contato" value ="${clientes.contato}" placeholder="" value="" maxlength ="60" required>
                                <div class="invalid-feedback">
                                    Contato necessário
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Contact's Title / Cargo pessoa de contato</label>
                            <div class="input-group">
                                <input name="cargocontato" type="text" class="form-control" id="cargocontato" placeholder="" value="${clientes.cargocontato}" maxlength ="60">
                                <div class="invalid-feedback">
                                    Contato necessário
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 mb-3">
                            <label for="email">Email address / Email</label>
                            <input name ="email" type="email" class="form-control" id="email" placeholder="cliente@exemplo.com" maxlength ="30" value ="${clientes.email}">
                            <div class="invalid-feedback">
                                Favor inserir um email válido.
                            </div>
                        </div>

                    </div>
                    <br>
                    <button class="btn btn-lg btn-outline-success" type="submit" name = "gravarcliente"><span data-feather="save"></span> Atualizar Cliente</button>
                </div>
            </div>

            <footer class="my-5 pt-5 text-muted text-center text-small">
                <p class="mb-1">&copy; MCI Brasil</p>
            </footer>
        </div>

    </form>




    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/CEP.js"></script>
    <script src="js/mascaraCNPJ.js"></script>
    <script src="js/jquery-1.2.6.pack.js"></script>
    <script src="js/jquery.maskedinput-1.1.4.pack.js"></script>
    <script src="js/confirmCompleteCliente.js"></script>
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
        function fMasc(objeto, mascara) {
            obj = objeto
            masc = mascara
            setTimeout("fMascEx()", 1)
        }
        function fMascEx() {
            obj.value = masc(obj.value)
        }
        function mTel(tel) {
            tel = tel.replace(/\D/g, "")
            tel = tel.replace(/^(\d)/, "($1")
            tel = tel.replace(/(.{3})(\d)/, "$1)$2")
            if (tel.length == 9) {
                tel = tel.replace(/(.{1})$/, "-$1")
            } else if (tel.length == 10) {
                tel = tel.replace(/(.{2})$/, "-$1")
            } else if (tel.length == 11) {
                tel = tel.replace(/(.{3})$/, "-$1")
            } else if (tel.length == 12) {
                tel = tel.replace(/(.{4})$/, "-$1")
            } else if (tel.length > 12) {
                tel = tel.replace(/(.{4})$/, "-$1")
            }
            return tel;
        }
        function mCNPJ(cnpj) {
            cnpj = cnpj.replace(/\D/g, "")
            cnpj = cnpj.replace(/^(\d{2})(\d)/, "$1.$2")
            cnpj = cnpj.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3")
            cnpj = cnpj.replace(/\.(\d{3})(\d)/, ".$1/$2")
            cnpj = cnpj.replace(/(\d{4})(\d)/, "$1-$2")
            return cnpj
        }
        function mCPF(cpf) {
            cpf = cpf.replace(/\D/g, "")
            cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
            cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
            cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2")
            return cpf
        }
        function mRG(rg) {
            rg = rg.replace(/\D/g, "")
            rg = rg.replace(/(\d{2})(\d)/, "$1.$2")
            rg = rg.replace(/(\d{3})(\d)/, "$1.$2")
            rg = rg.replace(/(\d{3})(\d{1})$/, "$1-$2")
            return rg
        }
        function mCEP(cep) {
            cep = cep.replace(/\D/g, "")
            cep = cep.replace(/^(\d{2})(\d)/, "$1$2")
            cep = cep.replace(/\.(\d{3})(\d)/, ".$1$2")
            return cep
        }
        function mNum(num) {
            num = num.replace(/\D/g, "")
            return num
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#cnpjcpf").mask("99.999.999/9999-99");
        });
    </script>

    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
        feather.replace()
    </script>

</body>
</html>
