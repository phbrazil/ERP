/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.pedidoCompra;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.pedidoCompra.AprovarPedidoCompraDAO;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "approvalRequest", urlPatterns = {"/approvalRequest"})
public class approvalRequest extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //request.setCharacterEncoding("UTF-8");
        request.getCharacterEncoding();

        HttpSession sessao = request.getSession(true);

        PrintWriter out = response.getWriter();

        int id = Integer.valueOf(request.getParameter("id"));
        String razaosocial = String.valueOf(request.getParameter("razaosocial"));
        String nomeprod = String.valueOf(request.getParameter("nomeprod"));
        String qtd = String.valueOf(request.getParameter("qtd"));
        String parcelamento = String.valueOf(request.getParameter("parcelamento"));
        String entrega = String.valueOf(request.getParameter("entrega"));
        String prioridade = String.valueOf(request.getParameter("prioridade"));
        String obs = String.valueOf(request.getParameter("obs"));
        String approval = String.valueOf(request.getParameter("approval"));
        String to1 = "paulo.bezerra@mci-group.com";

        if (approval.equals("true")) {

            AprovarPedidoCompraDAO aprovar = new AprovarPedidoCompraDAO();

            aprovar.AprovarPedido(id, true);

            String subject = "ERPortable - Novo pedido de compra";

            String body = "<strong>Caro " + razaosocial + ",</strong><br><br>"
                    + "Um novo pedido de compra foi gerado conforme abaixo:<br><br>"
                    + "<strong>Produto: </strong>" + nomeprod + "<br>"
                    + "<strong>Quantidade: </strong>" + qtd + "<br>"
                    + "<strong>Parcelamento: </strong>" + parcelamento + "<br>"
                    + "<strong>Entrega: </strong>" + entrega + "<br>"
                    + "<strong>Prioridade: </strong>" + prioridade + "<br>"
                    + "<strong>Obs: </strong>" + obs + "<br>";

            request.setAttribute("to1", to1);
            request.setAttribute("subject", subject);
            request.setAttribute("body", body);

            request.getRequestDispatcher("EmailAlertNewRequest.jsp").forward(request, response);

        } else {

            AprovarPedidoCompraDAO aprovar = new AprovarPedidoCompraDAO();

            aprovar.AprovarPedido(id, false);

            String path = "Home.jsp";
            String mensagem = "Pedido Rejeitado";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='Modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
