/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.produto;

import model.vendor.tbVendors;
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
import model.produto.tbProduto;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/createProduct", urlPatterns = {"/createProduct"})
public class createProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getCharacterEncoding();

        PrintWriter out = response.getWriter();

        HttpSession sessao = request.getSession(true);

        String emailuser = (String) sessao.getAttribute("emailuser");

        String data = new SimpleDateFormat("dd/MM/yyyy hh:mm").format(Calendar.getInstance().getTime());

        tbProduto produto = new tbProduto(0, "", "", "", false, "", "", "");

        produto.setNomeprod(request.getParameter("nomeprod"));
        produto.setCodfab(request.getParameter("codfab"));
        produto.setCodint(request.getParameter("codint"));
        
        if(request.getParameter("situacao").equals("Ativo")){
            produto.setSituacao(true);
        }else{
            produto.setSituacao(false);
        }
        produto.setDescricao(request.getParameter("descricao"));
        produto.setCreatedby(emailuser);
        produto.setDatacadastro(data);

        Integer id = 0;

        //GRAVAR NO BANCO
        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbProduto.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        try {
            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();
            id = (Integer) session.save(produto);

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
            String mensagem = "Produto " + produto.getNomeprod()+ " cadastrado!";
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
