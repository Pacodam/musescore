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
        <title>Sheets user</title>
    </head>

    <body class="container">
      
  
    <% User user = (User) session.getAttribute("user");
        if (user != null) {
            List<Sheetmusic> sheets = (List<Sheetmusic>) request.getAttribute("sheets");
            
    %>
    <h1>Sheets list</h1>

    
       <% if(!sheets.isEmpty()){ %>
	
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
     <div>  No sheets found </div>
     <% } %>

<% } else { %>
<div>You got no authorization. Login</div>
<a href="index.jsp">Return to menu</a>

<% }%>
  </body>
</html>

