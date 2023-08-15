<%-- 
    Document   : viewCart
    Created on : Aug 14, 2023, 9:48:11 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
    </head>
    <body>
        <h1>Your Shopping cart</h1>

        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${sessionScope.CART.getCart().values()}" var="p" varStatus="count">
                <form action="MainController">
                    <c:set var="total" value="${total + (p.quantity * p.price)}"/>
                    <tr>
                        <td>${count.count}</td>
                        <td>${p.productID}</td>
                        <td>${p.productName}</td>
                        <td>${p.description}</td>
                        <td>${p.price}</td>
                        <td>${p.quantity}</td>
                        <td>${p.quantity * p.price}</td>
                        <td>
                            <input type="hidden" name="productID" value="${p.productID}" />
                            <input type="submit" value="Remove" name="action" /> 
                        </td>
                    </tr>
                </form>
            </c:forEach>

        </tbody>
    </table>
    <h1>Total: ${total} triệu</h1><br>
    <a href="shopping.jsp">Add more</a>
</body>
</html>
