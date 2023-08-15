<%-- 
    Document   : contact
    Created on : Oct 23, 2022, 9:47:59 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Contact</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href=".//CSS/contact.css"/>
    </head>
    <body>
        <div class="navbarMenu">
            <div class="navbar">
                <div class="logo">
                    <a href="index.html"><img src="images/logo-white.png" width="125px"></a>
                </div>
                <nav>
                    <ul class="menuItems">
                        <li><a href="home">Home</a></li>
                        <li><a href="product">Products</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                            <c:if test="${sessionScope.account == null}">
                            <li class="active">
                                <a href="login">Login
                                    <span class="sr-only"></span>
                                </a>
                            </li>
                            <li><a href="register">Register</a></li>
                            </c:if>
                            <c:if test="${sessionScope.account != null}">
                            <li class="active">
                                <a href="profile">Profile</a>
                            </li>
                            <li><a href="logout" style="text-decoration: underline">Logout(${account.userID})</a></li>
                            <li><a href="change">ChangePassword</a></li>
                            </c:if>
                            <c:if test="${sessionScope.role != null}">
                            <li><a href="manager">Manager</a></li>
                            </c:if>
                    </ul>
                </nav>
                <a href="cart.jsp"><img src="images/cart.png" width="30px" height="30px"></a>
            </div>
        </div>
        <div class="container">
            <form action="https://formspree.io/f/mnqrbkry" method="POST">
                <h3>GET IN TOUCH</h3>
                <input type="text" name="name" placeholder="Your Name" required="">
                <input type="email" name="email" placeholder="Email" required="">
                <input type="text" name="phone" placeholder="Phone Number" required="">

                <textarea name="message" rows="4" placeholder="How can we help you?"></textarea>
                <button type="submit">SEND</button>
            </form>
        </div>
        
    </body>
</html>
