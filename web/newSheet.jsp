<%-- 
    Document   : newSheet
    Created on : 05-may-2019, 19:46:58
    Author     : MSI
--%>

<%@page import="entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <% User user = (User) session.getAttribute("user");
           if (user != null) {%>
        <h1>New Sheet</h1>
       
        <br>
       
        <form action="NewSheet" method="post">
        <font size="2">
      
         Title:<input type ="text" name="title" required>
         <br>   
         
         Artist:<input type="text" name="artist" size="40" required>
         <br>
         
         Instrument:
          <select name="instrument" size="1" required>
             <option value="Guitar" selected>Guitar</option>
             <option value="Piano" >Piano</option>
             <option value="Drums" >Drums</option>
             <option value="Flute" >Flute</option></select>
         <br>
         
        Genre:<input type="text" name="genre" size="40" required></td>   
        <br>  
        
        Difficulty:<br>
                    <input type="radio" name="difficulty" value="easy">Easy<br>
                    <input type="radio" name="difficulty" value="medium" checked >Medium<br>
                    <input type="radio" name="difficulty" value="hard">Hard<br>
                    <input type="radio" name="difficulty" value="professional">Professional<br> 
       <br>       
       
        Printed:
        <select name="printed" size="1" required>
          <option value="true" selected>Yes</option>
          <option value="false" >No</option>
        </select> 
                
        <br>  
        <br>
               
        <input type="submit" name="send" value="Send sheet"
                  
        </font>
        </form>
            <br> <a href="menu.jsp">Return to menu</a>
         <% } else { %>
         <div>You got no authorization. Login first</div>
         <a href="index.jsp">Return to menu</a>
         <% } %>
    </body>
</html>
