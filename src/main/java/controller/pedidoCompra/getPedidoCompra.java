/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.pedidoCompra;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.pedidoCompra.tbPedidoCompra;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/getPedidoCompra", urlPatterns = {"/getPedidoCompra"})
public class getPedidoCompra extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sessao = request.getSession(true);

        int id = Integer.valueOf(request.getParameter("id"));

        NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
                new Locale("pt", "BR"));

        //indica as configuracoes do banco
        Configuration conVenda = new Configuration().configure().addAnnotatedClass(tbPedidoCompra.class);
        SessionFactory sf = conVenda.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();
        tbPedidoCompra pedido;
        try {

            Transaction txVenda = session.beginTransaction();

            pedido = (tbPedidoCompra) session.get(tbPedidoCompra.class, id);

            //comita as informacoes
            txVenda.commit();

        } finally {
            if (session != null) {
                session.close();
                sf.close();
            }

        }
        request.setAttribute("pedido", pedido);

        request.getRequestDispatcher("editRequest.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
