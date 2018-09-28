<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if(session.getAttribute("nombre") == null) 
   {
     response.sendRedirect("../index.html");
   }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h1>Usuario:</h1>
        <p>${sessionScope['nombre']}</p>
    </body>
</html>
