<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.mcibrasil.opportunity.controller.AutoComplete.Projetos"%>
<%
    Projetos db = new Projetos();

    String query = request.getParameter("q");

    List<String> countries = db.getData(query);

    Iterator<String> iterator = countries.iterator();
    do {
        String projetos = (String) iterator.next();
        out.println(projetos);
    } while (iterator.hasNext());

%>