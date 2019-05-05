<%-- 
    Document   : final
    Created on : 30-abr-2019, 17:02:10
    Author     : MSI
--%>

<%@page import="servlets.NewUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
    </head>
    <body>
         <%
            String msg = (String) request.getAttribute("msg");
             %>
             <%= msg %>
        <a href="index.jsp">Return to menu</a>
        
    </body>
</html>
