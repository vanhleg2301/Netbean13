<%-- 
    Document   : product-details
    Created on : Oct 4, 2022, 5:41:39 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!-- -------------- single product details ----------------- -->

        <div class="small-container single-product">
            <div class="row">
                <div class="col-2">
                    <img src="${listD.image}" width="100%" id="productImg">
                    <div class="small-img-row">
                        <div class="small-img-col">
                            <img src="images/product-1.jpg" width="100%" class="small-img">
                        </div>
                        <div class="small-img-col">
                            <img src="images/Dell P2722H 27Inch IPS-2.jpg" width="100%" class="small-img">
                        </div>
                        <div class="small-img-col">
                            <img src="images/Dell P2722H 27Inch IPS-3.jpg" width="100%" class="small-img">
                        </div>
                        <div class="small-img-col">
                            <img src="images/Dell P2722H 27Inch IPS-4.jpg" width="100%" class="small-img">
                        </div>
                    </div>
                </div>

                <div class="col-2">
                    <a href="home"><p>Home / Moniter</p></a>
                    <h1 class="productName">${listD.name}</h1>
                    <h4>Price: ${listD.price}$</h4>
                    <br>
                    Quantity: <input type="number" value="1">
                    <a href="shop" class="btn">Add to Cart</a>
                    <div class="product-details">
                        <h3>Product details <i class="fa fa-indent"></i></h3>
                        <br>
                        <p>${listD.description}</p>
                    </div>
                </div>

            </div>
        </div>

        <h2 style="text-align: center">Related Products</h2>
        <div class="row">
            <c:forEach items="${requestScope.listP}" var="c">
                <div class="col-4">
                    <a href="detail?id=${c.id}"><img src="${c.image}" alt=""></a>
                    <a href="detail?id=${c.id}"><h4>${c.name}</h4></a>
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




        <!-- ------------------------- footer -------------------------------- -->

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

        <!-- ------------- js for product Dell 27he38z Moniter -------------- -->

        <script>
            var productImg = docment.getElementById("productImg");
            var smallImg = document.getElementsByClassName("small-img");
            console.log(smallImg);
        </script>

    </body>

</html>
