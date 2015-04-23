<%-- 
    Document   : books
    Created on : 23.07.2013, 14:56:11
    Author     : Aigerim
--%>

<%@page import="domain.Ganre"%>
<%@page import="domain.Publisher"%>
<%@page import="domain.Author"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Book"%>
<%@page import="db.Repository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Books</title>
        <%
            Repository r = new Repository();
            ArrayList<Author> authors = r.getAuthors();
            ArrayList<Publisher> publishers = r.getPublishers();
            ArrayList<Ganre> ganres = r.getGanres();
            ArrayList<Book> books = r.getBooks();
            User u = (User) session.getAttribute("user");
        %>
    </head>
    <body>
        <%@include file="WEB-INF/head.jspf" %>
        <br/>
        <table id="page">
            <%if (r.isAdmin(session)) {%>
            <tr>
            <form action="AddNewBookServlet" method="post">
                <td></td>
                <td><input type="text" name="title" id="title" placeholder="title"/></td>
                <td><select name="author" id="author">
                        <%
                            for (Author a : authors) {
                        %>
                        <option value="<%=a.getId()%>"><%=a.getName()%></option>
                        <%}%>
                    </select></td>
                <td><select name="ganre" id="ganre">
                        <%
                            for (Ganre g : ganres) {
                        %>
                        <option value="<%=g.getId()%>"><%=g.getTitle()%></option>
                        <%}%>
                    </select></td>
                <td><select name="publisher" id="publisher">
                        <%
                            for (Publisher p : publishers) {
                        %>
                        <option value="<%=p.getId()%>"><%=p.getTitle()%></option>
                        <%}%>
                    </select></td>

                <td><input type="text" name="year" id="year" placeholder="year" size="5em"/></td>
                <td><input type="text" name="price" id="price" placeholder="price" size="5em"/></td>
                <td><input type="submit" value="Add" size="5em"/></td>
            </form>
        </tr>
        <%}%>
        <tr>
            <td><b>ID</b></td>
            <td><b>Title</b></td>
            <td><b>Author</b></td>
            <td><b>Ganre</b></td>
            <td><b>Publisher</b></td>
            <td><b>Year</b></td>
            <td><b>Price</b></td>
        </tr>
        <%                for (Book b : books) {
        %>
        <tr>
            <td><%=b.getId()%></td>
            <td><a href="book.jsp?bookId=<%=b.getId()%>"><%=b.getTitle()%></a></td>
            <td><%=b.getAuthor().getName()%></td>
            <td><%=b.getGanre().getTitle()%></td>
            <td><%=b.getPublisher().getTitle()%></td>
            <td><%=b.getYear()%></td>
            <td><%=b.getPrice()%></td>
        </tr>
        <%                }
        %>
    </table>
    <%@include file="WEB-INF/foot.jspf" %>
</body>
</html>
