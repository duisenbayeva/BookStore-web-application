<%-- 
    Document   : login
    Created on : 27.07.2013, 16:28:42
    Author     : Aigerim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/head.jspf" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form action="LoginServlet" method="post">
            <table align="center"> 
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="username" id="username"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="passwd" id="passwd"/></td>
                    <td><input type="submit" value="Login" style="width: 7em"/></td>
                </tr>      
            </table>
        </form>
        <%@include file="WEB-INF/foot.jspf" %>
    </body>
</html>
