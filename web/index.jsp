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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
         <div>Access to campus:</div>
        
          <form action="Login" method="POST">
            <p>Username: <input type="text" name="user" required ></p>
            <p>Password: <input type="password" name="pass" required></p>
            <p><input type="submit" value="Login"></p>
          </form>
         
         <div>Register new user:</div>
        <form action="newUser.jsp">
            <input type="submit" value="New User">
        </form>
    </body>
</html>