<!--**
 *
 * @author paulo.bezerra
 *-->

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<%
    HttpSession sessao = request.getSession();

    Integer idgrupo = (Integer) sessao.getAttribute("idgrupo");
    String subarea = (String) sessao.getAttribute("subarea");
    String roles = (String) sessao.getAttribute("roles");

    boolean mobile = (Boolean) session.getAttribute("mobile");

%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Opportunity</title>
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

        <%@include  file = "navbar.jsp"%>

        <p></p>

        <%if (mobile == false) {

        %>
        <div align ="center">
            <!--img class="mb-4" src="img/mci_logo.png" alt="logo MCI" style="width: 20%; height: 20%"-->
            <div align ="center">
                <div class="col-md-7 order-md-1">
                    <div class="row">

                        <div class="col-md-4 mb-3">


                            <h4 class="text-muted"><fmt:message key="label.welcome" />
                                <span style = "color: #ff0080"><c:out value="${nomecomp}"/></span>
                            </h4>
                        </div>
                        <div class="col-md-4 mb-3" data-toggle="tooltip" title="Tarefas pendentes destinadas à você" data-placement="bottom">
                            <a href="ListarTasksUser?emailuser=${emailuser}" style="text-decoration: none" class="notification">
                                <span class="text-muted"><strong><fmt:message key="label.pending.tasks" /></strong></span>
                                <span id = 'pendingTasks' class="badge">${pendingTasks}</span>
                            </a>
                        </div>
                        <div class="col-md-4 mb-3" data-toggle="tooltip" title="Scorecards pendentes destinados à você" data-placement="bottom">
                            <a href="ListarScoreGeral?scorestatus=Opened&dtInicio=01/01/2019&dtFim=31/12/2019&scoreArea=All" style="text-decoration: none" class="notification">
                                <span class="text-muted"><strong><fmt:message key="label.pending.scorecards" /></strong></span>
                                <span id='pendingScorecards' class="badge">${pendingScorecards}</span>
                            </a>
                        </div>
                    </div>
                </div>
                <h4 class="mb-0">
                    <span style = "color: red;">${mensagem}</span>
                </h4>
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
                <div class="col-md-7 order-md-1">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <%                if (idgrupo == 1 || idgrupo == 5) {

                            %>
                            <form name = "DashboardFullDetails" action="${pageContext.request.contextPath}/DashboardFullDetails" method="POST">
                                <div class="card" style="width: 70%; height: 10%">
                                    <img class="card-img-top" src="img/Dashboards.png" style="width: 70px; height: 60px;" alt="Scorecard">
                                    <div class="card-body">
                                        <h5 class="text-muted">Projects Dashboards</h5>
                                        <input  type="hidden" name = "type" value = "Won">
                                        <input  type="hidden" name = "year" value = "2019">
                                        <button  type="submit" class = "btn btn-info"><fmt:message key="label.button.go" /></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <%}%>
                        <%
                            if (roles.contains("Dashboard Scorecard")) {%>
                        <div class="col-md-6 mb-3">
                            <form name = "DashboardScorecard" action="FiltroDashboardScorecard.jsp" method="POST">
                                <div class="card" style="width: 80%; height: 10%">
                                    <img class="card-img-top" src="img/scorecard.png" style="width: 60px; height: 60px;" alt="Scorecard">
                                    <div class="card-body">
                                        <h5 class="text-muted">Scorecard Dashboards</h5>
                                        <input  type="hidden" name = "scoreArea" value = "Corporate">
                                        <input  type="hidden" name = "year" value = "2019">
                                        <button  type="submit" name = "type" class = "btn btn-info"><fmt:message key="label.button.go" /></a></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>

            <%//if (idgrupo == 3 && subarea.equals("Comercial Corporate")) {%>

            <!--form name = "Dashboard" action="${pageContext.request.contextPath}/DashboardComercial" method="POST">

                <div class="content">
                    <div class="inner">
                        <div class="col-md-12 mb-3">
                            <label>Select</label>
                            <select name = "type" class="custom-select d-block w-100" id="per" >
                                <option>Prospects Follow up</option>
                                <option>Suspects Follow up</option>
                                <option>Top Clients Prospects</option>
                                <option>Prospects per BD</option>
                                <option>Prospects per Status</option>

                            </select>
                            <div class="invalid-feedback">
                                Favor selecionar o Status..
                            </div>
                        </div>
                        <button  type="submit" name = "confirmed" class = "buttonbranco" value = "Confirmed">Quick<br> Dashboard</button>
                    </div>
                </div>
            </form-->


            <%//                    }%>

            <h8 class="my-5 pt-5 text-muted text-center text-small">
                <form name='dash' action="${pageContext.request.contextPath}/SessaoServlet" method="POST">
                    <span class="text-small"><fmt:message key="label.current.projects" /> <h7 style='color: red'>
                            <select class='text-muted' onchange="Dash()" style="border: none; font-weight: bold" name = "year">
                                <option>${year}</option>
                                <option>2017</option>
                                <option>2018</option>
                                <option>2019</option>
                                <option>2020</option>
                                <option>2021</option>
                                <option>2022</option>
                            </select></h7>
                </form>
                <p></p>

                <table border='2' class = "tamanhofonte" cellpadding='5' width='1000' align = "center">
                    <tr>
                        <%if (roles.contains("HUB")) {%>
                        <td><p class="mb-0"><strong>HUB (GACU)</strong><br>
                                <span class="text-primary">Total Projects: ${totalhub} </span> 
                                <br>
                                <span class="text-center">Won Projects: ${wonhub} </span> 
                                <br>
                                <span class="text-center">Open Projects: ${openhub} </span> 
                                <br>
                                <span class="text-primary">Lost Projects: ${losthub} </span> 
                                <br>
                                <span class="text-center"><fmt:message key="label.gm.weighted" />: ${gmhub} </span>
                                <br> 
                                <span class="text-center"><fmt:message key="label.gm.confirmed" />: ${gmConfirmedHub} </span>
                                <br> 
                                <!--span class="text-primary">GM Average: ${hubaverage}</span>
                                <br--> 
                                <span class="text-center"><strong><fmt:message key="label.gm.closed" />: ${hubclosed}</strong></span>
                                <br>
                                <span class="text-primary"><fmt:message key="label.conversion.rate" />: ${convertionhub}%</span>

                            </p></td>
                            <%}%>
                            <%if (roles.contains("Services")) {%>
                        <td><p class="mb-0"><strong>Services (GACU)</strong><br>
                                <span class="text-primary">Total Projects: ${totalservices} </span>
                                <br> 
                                <span class="text-center">Won Projects: ${wonservices} </span> 
                                <br>
                                <span class="text-center">Open Projects: ${openservices} </span> 
                                <br>
                                <span class="text-primary">Lost Projects: ${lostservices} </span> 
                                <br>
                                <span class="text-center"><fmt:message key="label.gm.weighted" />: ${gmservices} </span> 
                                <br>
                                <span class="text-center"><fmt:message key="label.gm.confirmed" />: ${gmConfirmedServices} </span>
                                <br> 
                                <!--span class="text-primary">GM Average: ${servicesaverage}</span>
                                <br--> 
                                <span class="text-center"><strong><fmt:message key="label.gm.closed" />: ${servicesclosed}</strong></span>
                                <br>
                                <span class="text-primary"><fmt:message key="label.conversion.rate" />: ${convertionservices}%</span>
                            </p></td>
                            <%}%>
                            <%if (roles.contains("Key Accounts")) {%>
                        <td> <p class="mb-0"><strong>Key Accounts (ANRO)</strong><br>
                                <span class="text-primary">Total Projects: ${totalkey} </span>
                                <br> 
                                <span class="text-center">Won Projects: ${wonkey} </span> 
                                <br>
                                <span class="text-center">Open Projects: ${openkey} </span> 
                                <br>
                                <span class="text-primary">Lost Projects: ${lostkey} </span> 
                                <br>
                                <span class="text-center"><fmt:message key="label.gm.weighted" />: ${gmkey} </span>
                                <br> 
                                <span class="text-center"><fmt:message key="label.gm.confirmed" />: ${gmConfirmedKEY} </span>
                                <br> 
                                <!--span class="text-primary">GM Average: ${keyaverage}</span>
                                <br--> 
                                <span class="text-center"><strong><fmt:message key="label.gm.closed" />: ${keyclosed}</strong></span>
                                <br>
                                <span class="text-primary"><fmt:message key="label.conversion.rate" />: ${convertionkey}%</span>
                            </p></td>
                            <%}%>
                            <%if (roles.contains("Incentive/Ovation")) {%>
                        <td> <p class="mb-0"><strong>Incentive/Ovation (ADPE)</strong><br>
                                <span class="text-primary">Total Projects: ${totalincentive} </span> 
                                <br>
                                <span class="text-center">Won Projects: ${wonincentive} </span> 
                                <br>
                                <span class="text-center">Open Projects: ${openincentive} </span> 
                                <br>
                                <span class="text-primary">Lost Projects: ${lostincentive} </span> 
                                <br>
                                <span class="text-center"><fmt:message key="label.gm.weighted" />: ${gmincentive}</span> 
                                <br>
                                <span class="text-center"><fmt:message key="label.gm.confirmed" />: ${gmConfirmedIncentive} </span>
                                <br> 
                                <!--span class="text-primary">GM Average: ${incentiveaverage}</span>
                                <br--> 
                                <span class="text-center"><strong><fmt:message key="label.gm.closed" />: ${incentiveclosed}</strong></span>
                                <br>
                                <span class="text-primary"><fmt:message key="label.conversion.rate" />: ${convertionincentive}%</span>
                            </p></td>
                            <%}%>
                        <!--td><p class="mb-0"><strong>Proprietários</strong><br>
                                <span class="text-primary">Total Projects: ${totalproprietarios} </span>
                                <br> 
                                <span class="text-center">Won Projects: ${wonproprietarios} </span> 
                                <br>
                                <span class="text-center">Open Projects: ${openproprietarios} </span> 
                                <br>
                                <span class="text-primary">Lost Projects: ${lostproprietarios} </span> 
                                <br>
                                <span class="text-center">GM Weighted: ${gmproprietarios}</span> 
                                <br>
                                <span class="text-center">GM Confirmed: ${gmConfirmedProp} </span>
                                <br> 
                                <span class="text-primary">GM Average: ${propaverage}</span>
                                <br>
                                <span class="text-center"><strong>GM Closed: ${propclosed}</strong></span>
                                <br>
                                <span class="text-primary">Conversion rate: ${convertionprop}%</span>
                            </p></td-->
                    </tr>
                    <tr>
                        <%if (roles.contains("PCO")) {%>
                        <td><p class="mb-0"><strong>PCO (GACU)</strong><br>
                                <span class="text-primary">Total Projects: ${totalpco} </span> 
                                <br>
                                <span class="text-center">Won Projects: ${wonpco} </span> 
                                <br>
                                <span class="text-center">Open Projects: ${openpco} </span> 
                                <br>
                                <span class="text-primary">Lost Projects: ${lostpco} </span> 
                                <br>
                                <span class="text-center"><fmt:message key="label.gm.weighted" />: ${gmpco} </span>
                                <br> 
                                <span class="text-center"><fmt:message key="label.gm.confirmed" />: ${gmConfirmedPCO} </span>
                                <br> 
                                <!--span class="text-primary">GM Average: ${pcoaverage}</span>
                                <br--> 
                                <span class="text-center"><strong><fmt:message key="label.gm.closed" />: ${pcoclosed}</strong></span>
                                <br>
                                <span class="text-primary"><fmt:message key="label.conversion.rate" />: ${convertionpco}%</span>

                            </p></td>
                            <%}%>
                            <%if (roles.contains("Housing")) {%>
                        <td><p class="mb-0"><strong>Housing (ROCO)</strong><br>
                                <span class="text-primary">Total Projects: ${totalhousing} </span> 
                                <br>
                                <span class="text-center">Won Projects: ${wonhousing} </span> 
                                <br>
                                <span class="text-center">Open Projects: ${openhousing} </span> 
                                <br>
                                <span class="text-primary">Lost Projects: ${losthousing} </span> 
                                <br>
                                <span class="text-center"><fmt:message key="label.gm.weighted" />: ${gmhousing} </span>
                                <br> 
                                <span class="text-center"><fmt:message key="label.gm.confirmed" />: ${gmConfirmedHousing} </span>
                                <br> 
                                <!--span class="text-primary">GM Average: ${housingaverage}</span>
                                <br--> 
                                <span class="text-center"><strong><fmt:message key="label.gm.closed" />: ${housingclosed}</strong></span>
                                <br>
                                <span class="text-primary"><fmt:message key="label.conversion.rate" />: ${convertionhousing}%</span>
                            </p></td>
                            <%}%>
                            <%if (roles.contains("Dorier")) {%>
                        <td><p class="mb-0"><strong>Dorier <img src='img/dorier_logo.png' style="width: 30px; height: 30px;">(FASO)</strong><br>
                                <span class="text-primary">Total Projects: ${totaldorier} </span> 
                                <br>
                                <span class="text-center">Won Projects: ${wondorier} </span> 
                                <br>
                                <span class="text-center">Open Projects: ${opendorier} </span> 
                                <br>
                                <span class="text-primary">Lost Projects: ${lostdorier} </span> 
                                <br>
                                <span class="text-center"><fmt:message key="label.gm.weighted" />: ${gmdorier} </span>
                                <br> 
                                <span class="text-center"><fmt:message key="label.gm.confirmed" />: ${gmConfirmedDorier} </span>
                                <br> 
                                <!--span class="text-primary">GM Average: ${dorieraverage}</span>
                                <br--> 
                                <span class="text-center"><strong><fmt:message key="label.gm.closed" />: ${dorierclosed}</strong></span>
                                <br>
                                <span class="text-primary"><fmt:message key="label.conversion.rate" />: ${convertiondorier}%</span>
                            </p></td>
                            <%}%>
                            <%if (roles.contains("Criação") || roles.contains("Planejamento")) {%>
                        <td><p class="mb-0"><strong>Creativity</strong><br>
                                <span class="text-primary">Total Projects: ${qtdCri} </span> 
                                <br>
                                <span class="text-center">Won/Closed Projects: ${qtdCriWon} </span> 
                                <br>
                                <span class="text-primary">Lost Projects: ${qtdCriLost} </span> 
                                <br>
                                <span class="text-center"><strong><fmt:message key="label.gm.converted" />: ${gmCri}</strong></span> 
                                <br>    
                                <span class="text-primary"><fmt:message key="label.conversion.rate.general" />: ${convertioncri}%</span>
                                <br>    
                                <span class="text-center">HUB <fmt:message key="label.conversion.rate" />: ${convertioncrihub}%</span>
                                <br>    
                                <span class="text-primary">Services <fmt:message key="label.conversion.rate" />: ${convertioncriservices}%</span>
                                <br>    
                                <span class="text-center">Key Accounts <fmt:message key="label.conversion.rate" />: ${convertioncrikey}%</span>
                                <br>    
                                <span class="text-primary">Incentive/Ovation <fmt:message key="label.conversion.rate" />: ${convertioncriincentive}%</span>
                                <br>    
                                <span class="text-center">PCO <fmt:message key="label.conversion.rate" />: ${convertioncripco}%</span>
                                <br>    
                                <span class="text-primary">Housing <fmt:message key="label.conversion.rate" />: ${convertioncrihousing}%</span>

                            </p></td>
                    </tr>
                    <tr>
                        <td><p class="mb-0"><strong>Planning</strong><br>
                                <span class="text-primary">Total Projects: ${qtdPlan} </span> 
                                <br>
                                <span class="text-center">Won/Closed Projects: ${qtdPlanWon} </span> 
                                <br>
                                <span class="text-primary">Lost Projects: ${qtdPlanLost} </span> 
                                <br>
                                <span class="text-center"><strong><fmt:message key="label.gm.converted" />: ${gmPlan}</strong></span> 
                                <br>    
                                <span class="text-primary"><fmt:message key="label.conversion.rate.general" />: ${convertionplan}%</span>
                                <br>    
                                <span class="text-center">HUB <fmt:message key="label.conversion.rate" />: ${convertionplanhub}%</span>
                                <br>    
                                <span class="text-primary">Services <fmt:message key="label.conversion.rate" />: ${convertionplanservices}%</span>
                                <br>    
                                <span class="text-center">Key Accounts <fmt:message key="label.conversion.rate" />: ${convertionplankey}%</span>
                                <br>    
                                <span class="text-primary">Incentive/Ovation <fmt:message key="label.conversion.rate" />: ${convertionplanincentive}%</span>
                                <br>
                                <span class="text-center">PCO <fmt:message key="label.conversion.rate" />: ${convertionplanpco}%</span>
                                <br>    
                                <span class="text-primary">Housing <fmt:message key="label.conversion.rate" />: ${convertionplanhousing}%</span>
                            </p></td>

                        <%}%>
                    </tr>

                </table>
            </h8>
        </div>

        <%} else {
        %>
        <div  align ="center">
            <form name = "Dashboard" action="${pageContext.request.contextPath}/DashboardFullDetails" method="POST">
                <h1 class="mb-0" style="font-size: 80px;">
                    <img class="mb-4" src="img/mci_logo.png" alt="logo MCI" style="width: 50%; height: 50%">
                    <br>
                    Hello
                    <span class="text-primary" style="font-size: 80px;"><c:out value="${nomecomp}"/></span>
                </h1>
                <br>
                <h1 class="mb-0 text-muted" style="font-size: 30px;"><fmt:message key="label.mobile.alert" /></h1>
                <br>
                <br>
                <h3 class="mb-0">
                    <span style = "color: red;">${mensagem}</span>
                </h3>
                <%if (idgrupo != 2) {%>
                <label style="font-size: 40px;"><strong><fmt:message key="label.year" /></strong></label><br>
                <select name = "year" style = "width: 300px; height: 80px; font-size: 40px;" class="custom-select" id="year" >
                    <option>2018</option>
                    <option selected>2019</option>
                    <option>2017</option>
                    <option>2020</option>
                    <option>2021</option>
                    <option>2022</option>
                </select>
                <div class="invalid-feedback">
                    Favor selecionar o Ano..
                </div>
                <br>
                <br>
                <label style="font-size: 40px;"><strong>Status</strong></label><br>
                <select name = "type" style = "width: 90%; height: 20%; font-size: 40px; "class="custom-select" id="type" >
                    <option>Open</option>
                    <option selected>Won</option>
                    <option>Lost</option>
                    <option>Total</option>
                    <option>Closed</option>
                    <option>Canceled</option>
                    <option>Pending</option>
                </select>
                <div class="invalid-feedback">
                    Favor selecionar o Status..
                </div>
                <br>
                <br>
                <button  style="font-size: 200%;" type="submit" name = "type" class = "buttonbranco" ><strong>Quick <br> Dashboard</strong></button>
            </form>
            <%if (subarea.contains("Comercial")) {%>
            <form name = "DashboardScorecard" action="${pageContext.request.contextPath}/DashboardScorecard" method="POST">
                <br>
                <br>
                <input type="hidden" name="dtInicio" value="01/01/2019">
                <input type="hidden" name="dtFim" value="31/12/2019">
                <input type="hidden" name="scoreArea" value="Corporate">
                <button  style="font-size: 200%;" type="submit" name = "type" class = "buttonbranco" ><strong>Scorecard <br> Dashboard</strong></button>
            </form>
        </div>
        <%}%>

        <%}%>

        <%}%>

        <footer class="my-5 pt-5 text-muted text-center text-small">
            <p class="mb-0">Session
                <span class="text-primary"><c:out value="${sessaoid}"/></span>
            </p>
            <p class="mb-0">&copy; MCI Brasil</p>
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

    <script>

        var pendingScorecard = ${pendingScorecards};
        var pendingTasks = ${pendingTasks};
        var sessionLocale = "${sessionLocale}";

        if (pendingScorecard > 0) {

            document.getElementById('pendingScorecards').style.backgroundColor = "red";

            if (sessionLocale === "en") {
                alert('<br><strong>You have ' + pendingScorecard + " pending Scorecards</strong>");

            } else {
                alert('<br><strong>Você tem ' + pendingScorecard + " Scorecards pendentes</strong>");

            }

        } else {

            document.getElementById('pendingScorecards').style.backgroundColor = "#33b5e5";

        }

        if (pendingTasks > 0) {


            document.getElementById('pendingTasks').style.backgroundColor = "red";
            if (sessionLocale === "en") {

                alert('<br><strong>You have ' + pendingTasks + " pending Tasks</strong>");
            }else{
                
                alert('<br><strong>Você tem ' + pendingTasks + " Tarefas pendentes</strong>");
                
                
            }
        } else {
            document.getElementById('pendingTasks').style.backgroundColor = "#33b5e5";

        }

    </script>



</html>