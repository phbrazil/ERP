/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.pedidoCompra;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
@WebServlet(name = "/createPedidoCompra", urlPatterns = {"/createPedidoCompra"})
public class createPedidoCompra extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        //request.getCharacterEncoding();

        PrintWriter out = response.getWriter();

        HttpSession sessao = request.getSession(true);

        String emailuser = (String) sessao.getAttribute("emailuser");

        String data = new SimpleDateFormat("dd/MM/yyyy hh:mm").format(Calendar.getInstance().getTime());

        tbPedidoCompra pedido = new tbPedidoCompra(0, "", "", 0, "", "", "", "", true,"","");
        
        
        pedido.setRazaosocial(request.getParameter("razaosocial"));
        pedido.setNomeprod(request.getParameter("nomeprod"));
        pedido.setQtd(Integer.valueOf(request.getParameter("qtd")));
        pedido.setParcelamento(request.getParameter("parcelamento"));
        pedido.setEntrega(request.getParameter("entrega"));
        pedido.setPrioridade(request.getParameter("prioridade"));
        pedido.setObs(request.getParameter("obs"));
        pedido.setAprovado(false);
        pedido.setCreatedby(emailuser);
        pedido.setDatacadastro(data);

        Integer id = 0;

        //GRAVAR NO BANCO
        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbPedidoCompra.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        try {
            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();
            id = (Integer) session.save(pedido);

            //comita as informacoes
            tx.commit();

        } finally {
            if (session != null) {
                session.close();
                sf.close();
            }
        }

        if (id > 0) {

            String path = "Home.jsp";
            String mensagem = "Novo pedido de Compra ID " + id+ " cadastrado!";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='Modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");
        } else {
            String path = "Home.jsp";
            String mensagem = "Ocorreu um erro, tente novamente";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='Modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
