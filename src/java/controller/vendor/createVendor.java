/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.vendor;

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
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/createVendor", urlPatterns = {"/createVendor"})
public class createVendor extends HttpServlet {

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

        tbVendors vendor = new tbVendors(0, "", "", "", "", "",
                "", "", "", "", "","","");

        vendor.setRazaosocial(request.getParameter("razaosocial"));
        vendor.setCnpj(request.getParameter("cnpj"));
        vendor.setNomefantasia(request.getParameter("nomefantasia"));
        vendor.setWebsite(request.getParameter("website"));
        vendor.setIndustrysector(request.getParameter("industrysector"));
        vendor.setPhone1(request.getParameter("phone1"));
        vendor.setPhone2(request.getParameter("phone2"));
        vendor.setContato(request.getParameter("contato"));
        vendor.setCargo(request.getParameter("cargo"));
        vendor.setEmail(request.getParameter("email"));
        vendor.setCreatedby(emailuser);
        vendor.setDatacadastro(data);

        Integer id = 0;

        //GRAVAR NO BANCO
        //indica as configuracoes do banco
        //PODE SER USAR MAIS DE UMA CLASSE SEPARANDO POR VIRGULAS NO tbPauta.class,tb...
        Configuration con = new Configuration().configure().addAnnotatedClass(tbVendors.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        try {
            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();
            id = (Integer) session.save(vendor);

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
            String mensagem = "Fornecedor " + vendor.getRazaosocial() + " cadastrado!";
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
