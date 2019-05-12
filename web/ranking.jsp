<%-- 
    Document   : modifySheet
    Created on : 06-may-2019, 22:48:04
    Author     : MSI
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Sheetmusic"%>
<%@page import="entities.User"%>
<%@page import="entities.SheetRanking"%>
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
            List<SheetRanking> ranking = (List<SheetRanking>) request.getAttribute("ranking");
            
    %>
    <h1>Ranking</h1>

      
       <% if(!ranking.isEmpty()){ %>
	
	<table class="table table-striped">
	  <thead>
	    <tr>
	      <th scope="col">Username</th>
              <th scope="col">Total sheets</th>
	    </tr>
	  </thead>
          
	  <tbody>
              <% for(SheetRanking s: ranking){ %>
	    <tr>
                <td><%= s.getOwner()%></td>
              <td><%= s.getNumber()%></td>
	    </tr>
            <% } %>
	  </tbody>
	</table>
</body>

     <% }else{%>
     <div>  No sheets found </div>
     <% } %>
     
     <br> <a href="menu.jsp">Return to menu</a>

<% } else { %>
<div>You got no authorization. Login first</div>
<a href="index.jsp">Return to home</a>

<% }%>
  </body>
</html>


