<%-- 
    Document   : products
    Created on : Oct 4, 2022, 1:56:03 PM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

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
        <jsp:useBean id="a" class="dal.DAO" scope="request"></jsp:useBean>
            <style>
                .dropbtn {
                    background-color: #4CAF50;
                    color: white;
                    padding: 16px;
                    font-size: 16px;
                    border: none;
                    cursor: pointer;
                    margin-left: 42px;
                }

                .dropdown {
                    position: relative;
                    display: inline-block;
                }

                .dropdown-content {
                    display: none;
                    background-color: #f9f9f9;
                    min-width: 160px;
                    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                    z-index: 1;
                }
                .content-wrapper{
                    position: absolute;
                }

                .dropdown-content a {
                    color: black;
                    padding: 12px 16px;
                    text-decoration: none;
                    display: block;
                }

                .dropdown-content a:hover {
                    background-color: #f1f1f1
                }

                .dropdown:hover .dropdown-content {
                    display: block;
                }

                .dropdown:hover .dropbtn {
                    background-color: #3e8e41;
                }
                .pagination {
                    display: inline-block;
                }

                .pagination a {
                    color: black;
                    float: left;
                    padding: 8px 16px;
                    text-decoration: none;
                    transition: background-color .3s;
                    border: 1px solid #ddd;
                    margin: 0 4px;
                }
                .pagination li{
                    text-decoration: none;
                }

                .pagination a.active {
                    background-color: #4CAF50;
                    color: white;
                    border: 1px solid #4CAF50;
                }

                .pagination a:hover:not(.active) {
                    background-color: #ddd;
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


        <div class="small-container">
            <div class="row row-2">
                <div class="dropdown">
                    <a href="product"><button class="dropbtn">All Products</button></a>
                    <div class="content-wrapper">
                        <c:forEach items="${requestScope.listC}" var="c">
                            <div class="dropdown-content">
                                <a href="category?cid=${c.cid}">${c.cname}</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <form action="name">
                    <label for="name">Enter Product Name:</label><br>
                    <input type="text" name="name" placeholder="Name">
                    <input type="submit" value="Search">
                </form>
                <form action="price">
                    <label for="price">Enter Price:</label> &nbsp; &nbsp; &nbsp; &nbsp;
                    <input type="submit" value="Search"><br>
                    <input type="text" name="from" placeholder="From"></br>
                    <input type="text" name="to" placeholder="To">
                </form>
                <form action="sort" method="post">
                    <input type="submit" value="Sort">
                    <input type="hidden" name="cateID" value="${requestScope.cateID}">
                    <select name="Sort">
                        <option value="">Default Shorting</option>
                        <option value="1">Sort by asc price</option>
                        <option value="2">Sort by desc price</option>
                        <option value="3">Sort by name [ A - Z ]</option>
                        <option value="4">Sort by name [ Z - A ]</option>
                    </select>
                </form>
            </div>

            <div class="row">
                <c:forEach items="${requestScope.listP}" var="c">
                    <div class="col-4">
                        <a href="detail?id=${c.id}">
                            <img src="${c.image}" alt="alt"/>
                        </a>
                        <a href="detail?id=${c.id}">
                            <h4>${c.name}</h4>
                        </a>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-alt"></i>
                        </div>
                        <p>${c.price}$</p>
                    </div>
                </c:forEach>           
            </div>
        </div>

        <div class="clearfix" style="margin: 30px 42%;">
            <ul class="pagination">
                <c:forEach begin="1" end="${a.numberPage}" var="i">
                    <a href="paging?index=${i}">${i}</a>
                </c:forEach>
            </ul>
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
    </body>

</html>
