<%-- 
    Document   : authors
    Created on : 23.07.2013, 14:56:23
    Author     : Aigerim
--%>

<%@page import="domain.Author"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.Repository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authors</title>
    </head>
    <body>
        <%@include file="WEB-INF/head.jspf" %>
        <br/>
        <%
            Repository r = new Repository();
            ArrayList<Author> authors = r.getAuthors();
            User u = (User)session.getAttribute("user");
        %>
        <%if(r.isAdmin(session)){%>
        <div align="right">
                <form action="AddNewAuthorServlet" method="post">
                    <label>Add new Author:</label>
                    <input type="text" name="name" id="name" placeholder="author name"/>
                    <input type="submit" value="Add">
                </form>       
        </div>
        <%}%>
        <h3><table id="page">
            <tr>
            <td><b>ID</b></td>
            <td><b>Name</b></td>
        </tr>
        <%for (Author a : authors) {%>
        <tr> 
            <td><%=a.getId()%></td>
            <td><a href="author.jsp?authorId=<%=a.getId()%>"><%=a.getName()%></a></td>
        </tr>
        <%}%>
            </table></h3>
    <%@include file="WEB-INF/foot.jspf" %>
</body>
</html>
