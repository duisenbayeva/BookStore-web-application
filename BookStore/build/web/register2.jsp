<%-- 
    Document   : register2
    Created on : 28.07.2013, 12:37:11
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
        <%
            String error1 = (String)session.getAttribute("error1");
            String error = (String)session.getAttribute("error");
            session.setAttribute("error", null);
            session.setAttribute("error1", null);
            if (error.equals("1")){
        %>
        <label style="color: red"> This username has already registered. <a href="register.jsp">Try again</a></label>
        <%}else if(error1.equals("1")){%>
        <label style="color: red;" align="center">Your passwords don't match <a href="register.jsp">try again</a></label>
        <%} else {%>
        <label align="center">Registration completed! <a href="login.jsp">login</a></label>
        <%}%>
        <%@include file="WEB-INF/foot.jspf" %>
    </body>
</html>
