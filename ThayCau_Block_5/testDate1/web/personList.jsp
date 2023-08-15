<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<!DOCTYPE html>
<%
  PersonDAO u = new PersonDAO();
  List<Person> lst = u.getPersonList();
  //request.setAttribute("lst", lst);
  //If you use JSTL, the above statement is necessary
%>  
<html>
  <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>List of workers</title>
     <style type="text/css">
        a {text-decoration:none;} 
     </style>
  </head>
  <body>
    <h2> List of workers </h2>
    <table border="1">
      <tr>
        <td> Id </td>
        <td> Name </td>
        <td> Dob </td>
        <td>  </td>
      </tr>
       <% for(Person x : lst) { %>
       <tr>
         <td><%= x.getId() %></td>
         <td><%= x.getName() %></td>
         <td> <%= x.getDob() %></td>
        <td> <a href="deletePerson?id=<%= x.getId() %>"> Delete  </td>  
        </tr>
        <%}%>
    </table>     
    <p><button onclick='window.history.go(-1);'>Back to previous page</button>
    <p><a href="index.html">Back to homepage</a>
  </body>
</html>
