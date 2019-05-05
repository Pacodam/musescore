<%-- 
    Document   : index.jsp
    Created on : 05-may-2019, 12:04:55
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Musescore</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
         <div>Select an option:</div>
        
        <form action="newUser.jsp">
            <input type="submit" value="New User">
        </form>
         <form action="signInUser.jsp">
            <input type="submit" value="User login">
        </form>
    </body>
</html>