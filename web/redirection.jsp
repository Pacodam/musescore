<%-- 
    Document   : redirection
    Created on : 11-may-2019, 19:21:23
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="refresh" content="3;url=index.jsp"/>
        <title>redirection</title>
       
    </head>
    <body>
        <%
            String msg = (String) request.getAttribute("status");
             %>
             <%= msg %>
             <br> <a href="index.jsp">Return to menu</a>
              
    </body>
</html>
