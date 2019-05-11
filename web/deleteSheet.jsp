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
        <h1>Remove sheet</h1>
        <div class="container">
  <!-- Content here -->
        </div>
        
    </body>
    <% User user = (User) session.getAttribute("user");
        if (user != null) {
            List<Sheetmusic> sheets = (List<Sheetmusic>) request.getAttribute("sheets");
    %>

    <form action="DeleteSheet" method="post">
        Select sheet to remove:
        <select name="sheetId" size="1" required>
            <% for (Sheetmusic s : sheets) {%>
            <option value="<%= s.getIdsheetmusic()%>" ><%= s.getTitle()%></option>
            <% } %>  
        </select>
        <input type="submit" name="send" value="Delete this sheet">
    </form>
        
    <br> <a href="menu.jsp">Return to menu</a>

    <br>
    <br>
    <%
        if(request.getAttribute("sheetId") != null) {
             request.setAttribute("id", "1"); 
           // int id = (int) request.getAttribute("sheetId");
    %>
    <form action="DeleteSheet" method="post">
         <input type="submit" name="send2" value="Confirm"> 
    </form>
    
     <form action="SheetsFromUser">
        <input type="submit" value="Remove sheet" name="boton">
    </form>

<%
    }
%>



<% } else { %>
<div>You got no authorization. Login first</div>
<a href="index.jsp">Return to home</a>

<% }%>
</html>

