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
        <meta http-equiv="refresh" content="3;url=index.jsp"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Success</title>
    </head>
    <body>
         <%
            String msg = (String) request.getAttribute("status");
             %>
             <%= msg %>
             <br> <a href="index.jsp">Return to home</a>
        
    </body>
</html>
