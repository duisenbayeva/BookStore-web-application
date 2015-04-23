<%-- 
    Document   : publishers
    Created on : 23.07.2013, 14:56:35
    Author     : Aigerim
--%>

<%@page import="domain.Publisher"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Ganre"%>
<%@page import="db.Repository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Publishers</title>
    </head>
    <body>
        <%@include file="WEB-INF/head.jspf" %>
        <%
            Repository r = new Repository();
            ArrayList<Publisher> publishers = r.getPublishers();
            User u = (User)session.getAttribute("user");
        %>
        <%if(r.isAdmin(session)){%>
        <div align="right">
            <form action="AddNewPublisherServlet" method="post">
                <label>Add new Publisher:</label>
                <input type="text" name="title" id="title" placeholder="title" style="width: 7em"/>
                <input type="text" name="address" id="address" placeholder="address" style="width: 7em"/>
                <input type="submit" value="Add">
            </form>
        </div>
        <%}%>
        <h3><table id="page">
                <tr>
                    <td><b>ID</b></td>
                    <td><b>Title</b></td>
                    <td><b>Address</b></td>
                </tr>
                <%for (Publisher p : publishers) {%>
                <tr>
                    <td><%=p.getId()%> </td> 
                    <td><a href="publisher.jsp?publisherId=<%=p.getId()%>"><%=p.getTitle()%></td>
                    <td><%=p.getAddress()%></td>
                </tr>
                <%}%>
            </table></h3>
            <%@include file="WEB-INF/foot.jspf" %>
    </body>
</html>
