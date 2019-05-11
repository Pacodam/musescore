<%-- 
    Document   : menu
    Created on : 05-may-2019, 18:35:34
    Author     : MSI
--%>

<%@page import="entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Menu</title>
    </head>
    <body>
        <h1>Menu</h1>
    
    <% User user = (User) session.getAttribute("user");
        if (user != null) {%>

    <form action="newSheet.jsp">
        <input type="submit" value="New music sheet">
    </form>

    <form action="SheetsFromUser">
        <input type="submit" value="Sheet modification" name="boton">
    </form>

    <form action="SheetsFromUser">
        <input type="submit" value="Remove sheet" name="boton">
    </form>

    <form action="AllSheets">
        <input type="submit" value="View all sheets">
    </form>

    <form action="SheetsFromUser">
        <input type="submit" value="Sheets from user" name="boton">
    </form>

    <form action="instrumentSheet.jsp">
        <input type="submit" value="View sheets by instrument ">
    </form>

    <form action="Ranking">
        <input type="submit" value="Sheets ranking (more to less)">
    </form>

    <form action="Logout">
        <input type="submit" value="Logout">
    </form>
    <% } else { %>
         <div>You got no authorization. Login</div>
         <a href="index.jsp">Return to menu</a>
         
         <% } %>
    </body>
</html>
