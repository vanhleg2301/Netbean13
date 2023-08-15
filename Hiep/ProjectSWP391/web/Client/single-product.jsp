<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : single-product
    Created on : May 16, 2023, 10:00:11 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en" style class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers no-applicationcache svg inlinesvg smil svgclippaths"><head>
        <title>Ultras - Clothing Store eCommerce Store HTML Website Template</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <link rel="stylesheet" type="text/css" href="/Client/css/normalize.css">
        <link rel="stylesheet" type="text/css" href="/Client/icomoon/icomoon.css">
        <link rel="stylesheet" type="text/css" media="all" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="/Client/css/vendor.css">
        <link rel="stylesheet" type="text/css" href="/Client/style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
        <!-- script
        ================================================== -->
        <script src="/Client/js/modernizr.js"></script>
    </head>
    <body class="" style=>

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
                                         <img style="width: 60%" src="/images/hightechlogo.png" alt="logo">
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-10 col-md-10">
                                <div class="navbar">

                                    <div id="main-nav" class="stellarnav d-flex justify-content-end right">
                                        <ul class="menu-list">

                                            <li class="menu-item has-sub">
                                            <li><a href="/HomeController" class="item-anchor active">Home</a></li>
                                            </li>
                                            <li>
                                                <a href="/ShopController" class="item-anchor d-flex align-item-center" data-effect="Shop">Shop</a>
                                            </li>

                                            <li class="menu-item has-sub">
                                                <a href="/AboutCustomerController" class="item-anchor d-flex align-item-center" data-effect="About">About</a>
                                            </li>

                                            <li class="menu-item has-sub">
                                                <a href="/ContactCustomerController" class="item-anchor d-flex align-item-center" data-effect="Contact">Contact<span class="text-primary"></span></a>
                                            </li>

                                            <li class="menu-item has-sub">
                                                <a href="/NewsCustomerController" class="item-anchor d-flex align-item-center" data-effect="Blog">News</a>
                                            </li>

                                            <li>
                                                <a href="/CartController">
                                                    <i class="icon icon-shopping-cart"></i>
                                                </a>
                                            </li>


                                            <c:if test="${empty sessionScope.account}">
                                                <li class="menu-item has-sub">
                                                    <a href="/LoginController" class="item-anchor d-flex align-item-center icon icon-user"></i></a>
                                                </li>
                                            </c:if>

                                            <c:if test="${not empty sessionScope.account}">
                                                <li class="menu-item has-sub">
                                                    <a href="HomeController" class="item-anchor d-flex align-item-center icon icon-user"><i class="icon icon-chevron-down"></i></a>
                                                    <ul class="submenu">
                                                        <li><a href="/ProfileController" class="item-anchor">Profile</a></li>
                                                        <li><a href="/ChangesPasswordController" class="item-anchor">Password<span class="text-primary"></span></a></li>
                                                        <li><a href="/OrderCustomerController" class="item-anchor">Order</a></li>
                                                        <li><a href="/OrderWarrantyController" class="item-anchor">Order Warranty</a></li>
                                                        <li><a href="/WarrantyCustomerController" class="item-anchor">Warranty</a></li>
                                                        <li><a href="/LogoutController?logout=1" class="item-anchor">Log out<span class="text-primary"></span></a></li>
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
                                <a href="/HomeController">Home /</a>
                            </span>
                            <span class="item">
                                <a href="/ShopController">Shop /</a>
                            </span>
                            <span class="item">Shop Single</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <form action="/CartController" method="post">
            <input type="hidden" name="service" value="addToCart">

            <c:forEach items="${data}" var="d">

                <input type="hidden" name="id" value="${d.product_id}">

                <section class="single-product padding-large">
                    <div class="container">
                        <div class="row">

                            <div class="col-md-6">
                                <div class="row product-preview">
                                    <div thumbsslider="" class="swiper thumb-swiper col-md-3 col-xs-3 swiper-initialized swiper-horizontal swiper-backface-hidden swiper-thumbs">
                                        <div class="swiper-wrapper d-flex flex-wrap" id="swiper-wrapper-e823aaac75928e0f" aria-live="polite" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
                                            <div class="swiper-slide swiper-slide-visible swiper-slide-active" role="group" aria-label="1 / 3" style="width: 186px; height: 243px;">
                                                <img src="#" alt="">
                                            </div>
                                            <div class="swiper-slide swiper-slide-visible swiper-slide-next" role="group" aria-label="2 / 3" style="width: 186px; height: 243px;">
                                                <img src="#" alt="">
                                            </div>
                                            <div class="swiper-slide swiper-slide-visible swiper-slide-thumb-active" role="group" aria-label="3 / 3" style="width: 186px; height: 243px;">
                                                <img src="#" alt="">
                                            </div>
                                        </div>
                                        <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                                    <div class="swiper large-swiper overflow-hidden col-md-9 col-xs-9 swiper-fade swiper-initialized swiper-horizontal swiper-watch-progress swiper-backface-hidden">
                                        <div class="swiper-wrapper" id="swiper-wrapper-33c3ebe2556c5912" aria-live="polite" style="transition-duration: 0ms;">
                                            <div class="swiper-slide" role="group" aria-label="1 / 3" style="width: 632px; opacity: 1; transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
                                                <img src="/${d.image}" alt="single-product" style="height: 500px;">
                                            </div>
                                            <div class="swiper-slide swiper-slide-prev" role="group" aria-label="2 / 3" style="width: 632px; opacity: 1; transform: translate3d(-632px, 0px, 0px); transition-duration: 0ms;">
                                                <img src="/images/producs/1/1-add-1-large.jpg" alt="single-product" style="height: 500px;">
                                            </div>
                                            <div class="swiper-slide swiper-slide-visible swiper-slide-active" role="group" aria-label="3 / 3" style="width: 632px; opacity: 1; transform: translate3d(-1264px, 0px, 0px); transition-duration: 0ms;">
                                                <img src="/images/producs/1/1-add-2-large.jpg" alt="single-product" style="height: 500px;">
                                            </div>
                                        </div>
                                        <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="product-info">
                                    <div class="element-header">
                                        <h2 itemprop="name" class="product-title">${d.product_name}</h2>
                                    </div>

                                    <c:set var="a" value="${d.discount}" />
                                    <c:set var="b" value="${d.list_price}" />
                                    <c:set var="product" value="${(1-a) * b}" />

                                    <div class="product-price">
                                        <strong class="number">${product}</strong>
                                        <del class="number">${d.list_price}</del>
                                    </div>

                                    <p>${d.sub_description}</p>
                                    <div class="cart-wrap margin-small">

                                        <div class="product-quantity">
                                            <!--                                            <div class="item-title">
                                                                                            <strong># in stock</strong>
                                                                                        </div>-->
                                            <div class="stock-button-wrap">
                                                <div class="product-quantity d-flex align-items-center">
                                                    <h4 class="item-title no-margin">Quantity:</h4>                
                                                    <div class="qty-field d-flex">
                                                        <div class="qty-number d-flex justify-content-start align-items-center">
                                                            <button class="decrement-button" id="down">-</button>
                                                            <input type="text" id="quantity" name="quantity"  class="spin-number-output" value="1" min="1" max="100">
                                                            <button class="increment-button" id="up">+</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="action-buttons">
                                            <button type="submit" name="submit" class="btn btn-medium btn-dark">
                                                Buy now
                                            </button>
                                            <button type="submit" name="submit" id="add-to-cart" class="btn btn-medium btn-dark">
                                                <span id="add-to-cart" >Add to cart</span>
                                            </button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </c:forEach>
        </form>

        <section class="product-tabs">
            <div class="container">
                <div class="row">
                    <div class="tabs-listing">
                        <nav>
                            <div class="nav nav-tabs d-flex justify-content-center" id="nav-tab" role="tablist">
                                <button class="nav-link active" id="nav-review-tab" data-bs-toggle="tab" data-bs-target="#nav-review" type="button" role="tab" aria-controls="nav-review" aria-selected="true">Reviews</button>
                                <button class="nav-link" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="false">Description</button>
                                <button class="nav-link" id="nav-information-tab" data-bs-toggle="tab" data-bs-target="#nav-information" type="button" role="tab" aria-controls="nav-information" aria-selected="false">Shipping</button>
                                <button class="nav-link" id="nav-shipping-tab" data-bs-toggle="tab" data-bs-target="#nav-shipping" type="button" role="tab" aria-controls="nav-shipping" aria-selected="false">Return</button>
                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
                            <c:forEach items="${data}" var="d">
                                <div class="tab-pane fade" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                    <p>Product Description</p>
                                    <p>${d.description}</p>           
                                </div>
                            </c:forEach>
                            <div class="tab-pane fade" id="nav-information" role="tabpanel" aria-labelledby="nav-information-tab">
                                <p>Shipping Policy</p>
                                <p>At our company, we prioritize efficient order processing and prompt delivery to ensure customer satisfaction. Once an order is placed, our dedicated team will begin processing it within 24 hours. We understand the importance of timely delivery, and we strive to deliver your products to your doorstep within 3 days if you are located within the country.</p>
                                <p>For international orders, delivery time may vary due to factors beyond our control, such as customs procedures and the involvement of various stakeholders. We work closely with shipping partners to minimize any potential delays and ensure a smooth shipping experience. However, please note that the exact delivery time for international orders will depend on the specific country and its customs regulations.</p>
                            </div>
                            <div class="tab-pane fade" id="nav-shipping" role="tabpanel" aria-labelledby="nav-shipping-tab">
                                <p>Returns Policy</p>
                                <p>We value the trust our customers place in us, and we want you to be fully satisfied with your purchase. In the rare event that you receive a defective product, we offer a hassle-free return process. Prior to making your purchase, we provide customers with the opportunity to preview the products, ensuring transparency and giving you peace of mind.</p>
                                <p>If you encounter any issues with the quality or functionality of the product, you can initiate a return request within a specified time frame. Our customer support team will guide you through the return process and provide you with a suitable solution, such as a replacement or a refund. We strive to make the return experience as convenient and straightforward as possible, so you can shop with confidence.</p>
                                <p>Please note that certain conditions and exceptions may apply to our return policy, such as specific time limits and the condition of the returned item. We encourage you to review our detailed return policy, which can be found on our website, to familiarize yourself with all the necessary information.</p>
                                <p>We are committed to providing you with exceptional service and ensuring a seamless shipping and return experience. Your satisfaction is our top priority, and we continually strive to meet and exceed your expectations.</p>
                            </div>
                            <div class="tab-pane fade active" id="nav-review" role="tabpanel" aria-labelledby="nav-review-tab">
                                <div class="review-box review-style d-flex flex-wrap justify-content-between">
                                    <c:if test="${empty comment}">
                                        <p>Have no comment</p>
                                    </c:if>
                                    <c:if test="${comment != null}">
                                        <c:forEach var="c" items="${comment}">
                                            <div class="review-item d-flex">
                                                <div style="width: 10%" >
                                                    <img class="image-holder" src="/${c.image}" alt="review">
                                                </div>
                                                <div class="review-content">
                                                    <div class="review-header">
                                                        <fmt:formatDate value="${c.comment_date}" pattern="dd/MM/yyyy" var="formattedDate" />
                                                        <span class="author-name">${c.customer_name}</span>
                                                        <span class="review-date">- ${formattedDate}</span>
                                                    </div>
                                                    <p>${c.comment_content}</p>
                                                </div>
                                            </div>
                                        </c:forEach>  
                                    </c:if>
                                </div>

                                <c:if test="${not empty sessionScope.account}">
                                    <div class="add-review margin-small">
                                        <h3>Add a review</h3>
                                        <form id="form" class="padding-small" method="post" action="/SingleProductController">
                                            <input type="hidden" name="service" value="insertComment">
                                            <input type="hidden" name="product_id" value="${product_id}">
                                            <label>Your Review *</label>
                                            <textarea placeholder="Write your review here" name="comment_content" class="u-full-width"></textarea>
                                            <button type="submit" name="submit" class="btn btn-dark btn-medium">Submit</button>
                                        </form>
                                    </div>
                                </c:if>

                                <c:if test="${empty sessionScope.account}">
                                    <div class="add-review margin-small">
                                        <h3>Login to Review</h3>
                                    </div>
                                </c:if>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="featured-products" class="product-store padding-large">
            <div class="container">
                <div class="section-header d-flex flex-wrap align-items-center justify-content-between">
                    <h3 class="section-title">Related Products</h3>            
                    <div class="btn-wrap">
                        <a href="/ShopController" class="d-flex align-items-center">View all products <i class="icon icon icon-arrow-io"></i></a>
                    </div>            

                    <div class="swiper product-swiper overflow-hidden">
                        <div class="swiper-wrapper">
                            <c:forEach items="${relatepro}" var="d">
                                <div class="swiper-slide">
                                    <div class="product-item">
                                        <div class="image-holder">
                                            <img src="/${d.image}" alt="Books" style="width: 290px; height: 290px;">
                                        </div>
                                        <div class="product-detail">
                                            <h3 class="product-title">
                                                <a href="/SingleProductController/${d.code}">${d.product_name}</a>
                                            </h3>
                                            <span class="item-price text-primary number">${d.list_price}</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
        </section>

        <section id="brand-collection" class="padding-medium bg-light-grey">
            <div class="container">

                <div class="d-flex flex-wrap justify-content-between " style="margin-bottom: 20px;">
                    <img src="/images/brand/apple.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                    <img src="/images/brand/intel.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                    <img src="/images/brand/microsoft.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                    <img src="/images/brand/dell.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                    <img src="/images/brand/asus.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                </div>

                <div class="d-flex flex-wrap justify-content-between">
                    <img src="/images/brand/canon.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                    <img src="/images/brand/hp.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                    <img src="/images/brand/lenovo.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                    <img src="/images/brand/lg.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                    <img src="/images/brand/sony.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
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



        <script>
            const incrementButton = document.getElementById('up');
            const decrementButton = document.getElementById('down');
            const inputField = document.getElementById('quantity');

            incrementButton.addEventListener('click', function (event) {
                event.preventDefault();
                increaseValue();
            });

            decrementButton.addEventListener('click', function (event) {
                event.preventDefault();
                decreaseValue();
            });

            inputField.addEventListener('input', function (event) {
                validateInput();
            });

            function increaseValue() {
                let value = parseInt(inputField.value);
                if (value < 100) {
                    value++;
                    inputField.value = value;
                }
            }

            function decreaseValue() {
                let value = parseInt(inputField.value);
                if (value > 1) {
                    value--;
                    inputField.value = value;
                }
            }

            function validateInput() {
                let value = inputField.value;
                value = value.replace(/[^\d]/g, ''); // Loại bỏ tất cả các ký tự không phải số
                if (value === '') {
                    inputField.value = 1;
                } else {
                    value = parseInt(value);
                    if (isNaN(value) || value < 1 || value > 100) {
                        inputField.value = 1;
                    } else {
                        inputField.value = value;
                    }
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

        <script src="/Client/js/jquery-1.11.0.min.js"></script>
        <script src="/Client/js/plugins.js"></script>
        <script src="/Client/js/script.js"></script>

        <div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button type="button" id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none; max-width: none;"></div></div></body></html>