<%@page import="model.pedidoCompra.tbPedidoCompra"%>
<%@page import="java.util.List"%>
<!--**
 *
 * @author paulo.bezerra
 *-->
<%
    HttpSession sessao = request.getSession();

    int linha = 1;
    String color = "#FFFFFF";

    NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
            new Locale("pt", "BR"));


%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>

        <!-- MD BOOTSTRAP -->
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.6/css/mdb.min.css" rel="stylesheet">
        <link href="http://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.css" rel="stylesheet"/>


        <link rel="stylesheet"  href="css/button.css">
        <link rel="stylesheet"  href="css/buttonvoltar.css">
        <link rel="stylesheet"  href="css/gravar.css">
        <link rel="stylesheet" type="text/css" href="css/tooltip.css" />
        <link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />
        <link rel="stylesheet" type="text/css" href="css/tooltip.css" />
        <link rel="stylesheet" type="text/css" href="css/modal/modal.css" />
        <link rel="stylesheet" type="text/css" href="css/modal/jquery-ui.css" />
        <link rel="stylesheet" type="text/css" href="css/autocomplete/fonts.css" />

        <!-- Bootstrap core CSS -->
        <!--link href="css/bootstrap.min.css" rel="stylesheet"-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link href="css/tableprod.css" rel="stylesheet">
        <link href="css/fonteTabela.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
        <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/topodapagina.css" rel="stylesheet">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">


        <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
        <link rel="manifest" href="favicon/site.webmanifest">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">

        <title>Pendencias de Aprovação</title>
    </head>

    <body id="page-top">

        <p></p>
        <form id='AddTask' name = "AddTask" method="POST" target="blank"></form>
        <div align ="center">
            <div align ="right">
                <div class="col-md-10 order-md-1">
                    <div class="row">
                        <div class="col-md-2 mb-3">
                            <form name ="voltar">
                                <button  formaction="Home.jsp" class = "buttonvoltar" ><span data-feather="home"></span> Voltar</button>
                            </form>
                        </div>
                        <div class="col-md-4 mb-3">
                            <h4 class="mb-0">
                                <span class="text-muted">Solicitações Pendentes</span>
                            </h4> 
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <form id='EditRequest' action="${pageContext.request.contextPath}/EditRequest" name = "EditRequest" method="POST" target="blank"></form>
            <br>
            <div>
                <table class="table-responsive-lg">
                    <tr style="color: white;">
                        <td  bgcolor="#ff0080" >Line</td>
                        <td  bgcolor="#ff0080" align = "center">Razão Social</td>
                        <td  bgcolor="#ff0080" align = "center">Nome do Produto</td>
                        <td  bgcolor="#ff0080" align = "center">Quantidade</td>
                        <td  bgcolor="#ff0080" align = "center">Parcelamento</td>
                        <td  bgcolor="#ff0080" align = "center">Entrega</td>
                        <td  bgcolor="#ff0080" align = "center">Prioridade</td>
                        <td  bgcolor="#ff0080" align = "center">OBS</td>
                        <td  bgcolor="#ff0080" align = "center">Criado por</td>
                        <td  bgcolor="#ff0080" align = "center">Data Cadastro</td>
                        <td  bgcolor="#ff0080" align = "center">Status</td>
                    </tr>

                    <%                        List<tbPedidoCompra> tasks = (List<tbPedidoCompra>) request.getAttribute("pendencias");

                        if (tasks.size() > 0) {

                            //for (Iterator iterator = pacotes.iterator(); iterator.hasNext();) {
                            for (int i = 0; i < tasks.size(); i++) {

                                if (tasks.get(i).isAprovado() == false) {
                                    color = "#FF7F7F";
                                } else {
                                    color = "#008000";
                                }


                    %>
                    <tr id = 'linha'>
                        <td><%=linha%></td>
                        <td><strong><%=tasks.get(i).getRazaosocial()%></strong></td>
                        <td><%=tasks.get(i).getNomeprod()%></td>
                        <td><%=tasks.get(i).getQtd()%></td>
                        <td><%=String.valueOf(tasks.get(i).getParcelamento())%></td>
                        <td><%=String.valueOf(tasks.get(i).getEntrega())%></td>
                        <td><%=String.valueOf(tasks.get(i).getPrioridade())%></td>
                        <td><textarea><%=String.valueOf(tasks.get(i).getObs())%></textarea></td>
                        <td><%=String.valueOf(tasks.get(i).getCreatedby())%></td>
                        <td><%=String.valueOf(tasks.get(i).getDatacadastro())%></td>
                        <td style='color: white;' bgcolor='<%=color%>'<strong><%=tasks.get(i).isAprovado()%></strong></td>
                        <%
                                    linha++;
                                }

                            }

                        %>
                </table>
            </div>
            <footer class="my-5 pt-5 text-muted text-center text-small">
                <p class="mb-1">&copy; 9ember Devs</p>

            </footer>
    </body>

    <!-- Icons -->
    <script src="js/feather.min.js"></script>
    <script>
        feather.replace()
    </script>

    <!-- MD BOOTSTRAP-->

    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.6/js/mdb.min.js"></script>

    <script src="js/modal/jquery-ui.js"></script>
    <script src="js/modal/jquery-ui.min.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/jquery.maskMoney.js"></script>
    <script src="js/jquery.autocomplete.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="http://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.js"></script>


    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
    <script>
        $('#element').tooltip('show');
    </script>


    <script>
        // Get the modal
        var modal = document.getElementById('id01');
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>

    <script>

        //$('#nome').autocomplete({source: "getdataEmailsScoreCard.jsp", appendTo: $('#id01')});

        /*var subjects = [
         "Where's My Stuff?",
         "Cancel Items or Orders",
         "Returns & Refunds",
         "Shipping Rates & Information",
         "Change Your Payment Method",
         "Manage Your Account Information",
         "About Two-Step Verification",
         "Cancel Items or Orders",
         "Change Your Order Information",
         "Contact Third-Party Sellers",
         "More in Managing Your Orders"
         ];
     
         $('#form-autocomplete-1').mdb_autocomplete({
         data: subjects
         });*/



        $("#form-autocomplete-1").autocomplete("getdataEmailsScoreCard.jsp");



        function naBaseEmail(val) {

            var source = $("#form-autocomplete-1").autocomplete("getdataEmailsScoreCard.jsp");

            var length = source.length;
            for (var i = 0; i < length; i++) {
                if (source[i] != val) {
                    document.getElementById('form-autocomplete-1').value = "";
                    document.getElementById('form-autocomplete-1').placeholder = "Email not found";

                }
            }
        }
    </script>

    <script>

        var timepicker = new TimePicker('time', {
            lang: 'en',
            theme: 'dark'
        });
        timepicker.on('change', function (evt) {

            var value = (evt.hour || '00') + ':' + (evt.minute || '00');
            evt.element.value = value;

        });

    </script>


</html>