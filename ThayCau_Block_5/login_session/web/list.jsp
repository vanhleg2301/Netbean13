<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<!DOCTYPE html>
<%
  UserDAO u = new UserDAO(); 
  List<User> lst = u.getUsers();
%>    
<html>
  <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>List of users</title>
  </head>
  <body>
    <h2> List of users </h2>
    <table border="1">
      <tr>
        <td> Name </td>
        <td> Pass </td>
        <td> Role </td>
      </tr>
      <%
        for(User x: lst) {
      %>
      <tr>
        <td><%= x.getName() %> </td>
        <td><%= x.getPass() %> </td>
        <td><%= x.getRole() %> </td>
      </tr>  
      <% } %>  
    </table>     
    <p><button onclick='window.history.go(-1);'>Back to previous page</button>
    <p><a href="index.html">Back to homepage</a>
  </body>
</html>
