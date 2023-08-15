<%-- 
   Document   : hom
   Created on : Oct 4, 2022, 1:54:17 PM
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
        <title>MoniterStore | Ecommerce Website</title>
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    </head>

    <body>
        <div class="header">
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
                    <a href="addcart"><img src="images/cart.png" width="30px" height="30px"></a>
                </div>
            </div>
            <div class="row">
                <div class="col-2">
                    <h1>Give Your Work <br> A New Style!</h1>
                    <p>
                        Success isn't always about greatness. It's about consistency.
                        Consistent <br> hard works gains success. Greatness will comes.
                    </p>
                    <a href="product" class="btn">Explore Now &nbsp; &#10146;</a>
                </div>
                <div class="col-2">
                    <img src="images/image1.png" alt="">
                </div>
            </div>
        </div>



        <div class="section">
            <div class="slider">
                <div class="slides">
                    <input type="radio" name="radio-btn" id="radio1">
                    <input type="radio" name="radio-btn" id="radio2">
                    <input type="radio" name="radio-btn" id="radio3">
                    <input type="radio" name="radio-btn" id="radio4">
                    <input type="radio" name="radio-btn" id="radio5">

                    <div class="slide first">
                        <img src="images/category-1.jpg" alt="">
                    </div>
                    <div class="slide">
                        <img src="images/category-2.jpg" alt="">
                    </div>
                    <div class="slide">
                        <img src="images/category-3.jpg" alt="">
                    </div>
                    <div class="slide">
                        <img src="images/category-4.jpg" alt="">
                    </div>
                    <div class="slide">
                        <img src="images/category-5.jpg" alt="">
                    </div>
                </div>
                <div class="navigation-manual">
                    <label for="radio1" class="manual-btn"></label>
                    <label for="radio2" class="manual-btn"></label>
                    <label for="radio3" class="manual-btn"></label>
                    <label for="radio4" class="manual-btn"></label>
                    <label for="radio5" class="manual-btn"></label>
                </div>
            </div>
        </div>
    </div>


    <!-- ------------------------- Feature Products -------------------------------- -->

    <div class="small-container">
        <h2 class="tittle">Feature Products</h2>
        <div class="row">
            <c:forEach items="${requestScope.featureP}" var="c">
                <div class="col-4">
                    <a href="detail?id=${c.id}">
                        <img src="${c.image}" alt="">
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


        <h2 class="tittle">Latest Products</h2>
        <div class="row">
            <c:forEach items="${requestScope.lastestP}" var="c">
                <div class="col-4">
                    <a href="detail?id=${c.id}"><img src="${c.image}" alt=""></a>
                    <a href="detail">
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
        <!-- ------------------------- offer -------------------------------- -->


        <div class="offer">
            <div class="small-container">
                <div class="col-2">
                    <img src="images/exclusive.png" class="offer-img">
                </div>
                <div class="col-2">
                    <p>Exclusively Available on MoniterStore</p>
                    <h1>Canvas QHD Monitors</h1>
                    <small>Canvas monitors bring vibrant and rich detail
                        to your most exciting gaming moments and epic adventures.
                    </small>
                    <a href="product" class="btn">Buy Now &#10146</a>
                </div>
            </div>
        </div>


        <!-- ------------------------- testimonial -------------------------------- -->


        <div class="testimonial">
            <div class="small-container">
                <div class="row">
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>Màn hình dell thì siêu tuyệt vời. Tôi đã dùng 1 chiếc LG22" được 3 năm</p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-alt"></i>
                        </div>
                        <img src="images/user-1.png" alt="">
                        <h3>Sean Paker</h3>
                    </div>
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>Tôi ước tôi có 1 chiếc Asus 32inch ở trên bàn học nhưng mà để chơi game chứ không học :D</p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-alt"></i>
                        </div>
                        <img src="images/user-2.png" alt="">
                        <h3>Sean Paker</h3>
                    </div>
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>Thật tuyệt khi có 1 chiếc LG24inch để học tập và làm việc linh tinh :v</p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-alt"></i>
                        </div>
                        <img src="images/user-3.png" alt="">
                        <h3>Sean Paker</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- ------------------------- brands -------------------------------- -->

<div class="brands">
    <div class="small-container">
        <div class="row">
            <div class="col-5">
                <img src="images/logo-godrej.png" alt="">
            </div>
            <div class="col-5">
                <img src="images/logo-coca-cola.png" alt="">
            </div>
            <div class="col-5">
                <img src="images/logo-oppo.png" alt="">
            </div>
            <div class="col-5">
                <img src="images/logo-paypal.png" alt="">
            </div>
            <div class="col-5">
                <img src="images/logo-philips.png" alt="">
            </div>

        </div>
    </div>
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

<!-- ------ slider ------ -->

<script>
    var counter = 1;
    setInterval(function () {
        document.getElementById('radio' + counter).checked = true;
        counter++;

        if (counter > 5) {
            counter = 1;
        }

    }, 5000);
</script>
</body>

</html>
