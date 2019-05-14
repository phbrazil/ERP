/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.login;

import com.mcibrasil.opportunity.dao.Login.AcessoLoginDAO;
import com.mcibrasil.opportunity.model.Login.LoginDadosModel;
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

        LoginDadosModel logindados = new LoginDadosModel(null, null, null, null, 0, false, false);

        String emailuser = request.getParameter("emailuser");
        String password = request.getParameter("password");

        boolean mobile = Boolean.valueOf(request.getParameter("mobile"));

        logindados.setUsername(emailuser);
        logindados.setPassword(password);
        AcessoLoginDAO acessologin = new AcessoLoginDAO();
        logindados = acessologin.ValidaAcesso(emailuser, password);

        HttpSession sessao = request.getSession();

        if (logindados.isAcessopermitido() == true && !logindados.isChangepassword()) {

            sessao.setAttribute("emailuser", logindados.getUserName());

            String primeironome = "";

            for (int i = 0; i < logindados.getNomeUser().length(); i++) {

                if (i == 0) {
                    primeironome = primeironome + logindados.getNomeUser().toUpperCase().charAt(i);

                } else {
                    primeironome = primeironome + logindados.getNomeUser().toLowerCase().charAt(i);

                }

                if (String.valueOf(logindados.getNomeUser().charAt(i)).equals(" ")) {

                    break;

                }

            }

            sessao.setAttribute("nomecomp", primeironome);
            sessao.setAttribute("mobile", mobile);

            logindados = null;
            request.getRequestDispatcher("SessaoServlet").forward(request, response);

        } else if (logindados.isAcessopermitido()) {

            sessao.setAttribute("emailuser", logindados.getUserName());
            sessao.setAttribute("nomecomp", logindados.getNomeUser());
            sessao.setAttribute("mobile", mobile);

            PrintWriter out = response.getWriter();
            String path = "TrocarSenha.jsp";
            String mensagem = "Your Password must be changed";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='Modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        } else {
            PrintWriter out = response.getWriter();
            String path = "index.jsp";
            String mensagem = "Access Denied";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='Modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");
        }
    }

}
