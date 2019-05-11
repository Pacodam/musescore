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
        <h1>Find sheet by instrument</h1>
        <div class="container">
  <!-- Content here -->
        </div>
        
    </body>
    <% User user = (User) session.getAttribute("user");
        if (user != null) {
           
    %>

    <form action="SheetByInstrument" method="post">
        Select an instrument:
       <select name="instrument" size="1" required>
             <option value="Guitar" selected>Guitar</option>
             <option value="Piano" >Piano</option>
             <option value="Drums" >Drums</option>
             <option value="Flute" >Flute</option></select>
        <input type="submit" name="send" value="Find sheets">
    </form>

     <br> <a href="menu.jsp">Return to menu</a>
    <br>
    <br>
    <%
        if (request.getAttribute("sheets") != null) {
          List<Sheetmusic> sheets = (List<Sheetmusic>) request.getAttribute("sheets"); 
          if(!sheets.isEmpty()){ %>
	
	<table class="table table-striped">
	  <thead>
	    <tr>
	      <th scope="col">Id</th>
	      <th scope="col">Title</th>
	      <th scope="col">Artist</th>
	      <th scope="col">Instrument</th>
              <th scope="col">Genre</th>
	      <th scope="col">Difficulty</th>
	      <th scope="col">Printed</th>
               <th scope="col">Owner</th>
	    </tr>
	  </thead>
          
	  <tbody>
              <% for(Sheetmusic s: sheets){ %>
	    <tr>
	      <td><%= s.getIdsheetmusic() %></td>
              <td><%= s.getTitle() %></td>
              <td><%= s.getArtist() %></td>
              <td><%= s.getInstrument() %></td>
              <td><%= s.getGenre() %></td>
              <td><%= s.getDifficulty() %></td>
              <td><%= s.getPrinted() %></td>
              <td><%= s.getOwner().getUsername() %></td>
	    </tr>
            <% } %>
	  </tbody>
	</table>
</body>

     <% }else{%>
     <div>  No sheets found for that instrument</div>
     <% } %>

<%
    }
%>



<% } else { %>
<div>You got no authorization. Login first</div>
<a href="index.jsp">Return to home</a>

<% }%>
</html>

