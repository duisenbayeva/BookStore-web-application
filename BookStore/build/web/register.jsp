<%-- 
    Document   : register
    Created on : 27.07.2013, 16:47:28
    Author     : Aigerim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/head.jspf" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <form action="RegistrationServlet" method="POST">
            <table align="center">
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="username" id="username"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="passwd" id="passwd"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Confirm your password:</td>
                    <td><input type="password" name="cpasswd" id="cpasswd"/></td> 
                    <td><input type="submit" value="Register" style="width: 7em"/></td>
                </tr>
            </table> 
            <%@include file="WEB-INF/foot.jspf" %>
        </form>
    </body>
</html>
