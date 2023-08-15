<%-- 
    Document   : shopping
    Created on : Aug 14, 2023, 10:37:36 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping page</title>
    </head>
    <body>
        <h1>Welcome to Thinh's shop</h1>

        <form action="MainController">
            <input type="submit" value="get all" name="action" />
            <input type="submit" value="view cart" name="action" />
        </form>

        <c:if test="${not empty requestScope.LIST}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Add</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.LIST}" var="p" varStatus="count">
                    <form action="MainController">
                        <tr>
                            <td>${count.count}</td>
                            <td>${p.productID}</td> 
                            <td>${p.productName}</td>
                            <td>${p.description}</td>
                            <td>${p.price}</td>
                            <td>
                                <input type="hidden" name="productID" value="${p.productID}" />
                                <input type="hidden" name="productName" value="${p.productName}" />
                                <input type="hidden" name="description" value="${p.description}" />
                                <input type="hidden" name="price" value="${p.price}" />
                                <input type="hidden" name="status" value="${p.status}" />
                                <input type="submit" value="Add" name="action" /> 
                            </td>

                        </tr>
                    </form>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
        ${requestScope.MESSAGE}
</body>
</html>
