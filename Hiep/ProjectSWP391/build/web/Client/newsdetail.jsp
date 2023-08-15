<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : single-post
    Created on : May 16, 2023, 9:59:43 AM
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


        <section class="site-banner padding-small bg-light-grey">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="breadcrumbs">
                            <span class="item">
                                <a href="HomeController">Home /</a>
                            </span>
                            <span class="item">
                                <a href="NewsCustomerController">News /</a>
                            </span>
                            <span class="item">Single Post</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="main-content d-flex flex-wrap padding-large">
            <div class="container">
                <c:forEach var="n" items="${news}">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="post-meta">
                                <span class="post-date">${n.day} ${n.month}, ${n.year}</span> / <a href="NewsCustomerController" class="blog-categories">${n.newsgroup_name}</a>
                            </div>
                            <h1 class="page-title">${n.title}</h1>
                            <div class="feature-image">
                                <img src="${n.image}" alt="post image" class="jarallax-img">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="post-content">
                                <p><strong>${n.title}:</strong></p>
                                <p>${n.content}</p>
                                <div class="post-tags">
                                    <div class="block-tag">
                                        <ul class="list-unstyled d-flex">
                                            <li>
                                                <a href="#" class="btn btn-dark btn-small btn-rounded">Fashion</a>
                                            </li>
                                            <li>
                                                <a href="#" class="btn btn-dark btn-small btn-rounded">Hoodie</a>
                                            </li>
                                            <li>
                                                <a href="#" class="btn btn-dark btn-small btn-rounded">Casual</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="social-links d-flex margin-small">
                                    <div class="element-title">Share:</div>
                                    <ul class="d-flex list-unstyled">
                                        <li>
                                            <a href="#"><i class="icon icon-facebook"></i></a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="icon icon-twitter"></i></a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="icon icon-instagram"></i></a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="icon icon-youtube-play"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>


        <section id="flash-sales" class="product-store padding-large">
            <div class="container">
                <div class="section-header d-flex flex-wrap align-items-center justify-content-between">
                    <h3 class="section-title">Related News</h3>
                    <div class="btn-wrap align-right">
                        <a href="NewsCustomerController" class="d-flex align-items-center">Read All Articles <i class="icon icon icon-arrow-io"></i>
                        </a>
                    </div>
                </div>
                <div class="swiper product-swiper overflow-hidden">
                    <div class="swiper-wrapper section-header align-items-center justify">
                        <c:forEach items="${relatednews}" var="r">
                            <div class="swiper-slide  post-item product-item">
                                    <div class="image-holder zoom-effect">
                                        <a href="NewsDetailCustomerController?id=${r.news_id}">
                                            <img src="${r.image}" alt="post" class="post-image">
                                        </a>
                                    </div>
                                    <div class="post-content d-flex">
                                        <div class="meta-date" style="margin-right: 20px; margin-top: 23px">
                                            <div class="meta-day text-primary">${r.day}</div>
                                            <div class="meta-month">${r.month} ${r.year}</div>
                                        </div>
                                        <div class="post-header">
                                            <h4 class="post-title">
                                                <a href="NewsDetailCustomerController?id=${r.news_id}">${r.title}</a>
                                            </h4>
                                            <a href="NewsCustomerController" class="blog-categories">${r.newsgroup_name}</a>
                                        </div>
                                    </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
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
    </body>
</html>
