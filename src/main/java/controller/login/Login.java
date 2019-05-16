/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.login;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Paulo.Bezerra
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})

public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //request.setCharacterEncoding("ISO-8859-1");
        request.setCharacterEncoding("UTF-8");

        String emailuser = request.getParameter("emailuser");
        String password = request.getParameter("password");

        HttpSession sessao = request.getSession();

        if (emailuser.equals("erp@senac.com.br") && password.equals("senac")) {
            
            sessao.setAttribute("emailuser", emailuser);
            sessao.setAttribute("nomecomp", "Aluno");
            sessao.setAttribute("sessaoid", sessao.getId());
            
            PrintWriter out = response.getWriter();
            
            String path = "Home.jsp";
            String mensagem = "Sistema desenvolvido por: <br><br><strong>Paulo Henrique Bezerra</strong>"
                    + "<br><br><strong>Lucas Medeiros</strong><br><br>"
                    + "<strong>Andre Pereira Martins</strong>";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='Modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        } else {
            PrintWriter out = response.getWriter();
            String path = "index.jsp";
            String mensagem = "Accesso Negado!";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='Modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");
        }
    }

}
