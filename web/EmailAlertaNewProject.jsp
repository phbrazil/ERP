<!--**
 *
 * @author paulo.bezerra
 *-->
 <%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Opportunity</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
        <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
        <link href="css/buttonbranco.css" rel="stylesheet">
    </head>

    <body id="page-top">

        <form name = "email" id ="email" action="${pageContext.request.contextPath}/EmailAlertaNewProject" method="POST">

            <input type ="hidden" id = "to1"  name = "to1" value="${to1}" </input>
            <input type ="hidden" id = "to2"  name = "to2" value="${to2}" </input>
            <input type ="hidden" id = "to3"  name = "to3" value="${to3}" </input>
            <input type ="hidden" id = "to4"  name = "to4" value="${to4}" </input>
            <input type ="hidden" id = "to5"  name = "to5" value="${to5}" </input>
            <input type ="hidden" id = "to6"  name = "to6" value="${to6}" </input>
            <input type ="hidden" id = "to7"  name = "to7" value="${to7}" </input>
            <input type ="hidden" id = "to8"  name = "to8" value="${to8}" </input>
            <input type ="hidden" id = "to9"  name = "to9" value="${to9}" </input>
            <input type ="hidden" id = "to10"  name = "to10" value="${to10}" </input>
            <input type ="hidden" id = "body"  name = "body" value="${body}" </input>
            <input type ="hidden" id = "subject"  name = "subject" value="${subject}" </input>
            <input type ="hidden" id = "projectname"  name = "projectname" value="${projectname}" </input>
            <input type ="hidden" id = "subarea"  name = "subarea" value="${subarea}" </input>
            <input type ="hidden" id = "projectcode"  name = "projectcode" value="${projectcode}" </input>
            <input type ="hidden" id = "client_name"  name = "client_name" value="${client_name}" </input>
            <input type ="hidden" id = "contatomci"  name = "contatomci" value="${contatomci}" </input>
            <input type ="hidden" id = "eventstartdate"  name = "eventstartdate" value="${eventstartdate}" </input>
            <input type ="hidden" id = "eventclosingdate"  name = "eventclosingdate" value="${eventclosingdate}" </input>
            <input type ="hidden" id = "paxnumber"  name = "paxnumber" value="${paxnumber}" </input>
            <input type ="hidden" id = "pais"  name = "pais" value="${pais}" </input>
            <input type ="hidden" id = "estado"  name = "estado" value="${estado}" </input>
            <input type ="hidden" id = "cidade"  name = "cidade" value="${cidade}" </input>
            <input type ="hidden" id = "year"  name = "year" value="${year}" </input>
            <input type ="hidden" id = "prodpractice"  name = "prodpractice" value="${prodpractice}" </input>

        </form>    


        <script >

            window.onload = function () {
                var x = document.getElementsByName('email');
                x[0].submit(); //form submission
            }

        </script>

    </body>

</html>