/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.Repository;
import domain.Author;
import domain.Book;
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
@WebServlet(name = "AddNewBookServlet", urlPatterns = {"/AddNewBookServlet"})
public class AddNewBookServlet extends HttpServlet {

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
            Book b = new Book();
            ArrayList<Book> books = r.getBooks();
            String title = request.getParameter("title");
            int year = Integer.parseInt(request.getParameter("year"));
            int price = Integer.parseInt(request.getParameter("price"));
            int author = Integer.parseInt(request.getParameter("author"));
            int publisher = Integer.parseInt(request.getParameter("publisher"));
            int ganre = Integer.parseInt(request.getParameter("ganre"));
            /*if (!title.isEmpty() && year != 0 && price != 0) {
                for (Book book : books) {
                    if(!book.getTitle().equals(title) && book.getAuthor().getId()!=author && book.getGanre().getId()!=ganre &&
                            book.getPublisher().getId()!=publisher && book.getPrice()!=price && book.getYear()!=year){
                 */ 
                    b.setTitle(title);
                    b.setPrice(price);
                    b.setYear(year);
                    b.setAuthor(r.getAuthor(author));
                    b.setGanre(r.getGanre(ganre));
                    b.setPublisher(r.getPublisher(publisher));
                    r.saveBook(b);
                    /*}
                }
            }*/
            response.sendRedirect("books.jsp");

        } catch (Exception e) {
            out.println(e.getMessage());
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
