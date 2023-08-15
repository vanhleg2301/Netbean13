<%-- 
    Document   : profile
    Created on : Oct 23, 2022, 9:57:43 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>All Products - MoniterStore</title>
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <style>
            body{
                font-family: Montserrat, sans-serif;
                background: #28223f;
            }
            .profile-info{
                user-select: none;
                margin: 30px auto;
                background: #231e39;
                color: #b3b8cd;
                border-radius: 5px;
                width: 350px;
                text-align: center;
                box-shadow: 0 10px 20px -10px rgba(0,0,0,.75);
            }
            .cover-photo{
                background: url(https://images.unsplash.com/photo-1540228232483-1b64a7024923?ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80);
                height: 160px;
                width: 100%;
                border-radius: 5px 5px 0 0;
            }
            .profile{
                height: 120px;
                width: 120px;
                border-radius: 50%;
                margin: 93px 0 0 -175px;
                border: 1px solid #1f1a32;
                padding: 7px;
                background: #292343;
            }
            .profile-name{
                font-size: 25px;
                font-weight: bold;
                margin: 27px 0 0 120px;
            }
            .about{
                margin-top: 35px;
                line-height: 21px;
            }
            button{
                margin: 10px 0 40px 0;
            }
            .msg-btn, .follow-btn{
                background: #03bfbc;
                border: 1px solid #03bfbc;
                padding: 10px 25px;
                color: #231e39;
                border-radius: 3px;
                font-family: Montserrat, sans-serif;
                cursor: pointer;
            }
            .follow-btn{
                margin-left: 10px;
                background: transparent;
                color: #02899c;
            }
            .follow-btn:hover{
                color: #231e39;
                background: #03bfbc;
                transition: .5s;
            }
            .profile-info i{
                padding-left: 20px;
                font-size: 20px;
                margin-bottom: 20px;
                cursor: pointer;
                transition: .5s;
            }
            .profile-info i:hover{
                color: #03bfbc;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <a href="index.html"><img src="images/logo-white.png" width="125px"></a>
                </div>
                <nav>
                    <ul class="menuItems">
                        <li><a href="home">Home</a></li>
                        <li><a href="product">Products</a></li>
                            <c:if test="${sessionScope.role == null}">
                            <li><a href="contact.jsp">Contact</a></li>
                            </c:if>
                            <c:if test="${sessionScope.account == null}">
                            <li class="active">
                                <a href="login">Login
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li><a href="register">Register</a></li>
                            </c:if>
                            <c:if test="${sessionScope.account != null}">
                            <li class="active">
                                <a href="profile">Profile
                                    <span class="sr-only">(current)</span>
                                </a>
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

        <div class="profile-info">
            <c:forEach items="${requestScope.listU}" var="c">
                <div class="cover-photo">
                    <img src="https://images.unsplash.com/photo-1565464027194-7957a2295fb7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80" class="profile">
                </div>
                <div class="profile-name">${c.fullname}</div>
                <p class="about">User Interface Designer and<br>front-end developer</p>
                <a href="contact.jsp"><button class="msg-btn">Message</button></a>
                <button class="follow-btn">Following</button>
                <div>
                    <i class="fab fa-facebook-f"></i>
                    <i class="fab fa-instagram"></i>
                    <i class="fab fa-youtube"></i>
                    <i class="fab fa-twitter"></i>
                </div>
            </c:forEach>
        </div>


        <!--         ------------------------- footer -------------------------------- -->

        <div class="footer">
            <div class="small-container">
                <div class="row">
                    <div class="footer-col-1">
                        <h3>Download Our App</h3>
                        <p>Download App For Android And IOS Mobile Phone</p>
                    </div>
                    <div class="footer-col-2">
                        <img src="images/logo-white.png" alt="">
                        <p>Our Purposes Is Sustainably Make The Pleasure And
                            Benefits Of Technology Accessible To The Many.</p>
                    </div>
                    <div class="footer-col-3">
                        <h3>Usefull Links</h3>
                        <ul>
                            <li>Coupons</li>
                            <li>Blog Post</li>
                            <li>Return Policy</li>
                            <li>Join Affiliate</li>
                        </ul>
                    </div>
                    <div class="footer-col-4">
                        <h3>Follow Us</h3>
                        <ul>
                            <li>FaceBook</li>
                            <li>Twitter</li>
                            <li>Instagram</li>
                            <li>Youtube</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- ------------- js for toggle menu -------------- -->
        <script>
            var menuItems = document.getElementById("menuItems");
            menuItems.style.maxHeight = "0px";
            function menutoggle() {
                if (menuItems.style.maxHeight === "0px") {
                    {
                        menuItems.style.maxHeight = "200px";
                    }
                } else {
                    menuItems.style.maxHeight = "0px";
                }
            }
        </script>
    </body>
</html>
