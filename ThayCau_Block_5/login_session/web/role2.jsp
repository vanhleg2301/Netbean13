<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Notice about accessing the page </title>
    </head>
    <body>
        <h3> Notice about accessing the page: </h3>
        <%User x = (User) request.getSession().getAttribute("currUser");%>
        <%if(x==null || x.getRole()>2){%>
        <h2> Only user with role 1 or 2 can access this page! </h2>
        <% return;} 
        else {%>
        <h3> Hello an user with role 1 or role 2 </h3>
        <%} %>
    </body>
</html>
