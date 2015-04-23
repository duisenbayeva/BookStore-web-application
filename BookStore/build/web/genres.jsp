<%-- 
    Document   : genres
    Created on : 23.07.2013, 14:56:47
    Author     : Aigerim
--%>

<%@page import="domain.Ganre"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.Repository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ganres</title>
    </head>
    <body>
        <%@include file="WEB-INF/head.jspf" %>
        <%
            Repository r = new Repository();
            ArrayList<Ganre> ganres = r.getGanres();
            User u = (User)session.getAttribute("user");
        %>
        <%if(r.isAdmin(session)){%>
        <div align="right">
            <form action="AddNewGanreServlet" method="post">
                <label>Add new Ganre:</label>
                <input type="text" name="title" id="name" placeholder="title"/>
                <input type="submit" value="Add">
            </form>
        </div>
        <%}%>
        <h3><table id="page">
            <tr>
            <td><b>ID</b></td>
            <td><b>Title</b></td>
            </tr>
            <%for (Ganre g : ganres) {%>
            <tr>
                <td><%=g.getId()%> </td> 
                <td><a href="ganre.jsp?ganreId=<%=g.getId()%>"><%=g.getTitle()%></a></td>     
            </tr>
            <%}%>
        </table></h3>
        <%@include file="WEB-INF/foot.jspf" %>
    </body>
</html>
