<%@page import="controller.autocomplete.Vendors"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%
    Vendors db = new Vendors();

    String query = request.getParameter("q");

    List<String> clientes = db.getData(query);

    Iterator<String> iterator = clientes.iterator();

    if (iterator.hasNext() == false) {
        //String vazio = "Vendor is not in the database";
        //out.println(vazio);
    } else {

        do {
            String vendorsList = (String) iterator.next();
            out.println(vendorsList);
        } while (iterator.hasNext());

    }
%>