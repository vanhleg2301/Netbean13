<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 
    Document   : home
    Created on : May 16, 2023, 9:58:20 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Ultras - Clothing Store eCommerce Store HTML Website Template</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <link rel="stylesheet" type="text/css" href="Client/css/normalize.css">
        <link rel="stylesheet" type="text/css" href="Client/icomoon/icomoon.css">
        <link rel="stylesheet" type="text/css" media="all" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="Client/css/vendor.css">
        <link rel="stylesheet" type="text/css" href="Client/style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <!-- script
        ================================================== -->
        <script src="Client/js/modernizr.js"></script>

        <style>
            .orderstatus {
                margin-bottom:  20px;
                display: flex;
                justify-content: space-evenly;
                margin-top:   20px;
            }
        </style>

    </head>
    <body>
        <div class="preloader-wrapper">
            <div class="preloader">
            </div>
        </div>

        <header id="header">
            <div id="header-wrap">
                <nav class="primary-nav padding-small">
                    <div class="container">
                        <div class="row d-flex align-items-center">
                            <div class="col-lg-2 col-md-2">
                                <div class="main-logo">
                                    <a href="HomeController">
                                        <img style="width: 60%" src="images/hightechlogo.png" alt="logo">
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-10 col-md-10">
                                <div class="navbar">

                                    <div id="main-nav" class="stellarnav d-flex justify-content-end right">
                                        <ul class="menu-list">

                                            <li class="menu-item has-sub">
                                            <li><a href="HomeController" class="item-anchor active">Home</a></li>
                                            </li>
                                            <li>
                                                <a href="ShopController" class="item-anchor d-flex align-item-center" data-effect="Shop">Shop</a>
                                            </li>

                                            <li class="menu-item has-sub">
                                                <a href="AboutCustomerController" class="item-anchor d-flex align-item-center" data-effect="About">About</a>
                                            </li>

                                            <li class="menu-item has-sub">
                                                <a href="ContactCustomerController" class="item-anchor d-flex align-item-center" data-effect="Contact">Contact<span class="text-primary"></span></a>
                                            </li>

                                            <li class="menu-item has-sub">
                                                <a href="NewsCustomerController" class="item-anchor d-flex align-item-center" data-effect="Blog">News</a>
                                            </li>

                                            <li>
                                                <a href="CartController">
                                                    <i class="icon icon-shopping-cart"></i>
                                                </a>
                                            </li>


                                            <c:if test="${empty sessionScope.account}">
                                                <li class="menu-item has-sub">
                                                    <a href="LoginController" class="item-anchor d-flex align-item-center icon icon-user"></i></a>
                                                </li>
                                            </c:if>

                                            <c:if test="${not empty sessionScope.account}">
                                                <li class="menu-item has-sub">
                                                    <a href="HomeController" class="item-anchor d-flex align-item-center icon icon-user"><i class="icon icon-chevron-down"></i></a>
                                                    <ul class="submenu">
                                                        <li><a href="ProfileController" class="item-anchor">Profile</a></li>
                                                        <li><a href="ChangesPasswordController" class="item-anchor">Password<span class="text-primary"></span></a></li>
                                                        <li><a href="OrderCustomerController" class="item-anchor">Order</a></li>
                                                        <li><a href="OrderWarrantyController" class="item-anchor">Order Warranty</a></li>
                                                        <li><a href="WarrantyCustomerController" class="item-anchor">Warranty</a></li>
                                                        <li><a href="LogoutController?logout=1" class="item-anchor">Log out<span class="text-primary"></span></a></li>
                                                    </ul>
                                                </li>
                                            </c:if>                                                      

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </header>

        <div class="col-lg-12 col-md-12">
            <div>
                <div style="text-align: center">
                    <h1 class="">Add Warranty</h1>
                </div>
            </div>
            <div>
                <table style="width: 100%">
                    <thead>
                        <tr>
                            <th>Product Name</th>
                            <th>Image</th>
                            <th>Quantity Order</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${data}" var="d">
                            <tr>
                                <td>${d.product_name}</td> 
                                <td style="width: 40%"><img src="${d.image}" alt="alt" style="width: 60%"/></td>
                                <td>${d.quantity_order}</td> 
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!--                input -->
            <div>
                <div style="text-align: center">
                    <h3 class="">Information of Warranty</h3>
                </div>
            </div>
            <div>
                <form class="forms-sample" method="post" action="OrderWarrantyController" id="yourFormId">
                    <input type="hidden" name="service" value="insertWarranty">
                    <table style="width: 100%">
                        <thead>
                            <tr>
                                <th>Upload Image Product</th>
                                <th>Status Product</th>
                                <th>Quantity Warranty</th>
                                <th>Submit</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${data}" var="d">

                            <input type="hidden" name="customer_id" value="${d.customer_id}">   
                            <input type="hidden" name="name" id="name" value="${d.name}">
                            <input type="hidden" name="phone" id="phone" value="${d.phone}">

                            <input type="hidden" name="product_id" id="product_id" value="${d.product_id}">
                            <input type="hidden" name="product_name" id="product_name" value="${d.product_name}">
                            <input type="hidden" name="image" value="${d.image}">

                            <input type="hidden" name="orderdetail_id" value="${d.orderdetail_id}">
                            <input type="hidden" name="order_date" value="${d.order_date}">

                            <input type="hidden" name="status" value="Wait">
                            <tr>
                                <td style="width: 30%">
                                    <img width="90%" id="preview-img" src="" alt=""> <br>
                                    <input type="file" onchange="previewImage()" accept="image/*" name="image_product"/>
                                </td> 

                                <td>
                                    <input type="text" name="product_status" id="product_status">
                                </td> 

                                <td>
                                    <input type="text" name="quantity" id="quantity" required="" >
                                </td> 

                                <td>
                                    <input type="submit" name="submit">
                                </td> 
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>

        <script src="Client/js/jquery-1.11.0.min.js"></script>
        <script src="Client/js/plugins.js"></script>
        <script src="Client/js/script.js"></script>
        <script>
                                        function previewImage() {
                                            var preview = document.querySelector('#preview-img');
                                            var file = document.querySelector('input[type=file]').files[0];
                                            var reader = new FileReader();

                                            reader.onloadend = function () {
                                                preview.src = reader.result;
                                            };

                                            if (file) {
                                                reader.readAsDataURL(file);
                                            } else {
                                                preview.src = "";
                                            }
                                        }
        </script>
        <script>
            <c:forEach items="${data}" var="d">
            const inputField = document.getElementById('quantity');

            inputField.addEventListener('input', function (event) {
                validateInput();
            });

            function validateInput() {
                let value = inputField.value;
                value = value.replace(/[^\d]/g, ''); // Loại bỏ tất cả các ký tự không phải số
                if (value === '') {
                    inputField.value = 1;
                } else {
                    value = parseInt(value);
                    if (isNaN(value) || value < 1 || value > ${d.quantity_order}) {
                        inputField.value = 1;
                    } else {
                        inputField.value = value;
                    }
                }
            }
            </c:forEach>
        </script>
    </body>
</html>