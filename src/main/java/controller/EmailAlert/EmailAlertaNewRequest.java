/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.EmailAlert;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "EmailAlertaNewRequest", urlPatterns = {"/EmailAlertaNewRequest"})
public class EmailAlertaNewRequest extends HttpServlet {

    @EJB
    private EmailSessionBean emailBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getCharacterEncoding();
        //request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession(true);

        boolean emailenviado = false;

        String to1 = (String) request.getParameter("to1");
        String subject = String.valueOf(request.getParameter("subject"));
        String body = (String) request.getParameter("body");

        PrintWriter out = response.getWriter();

        do {

            out.println("<html><head>");
            out.println("<meta name= 'viewport' content='width-device-width, initial-scale=1.0'>");
            //out.println("<link rel='stylesheet' type='text/css' href='css/customAlert.css'/>");
            out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\">");
            out.println("<title>Favor aguardar...</title>");
            out.println("<meta contentType=\"text/html\" pageEncoding=\"UTF-8\"");
            out.println("</head><body style='background-color: white;color: black;'>");
            out.println("<br>");
            out.println("<center><h1 class='text-primary'><strong>Seu pedido de compra está sendo aprovado</strong><br>");
            out.println("<br>");
            out.println("<img src='img/loading.gif' width='300' height'300'></h1>");
            out.println("<h2 class='text-muted'>Enviando email de notificação.<img src='img/mail.gif' width='100' height'100'></h2>");
            out.println("<p class='text-muted'>O tempo médio é de 5 segundos</p></center>");
            out.println("<br><div align='center'><p class= 'mt-5 mb-3 text-muted'><strong>&copy; 9ember Devs</strong></p></div>");
            //out.println("<script src='js/customAlert.js'></script>");
            out.println("</body></html>");
            out.flush();

            try {
                emailenviado = emailBean.sendEmail(to1, subject, body);

            } catch (RuntimeException ex) {
                ex.printStackTrace();
            }
        } while (emailenviado == false);

        if (emailenviado == true) {

            String path = "Home.jsp";
            String mensagem = "Pedido enviado ao Fornecedor";
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
