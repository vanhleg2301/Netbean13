<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : contact
    Created on : May 16, 2023, 9:57:53 AM
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


        <section class="site-banner jarallax padding-large" style="background: url(images/about/teamworking.jpg) no-repeat; background-position: top;">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-title">Contact us</h1>
                        <div class="breadcrumbs">
                            <span class="item">
                                <a href="HomeController">Home /</a>
                            </span>
                            <span class="item">Contact us</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="contact-information padding-large">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="section-header">
                            <h2 class="section-title">${contact[0].title}</h2>
                        </div>
                        <div class="contact-detail">
                            <div class="detail-list">
                                <p>${contact[0].content}</p>
                                <ul class="list-unstyled list-icon">
                                    <li>
                                        <a href="tel://0968519615"><i class="icon icon-phone"></i>${contact[1].title}</a>
                                    </li>
                                    <li>
                                        <a href="mailto:hightech05vn@gmail.com"><i class="icon icon-mail"></i>${contact[2].title}</a>
                                    </li>
                                    <li>
                                        <a href="https://www.google.com/maps/place/Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+H%E1%BB%8Dc+FPT/@21.01325,105.5258466,19z/data=!3m1!4b1!4m6!3m5!1s0x31345b465a4e65fb:0xaae6040cfabe8fe!8m2!3d21.01325!4d105.5270643!16s%2Fm%2F02rsytm?hl=vi-VN&entry=ttu"><i class="icon icon-map-pin"></i>${contact[3].title}</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="social-links">
                                <h3>Social Links</h3>
                                <ul class="d-flex list-unstyled">
                                    <li><a href="https://www.facebook.com/hightechstore05vn" class="icon icon-facebook"></a></li>
                                    <li><a href="https://twitter.com/" class="icon icon-twitter"></a></li>
                                    <li><a href="https://www.instagram.com/" class="icon icon-instagram"></a></li>
                                    <li><a href="https://www.youtube.com/" class="icon icon-youtube-play"></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="contact-information">
                            <div class="section-header">
                                <h2 class="section-title">Send us a message</h2>
                            </div>
                            <c:if test="${empty sessionScope.account}">
                                <form name="contactform" action="ContactCustomerController" method="post" class="contact-form">
                                    <input type="hidden"  name="service"  value="addContact" >
                                    <div class="form-item">
                                        <input type="text" minlength="2" name="name" placeholder="Name" class="u-full-width bg-light" required>
                                        <input type="text" name="email" placeholder="E-mail" class="u-full-width bg-light" required>
                                        <h4>${ms}</h4>
                                        <textarea class="u-full-width bg-light" name="message" placeholder="Message" style="height: 180px;" required></textarea>
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-dark btn-full btn-medium">Submit</button>
                                </form>
                            </c:if>    
                            <c:if test="${not empty sessionScope.account}">
                                    <form name="contactform" action="ContactCustomerController" method="post" class="contact-form">
                                        <input type="hidden"  name="service"  value="addContact" >
                                        <div class="form-item">
                                            <input type="hidden" minlength="2" name="name" value="${data.name}" placeholder="Name" class="u-full-width bg-light" required>
                                            <input type="hidden" name="email" placeholder="E-mail" value="${data.gmail}" class="u-full-width bg-light" required>
                                            <h4>${ms}</h4>
                                            <textarea class="u-full-width bg-light" name="message" placeholder="Message" style="height: 180px;" required></textarea>
                                        </div>
                                        <button type="submit" name="submit" class="btn btn-dark btn-full btn-medium">Submit</button>
                                    </form>
                            </c:if>    
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="google-map">
            <div class="mapouter">
                <div class="gmap_canvas">
                    <iframe width="100%" height="500" id="gmap_canvas" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.3117922776863!2d105.52230051441888!3d21.01319088600025!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abae2885b045%3A0xf19308b125f71f0d!2sFPT%20University!5e0!3m2!1sen!2sca!4v1621787501330!5m2!1sen!2sca" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                    <a href="https://getasearch.com/fmovies"></a>
                    <br>
                    <style>
                        .mapouter {
                            position: relative;
                            text-align: right;
                            height: 500px;
                            width: 100%;
                        }
                    </style>
                    <a href="https://www.embedgooglemap.net">embedgooglemap.net</a>
                    <style>
                        .gmap_canvas {
                            overflow: hidden;
                            background: none !important;
                            height: 500px;
                            width: 100%;
                        }
                    </style>
                </div>
            </div>
        </section>


        <section id="instagram" class="padding-large">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Follow our instagram</h2>
                </div>
                <p>Our official Instagram account <a href="#">@ultras</a> or <a href="#">#ultras_clothing</a>
                </p>
                <div class="row d-flex flex-wrap justify-content-between">
                    <div class="col-lg-2 col-md-4 col-sm-6">
                        <figure class="zoom-effect">
                            <img src="images/avatar/carol.svg" alt="instagram" class="insta-image">
                            <i class="icon icon-instagram"></i>
                        </figure>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6">
                        <figure class="zoom-effect">
                            <img src="images/avatar/george.svg" alt="instagram" class="insta-image">
                            <i class="icon icon-instagram"></i>
                        </figure>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6">
                        <figure class="zoom-effect">
                            <img src="images/avatar/martin.svg" alt="instagram" class="insta-image">
                            <i class="icon icon-instagram"></i>
                        </figure>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6">
                        <figure class="zoom-effect">
                            <img src="images/avatar/nicole.svg" alt="instagram" class="insta-image">
                            <i class="icon icon-instagram"></i>
                        </figure>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6">
                        <figure class="zoom-effect">
                            <img src="images/avatar/patricia.svg" alt="instagram" class="insta-image">
                            <i class="icon icon-instagram"></i>
                        </figure>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6">
                        <figure class="zoom-effect">
                            <img src="images/avatar/thomas.svg" alt="instagram" class="insta-image">
                            <i class="icon icon-instagram"></i>
                        </figure>
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
    </body>
</html>
