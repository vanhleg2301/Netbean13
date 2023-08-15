<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : shop
    Created on : May 16, 2023, 9:59:24 AM
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


        <section class="site-banner jarallax min-height300 padding-large" style="background: url(images/banner/macbook.jpg) no-repeat; background-position: top;">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-title">Shop page</h1>
                        <div class="breadcrumbs">
                            <span class="item">
                                <a href="index.html">Home /</a>
                            </span>
                            <span class="item">Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="shopify-grid padding-large">
            <div class="container">
                <div class="row">

                    <section id="selling-products" class="col-md-9 product-store">
                        <div class="container">
                            <ul class="tabs list-unstyled">
                                <li data-tab-target="#all" class="active tab">
                                    <a href="ShopController">All</a>
                                </li>
                                <c:forEach var="c" items="${listC}">
                                    <li data-tab-target="#all" class="tab">
                                        <a href="ShopController?service=displayProductbyCategory&id=${c.category_id}">${c.category_name}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                            <div class="tab-content">
                                <div id="all" data-tab-content class="active">
                                    <div class="row d-flex flex-wrap">
                                        <c:forEach var="d" items="${data}">
                                            <div class="product-item col-lg-4 col-md-6 col-sm-6">
                                                <div class="image-holder">
                                                    <img src="${d.image}" alt="Books" class="product-image" style="width: 290px; height: 290px;">
                                                </div>
                                                <div class="product-detail">
                                                    <h4 class="product-title">
                                                        <a href="SingleProductController/${d.code}">${d.product_name}</a>
                                                    </h4>
                                                    <div class="item-price text-primary number">${d.list_price}</div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <div>
                                        <nav class="navigation paging-navigation text-center padding-medium" role="navigation">
                                            <div class="pagination loop-pagination d-flex justify-content-center">
                                                <c:choose>
                                                    <c:when test="${currentPage > 1}">
                                                        <c:if test="${id == null && name == null && priceRange == null}">
                                                            <a href="?page=${currentPage - 1}" class="pagination-arrow d-flex align-items-center">
                                                                <i class="icon icon-arrow-left"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${id != null && sv.equals('displayProductbyCategory')}">
                                                            <a href="?service=displayProductbyCategory&id=${id}&page=${currentPage - 1}" class="pagination-arrow d-flex align-items-center">
                                                                <i class="icon icon-arrow-left"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${id != null && sv.equals('displayProductbyBrand')}">
                                                            <a href="?service=displayProductbyBrand&id=${id}&page=${currentPage - 1}" class="pagination-arrow d-flex align-items-center">
                                                                <i class="icon icon-arrow-left"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${name != null && sv.equals('displayProductbyName')}">
                                                            <a href="?service=displayProductbyName&name=${name}&page=${currentPage - 1}" class="pagination-arrow d-flex align-items-center">
                                                                <i class="icon icon-arrow-left"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${priceRange != null && sv.equals('displayProductByPrice')}">
                                                            <a href="?service=displayProductByPrice&priceRange=${priceRange}&page=${currentPage - 1}" class="pagination-arrow d-flex align-items-center">
                                                                <i class="icon icon-arrow-left"></i>
                                                            </a>
                                                        </c:if>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="#" class="pagination-arrow d-flex align-items-center">
                                                            <i class="icon icon-arrow-left"></i>
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>

                                                <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                    <c:choose>
                                                        <c:when test="${loop.index == currentPage}">
                                                            <span aria-current="page" class="page-numbers current">${loop.index}</span>
                                                        </c:when>

                                                        <c:otherwise>
                                                            <c:if test="${id != null && sv.equals('displayProductbyCategory')}">
                                                                <a href="?service=displayProductbyCategory&id=${id}&page=${loop.index}" class="page-numbers">${loop.index}</a>
                                                            </c:if>
                                                            <c:if test="${id != null && sv.equals('displayProductbyBrand')}">
                                                                <a href="?service=displayProductbyBrand&id=${id}&page=${loop.index}" class="page-numbers">${loop.index}</a>
                                                            </c:if>
                                                            <c:if test="${name != null && sv.equals('displayProductbyName')}">
                                                                <a href="?service=displayProductbyName&name=${name}&page=${loop.index}" class="page-numbers">${loop.index}</a>
                                                            </c:if>
                                                            <c:if test="${priceRange != null && sv.equals('displayProductByPrice')}">
                                                                <a href="?service=displayProductByPrice&priceRange=${priceRange}&page=${loop.index}" class="page-numbers">${loop.index}</a>
                                                            </c:if>
                                                            <c:if test="${id == null && name == null && priceRange == null}">
                                                                <a href="?page=${loop.index}" class="page-numbers">${loop.index}</a>
                                                            </c:if>  
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>

                                                <c:choose>
                                                    <c:when test="${currentPage < totalPages}">
                                                        <c:if test="${id == null && name == null && priceRange == null}">
                                                            <a href="ShopController?page=${currentPage + 1}" class="pagination-arrow d-flex align-items-center">
                                                                <i class="icon icon-arrow-right"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${priceRange != null && sv.equals('displayProductByPrice')}">
                                                            <a href="ShopController?service=displayProductByPrice&priceRange=${priceRange}&page=${currentPage + 1}" class="pagination-arrow d-flex align-items-center">
                                                                <i class="icon icon-arrow-right"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${name != null && sv.equals('displayProductbyName')}">
                                                            <a href="ShopController?service=displayProductbyName&name=${name}&page=${currentPage + 1}" class="pagination-arrow d-flex align-items-center">
                                                                <i class="icon icon-arrow-right"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${id != null && sv.equals('displayProductbyBrand')}">
                                                            <a href="ShopController?service=displayProductbyBrand&id=${id}&page=${currentPage + 1}" class="pagination-arrow d-flex align-items-center">
                                                                <i class="icon icon-arrow-right"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${id != null && sv.equals('displayProductbyCategory')}">
                                                            <a href="ShopController?service=displayProductbyCategory&id=${id}&page=${currentPage + 1}" class="pagination-arrow d-flex align-items-center">
                                                                <i class="icon icon-arrow-right"></i>
                                                            </a>
                                                        </c:if>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="#" class="pagination-arrow d-flex align-items-center">
                                                            <i class="icon icon-arrow-right"></i>
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </nav>
                                    </div>

                                    </section>
                                    <aside class="col-md-3">
                                        <div class="sidebar">
                                            <div class="widgets widget-menu">
                                                <div class="widget-search-bar">
                                                    <form action="ShopController" method="get" class="d-flex">
                                                        <input type="hidden" name="service" value="displayProductbyName">
                                                        <input type="text" name="name" required>
                                                        <button class="btn btn-dark"><i class="icon icon-search"></i></button>
                                                    </form>
                                                </div> 
                                            </div>

                                            <div class="widgets widget-product-brands">
                                                <h5 class="widget-title">Brands</h5>
                                                <ul class="product-tags sidebar-list list-unstyled">
                                                    <c:forEach var="b" items="${listB}">
                                                        <li class="tags-item">
                                                            <a href="ShopController?service=displayProductbyBrand&id=${b.brand_id}">${b.brand_name}</a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                            <div class="widgets widget-price-filter">
                                                <h5 class="widget-title">Filter By Price</h5>
                                                <ul class="product-tags sidebar-list list-unstyled">
                                                    <form method="GET" action="ShopController">
                                                        <input type="hidden" name="service" value="displayProductByPrice">
                                                        <c:if test="${priceRange == null}">
                                                            <input type="radio" id="option1" name="priceRange" value="0-500" checked>
                                                            <label for="option1">From 0 to 5.000.000đ</label><br>

                                                            <input type="radio" id="option2" name="priceRange" value="500-1000" >
                                                            <label for="option2">From 5.000.000đ  to 10.000.000đ </label><br>

                                                            <input type="radio" id="option3" name="priceRange" value="1000-2000">
                                                            <label for="option3">From 10.000.000đ  to 20.000.000đ </label><br>

                                                            <input type="radio" id="option4" name="priceRange" value="2000-">
                                                            <label for="option4">Greater than 20.000.000đ</label><br>
                                                        </c:if>
                                                        <c:if test="${priceRange eq '0-500'}">
                                                            <input type="radio" id="option1" name="priceRange" value="0-500" checked>
                                                            <label for="option1">From 0 to 5.000.000đ</label><br>

                                                            <input type="radio" id="option2" name="priceRange" value="500-1000" >
                                                            <label for="option2">From 5.000.000đ  to 10.000.000đ </label><br>

                                                            <input type="radio" id="option3" name="priceRange" value="1000-2000">
                                                            <label for="option3">From 10.000.000đ  to 20.000.000đ </label><br>

                                                            <input type="radio" id="option4" name="priceRange" value="2000-">
                                                            <label for="option4">Greater than 20.000.000đ</label><br>
                                                        </c:if>
                                                        <c:if test="${priceRange eq '500-1000'}">
                                                            <input type="radio" id="option1" name="priceRange" value="0-500">
                                                            <label for="option1">From 0 to 5.000.000đ</label><br>

                                                            <input type="radio" id="option2" name="priceRange" value="500-1000" checked>
                                                            <label for="option2">From 5.000.000đ  to 10.000.000đ </label><br>

                                                            <input type="radio" id="option3" name="priceRange" value="1000-2000">
                                                            <label for="option3">From 10.000.000đ  to 20.000.000đ </label><br>

                                                            <input type="radio" id="option4" name="priceRange" value="2000-">
                                                            <label for="option4">Greater than 20.000.000đ</label><br>
                                                        </c:if>
                                                        <c:if test="${priceRange eq '1000-2000'}">
                                                            <input type="radio" id="option1" name="priceRange" value="0-500">
                                                            <label for="option1">From 0 to 5.000.000đ</label><br>

                                                            <input type="radio" id="option2" name="priceRange" value="500-1000" >
                                                            <label for="option2">From 5.000.000đ  to 10.000.000đ </label><br>

                                                            <input type="radio" id="option3" name="priceRange" value="1000-2000" checked>
                                                            <label for="option3">From 10.000.000đ  to 20.000.000đ </label><br>

                                                            <input type="radio" id="option4" name="priceRange" value="2000-">
                                                            <label for="option4">Greater than 20.000.000đ</label><br>
                                                        </c:if>
                                                        <c:if test="${priceRange eq '2000-'}">
                                                            <input type="radio" id="option1" name="priceRange" value="0-500">
                                                            <label for="option1">From 0 to 5.000.000đ</label><br>

                                                            <input type="radio" id="option2" name="priceRange" value="500-1000" >
                                                            <label for="option2">From 5.000.000đ  to 10.000.000đ </label><br>

                                                            <input type="radio" id="option3" name="priceRange" value="1000-2000">
                                                            <label for="option3">From 10.000.000đ  to 20.000.000đ </label><br>

                                                            <input type="radio" id="option4" name="priceRange" value="2000-" checked>
                                                            <label for="option4">Greater than 20.000.000đ</label><br>
                                                        </c:if>

                                                        <button type="submit">Search</button>
                                                    </form>
                                                </ul>
                                            </div>
                                        </div>
                                    </aside>

                                </div>        
                            </div>      
                        </div>
                        <hr>
                        <section id="brand-collection" class="padding-medium bg-light-grey">
                            <div class="container">

                                <div class="d-flex flex-wrap justify-content-between " style="margin-bottom: 20px;">
                                    <img src="images/brand/apple.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                                    <img src="images/brand/intel.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                                    <img src="images/brand/microsoft.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                                    <img src="images/brand/dell.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                                    <img src="images/brand/asus.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                                </div>

                                <div class="d-flex flex-wrap justify-content-between">
                                    <img src="images/brand/canon.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                                    <img src="images/brand/hp.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                                    <img src="images/brand/lenovo.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                                    <img src="images/brand/lg.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
                                    <img src="images/brand/sony.svg" alt="phone" class="brand-image" style="width: 100px; height: 50px;">
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


                        </body>
                        </html>
