/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.Repository;
import domain.Author;
import domain.Publisher;
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
@WebServlet(name = "AddNewPublisherServlet", urlPatterns = {"/AddNewPublisherServlet"})
public class AddNewPublisherServlet extends HttpServlet {

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
            Publisher p = new Publisher();
            String title = request.getParameter("title");
            String address = request.getParameter("address");
            Boolean b =false;
            Boolean bool = false;
            ArrayList<Publisher> publishers = r.getPublishers();
            if (!title.isEmpty() && !address.isEmpty()) {
                bool = true;
                for(Publisher pr:publishers){
                    if(pr.getTitle().equals(title)){
                        b = true;
                    }
                }   
            } 
            if(b==false && bool == true){
                p.setTitle(title);
                p.setAddress(address);
                r.savePublisher(p); 
            }
            response.sendRedirect("publishers.jsp");
        } catch (Exception ex) {
            Logger.getLogger(AddNewAuthorServlet.class.getName()).log(Level.SEVERE, null, ex);
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
