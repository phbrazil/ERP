/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.action;

import controller.login.*;
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
@WebServlet(name = "ActionHome", urlPatterns = {"/ActionHome"})

public class Action extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //request.setCharacterEncoding("ISO-8859-1");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        String password = request.getParameter("password");

        HttpSession sessao = request.getSession();

        if (action.equals("newVendor")) {

            request.getRequestDispatcher("newVendor.jsp").forward(request, response);

        } else if (action.equals("newProduct")) {

            request.getRequestDispatcher("newProduct.jsp").forward(request, response);

        } else if (action.equals("newRequest")) {

            request.getRequestDispatcher("newRequest.jsp").forward(request, response);
        }
    }

}
