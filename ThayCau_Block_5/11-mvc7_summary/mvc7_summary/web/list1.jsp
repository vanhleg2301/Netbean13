<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Student" %>
<%@page import = "java.util.*" %>
<!DOCTYPE html>
<%
  List<Student> lst = (List<Student>) request.getAttribute("lst");
%>    
<html>
  <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>List of students</title>
  </head>
  <body>
    <h2> List of students </h2>
    <table border="1">
      <tr>
        <td> Rollno </td>
        <td> Name </td>
        <td> Mark </td>
      </tr>
      <%
        for(Student x: lst) {
      %>
      <tr>
        <td><%= x.getRollno() %> </td>
        <td><%= x.getName() %> </td>
        <td><%= x.getMark() %> </td>
      </tr>  
      <% } %>  
    </table>     
    <p><button onclick='window.history.go(-1);'>Back to previous page</button>
    <p><a href="index.html">Back to homepage</a>
  </body>
</html>
