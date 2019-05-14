<!--**
 *
 * @author paulo.bezerra
 *-->

<%
    HttpSession sessao = request.getSession();

    Integer idgrupo = (Integer) sessao.getAttribute("idgrupo");
    boolean mobile = (Boolean) session.getAttribute("mobile");
    String subarea = (String) sessao.getAttribute("subarea");

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


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">

        <title>Cadastrar Cliente</title>

    </head>



    <body id="page-top">

        <%if (idgrupo != 2 && !subarea.equals("")) {%>

        <form name = "cliente" id ='cliente' action="${pageContext.request.contextPath}/CadastrarClientes" method="POST">

            <div id="includedContent"></div>

            <%@include  file="navbar.jsp" %>
            <br>

            <div align ="center">
                <div class="container">
                    <div align = "center" >
                        <h4 class="text-muted">Create new Client</h4>
                    </div>
                    <br>
                    <h5 class="mb-0">
                        <span class="text-primary">Client Information</span>
                    </h5>
                    <br>
                </div>
                <div class="row" style="width: 70%;">
                    <div class="col-md-7 mb-3" data-toggle="tooltip" title='Campo obrigatório'>
                        <label>CardName / Razão Social <strong style="color: red;">***</strong></label>
                        <div class="input-group">
                            <input autocomplete="off" autofocus name="razaosocial" type="text" class="form-control" id="razaosocial" placeholder=""   maxlength ="60" required>
                            <div class="invalid-feedback">
                                CardName necessário
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 mb-3" data-toggle="tooltip" title='Favor informar o CNPJ real do cliente'>
                        <label>CardCode / CNPJ <strong style="color: red;">***</strong></label>
                        <div class="input-group">
                            
                            <input required autocomplete="off" data-toggle="tooltip"  class="form-control form-control-dark w-100" id="cnpjcpf" type="text" onblur="naBase(this.value)" aria-label="Search" name ="cnpjcpf"/>

                        </div>
                    </div>

                    <div class="col-md-7 mb-3" data-toggle="tooltip" title='Campo obrigatório'>
                        <label>Card Foreign Name / Nome Fantasia <strong style="color: red;">***</strong></label>
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
                            <input autocomplete="off" name="site" type="text" class="form-control" id="site" placeholder="example www.mcibrasil.com.br"  required maxlength ="50">
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
                        <label>Main Contact name / Pessoa de contato <strong style="color: red;">***</strong></label>
                        <div class="input-group">
                            <input autocomplete="off" name="contato" type="text" class="form-control" id="contato" placeholder="" maxlength ="60" required>
                            <div class="invalid-feedback">
                                Contato necessário
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Contact's Title / Cargo pessoa de contato</label>
                        <div class="input-group">
                            <input autocomplete="off" name="cargocontato" type="text" class="form-control" id="cargocontato" placeholder="" maxlength ="60">
                            <div class="invalid-feedback">
                                Contato necessário
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 mb-3" data-toggle="tooltip" title='Email do Cliente obrigatório'>
                        <label for="email">Email address / Email <strong style="color: red;">***</strong></label>
                        <input autocomplete="off" name ="email" type="email" class="form-control" id="email" placeholder="cliente@exemplo.com" maxlength ="100" required>
                        <div class="invalid-feedback">
                            Favor inserir um email válido.
                        </div>
                    </div>
                    <!--div class="col-md-4 mb-3">
                        <label>Address / Nome de endereço</label>
                        <input  autocomplete="off" name ="nomeendereco" type="text" class="form-control" id="nomeendereco" placeholder="" maxlength ="30">
                        <div class="invalid-feedback">
                            Favor inserir um nome válido.
                        </div>
                    </div>
                    <div class="col-md-5 mb-3">
                        <label>Type Of Address / Tipo de logradouro</label>
                        <input autocomplete="off" name ="tipologradouro" type="text" class="form-control" id="tipologradouro" placeholder="" maxlength ="30"complemento>
                        <div class="invalid-feedback">
                            Favor inserir um nome válido.
                        </div>
                    </div>

                    <div class="col-md-2 mb-3">
                        <label>ZipCode / cep</label>
                        <input name ="cep" autocomplete="off" type="text" class="form-control" id="cep"   placeholder="00000000" size="10" maxlength="8" onblur="pesquisacep(this.value);">
                        <div class="invalid-feedback">
                            CEP obrigatório
                        </div>
                    </div>

                    <div class="col-md-8 mb-3">
                        <label>Street / Rua</label>
                        <input name ="rua" type="text" class="form-control" id="rua"  size="60" maxlength ="50">

                        <div class="invalid-feedback">
                            Favor inserir a Rua
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label>Street No / Número</label>
                        <input name ="numero" type="text" class="form-control" id="numero" size="60" maxlength ="50">

                        <div class="invalid-feedback">
                            Favor inserir o Numero
                        </div>
                    </div>
                    <div class="col-md-5 mb-3">
                        <label>Building Floor Room / Complemento</label>
                        <input name ="complemento" type="text" class="form-control" id="complemento" size="60" maxlength ="50">

                        <div class="invalid-feedback">
                            Favor inserir o Complemento
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Block / Bairro</label>
                        <input name ="bairro" type="text" class="form-control" id="bairro" size="60" maxlength ="50">

                        <div class="invalid-feedback">
                            Favor inserir o Bairro
                        </div>
                    </div>

                    <div class="col-md-5 mb-3">
                        <label>City / Cidade</label>
                        <input name ="cidade" type="text" class="form-control" id="cidade" placeholder="Cidade" size = "40" maxlength ="50">
                        <div class="invalid-feedback">
                            Favor inserir a Cidade.
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Country /País</label>
                        <select name ="pais" class="custom-select d-block w-100" id="pais">
                            <option>Diversos</option>
                            <option>Afeganistão</option>
                            <option>África do Sul</option>
                            <option>Albânia</option>
                            <option>Alemanha</option>
                            <option>Andorra</option>
                            <option>Angola</option>
                            <option>Antiga e Barbuda</option>
                            <option>Arábia Saudita</option>
                            <option>Argélia</option>
                            <option>Argentina</option>
                            <option>Arménia</option>
                            <option>Austrália</option>
                            <option>Áustria</option>
                            <option>Azerbaijão</option>
                            <option>Bahamas</option>
                            <option>Bangladexe</option>
                            <option>Barbados</option>
                            <option>Barém</option>
                            <option>Bélgica</option>
                            <option>Belize</option>
                            <option>Benim</option>
                            <option>Bielorrússia</option>
                            <option>Bolívia</option>
                            <option>Bósnia e Herzegovina</option>
                            <option>Botsuana</option>
                            <option selected>Brazil</option>
                            <option>Brunei</option>
                            <option>Bulgária</option>
                            <option>Burquina Faso</option>
                            <option>Burúndi</option>
                            <option>Butão</option>
                            <option>Cabo Verde</option>
                            <option>Camarões</option>
                            <option>Camboja</option>
                            <option>Canadá</option>
                            <option>Catar</option>
                            <option>Cazaquistão</option>
                            <option>Chade</option>
                            <option>Chile</option>
                            <option>China</option>
                            <option>Chipre</option>
                            <option>Colômbia</option>
                            <option>Comores</option>
                            <option>Congo-Brazzaville</option>
                            <option>Coreia do Norte</option>
                            <option>Coreia do Sul</option>
                            <option>Cosovo</option>
                            <option>Costa do Marfim</option>
                            <option>Costa Rica</option>
                            <option>Croácia</option>
                            <option>Cuaite</option>
                            <option>Cuba</option>
                            <option>Dinamarca</option>
                            <option>Dominica</option>
                            <option>Egito</option>
                            <option>Emirados Árabes Unidos</option>
                            <option>Equador</option>
                            <option>Eritreia</option>
                            <option>Eslováquia</option>
                            <option>Eslovénia</option>
                            <option>Espanha</option>
                            <option>Estado da Palestina</option>
                            <option>Estados Unidos</option>
                            <option>Estónia</option>
                            <option>Etiópia</option>
                            <option>Fiji</option>
                            <option>Filipinas</option>
                            <option>Finlândia</option>
                            <option>França</option>
                            <option>Gabão</option>
                            <option>Gâmbia</option>
                            <option>Gana</option>
                            <option>Geórgia</option>
                            <option>Granada</option>
                            <option>Grécia</option>
                            <option>Guatemala</option>
                            <option>Guiana</option>
                            <option>Guiné</option>
                            <option>Guiné Equatorial</option>
                            <option>Guiné-Bissau</option>
                            <option>Haiti</option>
                            <option>Honduras</option>
                            <option>Hungria</option>
                            <option>Iémen</option>
                            <option>Ilhas Marechal</option>
                            <option>Índia</option>
                            <option>Indonésia</option>
                            <option>Irão</option>
                            <option>Iraque</option>
                            <option>Irlanda</option>
                            <option>Islândia</option>
                            <option>Israel</option>
                            <option>Itália</option>
                            <option>Jamaica</option>
                            <option>Japão</option>
                            <option>Jibuti</option>
                            <option>Jordânia</option>
                            <option>Laus</option>
                            <option>Lesoto</option>
                            <option>Letónia</option>
                            <option>Líbano</option>
                            <option>Libéria</option>
                            <option>Líbia</option>
                            <option>Listenstaine</option>
                            <option>Lituânia</option>
                            <option>Luxemburgo</option>
                            <option>Macedónia</option>
                            <option>Madagáscar</option>
                            <option>Malásia</option>
                            <option>Maláui</option>
                            <option>Maldivas</option>
                            <option>Mali</option>
                            <option>Malta</option>
                            <option>Marrocos</option>
                            <option>Maurícia</option>
                            <option>Mauritânia</option>
                            <option>México</option>
                            <option>Mianmar</option>
                            <option>Micronésia</option>
                            <option>Moçambique</option>
                            <option>Moldávia</option>
                            <option>Mónaco</option>
                            <option>Mongólia</option>
                            <option>Montenegro</option>
                            <option>Namíbia</option>
                            <option>Nauru</option>
                            <option>Nepal</option>
                            <option>Nicarágua</option>
                            <option>Níger</option>
                            <option>Nigéria</option>
                            <option>Noruega</option>
                            <option>Nova Zelândia</option>
                            <option>Omã</option>
                            <option>Países Baixos</option>
                            <option>Palau</option>
                            <option>Panamá</option>
                            <option>Papua Nova Guiné</option>
                            <option>Paquistão</option>
                            <option>Paraguai</option>
                            <option>Peru</option>
                            <option>Polónia</option>
                            <option>Portugal</option>
                            <option>Quénia</option>
                            <option>Quirguistão</option>
                            <option>Quiribáti</option>
                            <option>Reino Unido</option>
                            <option>República Centro-Africana</option>
                            <option>República Checa</option>
                            <option>República Democrática do Congo</option>
                            <option>República Dominicana</option>
                            <option>Roménia</option>
                            <option>Ruanda</option>
                            <option>Rússia</option>
                            <option>Salomão</option>
                            <option>Salvador</option>
                            <option>Samoa</option>
                            <option>Santa Lúcia</option>
                            <option>São Cristóvão e Neves</option>
                            <option>São Marinho</option>
                            <option>São Tomé e Príncipe</option>
                            <option>São Vicente e Granadinas</option>
                            <option>Seicheles</option>
                            <option>Senegal</option>
                            <option>Serra Leoa</option>
                            <option>Sérvia</option>
                            <option>Singapura</option>
                            <option>Síria</option>
                            <option>Somália</option>
                            <option>Sri Lanca</option>
                            <option>Suazilândia</option>
                            <option>Sudão</option>
                            <option>Sudão do Sul</option>
                            <option>Suécia</option>
                            <option>Suíça</option>
                            <option>Suriname</option>
                            <option>Tailândia</option>
                            <option>Taiuã</option>
                            <option>Tajiquistão</option>
                            <option>Tanzânia</option>
                            <option>Timor-Leste</option>
                            <option>Togo</option>
                            <option>Tonga</option>
                            <option>Trindade e Tobago</option>
                            <option>Tunísia</option>
                            <option>Turcomenistão</option>
                            <option>Turquia</option>
                            <option>Tuvalu</option>
                            <option>Ucrânia</option>
                            <option>Uganda</option>
                            <option>Uruguai</option>
                            <option>Usbequistão</option>
                            <option>Vanuatu</option>
                            <option>Vaticano</option>
                            <option>Venezuela</option>
                            <option>Vietname</option>
                            <option>Zâmbia</option>
                            <option>Zimbábue</option>                        </select>
                        <div class="invalid-feedback">
                            Favor selecionar o país.
                        </div>
                    </div>
                    <div class="col-md-2 mb-3">
                        <label>State / UF</label>
                        <select name = "uf" class="custom-select d-block w-100" id="uf">
                            <option>AC</option>
                            <option>AL</option>
                            <option>AP</option>
                            <option>AM</option>
                            <option>BA</option>
                            <option>CE</option>
                            <option>DF</option>
                            <option>ES</option>
                            <option>GO</option>
                            <option>MA</option>
                            <option>MT</option>
                            <option>MS</option>
                            <option>MG</option>
                            <option>PA</option>
                            <option>PB</option>
                            <option>PR</option>
                            <option>PE</option>
                            <option>PI</option>
                            <option>RJ</option>
                            <option>RN</option>
                            <option>RS</option>
                            <option>RO</option>
                            <option>RR</option>
                            <option>SC</option>
                            <option>SP</option>
                            <option>SE</option>
                            <option>TO</option>
                        </select>

                        <div class="invalid-feedback">
                            Favor selecionar um Estado..
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Inscrição Estadual</label>
                        <input name ="inscestadual" type="text" class="form-control" id="inscestadual" size="60" maxlength ="50">

                        <div class="invalid-feedback">
                            Favor inserir a inscrição
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Inscrição Municipal</label>
                        <input name ="inscmunicipal" type="text" class="form-control" id="inscmunicipal" size="60" maxlength ="50">

                        <div class="invalid-feedback">
                            Favor inserir a inscrição
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Cnae / Cnae</label>
                        <input name ="cnae" type="text" class="form-control" id="cnae" size="60" maxlength ="50">

                        <div class="invalid-feedback">
                            Favor inserir a inscrição
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Bank / Banco</label>
                        <input name ="banco" type="text" class="form-control" id="banco" size="60" maxlength ="50">

                        <div class="invalid-feedback">
                            Favor inserir o Banco
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Agency / Agencia</label>
                        <input name ="agencia" type="number" class="form-control" id="agencia">

                        <div class="invalid-feedback">
                            Favor inserir a Agencia
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Agency Digit / Dígito Agencia</label>
                        <input name ="digitoagencia" type="number" value = '0' class="form-control" max = "9" min="0" id="digitoagencia">

                        <div class="invalid-feedback">
                            Favor inserir a Agencia
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Account / Conta</label>
                        <input name ="conta" type="text" class="form-control" id="conta">

                        <div class="invalid-feedback">
                            Favor inserir a Conta
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Account Digit / Dígito Conta</label>
                        <input name ="digitoconta" type="number" class="form-control" max="9" min = "0" value = '0' id="digitoconta">

                        <div class="invalid-feedback">
                            Favor inserir o Digito
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Invoice Term / Prazo de pagamento acordado</label>
                        <input name ="prazopagamento" type="text" class="form-control" id="prazopagamento">

                        <div class="invalid-feedback">
                            Favor inserir o Invoice
                        </div>
                    </div>

                    <div class="col-md-4 mb-3">
                        <label>Pricing type / Fee ou Rebate</label>
                        <input name ="rebate" type="text" class="form-control" id="rebate">

                        <div class="invalid-feedback">
                            Favor inserir o Invoice
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Billing form  / Forma de faturamento</label>
                        <input name ="formafaturamento" type="text" class="form-control" id="formafaturamento">

                        <div class="invalid-feedback">
                            Favor inserir o Billing
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Notes / Observações</label>
                        <input name ="obs" type="text" class="form-control" id="obs">

                        <div class="invalid-feedback">
                            Favor inserir o Notes
                        </div>
                    </div-->

                </div>
                <button class="btn btn-lg btn-outline-success" type="submit" onclick="{
                            return confirmCompleteCliente();
                        }" name = "gravarcliente"><span data-feather="save"></span> Save new Client</button>
            </div>
            <footer class="my-5 pt-5 text-muted text-center text-small">
                <p class="mb-1">&copy; MCI Brasil</p>
            </footer>
        </div>

    </form>

    <%} else {

            String path = "Home.jsp";
            String mensagem = "You cannot create a new Client";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='Modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        }%>


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
            $("#cnpjcpf").mask("99.999.999/9999-99");
        });
    </script>

    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script src="js/customAlert.js"></script>
    <script>
        feather.replace();
    </script>
    <script>



        $("#cnpjcpf").autocomplete({
            source: $("#cnpjcpf").autocomplete("getdataCNPJ.jsp")});

    </script>

    <script>
        $('#element').tooltip('show')
    </script>
</body>
</html>
