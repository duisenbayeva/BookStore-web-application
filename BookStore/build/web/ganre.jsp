<%-- 
    Document   : getBooksOfGanre
    Created on : 24.07.2013, 15:06:48
    Author     : Aigerim
--%>

<%@page import="domain.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.Repository"%>
<%@page import="domain.Ganre"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Repository r = new Repository();
            int ganreId = Integer.parseInt(request.getParameter("ganreId"));
            Ganre g = r.getGanre(ganreId);
            ArrayList<Book> books = r.getBooksByGanre(g);
            User u = (User)session.getAttribute("user");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=g.getTitle()%></title>
    </head>
    <body>
        <%@include file="WEB-INF/head.jspf" %>
        <br/>

        <h2><label><%=g.getTitle()%></label></h2>
        <script type="text/javascript">
            function deleteGanre(id){
                var conf = confirm("Are you sure that you want to delete '<%=g.getTitle()%>'");
                if(conf==true){
                    location = "DeleteGanreServlet?ganreId=<%=g.getId()%>";
                    alert("'<%=g.getTitle()%>'  was deleted");
                } else { 
                                        
                }
                               
            }
        </script>   
        <%if(r.isAdmin(session)){%>
        <div align="right">
            <form action="EditGanreServlet?ganreId=<%=g.getId()%>" method="post">
                <input type="text" name="ganreTitle" id="ganreTitle" value="<%=g.getTitle()%>"/>
                <input type="submit" value="Edit" style="margin-right: 5em; width: 7em"/>
            </form>
                <input type="button" name="deleteBtn" onclick="deleteGanre(<%=g.getId()%>)" value="Delete" style="margin-right: 5em; width: 7em"/> 
        </div>
        <%}%>
        <h3><table id="page">
            <tr>
            <td><b>ID</b></td>
            <td><b>Title</b></td>
            <td><b>Publisher</b></td>
            <td><b>Year</b></td>
            <td><b>Price</b></td>
            </tr>
            </tr>
            <%                for (Book b : books) {
            %>
            <tr>
                <td><%=b.getId()%></td>
                <td><%=b.getTitle()%></td>
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
