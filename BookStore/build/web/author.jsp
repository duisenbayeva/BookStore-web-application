<%-- 
    Document   : getBooksByAuthor
    Created on : 23.07.2013, 22:09:19
    Author     : Aigerim
--%>

<%@page import="domain.Author"%>
<%@page import="domain.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.Repository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/head.jspf" %>

        <%
            Repository r = new Repository();
            int authorId = Integer.parseInt(request.getParameter("authorId"));
            Author a = r.getAuthor(authorId);
            ArrayList<Book> books = r.getBooksByAuthor(a);
            User u = (User)session.getAttribute("user");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=a.getName()%></title>
    </head>
    <body>
        <br/>
        <script type="text/javascript">
            function deleteAuthor(id){
                var conf = confirm("Are you sure that you want to delete '<%=a.getName()%>'");
                if(conf==true){
                    location = "DeleteAuthorServlet?authorId=<%=a.getId()%>";
                    alert("'<%=a.getName()%>'  was deleted");
                } else {                                                
                }
            }
        </script>

        <h2><label><%=a.getName()%></label></h2>
        <%if(r.isAdmin(session)){%>
        <div align="right">
            <form action="EditAuthorServlet?authorId=<%=a.getId()%>" method="post">
                <input type="text" name="authorName" id="authorName" value="<%=a.getName()%>"/>
                <input type="submit" value="Edit" style="margin-right: 5em; width: 7em"/>
            </form>
            <input type="button" name="deleteBtn" onclick="deleteAuthor(<%=a.getId()%>)" value="Delete" style="margin-right: 5em; width: 7em"/>
        </div><br/>
        <%}%>
        <h3><table id="page">
                <tr>
                    <td><b>ID</b></td>
                    <td><b>Book</b></td>
                    <td><b>Ganre</b></td>
                    <td><b>Publisher</b></td>
                    <td><b>Year</b></td>
                    <td><b>Price</b></td>
                </tr>
                <%                for (Book b : books) {
                %>
                <tr>
                    <td><%=b.getId()%></td>
                    <td><%=b.getTitle()%></td>
                    <td><%=b.getGanre().getTitle()%></td>
                    <td><%=b.getPublisher().getTitle()%></td>
                    <td><%=b.getYear()%></td>
                    <td><%=b.getPrice()%></td>
                </tr>
                <%                }
                %>
            </table></h3>
            <%@include file="WEB-INF/foot.jspf" %>
    </body>
</html>
