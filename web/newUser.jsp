<%-- 
    Document   : newUser
    Created on : 05-may-2019, 12:24:29
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
new user registration
-->
<html>
    <head>
        <title>New user registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>New User</h1>
        <form method="POST" action="NewUser"> 
            <p>Username: <input type="text" name="username" required></p>
            <p>Password: <input type="text" name="password" required></p>
  
            <p>Favourite instrument:
                <select name="favourite" required>
                    <option>Guitar</option>
                    <option>Piano</option>
                    <option>Drums</option>
                </select>
            </p>
            <p><input type="submit" value="Alta"></p>
        </form>
    </body>
</html>