<%-- 
    Document   : book
    Created on : 24.07.2013, 23:33:19
    Author     : Aigerim
--%>

<%@page import="domain.Ganre"%>
<%@page import="domain.Publisher"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Author"%>
<%@page import="domain.Book"%>
<%@page import="db.Repository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Repository r = new Repository();
            Book b = r.getBook(Integer.parseInt(request.getParameter("bookId")));
            ArrayList<Author> authors = r.getAuthors();
            ArrayList<Publisher> publishers = r.getPublishers();
            ArrayList<Ganre> ganres = r.getGanres();
            User u = (User) session.getAttribute("user");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=b.getTitle()%></title>
    </head>
    <body>
        <%@include file="WEB-INF/head.jspf" %>
        <br/>

        <script type="text/javascript">
            function deleteBook(id){
                var conf = confirm("Are you sure that you want to delete '<%=b.getTitle()%>'");
                if(conf==true){
                    location = "DeleteBookServlet?bookId=<%=b.getId()%>";
                    alert("'<%=b.getTitle()%>'  was deleted");
                } else { 
                                        
                }
                               
            }
        </script>

        <form action="EditBookServlet?bookId=<%=b.getId()%>" method="post">
            <table>
                <tr>
                    <th>Title: </th>
                    <td></td>
                    <td><%=b.getTitle()%></td>

                    <td><input type="text" name="title" id="title" value="<%=b.getTitle()%>"/></td>
                </tr>
                <tr>
                    <th>Author: </th>
                    <td></td>
                    <td><%=b.getAuthor().getName()%></td>

                    <td><select name="author" id="author" value="<%=b.getAuthor().getName()%>" style="width: 155px;">
                            <%
                                for (Author a : authors) {
                            %>
                            <option value="<%=a.getId()%>"><%=a.getName()%></option>
                            <%}%>
                        </select></td>
                </tr>
                <tr>
                    <th>Ganre:</th>
                    <td></td>
                    <td><%=b.getGanre().getTitle()%></td>

                    <td><select name="ganre" id="ganre" value="<%=b.getGanre().getTitle()%>"style="width: 155px;">
                            <%
                                for (Ganre g : ganres) {
                            %>
                            <option value="<%=g.getId()%>"><%=g.getTitle()%></option>
                            <%}%>
                        </select></td>
                </tr>
                <tr>
                    <th>Publisher:</th>
                    <td></td>
                    <td><%=b.getPublisher().getTitle()%></td>

                    <td><select name="publisher" id="publisher" value="<%=b.getPublisher().getTitle()%>"style="width: 155px;" d>
                            <%
                                for (Publisher p : publishers) {
                            %>
                            <option value="<%=p.getId()%>"><%=p.getTitle()%></option>
                            <%}%>
                        </select></td>
                </tr>
                <tr>
                    <th>Year:</th>
                    <td></td>
                    <td><%=b.getYear()%></td>

                    <td><input type="text" name="year" id="year" value="<%=b.getYear()%>"/></td>
                </tr>
                <tr>
                    <th>Price:</th>
                    <td></td>
                    <td><%=b.getPrice()%></td>

                    <td><input type="text" name="price" id="price" value="<%=b.getPrice()%>"/></td>
                </tr>
                <tr>

                    <td><input type="button" name="deleteBtn" onclick="deleteBook(<%=b.getId()%>)" value="Delete"/></td>
                    <td colspan="2"></td>

                    <td><input type="submit" value="Edit"/></td>     
                </tr>
            </table>
        </form>

        <%@include file="WEB-INF/foot.jspf" %>
    </body>
</html>
