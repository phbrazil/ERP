<%@page import="controller.autocomplete.Produtos"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%
    Produtos db = new Produtos();

    String query = request.getParameter("q");

    List<String> countries = db.getData(query);

    Iterator<String> iterator = countries.iterator();
    do {
        String produtos = (String) iterator.next();
        out.println(produtos);
    } while (iterator.hasNext());

%>