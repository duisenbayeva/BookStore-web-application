/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.Repository;
import domain.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author balnur
 */
@WebServlet(name = "RegistrationServlet", urlPatterns = {"/RegistrationServlet"})
public class RegistrationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Repository r = new Repository();
            String username = request.getParameter("username");
            String passwd = request.getParameter("passwd");
            String cpasswd = request.getParameter("cpasswd");
            ArrayList<User> users = r.getUsers();
            boolean b = false;
            for(User u:users){
                if(u.getUsername().equals(username)){
                    b = true;
                }
            }
            if (b==true) {
                request.getSession().setAttribute("error", "1");
            } else if (!passwd.equals(cpasswd)) {
                request.getSession().setAttribute("error1", "1");
                request.getSession().setAttribute("error", "0");
            } else {
                User u = new User();
                u.setUsername(username);
                u.setPasswd(passwd);
                r.saveUser(u);
                request.getSession().setAttribute("error1", "0");
                request.getSession().setAttribute("error", "0");
            }

            response.sendRedirect("register2.jsp");
        } catch (Exception ex) {
            out.print(ex.getMessage());
        } finally {
            out.close();
        }
    }
// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
