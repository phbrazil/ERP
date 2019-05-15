<%@page import="com.mcibrasil.opportunity.controller.AutoComplete.Clientes"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%
    Clientes db = new Clientes();

    String query = request.getParameter("q");

    List<String> clientes = db.getData(query);

    Iterator<String> iterator = clientes.iterator();

    if (iterator.hasNext() == false) {
        //String vazio = "Client is not in the database";
        //out.println(vazio);
    } else {

        do {
            String clienteslist = (String) iterator.next();
            out.println(clienteslist);
        } while (iterator.hasNext());

    }
%>