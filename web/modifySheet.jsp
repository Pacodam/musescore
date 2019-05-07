<%-- 
    Document   : modifySheet
    Created on : 06-may-2019, 22:48:04
    Author     : MSI
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Sheetmusic"%>
<%@page import="entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sheet modification</title>
    </head>
    
    <body>
        <h1>Sheet modification</h1>
    </body>
     <% User user = (User) session.getAttribute("user");
        if (user != null) {
           List<Sheetmusic> sheets = (List<Sheetmusic>) request.getAttribute("sheets");    
     %>
     
        <form action="ModifySheet" method="post">
        <font size="2">
        
         Select sheet to modify:
          <select name="sheetId" size="1" required>
              <% for(Sheetmusic s: sheets){ %>
                 <option value="<%= s.getIdsheetmusic() %>" ><%= s.getTitle() %></option>
               <% } %>  
          </select>
          <br>
          <br>
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
               
        <input type="submit" name="send" value="Modify sheet"
                  
        </font>
        </form>
           
        
        
      <% } else { %>
       <div>You got no authorization. Login</div>
       <a href="index.jsp">Return to menu</a>
         
       <% } %>
</html>
