<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : list
    Created on : Jul 16, 2022, 8:17:01 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Added books by ${sessionScope['acc'].getDisplayname()}<br>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Added Date</th>
                    <th>is Online</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="b" items="${blist}">
                    <tr>
                        <td>${b.id}</td>
                        <td>${b.name}</td>
                        <td>${b.addedDate}</td>
                        <td>${b.isOnline?"Yes":"No"}</td>
                    </tr>
                </c:forEach>


            </tbody>
        </table>

    </body>
</html>
