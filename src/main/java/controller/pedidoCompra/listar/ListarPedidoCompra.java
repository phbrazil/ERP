/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.pedidoCompra.listar;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.pedidoCompra.ListarPedidosCompraDAO;
import model.pedidoCompra.tbPedidoCompra;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/ListarPedidoCompra", urlPatterns = {"/ListarPedidoCompra"})
public class ListarPedidoCompra extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession(true);

        String emailuser = (String) sessao.getAttribute("emailuser");


        //indica as configuracoes do banco
        //Configuration con = new Configuration().configure().addAnnotatedClass(tbPedidoCompra.class);
        //SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        //Session session = sf.openSession();
        List<tbPedidoCompra> pendencias;
        
        ListarPedidosCompraDAO listar = new ListarPedidosCompraDAO();
        
        pendencias = listar.ListarPedidos();
        
        request.setAttribute("pendencias", pendencias);


        request.getRequestDispatcher("ListarPendencias.jsp").forward(request, response);



    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
