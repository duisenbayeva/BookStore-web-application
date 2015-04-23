/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.Repository;
import domain.Book;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author balnur
 */
@WebServlet(name = "EditBookServlet", urlPatterns = {"/EditBookServlet"})
public class EditBookServlet extends HttpServlet {

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
            Book b = r.getBook(Integer.parseInt(request.getParameter("bookId")));
            b.setTitle(request.getParameter("title"));
            b.setPrice(Integer.parseInt(request.getParameter("price")));
            b.setYear(Integer.parseInt(request.getParameter("year")));
            b.setAuthor(r.getAuthor(Integer.parseInt(request.getParameter("author"))));
            b.setGanre(r.getGanre(Integer.parseInt(request.getParameter("ganre"))));
            b.setPublisher(r.getPublisher(Integer.parseInt(request.getParameter("publisher"))));
            r.saveBook(b);
            response.sendRedirect("books.jsp");
        }catch(Exception e){
            response.sendRedirect("books.jsp");
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
