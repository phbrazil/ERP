<!--**
 *
 * @author paulo.bezerra
 *-->

<%@page import="java.awt.geom.Area"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>

<html>
    <head>
    <fmt:setLocale value="${sessionLocale}"/>
    <fmt:setBundle basename="messages"/>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
    <meta name="google" content="notranslate">


    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Opportunity</title>

</head>

<style type="text/css">
    .fonte {
        color: white;
        background-color: #ff0080;

    }
    .fonte a:hover {background-color: #000000;}

</style>


<body>

<fmt:setLocale value="${sessionLocale}"/>

<fmt:setBundle basename="messages"/>

<link rel="stylesheet" type="text/css" href="css/dropdown.css">

<nav class="navbar navbar-expand-sm navbar-fixed-top fonte">
    <a class="navbar js-scroll-trigger fonte" style="text-decoration:none; color: white;" href="Home.jsp">
        <span class="d-block d-lg-block"><img style ="width: 60px; height: 50px;" src = "img/mci_brazil.png"></span>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <ul class="navbar-nav">
        <li class="nav-item dropdown">
            <a style="text-decoration:none; color: white;" class="nav-link dropdown-toggle" onclick="myConsultar()" id="navbardrop" data-toggle="dropdown">
                <fmt:message key="label.search" />
            </a>
            <div  style="display: none" id="consultar" class="dropdown-transparente">
                <p><a class="dropdown-item" id = "clscore" href="ConsultaScore.jsp" style="text-decoration:none; color: white;"><fmt:message key="label.search.scorecard" /></a></p>
                <p><a class="dropdown-item" id = "clprojeto" href="ConsultaProjeto.jsp" style="text-decoration:none; color: white;"><fmt:message key="label.search.opportunity" /></a></p>
                <!--p><a id = "consultamapping" href="ConsultaClientMapping.jsp" style="text-decoration:none; color: white;">Client Mapping</a></p-->
                <p><a class="dropdown-item" id = "clcliente" href="ConsultaCliente.jsp" style="text-decoration:none; color: white;"><fmt:message key="label.search.client" /></a></p>
                <!--p><a class="dropdown-item" id = "clprospect" href="ConsultaProspect.jsp" style="text-decoration:none; color: white;">Prospects</a></p-->
                <!--p><a class="dropdown-item" id = "clsuspect" href="ConsultaSuspect.jsp" style="text-decoration:none; color: white;">Suspects</a></p-->
                <p><a class="dropdown-item" id = "cluser" href="ConsultaUsuario.jsp" style="text-decoration:none; color: white;"><fmt:message key="label.search.user" /></a></p>
            </div>
        </li>

        <li class="nav-item">
            <div class="nav-item dropdown">
                <a style="text-decoration:none; color: white;" class="nav-link dropdown-toggle" onclick="myCadastrar()" id="navbardrop" data-toggle="dropdown">
                    <fmt:message key="label.create" />
                </a>
                <div  style="display: none" id="cadastrar" class="dropdown-transparente">
                    <p><a class="dropdown-item" id = "cdscore" href="ScoreCardCheckClient.jsp" style="text-decoration:none; color: white;"><fmt:message key="label.create.scorecard" /></a></p>
                    <p><a class="dropdown-item" id = "cdprojeto" href="CadastrarProjeto.jsp" style="text-decoration:none; color: white;"><fmt:message key="label.create.opportunity" /></a></p>
                    <!--p><a id = "cadastrarmapping" href="CadastrarClientMapping.jsp" style="text-decoration:none; color: white;">Client Mapping</a></p-->
                    <p><a class="dropdown-item" id = "cdcliente" href="CadastrarCliente.jsp" style="text-decoration:none; color: white;"><fmt:message key="label.create.client" /></a></p>
                    <!--p><a class="dropdown-item" id = "cdprospect" href="CadastrarProspect.jsp" style="text-decoration:none; color: white;">Prospect</a></p-->
                    <!--p><a class="dropdown-item" id = "cdsuspect" href="CadastrarSuspect.jsp" style="text-decoration:none; color: white;">Suspect</a></p-->
                    <p><a class="dropdown-item" id = "cduser" href="CadastrarUsuario.jsp" style="text-decoration:none; color: white;"><fmt:message key="label.create.user" /></a></p>
                </div>
            </div>
        </li>
        <li class="nav-item">
            <div class="nav-item dropdown">
                <a style="text-decoration:none; color: white;" class="nav-link dropdown-toggle" onclick="myGerenciamento()" id="navbardrop" data-toggle="dropdown">
                    <fmt:message key="label.manage" />
                </a>
                <div style="display: none" id="gerenciamento" class="dropdown-transparente">
                    <p><a class="dropdown-item" id = "liscore" href="FiltroListarScoreCard.jsp" style="text-decoration:none; color: white;"><fmt:message key="label.manage.scorecard" /></a></p>
                    <p><a class="dropdown-item" id = "liprojeto" href="FiltroBL.jsp" style="text-decoration:none; color: white;"><fmt:message key="label.manage.opportunity" /></a></p>
                    <p><a class="dropdown-item" id = "lipauta" href="ListarPauta" style="text-decoration:none; color: white;"><fmt:message key="label.manage.schedule" /></a></p>
                    <!--p><a class="dropdown-item" id = "liarc" href="ListarProjetosArquivados" style="text-decoration:none; color: white;">Archived Projects</a></p-->
                    <!--p><a id = "listarmapping" href="ListarClientMappingGeral" style="text-decoration:none; color: white;">Listar Client Mapping</a></p-->
                    <!--p><a class="dropdown-item" id = "licliente" href="ListarClientesGeral" style="text-decoration:none; color: white;">List Clients</a></p-->
                    <!--p><a class="dropdown-item" id = "liprospect" href="ListarProspectsGeral" style="text-decoration:none; color: white;">List Prospects</a></p-->
                    <!--p><a class="dropdown-item" id = "lisuspect" href="ListarSuspectsGeral" style="text-decoration:none; color: white;">List Suspects</a></p-->
                </div>
            </div>
        </li>

        <li class="nav-item">
            <a  class="nav-link js-scroll-trigger" style="text-decoration:none; color: white;" href="MemoBL.jsp"><fmt:message key="label.tips" /></a>

        </li>
        <li class="nav-item">
            <a  class="nav-link js-scroll-trigger" style="text-decoration:none; color: white;" href="Manual.jsp"><fmt:message key="label.manual" /></a>

        </li>

        <li class="nav-item">
            <a class="nav-link js-scroll-trigger fonte" style="text-decoration:none; color: white;" href="Logout.jsp"><fmt:message key="label.signout" /></a>

        </li>
        <li class ="nav-item" align = "right">
            <a class="nav-link js-scroll-trigger" style="color: black;"><strong>${emailuser}</strong></a>
        </li>
        <li class="nav-item">
            <div class="nav-item dropdown">
                <a style="text-decoration:none; color: white;" class="nav-link dropdown-toggle" onclick="myLanguage()" id="navbardrop" data-toggle="dropdown">
                    <fmt:message key="label.chooseSessionLocale" />
                </a>
                <div style="display: none" id="language" class="dropdown-transparente">
                    <p><a href="Language?sessionLocale=en" style='text-decoration: none; color: white;'><fmt:message key="label.lang.en" /> <img src="img/en.png" style="width: 40px; height: 30px"></a></p>
                    <p><a href="Language?sessionLocale=pt" style='text-decoration: none; color: white;'><fmt:message key="label.lang.pt" /> <img src="img/br.png" style="width: 40px; height: 30px"></a></p>
                    <!--p><a href="Language?sessionLocale=de" style='text-decoration: none; color: white;'><fmt:message key="label.lang.de" /></a></p>
                    <p><a href="Language?sessionLocale=fr" style='text-decoration: none; color: white;'><fmt:message key="label.lang.fr" /></a></p>
                    <p><a href="Language?sessionLocale=zh" style='text-decoration: none; color: white;'><fmt:message key="label.lang.cn" /></a></p-->
                </div>
            </div>
        </li>
    </ul>



</nav>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!--script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script-->
<script src="js/jquery/jquery_3.2.1.js"></script>
<script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
<script src="js/feather.min.js"></script>

<script>
                    var idgrupo = "${idgrupo}";
                    var subarea = "${subarea}";
                    var mobile = "${mobile}";

                    if (idgrupo == 1 || idgrupo == 3 || idgrupo == 4) {

                        // document.getElementById('clprospect').style.display = 'block';
                        // document.getElementById('cdprospect').style.display = 'block';
                        // document.getElementById('clsuspect').style.display = 'block';
                        //  document.getElementById('cdsuspect').style.display = 'block';

                        if (mobile == 'true') {
                            //    document.getElementById('lisuspect').style.display = 'none';
                            //   document.getElementById('liprospect').style.display = 'none';

                        } else {
                            // document.getElementById('lisuspect').style.display = 'block';
                            // document.getElementById('liprospect').style.display = 'block';

                        }

                        document.getElementById('clprojeto').style.display = 'block';
                        document.getElementById('cdprojeto').style.display = 'block';
                        document.getElementById('cduser').style.display = 'none';
                        document.getElementById('cluser').style.display = 'none';
                        document.getElementById('liscore').style.display = 'block';
                        document.getElementById('clscore').style.display = 'block';
                        //document.getElementById('liarc').style.display = 'none';
                        if (subarea.includes("Comercial")) {
                            document.getElementById('cdscore').style.display = 'block';
                        } else {
                            document.getElementById('cdscore').style.display = 'none';

                        }

                    } else if (idgrupo == 2) {
                        if (mobile === 'false') {
                            //   document.getElementById('clprospect').style.display = 'none';
                            //   document.getElementById('cdprospect').style.display = 'none';
                            //   document.getElementById('liprospect').style.display = 'none';
                            //    document.getElementById('clsuspect').style.display = 'none';
                            //   document.getElementById('cdsuspect').style.display = 'none';
                            //   document.getElementById('lisuspect').style.display = 'none';
                            document.getElementById('clprojeto').style.display = 'block';
                            document.getElementById('cdprojeto').style.display = 'block';
                            document.getElementById('liprojeto').style.display = 'block';
                            //document.getElementById('liarc').style.display = 'block';
                            document.getElementById('cduser').style.display = 'none';
                            document.getElementById('cluser').style.display = 'none';
                            //   document.getElementById('clcliente').style.display = 'none';
                            document.getElementById('cdcliente').style.display = 'none';
                            //  document.getElementById('licliente').style.display = 'none';
                            document.getElementById('cdscore').style.display = 'none';
                            document.getElementById('clscore').style.display = 'none';
                            document.getElementById('liscore').style.display = 'none';
                            // document.getElementById('simplesnacional').style.display = 'none';
                        } else {
                            // document.getElementById('clprospect').style.display = 'none';
                            // document.getElementById('cdprospect').style.display = 'none';
                            // document.getElementById('clsuspect').style.display = 'none';
                            // document.getElementById('cdsuspect').style.display = 'none';
                            document.getElementById('clprojeto').style.display = 'block';
                            document.getElementById('cdprojeto').style.display = 'none';
                            document.getElementById('cduser').style.display = 'none';
                            document.getElementById('cluser').style.display = 'none';
                            //document.getElementById('liarc').style.display = 'none';
                            // document.getElementById('clcliente').style.display = 'none';
                            document.getElementById('cdcliente').style.display = 'none';
                            document.getElementById('cdscore').style.display = 'none';
                            document.getElementById('clscore').style.display = 'none';
                            document.getElementById('liscore').style.display = 'none';
                            document.getElementById('liprojeto').style.display = 'none';
                            document.getElementById('liarc').style.display = 'none';
                            //   document.getElementById('licliente').style.display = 'none';
                            //   document.getElementById('liprospect').style.display = 'none';
                            // document.getElementById('lisuspect').style.display = 'none';
                            // document.getElementById('simplesnacional').style.display = 'none';
                        }

                    } else if (idgrupo == 5) {
                        // document.getElementById('clprospect').style.display = 'block';
                        // document.getElementById('cdprospect').style.display = 'block';
                        // document.getElementById('clsuspect').style.display = 'block';
                        // document.getElementById('cdsuspect').style.display = 'block';
                        document.getElementById('clprojeto').style.display = 'block';
                        document.getElementById('cdprojeto').style.display = 'block';
                        document.getElementById('cduser').style.display = 'block';
                        document.getElementById('cluser').style.display = 'block';
                        //document.getElementById('liarc').style.display = 'block';
                        document.getElementById('cdscore').style.display = 'block';
                        document.getElementById('liscore').style.display = 'block';
                        //  document.getElementById('simplesnacional').style.display = 'block';


                    } else {
                        //document.getElementById('clprospect').style.display = 'none';
                        // document.getElementById('cdprospect').style.display = 'none';
                        // document.getElementById('clsuspect').style.display = 'none';
                        // document.getElementById('cdsuspect').style.display = 'none';
                        document.getElementById('clprojeto').style.display = 'none';
                        document.getElementById('cduser').style.display = 'none';
                        document.getElementById('cluser').style.display = 'none';
                        //document.getElementById('liarc').style.display = 'none';
                        document.getElementById('cdscore').style.display = 'none';


                    }

</script>


<style>

    .transparente {
        position: relative;
        display: inline-block;


    }

    .dropdown-transparente {
        display: none;
        position: absolute;
        min-width: 190px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        padding: 12px 16px;
        z-index: 1;
        color: white;
        background-color: #ff0080;
    }
    .dropdown-transparente a:hover {background-color: #000000;}

    .dropdown:hover .dropdown-transparente {
        display: block;
    }


</style>

<script>

    function myConsultar() {
        var consultar = document.getElementById("consultar");

        if (consultar.style.display === "none") {
            consultar.style.display = "block";
        } else {
            consultar.style.display = "none";

        }
    }
    function myCadastrar() {
        var cadastrar = document.getElementById("cadastrar");

        if (cadastrar.style.display === "none") {
            cadastrar.style.display = "block";
        } else {
            cadastrar.style.display = "none";

        }
    }
    function myGerenciamento() {
        var gerenciamento = document.getElementById("gerenciamento");

        if (gerenciamento.style.display === "none") {
            gerenciamento.style.display = "block";
        } else {
            gerenciamento.style.display = "none";

        }
    }

    function myLanguage() {
        var language = document.getElementById("language");

        if (language.style.display === "none") {
            language.style.display = "block";
        } else {
            language.style.display = "none";

        }
    }

</script>

</div>        
</body>
</html>
