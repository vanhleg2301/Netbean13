<%-- 
    Document   : cart
    Created on : Oct 4, 2022, 8:36:19 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <div class="small-container cart-page">
            <table>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
                <tr>
                    <td>
                        <c:forEach items="${cart.items}" var="c">
                            <div class="d-flex align-items-center mb-5" style="margin: 40px 20px; border: #495057 dotted 1px; display: flex">
                                <div class="flex-shrink-0" style="width: 160px">
                                    <img src="${c.product.image}"
                                         class="img-fluid" style="width: 150px;" alt="Generic placeholder image">
                                </div>

                                <div class="flex-grow-1 ms-3 anh">
                                    <a href="#!" class="float-end text-black"><i class="fas fa-times"></i></a>
                                    <div class="row">
                                        <h5 class=" col-md-6">${c.product.name}</h5>
                                        <a class="col-md-6" style="width: 100px" href="removecart?id=${c.product.id}"><img src="data:image/png;base64,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"></a>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <p class="fw-bold mb-0 me-5 pe-3">Price: ${c.product.price}đ</p>
                                        <div class="def-number-input number-input safari_only">
                                            <form action="processcart" method="post" style="display: flex">
                                                <a style="min-width: 26px" href="processcart?id=${c.product.id}&&quantity=1"><img src="imgProjectPrj/cong.png" alt="alt"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input text="text" name="id" value="${c.product.id}" hidden/>
                                                <input class="quantity fw-bold text-black" name="quantity" value="${c.quantity}"type="text" onchange="this.form.submit()">&nbsp;&nbsp;
                                                <a style="min-width: 26px" href="processcart?id=${c.product.id}&&quantity=-1"><img src="imgProjectPrj/tru.png" alt="alt"/></a><br/>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                    </td>
                    <td><input type="number" value="1"></td>
                    <td>$250.00</td>
                </tr>
            </table>
            <div class="total-price">
                <table>
                    <tr>
                        <td>Subtotal</td>
                        <td>$100.00</td>
                    </tr>
                    <tr>
                        <td>Tax</td>
                        <td>$100.00</td>
                    </tr>
                    <tr>
                        <td>Total</td>
                        <td>$100.00</td>
                    </tr>
                </table>
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
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete category with id" + id)) {
                    window.location = "delete?id=" + id;
                }
            }
        </script>

    </body>

</html>