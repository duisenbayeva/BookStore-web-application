<%-- 
    Document   : getBooksOfPublisher
    Created on : 24.07.2013, 15:06:15
    Author     : Aigerim
--%>

<%@page import="domain.Publisher"%>
<%@page import="domain.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.Repository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Repository r = new Repository();
            int publisherId = Integer.parseInt(request.getParameter("publisherId"));
            Publisher p = r.getPublisher(publisherId);
            ArrayList<Book> books = r.getBooksOfPublisher(p);
            User u = (User)session.getAttribute("user");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getTitle()%></title>
    </head>
    <body>
        <%@include file="WEB-INF/head.jspf" %>
        <br/>

        <h2><label><%=p.getTitle()%></label></h2>

        <script type="text/javascript">
            function deletePublisher(id){
                var conf = confirm("Are you sure that you want to delete '<%=p.getTitle()%>'");
                if(conf==true){
                    location = "DeletePublisherServlet?publisherId=<%=p.getId()%>";
                    alert("'<%=p.getTitle()%>' was deleted");
                } else { 
                                        
                }
                               
            }
        </script>
        <%if(r.isAdmin(session)){%>
        <div align="right">
            <form action="EditPublisherServlet?publisherId=<%=p.getId()%>" method="post">
                <input type="text" name="publisherTitle" id="publisherTitle" value="<%=p.getTitle()%>"/>
                <input type="text" name="publisherAddress" id="publisherAddress" value="<%=p.getAddress()%>"/>
                <input type="submit" value="Edit" style="margin-right: 2em; width: 7em"/>
            </form>
            <input type="button" name="deleteBtn" onclick="deletePublisher(<%=p.getId()%>)" value="Delete" style="margin-right: 2em; width: 7em"/>
        </div>
        <%}%>
        <h3><table id="page">
                <tr>
                    <td><b>ID</b></td>
                    <td><b>Book</b></td>
                    <td><b>Ganre</b></td>
                    <td><b>Year</b></td>
                    <td><b>Price</b></td>
                </tr>
                <%                for (Book b : books) {
                %>
                <tr>
                    <td><%=b.getId()%></td>
                    <td><%=b.getTitle()%></td>
                    <td><%=b.getGanre().getTitle()%></td>
                    <td><%=b.getYear()%></td>
                    <td><%=b.getPrice()%></td>
                </tr>
                <%                }
                %>
            </table></h3>
            <%@include file="WEB-INF/foot.jspf" %>
    </body>
</html>
