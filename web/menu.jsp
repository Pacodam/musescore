<%-- 
    Document   : menu
    Created on : 05-may-2019, 18:35:34
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
    </head>
    <body>
        <h1>Menu</h1>
    </body>
    
     
        <form action="newSheet.jsp">
            <input type="submit" value="New music sheet">
        </form>
     
        <form action="modifySheet.jsp">
            <input type="submit" value="Sheet modification">
        </form>
     
        <form action="deleteSheet.jsp">
           <input type="submit" value="Remove sheet">
        </form>
     
        <form action="allSheets.jsp">
            <input type="submit" value="View all sheets">
        </form>
      
        <form action="userSheet.jsp">
            <input type="submit" value="View sheets from an user">
        </form>
      
        <form action="instrumentSheet.jsp">
            <input type="submit" value="View sheets by instrument ">
        </form>
       
        <form action="rankingSheet.jsp">
            <input type="submit" value="Sheets ranking (more to less)">
        </form>
       
        <form action="logout.jsp">
            <input type="submit" value="Logout">
        </form>
</html>
