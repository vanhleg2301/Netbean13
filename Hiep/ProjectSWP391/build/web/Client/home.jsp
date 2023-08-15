<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

        <section id="billboard" class="overflow-hidden">
            <button class="button-prev">
                <i class="icon icon-chevron-left"></i>
            </button>
            <button class="button-next">
                <i class="icon icon-chevron-right"></i>
            </button>
            <div class="swiper main-swiper">
                <div class="swiper-wrapper">
                    <c:forEach var="b" items="${listB}">
                        <c:if test="${b.news_id == 42 || b.news_id == 43}">
                            <div class="swiper-slide" style="background-image: url('${b.image}');background-repeat: no-repeat;background-size: cover;background-position: center;">
                                <div class="banner-content">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h2 class="banner-title">${b.title}</h2>
                                                <p>${b.content}</p>
                                                <div class="btn-wrap">
                                                    <a href="ShopController" class="btn btn-light btn-medium d-flex align-items-center" tabindex="0">Shop it now <i class="icon icon-arrow-io"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>                   
                </div>
            </div>
        </section>

        <section id="featured-products" class="product-store padding-large">
            <div class="container">
                <div class="section-header d-flex flex-wrap align-items-center justify-content-between">
                    <h2 class="section-title">Best Selling Products</h2>            
                    <div class="btn-wrap">
                        <a href="ShopController" class="d-flex align-items-center">View all products <i class="icon icon icon-arrow-io"></i></a>
                    </div>            

                    <div class="swiper product-swiper overflow-hidden">
                        <div class="swiper-wrapper">
                            <c:forEach items="${data}" var="d">
                                <div class="swiper-slide">
                                    <div class="product-item">
                                        <div class="image-holder">
                                            <img src="${d.image}" alt="Books" class="product-image" style="width: 290px; height: 290px;">
                                        </div>
                                        <div class="product-detail">
                                            <h3 class="product-title">
                                                <a href="SingleProductController/${d.code}">${d.product_name}</a>
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

        <section id="latest-collection">
            <div class="container">
                <div class="product-collection row">
                    <c:forEach var="hb" items="${listB}">
                        <c:if test="${hb.news_id == 44}">
                            <div class="col-lg-7 col-md-12 left-content">
                                <div class="collection-item">
                                    <div class="products-thumb">
                                        <img src="${hb.image}" alt="collection item" class="large-image image-rounded">
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 product-entry">
                                        <h3 class="item-title">${hb.title}</h3>
                                        <p>${hb.content}</p>
                                        <div class="btn-wrap">
                                            <a href="ShopController" class="d-flex align-items-center">shop collection <i class="icon icon-arrow-io"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${hb.news_id == 45 || hb.news_id == 46}">
                            <div class="col-lg-5 col-md-12 right-content flex-wrap">
                                <div class="collection-item top-item">
                                    <div class="products-thumb">
                                        <img src="${hb.image}" alt="collection item" class="small-image image-rounded">
                                    </div>
                                    <div class="col-md-6 product-entry">
                                        <h3 class="item-title">${hb.title}</h3>
                                        <div class="btn-wrap">
                                            <a href="ShopController" class="d-flex align-items-center">shop collection <i class="icon icon-arrow-io"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </section>

        <section id="selling-products" class="product-store bg-light-grey padding-large">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">New Products</h2>
                </div>
                <div class="tab-content">
                    <div id="all" data-tab-content class="active">
                        <div class="row d-flex flex-wrap">
                            <c:forEach items="${data1}" var="d">

                                <div class="product-item col-lg-3 col-md-6 col-sm-6">
                                    <div class="image-holder">
                                        <img src="${d.image}" alt="Books" class="product-image" style="width: 290px; height: 290px;">
                                    </div>
                                    <div class="product-detail">
                                        <h3 class="product-title">
                                            <a href="SingleProductController/${d.code}">${d.product_name}</a>
                                        </h3>
                                        <div class="item-price text-primary number">${d.list_price}</div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>         

                </div>
            </div>
        </section>

        <section id="testimonials" class="padding-large no-padding-bottom">
            <div class="container">
                <div class="reviews-content">
                    <div class="row d-flex flex-wrap">
                        <div class="col-md-2">
                            <div class="review-icon">
                                <i class="icon icon-right-quote"></i>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="swiper testimonial-swiper overflow-hidden">
                                <div class="swiper-wrapper">
                                    <c:forEach items="${allquote}" var="q">
                                        <div class="swiper-slide">
                                            <div class="testimonial-detail">
                                                <p>${q.content}</p>
                                                <div class="author-detail">
                                                    <div class="name">${q.author}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="swiper-arrows">
                                <button class="prev-button">
                                    <i class="icon icon-arrow-left"></i>
                                </button>
                                <button class="next-button">
                                    <i class="icon icon-arrow-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="flash-sales" class="product-store padding-large">

            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Flash sales</h2>
                </div>
                <div class="swiper product-swiper flash-sales overflow-hidden">



                    <div class="swiper-wrapper">
                        <c:forEach items="${data2}" var="d">
                            <div class="swiper-slide">
                                <div class="product-item">
                                    <img src="${d.image}" alt="Books" class="product-image" style="width: 290px; height: 290px;">
                                    <div class="discount">${d.discount*100}%</div>
                                    <div class="product-detail">
                                        <h3 class="product-title">
                                            <a href="SingleProductController/${d.code}">${d.product_name}</a>
                                        </h3>
                                        <div class="product-price text-primary">
                                            <p class="item-price number">${(1-d.discount) * d.list_price}</p>
                                            <del class="number">${d.list_price}</del>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="swiper-pagination"></div>

                </div>
            </div>
        </section>

        <section class="shoppify-section-banner">
            <div class="container">
                <c:forEach var="hb" items="${listB}">
                    <c:if test="${hb.news_id == 47}">
                        <div class="product-collection">
                            <div class="left-content collection-item">
                                <div class="products-thumb">
                                    <img src="${hb.image}" alt="collection item" class="large-image image-rounded">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 product-entry">
                                    <h3 class="item-title">${hb.title}</h3>
                                    <p>${hb.content}</p>
                                    <div class="btn-wrap">
                                        <a href="ShopController" class="d-flex align-items-center">shop collection <i class="icon icon-arrow-io"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </section>


        <section id="quotation" class="align-center padding-large">
            <div class="inner-content">
                <c:forEach items="${quote}" var="q">
                    <h2 class="section-title divider">Quote of the day</h2>
                    <blockquote>
                        <q>${q.content}</q>
                        <div class="author-name">- ${q.author} </div>
                    </blockquote>
                </c:forEach>
            </div>
        </section>

        <hr>

        <section id="latest-blog" class="padding-large">
            <div class="container">
                <div class="section-header d-flex flex-wrap align-items-center justify-content-between">
                    <h2 class="section-title">News</h2>
                    <div class="btn-wrap align-right">
                        <a href="NewsCustomerController" class="d-flex align-items-center">Read All Articles <i class="icon icon icon-arrow-io"></i>
                        </a>
                    </div>
                </div>
                <div class="row d-flex flex-wrap">
                    <c:forEach items="${news}" var="n">
                        <article class="col-md-4 post-item">
                            <div class="image-holder zoom-effect">
                                <a href="NewsDetailCustomerController?id=${n.news_id}">
                                    <img src="${n.image}" alt="post" class="post-image">
                                </a>
                            </div>
                            <div class="post-content d-flex">
                                <div class="meta-date">
                                    <div class="meta-day text-primary">${n.day}</div>
                                    <div class="meta-month">${n.month}-${n.year}</div>
                                </div>
                                <div class="post-header">
                                    <h3 class="post-title">
                                        <a href="NewsDetailCustomerController?id=${n.news_id}">${n.title}</a>
                                    </h3>
                                    <a href="NewsCustomerController" class="blog-categories">${n.newsgroup_name}</a>
                                </div>
                            </div>
                        </article>  
                    </c:forEach>
                </div>
            </div>
        </section>

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

        <section id="instagram" class="padding-large">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Follow our instagram</h2>
                </div>
                <p>Our official Instagram account <a href="#">@higtechstore</a> or <a href="#">#higtech_store</a>
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
                                <c:forEach items="${titlefooter}" var="item" varStatus="loop">
                                    <c:if test="${loop.index eq 0}">
                                        <h5 class="widget-title">${item.title}</h5>
                                    </c:if>
                                </c:forEach>
                                <c:forEach var="item" items="${footer1}">
                                    <ul class="menu-list list-unstyled">
                                        <li class="menu-item">
                                            <a href="${item.content}">${item.title}</a>
                                        </li>
                                    </ul>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer-menu">
                                <c:forEach items="${titlefooter}" var="item" varStatus="loop">
                                    <c:if test="${loop.index eq 1}">
                                        <h5 class="widget-title">${item.title}</h5>
                                    </c:if>
                                </c:forEach>
                                <c:forEach var="item" items="${footer2}">
                                    <ul class="menu-list list-unstyled">
                                        <li class="menu-item">
                                            <a href="${item.content}">${item.title}</a>
                                        </li>
                                    </ul>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer-menu">
                                <c:forEach items="${titlefooter}" var="item" varStatus="loop">
                                    <c:if test="${loop.index eq 2}">
                                        <h5 class="widget-title">${item.title}</h5>
                                    </c:if>
                                </c:forEach>
                                <p style="margin-top: 5px; margin-bottom: 5px;">${footer3[0].title}</p> 
                                <a href="mailto:hightech05vn@gmail.com">
                                    <strong style="margin-top: 5px; margin-bottom: 5px; color: #8d8d8d;text-decoration: underline;">
                                        ${footer3[1].content}
                                    </strong></a>
                                <p style="margin-top: 5px; margin-bottom: 5px;">${footer3[2].title}</p>
                                <a href="tel://0968519615">
                                    <strong style="margin-top: 5px; margin-bottom: 5px; color: #8d8d8d">
                                        ${footer3[3].content}
                                    </strong></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer-menu">
                                <c:forEach items="${titlefooter}" var="item" varStatus="loop">
                                    <c:if test="${loop.index eq 3}">
                                        <h5 class="widget-title">${item.title}</h5>
                                    </c:if>
                                </c:forEach>

                                <p>${footer4[0].title}</p>
                                <div class="social-links">
                                    <ul class="d-flex list-unstyled">
                                        <li>
                                            <a href="${footer4[1].content}">
                                                <i class="icon icon-facebook"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${footer4[2].content}">
                                                <i class="icon icon-twitter"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${footer4[3].content}">
                                                <i class="icon icon-youtube-play"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${footer4[4].content}">
                                                <i class="icon icon-behance-square"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
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