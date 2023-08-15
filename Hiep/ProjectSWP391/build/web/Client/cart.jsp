<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : cart
    Created on : May 16, 2023, 9:56:59 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en" style class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers no-applicationcache svg inlinesvg smil svgclippaths">
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
    </head>
    <body class="" style>

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

        <section class="site-banner padding-small bg-light-grey">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="breadcrumbs">
                            <span class="item">
                                <a href="HomeControlle">Home /</a>
                            </span>
                            <span class="item">
                                <a href="ShopController">Shop /</a>
                            </span>
                            <span class="item">Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="shopify-cart padding-large">
            <div>
                <h4 style="text-align: center">${ms}</h4>
            </div>
            <div class="container">
                <div class="cart-table">
                    <div class="cart-header border-bottom ">
                        <div class="row d-flex">
                            <h3 class="cart-title col-lg-4">Product</h3>
                            <h3 class="cart-title col-lg-3">Quantity</h3>
                            <h3 class="cart-title col-lg-4">Subtotal</h3>
                        </div>
                    </div>
                    <form action="CartController" method="post">  
                        <input type="hidden" name="service" value="updateCart">

                        <div class="cart-item border-bottom padding-small">
                            <c:forEach var="c" items="${listCart}" varStatus="status">
                                <div>
                                    <input type="hidden" name="id${status.index}" value="${c.id}">
                                </div>
                                <div class="row"> 
                                    <div class="col-lg-4 col-md-3">
                                        <div class="row cart-info d-flex flex-wrap">
                                            <div class="col-lg-5">
                                                <div class="card-image">
                                                    <img src="${c.image}" alt="cloth" class="img-fluid">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="card-detail">
                                                    <h3 class="card-title">
                                                        <a href="#">${c.name}</a>
                                                    </h3>
                                                    <div class="card-price">
                                                        <span class="money text-primary number">${c.price}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-7">
                                        <div class="row d-flex">
                                            <div class="col-lg-6">
                                                <div class="qty-number d-flex align-items-center justify-content-start">
                                                    <button class="decrement-button" data-index="${status.index}">-</button>
                                                    <input type="text" name="quantity${status.index}" class="spin-number-output" value="${c.quantity}" min="1" max="100">
                                                    <button class="increment-button" data-index="${status.index}">+</button>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="total-price" style="margin-top: 25px">
                                                    <span class="money text-primary number">${c.subtotal}</span>
                                                </div>
                                            </div>   
                                        </div>             
                                    </div>
                                    <div class="col-lg-1 col-md-2">
                                        <div class="cart-remove" style="margin-top: 30px">
                                            <a href="CartController?service=deleteCart&id=${c.id}"><i class="icon icon-close"></i></a>
                                        </div>
                                    </div>
                                </div
                            </c:forEach>
                        </div>
                </div>

                <div class="cart-totals">
                    <h2 class="section-title">Cart Totals</h2>
                    <div class="total-price">
                        <table cellspacing="0" class="table">
                            <tbody>
                                <tr class="subtotal">
                                    <th>Subtotal</th>
                                    <td data-title="Subtotal">
                                        <span class="price-amount amount text-primary">
                                            <bdi>
                                                <span class="price-currency-symbol number">${totalprice}</span>
                                            </bdi>
                                        </span>
                                    </td>
                                </tr>
                                <tr class="order-total">
                                    <th>Total</th>
                                    <td data-title="Total">
                                        <span class="price-amount amount text-primary">
                                            <bdi>
                                                <span class="price-currency-symbol number">${totalprice}</span></bdi>
                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="button-wrap">
                        <button type="submit" name="submit" class="btn btn-dark btn-medium">Update Cart</button>
                        </form>    
                        <a href="ShopController"><button class="btn btn-dark btn-medium">Continue Shopping</button></a>
                        <c:if test="${not empty sessionScope.account}">
                            <a href="CheckoutController"><button class="btn btn-dark btn-medium">Proceed to checkout</button></a>
                        </c:if>
                        <c:if test="${empty sessionScope.account}">
                            <a href="CheckoutGuestController"><button class="btn btn-dark btn-medium">Proceed to checkout</button></a>
                        </c:if>
                    </div>
                </div>
            </div>
        </section>


        <section id="subscribe" class="bg-light-grey padding-large">
            <div class="container">
                <div class="row">
                    <div class="block-text col-md-6">
                        <div class="section-header">
                            <h2 class="section-title">Get 25% off Discount Coupons</h2>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictumst amet, metus, sit massa posuere maecenas. At tellus ut nunc amet vel egestas.</p>
                    </div>
                    <div class="subscribe-content col-md-6">
                        <form id="form" class="d-flex justify-content-between">
                            <input type="text" name="email" placeholder="Enter your email addresss here">
                            <button class="btn btn-dark">Subscribe Now</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <section id="shipping-information">
            <hr>
            <div class="container">
                <div class="row d-flex flex-wrap align-items-center justify-content-between">
                    <div class="col-md-3 col-sm-6">
                        <div class="icon-box">
                            <i class="icon icon-truck"></i>
                            <h4 class="block-title">
                                <strong>Free shipping</strong> Over $200
                            </h4>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="icon-box">
                            <i class="icon icon-return"></i>
                            <h4 class="block-title">
                                <strong>Money back</strong> Return within 7 days
                            </h4>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="icon-box">
                            <i class="icon icon-tags1"></i>
                            <h4 class="block-title">
                                <strong>Buy 4 get 5th</strong> 50% off
                            </h4>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="icon-box">
                            <i class="icon icon-help_outline"></i>
                            <h4 class="block-title">
                                <strong>Any questions?</strong> experts are ready
                            </h4>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </section>

        <footer id="footer">
            <div class="container">
                <div class="footer-menu-list">
                    <div class="row d-flex flex-wrap justify-content-between">
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer-menu">
                                
                                <c:forEach var="footer" items="${footerTitle}">
                                    <c:if test="${footer.id eq 1}">
                                        <h5 class="widget-title">${footer.title_name}</h5>
                                    </c:if>
                                </c:forEach>
                                <c:forEach var="ultra" items="${ultras}">
                                    <ul class="menu-list list-unstyled">
                                        <li class="menu-item">
                                            <a href="${ultra.url}">${ultra.urlTitle}</a>
                                        </li>
                                    </ul>  
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer-menu">
                                <c:forEach var="footer" items="${footerTitle}">
                                    <c:if test="${footer.id eq 2}">
                                        <h5 class="widget-title">${footer.title_name}</h5>
                                    </c:if>
                                </c:forEach>
                                <c:forEach var="service" items="${customerServices}">
                                    <ul class="menu-list list-unstyled">
                                        <li class="menu-item">
                                            <a href="${service.url}">${service.urlTitle}</a>
                                        </li>
                                    </ul>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer-menu">
                                <c:forEach var="footer" items="${footerTitle}">
                                    <c:if test="${footer.id eq 3}">
                                        <h5 class="widget-title">${footer.title_name}</h5>
                                    </c:if>
                                </c:forEach>
                                <c:forEach var="contact" items="${contacts}">
                                    <p>${contact.mailContent}</p> <a href="#" class="email">${contact.contactMail}</a>
                                    <p>${contact.phoneContent}. <br>
                                        <strong>${contact.contactPhone}</strong>
                                    </p>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer-menu">
                                <c:forEach var="footer" items="${footerTitle}">
                                    <c:if test="${footer.id eq 4}">
                                        <h5 class="widget-title">${footer.title_name}</h5>
                                    </c:if>
                                </c:forEach>
                                <c:forEach var="love" items="${foreverLove}">
                                    <p>${love.feedbackContent}</p>
                                    <div class="social-links">
                                        <ul class="d-flex list-unstyled">
                                            <li>
                                                <a href="${love.facebookUrl}">
                                                    <i class="icon icon-facebook"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${love.twitterUrl}">
                                                    <i class="icon icon-twitter"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${love.youtubeUrl}">
                                                    <i class="icon icon-youtube-play"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${love.behanceUrl}">
                                                    <i class="icon icon-behance-square"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer> 

        <script src="Client/js/jquery-1.11.0.min.js"></script>
        <script src="Client/js/plugins.js"></script>
        <script src="Client/js/script.js"></script>
        <script>
            const decrementButtons = document.getElementsByClassName('decrement-button');
            const incrementButtons = document.getElementsByClassName('increment-button');

            for (let i = 0; i < decrementButtons.length; i++) {
                decrementButtons[i].addEventListener('click', function (event) {
                    event.preventDefault();
                    const parent = this.closest('.row');
                    const inputField = parent.querySelector('.spin-number-output');
                    decreaseValue(inputField);
                });
            }

            for (let i = 0; i < incrementButtons.length; i++) {
                incrementButtons[i].addEventListener('click', function (event) {
                    event.preventDefault();
                    const parent = this.closest('.row');
                    const inputField = parent.querySelector('.spin-number-output');
                    increaseValue(inputField);
                });
            }


            const inputFields = document.getElementsByClassName('spin-number-output');

            for (let i = 0; i < inputFields.length; i++) {

                const inputField = inputFields[i];

                inputField.addEventListener('input', function (event) {
                    let value = this.value;
                    value = value.replace(/[^\d]/g, ''); // Loại bỏ tất cả các ký tự không phải số

                    if (value === '' || value < 1 || value > 100) {
                        this.value = 1;
                    } else {
                        this.value = value;
                    }
                });
            }


            function increaseValue(inputField) {
                let value = parseInt(inputField.value);
                if (value < 100) {
                    value++;
                    inputField.value = value;
                }
            }

            function decreaseValue(inputField) {
                let value = parseInt(inputField.value);
                if (value > 1) {
                    value--;
                    inputField.value = value;
                }
            }

            const numberElements = document.getElementsByClassName('number');
            for (let i = 0; i < numberElements.length; i++) {
                const numberElement = numberElements[i];
                const number = parseFloat(numberElement.innerText);
                const formattedNumber = formatCurrency(number);
                numberElement.innerText = formattedNumber;
            }

            function formatCurrency(value) {
                const intValue = parseInt(value);
                const formattedValue = intValue.toLocaleString('vi-VN', {
                    style: 'currency',
                    currency: 'VND',
                });
                return formattedValue;
            }
        </script>

        <div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button type="button" id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none; max-width: none;"></div></div></body></html>
