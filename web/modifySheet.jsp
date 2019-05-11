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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Sheet modification</title>
    </head>

    <body>
        <h1>Sheet modification</h1>
        <div class="container">
  <!-- Content here -->
        </div>
        
    </body>
    <% User user = (User) session.getAttribute("user");
        if (user != null) {
            List<Sheetmusic> sheets = (List<Sheetmusic>) request.getAttribute("sheets");
    %>

    <form action="ModifySheet" method="post">
        Select sheet to modify:
        <select name="sheetId" size="1" required>
            <% for (Sheetmusic s : sheets) {%>
            <option value="<%= s.getIdsheetmusic()%>" ><%= s.getTitle()%></option>
            <% } %>  
        </select>
        <input type="submit" name="send" value="Select this sheet">
    </form>
        
        <br> <a href="menu.jsp">Return to menu</a>

    <br>
    <br>
    <%
        if (request.getAttribute("sheet") != null) {
            Sheetmusic s = (Sheetmusic) request.getAttribute("sheet");
    %>
    <form>
    Id:<input type ="text" name="sheetId" readonly value="<%= s.getIdsheetmusic()%>">
   
    <br>
    Insert new values:
    <br>

    Title:<input type ="text" name="title" required value="<%= s.getTitle() %>">
    <br>   

    Artist:<input type="text" name="artist" size="40" value= "<%= s.getArtist()%>"required>
    <br>

    Instrument:
    <select name="instrument" size="1" required>
        <option value="Guitar" <% if (s.getInstrument().equalsIgnoreCase("Guitar")) { %> selected <% } %> >Guitar</option>
        <option value="Piano" <% if (s.getInstrument().equalsIgnoreCase("Piano")) { %> selected <% } %>  >Piano</option>
        <option value="Drums" <% if (s.getInstrument().equalsIgnoreCase("Drums")) { %> selected <% } %> >Drums</option>
        <option value="Flute" <% if (s.getInstrument().equalsIgnoreCase("flute")) { %> selected <% } %> >Flute</option></select>
    <br>

    Genre:<input type="text" name="genre" size="40" required value = "<%= s.getGenre() %>"></td>   
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

<input type="submit" name="send2" value="Modify sheet">

    </form>

    


<%
    }
%>

<% } else { %>
<div>You got no authorization. Login</div>
<a href="index.jsp">Return to menu</a>

<% }%>
</html>
