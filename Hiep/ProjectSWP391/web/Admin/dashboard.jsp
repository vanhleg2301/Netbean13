<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Star Admin2 </title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="Admin/vendors/feather/feather.css">
        <link rel="stylesheet" href="Admin/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="Admin/vendors/ti-icons/css/themify-icons.css">
        <link rel="stylesheet" href="Admin/vendors/typicons/typicons.css">
        <link rel="stylesheet" href="Admin/vendors/simple-line-icons/css/simple-line-icons.css">
        <link rel="stylesheet" href="Admin/vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="Admin/css/vertical-layout-light/style.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="Admin/images/favicon.png" />
        <style>
            a {
                all: unset;
                cursor: pointer;
            }
        </style>
    </head>

    <body>
        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
                    <div class="me-3">
                        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">
                            <span class="icon-menu"></span>
                        </button>
                    </div>
                    <div>
                        <a class="navbar-brand brand-logo" href="DashboardController">
                            <img src="images/logo.svg" alt="logo" />
                        </a>
                        <a class="navbar-brand brand-logo-mini" href="#">
                            <img src="images/logo.svg" alt="logo" />
                        </a>
                    </div>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-top"> 
                    <ul class="navbar-nav ms-auto">

                        <li class="nav-item dropdown d-none d-lg-block">
                            <a class="nav-link dropdown-bordered dropdown-toggle dropdown-toggle-split" id="messageDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false"> Select Category </a>
                        </li>

                        <li class="nav-item d-none d-lg-block">
                            <div id="datepicker-popup" class="input-group date datepicker navbar-date-picker">
                                <span class="input-group-addon input-group-prepend border-right">
                                    <span class="icon-calendar input-group-text calendar-icon"></span>
                                </span>
                                <input type="text" class="form-control">
                            </div>
                        </li>

                        <li class="nav-item">
                            <form class="search-form" action="#">
                                <i class="icon-search"></i>
                                <input type="search" class="form-control" placeholder="Search Here" title="Search here">
                            </form>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link count-indicator" id="notificationDropdown" href="#" data-bs-toggle="dropdown">
                                <i class="icon-mail icon-lg"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0" aria-labelledby="notificationDropdown">
                            </div>
                        </li>

                        <li class="nav-item dropdown"> 
                            <a class="nav-link count-indicator" id="countDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="icon-bell"></i>
                                <span class="count"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0" aria-labelledby="countDropdown">
                            </div>
                        </li>

                        <li class="nav-item dropdown d-none d-lg-block user-dropdown">
                            <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="mdi mdi-account-circle"></i> </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                                <a href="ProfileAdminController" class="dropdown-item"><i class="dropdown-item-icon mdi mdi-account-outline text-primary me-2"></i> My Profile </span></a>
                                <a href="ChangesPasswordAdminController" class="dropdown-item"><i class="dropdown-item-icon mdi mdi-account-key text-primary me-2"></i> Change Password</a>
                                <a href="LogoutController?logout=2" class="dropdown-item"><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>Sign Out</a>
                            </div>
                        </li>

                    </ul>

                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-bs-toggle="offcanvas">
                        <span class="mdi mdi-menu"></span>
                    </button>
                </div>
            </nav>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <!-- partial:partials/_settings-panel.html -->
                <div class="theme-setting-wrapper">
                    <div id="settings-trigger"><i class="ti-settings"></i></div>
                    <div id="theme-settings" class="settings-panel">
                        <i class="settings-close ti-close"></i>
                        <p class="settings-heading">SIDEBAR SKINS</p>
                        <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border me-3"></div>Light</div>
                        <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border me-3"></div>Dark</div>
                        <p class="settings-heading mt-2">HEADER SKINS</p>
                        <div class="color-tiles mx-0 px-4">
                            <div class="tiles success"></div>
                            <div class="tiles warning"></div>
                            <div class="tiles danger"></div>
                            <div class="tiles info"></div>
                            <div class="tiles dark"></div>
                            <div class="tiles default"></div>
                        </div>
                    </div>
                </div>

                <!-- partial -->
                <!-- partial:partials/_sidebar.html -->
                <nav class="sidebar sidebar-offcanvas" id="sidebar">
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link" href="DashboardController">
                                <i class="mdi mdi-grid-large menu-icon"></i>
                                <span class="menu-title">Dashboard</span>
                            </a>
                        </li>
                        <li class="nav-item nav-category">TABLES</li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
                                <i class="menu-icon mdi mdi-table"></i>
                                <span class="menu-title">Account Manager</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="tables">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="AdminController">Admin</a></li>
                                    <li class="nav-item"> <a class="nav-link" href="CustomerController">Customer</a></li>
                                </ul>
                            </div>
                        </li>   

                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
                                <i class="menu-icon mdi mdi-table"></i>
                                <span class="menu-title">Product Manager</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="tables">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="ProductController">Product</a></li>
                                    <li class="nav-item"> <a class="nav-link" href="BrandController">Brand</a></li>
                                    <li class="nav-item"> <a class="nav-link" href="CategoryController">Category</a></li>

                                </ul>
                            </div>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
                                <i class="menu-icon mdi mdi-table"></i>
                                <span class="menu-title">Order Manager</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="tables">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="OrderController">Order</a></li>
                                    <li class="nav-item"> <a class="nav-link" href="OrderDetailController">Order detail</a></li>
                                </ul>
                            </div>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
                                <i class="menu-icon mdi mdi-table"></i>
                                <span class="menu-title">Warranty Manager</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="tables">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="WarrantyController">Warranty</a></li>
                                </ul>
                            </div>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
                                <i class="menu-icon mdi mdi-table"></i>
                                <span class="menu-title">News Manager</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="tables">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="NewsController">News</a></li>
                                    <li class="nav-item"> <a class="nav-link" href="NewsGroupController">News Group</a></li>
                                </ul>
                            </div>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
                                <i class="menu-icon mdi mdi-table"></i>
                                <span class="menu-title">Contact Manager</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="tables">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="ContactController">Contact</a></li>
                                    <li class="nav-item"> <a class="nav-link" href="CommentController">Comment</a></li>
                                </ul>
                            </div>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
                                <i class="menu-icon mdi mdi-table"></i>
                                <span class="menu-title">Client Manager</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="tables">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="BannerController">Banner</a></li>
                                </ul>
                            </div>
                            <div class="collapse" id="tables">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="AboutUsController">About Us</a></li>
                                    <li class="nav-item"> <a class="nav-link" href="QuoteController">Quote</a></li>
                                </ul>
                            </div>
                            <div class="collapse" id="tables">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="FooterTitleController">Footer Title</a></li>
                                    <li class="nav-item"> <a class="nav-link" href="FooterContentController">Footer Content</a></li>
                                </ul>
                            </div>
                            <div class="collapse" id="tables">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="ContactInfoController">Contact Information</a></li>
                                </ul>
                            </div>
                        </li>

                        <li class="nav-item nav-category">Forms and Datas</li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
                                <i class="menu-icon mdi mdi-chart-line"></i>
                                <span class="menu-title">Charts</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="charts">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="ChartController">Chart</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </nav>
                <!-- partial -->
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="home-tab">
                                    <div class="d-sm-flex align-items-center justify-content-between border-bottom">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active ps-0" id="home-tab" data-bs-toggle="tab" href="#overview" role="tab" aria-controls="overview" aria-selected="true">Overview</a>
                                            </li>
                                        </ul>
                                        <div>
                                            <div class="btn-wrapper">
                                                <a href="#" class="btn btn-otline-dark align-items-center"><i class="icon-share"></i> Share</a>
                                                <a href="#" class="btn btn-otline-dark"><i class="icon-printer"></i> Print</a>
                                                <a href="#" class="btn btn-primary text-white me-0"><i class="icon-download"></i> Export</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-content tab-content-basic">
                                        <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview"> 
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="statistics-details d-flex align-items-center justify-content-between">
                                                        <div>
                                                            <h4>Total Order</h4>
                                                            <h3 class="rate-percentage badge badge-opacity-info">${totalorder}</h3>
                                                        </div>
                                                        <div>
                                                            <h4 class="">Total Product Sold</h4>
                                                            <h3 class="rate-percentage badge badge-opacity-warning">${totalproductsold}</h3>
                                                        </div>
                                                        <div>
                                                            <h4 class="">Total Income</h4>
                                                            <h3 class="rate-percentage badge badge badge-danger number text-danger">${totalincome}</h3>
                                                        </div>
                                                        <div class="d-none d-md-block">
                                                            <h4 class="">Total Product</h4>
                                                            <h3 class="rate-percentage badge badge-opacity-danger">${totalproduct}</h3>

                                                        </div>
                                                        <div class="d-none d-md-block">
                                                            <h4 class="">Total Customer</h4>
                                                            <h3 class="rate-percentage badge badge-opacity-success">${totalcustomer}</h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> 
                                            <div class="row">
                                                <div class="col-lg-8 d-flex flex-column">
                                                    <div class="row flex-grow">
                                                        <div class="col-12 grid-margin stretch-card">
                                                            <div class="card card-rounded">
                                                                <div class="card-body">
                                                                    <div class="d-sm-flex justify-content-between align-items-start">
                                                                        <div>
                                                                            <h4 class="card-title card-title-dash">Market Overview</h4>
                                                                            <p class="card-subtitle card-subtitle-dash">Summary of total money for year</p>
                                                                        </div>
                                                                        <div>
                                                                            <div class="dropdown">
                                                                                <button class="btn btn-secondary dropdown-toggle toggle-dark btn-lg mb-0 me-0" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> This Year: ${year} </button>
                                                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                                                                                    <h6 class="dropdown-header">Year</h6>
                                                                                    <a class="dropdown-item" href="DashboardController?service=searchTotalMoneyYear&year=${year-1}">${year-1}</a>
                                                                                    <a class="dropdown-item" href="DashboardController?service=searchTotalMoneyYear&year=${year-2}">${year-2}</a>
                                                                                    <a class="dropdown-item" href="DashboardController?service=searchTotalMoneyYear&year=${year-3}">${year-3}</a>
                                                                                    <a class="dropdown-item" href="DashboardController?service=searchTotalMoneyYear&year=${year-4}">${year-4}</a>
                                                                                    <a class="dropdown-item" href="DashboardController?service=searchTotalMoneyYear&year=${year-5}">${year-5}</a>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="d-sm-flex align-items-center mt-1 justify-content-between">
                                                                        <div class="d-sm-flex align-items-center mt-4 justify-content-between"><h2 class="me-2 fw-bold number text-info">${totalincomeyear}</h2></div>
                                                                        <div class="me-3"><div id="marketing-overview-legend"></div></div>
                                                                    </div>
                                                                    <div class="chartjs-bar-wrapper mt-3">
                                                                        <canvas id="marketingOverview"></canvas>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-6 col-lg-6 grid-margin stretch-card">
                                                            <div class="row flex-grow">
                                                                <div class="col-12 grid-margin stretch-card">
                                                                    <div class="card card-rounded">
                                                                        <div class="card-body">
                                                                            <div class="row">
                                                                                <div class="col-lg-12">
                                                                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                                                                        <h4 class="card-title card-title-dash">Top Category</h4>
                                                                                    </div>
                                                                                    <canvas class="my-auto" id="doughnutChart" height="200"></canvas>
                                                                                    <div id="doughnut-chart-legend" class="mt-5 text-center"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6 col-lg-6 grid-margin stretch-card">
                                                            <div class="card card-rounded">
                                                                <div class="card-body">
                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                                                <div>
                                                                                    <h4 class="card-title card-title-dash">Top Loyal Customers</h4>
                                                                                </div>
                                                                            </div>
                                                                            <div class="mt-3">
                                                                                <c:forEach var="d" items="${data}">
                                                                                    <div class="wrapper d-flex align-items-center justify-content-between py-2 border-bottom">
                                                                                        <div class="d-flex">
                                                                                            <c:if test="${d.image == null}">
                                                                                                <img class="img-sm rounded-10" src="images/avatar/thomas.svg" alt="profile">
                                                                                            </c:if>
                                                                                            <c:if test="${d.image != null}">
                                                                                                <img class="img-sm rounded-10" src="${d.image}" alt="profile">
                                                                                            </c:if>
                                                                                            <div class="wrapper ms-3">
                                                                                                <p class="ms-1 mb-1 fw-bold">${d.name}</p>
                                                                                                <small class="text-muted mb-0 number">${d.total_price}</small>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="text-muted text-small">
                                                                                            Id: ${d.customer_id}
                                                                                        </div>
                                                                                    </div>
                                                                                </c:forEach>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-4 d-flex flex-column">
                                                    <div class="row">
                                                        <div class="col-12 grid-margin stretch-card">
                                                            <div class="card card-rounded">
                                                                <div class="card-body">
                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <div class="d-flex justify-content-between align-items-center">
                                                                                <h4 class="card-title card-title-dash">Order Status</h4>
                                                                                <div class="add-items d-flex mb-0">
                                                                                    <!-- <input type="text" class="form-control todo-list-input" placeholder="What do you need to do today?"> -->
                                                                                    <button class="add btn btn-icons btn-rounded btn-primary todo-list-add-btn text-white me-0 pl-12p"><i class="mdi mdi-plus"></i></button>
                                                                                </div>
                                                                            </div>
                                                                            <div class="list-wrapper">
                                                                                <ul class="todo-list todo-list-rounded">
                                                                                    <li class="d-block">
                                                                                        <div class="form-check w-100">
                                                                                            <label class="form-check-label">
                                                                                                <input class="checkbox" type="checkbox"> Total of Wait: ${wait} <i class="input-helper rounded"></i>
                                                                                            </label>
                                                                                            <div class="d-flex mt-2">
                                                                                                <div class="ps-4 text-small me-3">Click to view</div>
                                                                                                <div class="badge badge-opacity-info me-3">Wait</div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </li>
                                                                                    <li class="d-block">
                                                                                        <div class="form-check w-100">
                                                                                            <label class="form-check-label">
                                                                                                <input class="checkbox" type="checkbox"> Total of Process: ${process} <i class="input-helper rounded"></i>
                                                                                            </label>
                                                                                            <div class="d-flex mt-2">
                                                                                                <div class="ps-4 text-small me-3">Click to view</div>
                                                                                                <div class="badge badge-opacity-warning me-3">Process</div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </li>
                                                                                    <li>
                                                                                        <div class="form-check w-100">
                                                                                            <label class="form-check-label">
                                                                                                <input class="checkbox" type="checkbox"> Total of Done: ${done} <i class="input-helper rounded"></i>
                                                                                            </label>
                                                                                            <div class="d-flex mt-2">
                                                                                                <div class="ps-4 text-small me-3">Click to view</div>
                                                                                                <div class="badge badge-opacity-success me-3">Done</div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </li>
                                                                                    <li class="border-bottom-0">
                                                                                        <div class="form-check w-100">
                                                                                            <label class="form-check-label">
                                                                                                <input class="checkbox" type="checkbox"> Total of Cancel: ${cancel} <i class="input-helper rounded"></i>
                                                                                            </label>
                                                                                            <div class="d-flex mt-2">
                                                                                                <div class="ps-4 text-small me-3">Click to view</div>
                                                                                                <div class="badge badge-opacity-danger me-3">Cancel</div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-12 grid-margin stretch-card">
                                                            <div class="card card-rounded">
                                                                <div class="card-body">
                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                                                <div>
                                                                                    <h4 class="card-title card-title-dash">Status Order Report</h4>
                                                                                </div>
                                                                            </div>
                                                                            <div class="mt-3">
                                                                                <canvas id="leaveReport"></canvas>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <footer class="footer">
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash.</span>
                            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Copyright � 2021. All rights reserved.</span>
                        </div>
                    </footer>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->

        <!-- plugins:js -->
        <script src="Admin/vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <script src="Admin/vendors/chart.js/Chart.min.js"></script>
        <script src="Admin/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
        <script src="Admin/vendors/progressbar.js/progressbar.min.js"></script>

        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="Admin/js/off-canvas.js"></script>
        <script src="Admin/js/hoverable-collapse.js"></script>
        <script src="Admin/js/template.js"></script>
        <script src="Admin/js/settings.js"></script>
        <script src="Admin/js/todolist.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page-->
        <script src="Admin/js/jquery.cookie.js" type="text/javascript"></script>
        <!--        <script src="Admin/js/dashboard.js"></script>-->
        <script src="Admin/js/Chart.roundedBarCharts.js"></script>
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

            (function ($) {
                'use strict';
                $(function () {
                    if ($("#performaneLine").length) {
                        var graphGradient = document.getElementById("performaneLine").getContext('2d');
                        var graphGradient2 = document.getElementById("performaneLine").getContext('2d');
                        var saleGradientBg = graphGradient.createLinearGradient(5, 0, 5, 100);
                        saleGradientBg.addColorStop(0, 'rgba(26, 115, 232, 0.18)');
                        saleGradientBg.addColorStop(1, 'rgba(26, 115, 232, 0.02)');
                        var saleGradientBg2 = graphGradient2.createLinearGradient(100, 0, 50, 150);
                        saleGradientBg2.addColorStop(0, 'rgba(0, 208, 255, 0.19)');
                        saleGradientBg2.addColorStop(1, 'rgba(0, 208, 255, 0.03)');
                        var salesTopData = {
                            labels: ["SUN", "sun", "MON", "mon", "TUE", "tue", "WED", "wed", "THU", "thu", "FRI", "fri", "SAT"],
                            datasets: [{
                                    label: 'This week',
                                    data: [50, 110, 60, 290, 200, 115, 130, 170, 90, 210, 240, 280, 200],
                                    backgroundColor: saleGradientBg,
                                    borderColor: [
                                        '#1F3BB3',
                                    ],
                                    borderWidth: 1.5,
                                    fill: true, // 3: no fill
                                    pointBorderWidth: 1,
                                    pointRadius: [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
                                    pointHoverRadius: [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
                                    pointBackgroundColor: ['#1F3BB3)', '#1F3BB3', '#1F3BB3', '#1F3BB3', '#1F3BB3)', '#1F3BB3', '#1F3BB3', '#1F3BB3', '#1F3BB3)', '#1F3BB3', '#1F3BB3', '#1F3BB3', '#1F3BB3)'],
                                    pointBorderColor: ['#fff', '#fff', '#fff', '#fff', '#fff', '#fff', '#fff', '#fff', '#fff', '#fff', '#fff', '#fff', '#fff', ],
                                }, {
                                    label: 'Last week',
                                    data: [30, 150, 190, 250, 120, 150, 130, 20, 30, 15, 40, 95, 180],
                                    backgroundColor: saleGradientBg2,
                                    borderColor: [
                                        '#52CDFF',
                                    ],
                                    borderWidth: 1.5,
                                    fill: true, // 3: no fill
                                    pointBorderWidth: 1,
                                    pointRadius: [0, 0, 0, 4, 0],
                                    pointHoverRadius: [0, 0, 0, 2, 0],
                                    pointBackgroundColor: ['#52CDFF)', '#52CDFF', '#52CDFF', '#52CDFF', '#52CDFF)', '#52CDFF', '#52CDFF', '#52CDFF', '#52CDFF)', '#52CDFF', '#52CDFF', '#52CDFF', '#52CDFF)'],
                                    pointBorderColor: ['#fff', '#fff', '#fff', '#fff', '#fff', '#fff', '#fff', '#fff', '#fff', '#fff', '#fff', '#fff', '#fff', ],
                                }]
                        };

                        var salesTopOptions = {
                            responsive: true,
                            maintainAspectRatio: false,
                            scales: {
                                yAxes: [{
                                        gridLines: {
                                            display: true,
                                            drawBorder: false,
                                            color: "#F0F0F0",
                                            zeroLineColor: '#F0F0F0',
                                        },
                                        ticks: {
                                            beginAtZero: false,
                                            autoSkip: true,
                                            maxTicksLimit: 4,
                                            fontSize: 10,
                                            color: "#6B778C"
                                        }
                                    }],
                                xAxes: [{
                                        gridLines: {
                                            display: false,
                                            drawBorder: false,
                                        },
                                        ticks: {
                                            beginAtZero: false,
                                            autoSkip: true,
                                            maxTicksLimit: 7,
                                            fontSize: 10,
                                            color: "#6B778C"
                                        }
                                    }],
                            },
                            legend: false,
                            legendCallback: function (chart) {
                                var text = [];
                                text.push('<div class="chartjs-legend"><ul>');
                                for (var i = 0; i < chart.data.datasets.length; i++) {
                                    console.log(chart.data.datasets[i]); // see what's inside the obj.
                                    text.push('<li>');
                                    text.push('<span style="background-color:' + chart.data.datasets[i].borderColor + '">' + '</span>');
                                    text.push(chart.data.datasets[i].label);
                                    text.push('</li>');
                                }
                                text.push('</ul></div>');
                                return text.join("");
                            },

                            elements: {
                                line: {
                                    tension: 0.4,
                                }
                            },
                            tooltips: {
                                backgroundColor: 'rgba(31, 59, 179, 1)',
                            }
                        }
                        var salesTop = new Chart(graphGradient, {
                            type: 'line',
                            data: salesTopData,
                            options: salesTopOptions
                        });
                        document.getElementById('performance-line-legend').innerHTML = salesTop.generateLegend();
                    }
                    if ($("#performaneLine-dark").length) {
                        var graphGradient = document.getElementById("performaneLine-dark").getContext('2d');
                        var graphGradient2 = document.getElementById("performaneLine-dark").getContext('2d');
                        var saleGradientBg = graphGradient.createLinearGradient(5, 0, 5, 100);
                        saleGradientBg.addColorStop(0, 'rgba(26, 115, 232, 0.18)');
                        saleGradientBg.addColorStop(1, 'rgba(34, 36, 55, 0.5)');
                        var saleGradientBg2 = graphGradient2.createLinearGradient(10, 0, 0, 150);
                        saleGradientBg2.addColorStop(0, 'rgba(0, 208, 255, 0.19)');
                        saleGradientBg2.addColorStop(1, 'rgba(34, 36, 55, 0.2)');
                        var salesTopDataDark = {
                            labels: ["SUN", "sun", "MON", "mon", "TUE", "tue", "WED", "wed", "THU", "thu", "FRI", "fri", "SAT"],
                            datasets: [{
                                    label: '# of Votes',
                                    data: [50, 110, 60, 290, 200, 115, 130, 170, 90, 210, 240, 280, 200],
                                    backgroundColor: saleGradientBg,
                                    borderColor: [
                                        '#1F3BB3',
                                    ],
                                    borderWidth: 1.5,
                                    fill: true, // 3: no fill
                                    pointBorderWidth: 1,
                                    pointRadius: [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
                                    pointHoverRadius: [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
                                    pointBackgroundColor: ['#1F3BB3)', '#1F3BB3', '#1F3BB3', '#1F3BB3', '#1F3BB3)', '#1F3BB3', '#1F3BB3', '#1F3BB3', '#1F3BB3)', '#1F3BB3', '#1F3BB3', '#1F3BB3', '#1F3BB3)'],
                                    pointBorderColor: ['#222437', '#222437', '#222437', '#222437', '#222437', '#222437', '#222437', '#222437', '#222437', '#222437', '#222437', '#222437', '#222437', ],
                                }, {
                                    label: '# of Votes',
                                    data: [30, 150, 190, 250, 120, 150, 130, 20, 30, 15, 40, 95, 180],
                                    backgroundColor: saleGradientBg2,
                                    borderColor: [
                                        '#52CDFF',
                                    ],
                                    borderWidth: 1.5,
                                    fill: true, // 3: no fill
                                    pointBorderWidth: 1,
                                    pointRadius: [0, 0, 0, 4, 0],
                                    pointHoverRadius: [0, 0, 0, 2, 0],
                                    pointBackgroundColor: ['#52CDFF)', '#52CDFF', '#52CDFF', '#52CDFF', '#52CDFF)', '#52CDFF', '#52CDFF', '#52CDFF', '#52CDFF)', '#52CDFF', '#52CDFF', '#52CDFF', '#52CDFF)'],
                                    pointBorderColor: ['#222437', '#222437', '#222437', '#222437', '#222437', '#222437', '#222437', '#222437', '#222437', '#222437', '#222437', '#222437', '#222437', ],
                                }]
                        };

                        var salesTopOptionsDark = {
                            responsive: true,
                            maintainAspectRatio: false,
                            scales: {
                                yAxes: [{
                                        gridLines: {
                                            display: true,
                                            drawBorder: false,
                                            color: "rgba(255,255,255,.05)",
                                            zeroLineColor: "rgba(255,255,255,.05)",
                                        },
                                        ticks: {
                                            beginAtZero: false,
                                            autoSkip: true,
                                            maxTicksLimit: 4,
                                            fontSize: 10,
                                            color: "#6B778C"
                                        }
                                    }],
                                xAxes: [{
                                        gridLines: {
                                            display: false,
                                            drawBorder: false,
                                        },
                                        ticks: {
                                            beginAtZero: false,
                                            autoSkip: true,
                                            maxTicksLimit: 7,
                                            fontSize: 10,
                                            color: "#6B778C"
                                        }
                                    }],
                            },
                            legend: false,
                            legendCallback: function (chart) {
                                var text = [];
                                text.push('<div class="chartjs-legend"><ul>');
                                for (var i = 0; i < chart.data.datasets.length; i++) {
                                    console.log(chart.data.datasets[i]); // see what's inside the obj.
                                    text.push('<li>');
                                    text.push('<span style="background-color:' + chart.data.datasets[i].borderColor + '">' + '</span>');
                                    text.push(chart.data.datasets[i].label);
                                    text.push('</li>');
                                }
                                text.push('</ul></div>');
                                return text.join("");
                            },

                            elements: {
                                line: {
                                    tension: 0.4,
                                }
                            },
                            tooltips: {
                                backgroundColor: 'rgba(31, 59, 179, 1)',
                            }
                        }
                        var salesTopDark = new Chart(graphGradient, {
                            type: 'line',
                            data: salesTopDataDark,
                            options: salesTopOptionsDark
                        });
                        document.getElementById('performance-line-legend-dark').innerHTML = salesTopDark.generateLegend();
                    }
                    if ($("#datepicker-popup").length) {
                        $('#datepicker-popup').datepicker({
                            enableOnReadonly: true,
                            todayHighlight: true,
                        });
                        $("#datepicker-popup").datepicker("setDate", "0");
                    }
                    if ($("#status-summary").length) {
                        var statusSummaryChartCanvas = document.getElementById("status-summary").getContext('2d');
                        ;
                        var statusData = {
                            labels: ["SUN", "MON", "TUE", "WED", "THU", "FRI"],
                            datasets: [{
                                    label: '# of Votes',
                                    data: [50, 68, 70, 10, 12, 80],
                                    backgroundColor: "#ffcc00",
                                    borderColor: [
                                        '#01B6A0',
                                    ],
                                    borderWidth: 2,
                                    fill: false, // 3: no fill
                                    pointBorderWidth: 0,
                                    pointRadius: [0, 0, 0, 0, 0, 0],
                                    pointHoverRadius: [0, 0, 0, 0, 0, 0],
                                }]
                        };

                        var statusOptions = {
                            responsive: true,
                            maintainAspectRatio: false,
                            scales: {
                                yAxes: [{
                                        display: false,
                                        gridLines: {
                                            display: false,
                                            drawBorder: false,
                                            color: "#F0F0F0"
                                        },
                                        ticks: {
                                            beginAtZero: false,
                                            autoSkip: true,
                                            maxTicksLimit: 4,
                                            fontSize: 10,
                                            color: "#6B778C"
                                        }
                                    }],
                                xAxes: [{
                                        display: false,
                                        gridLines: {
                                            display: false,
                                            drawBorder: false,
                                        },
                                        ticks: {
                                            beginAtZero: false,
                                            autoSkip: true,
                                            maxTicksLimit: 7,
                                            fontSize: 10,
                                            color: "#6B778C"
                                        }
                                    }],
                            },
                            legend: false,

                            elements: {
                                line: {
                                    tension: 0.4,
                                }
                            },
                            tooltips: {
                                backgroundColor: 'rgba(31, 59, 179, 1)',
                            }
                        }
                        var statusSummaryChart = new Chart(statusSummaryChartCanvas, {
                            type: 'line',
                            data: statusData,
                            options: statusOptions
                        });
                    }
                    if ($('#totalVisitors').length) {
                        var bar = new ProgressBar.Circle(totalVisitors, {
                            color: '#fff',
                            // This has to be the same size as the maximum width to
                            // prevent clipping
                            strokeWidth: 15,
                            trailWidth: 15,
                            easing: 'easeInOut',
                            duration: 1400,
                            text: {
                                autoStyleContainer: false
                            },
                            from: {
                                color: '#52CDFF',
                                width: 15
                            },
                            to: {
                                color: '#677ae4',
                                width: 15
                            },
                            // Set default step function for all animate calls
                            step: function (state, circle) {
                                circle.path.setAttribute('stroke', state.color);
                                circle.path.setAttribute('stroke-width', state.width);

                                var value = Math.round(circle.value() * 100);
                                if (value === 0) {
                                    circle.setText('');
                                } else {
                                    circle.setText(value);
                                }

                            }
                        });

                        bar.text.style.fontSize = '0rem';
                        bar.animate(.64); // Number from 0.0 to 1.0
                    }
                    if ($('#visitperday').length) {
                        var bar = new ProgressBar.Circle(visitperday, {
                            color: '#fff',
                            // This has to be the same size as the maximum width to
                            // prevent clipping
                            strokeWidth: 15,
                            trailWidth: 15,
                            easing: 'easeInOut',
                            duration: 1400,
                            text: {
                                autoStyleContainer: false
                            },
                            from: {
                                color: '#34B1AA',
                                width: 15
                            },
                            to: {
                                color: '#677ae4',
                                width: 15
                            },
                            // Set default step function for all animate calls
                            step: function (state, circle) {
                                circle.path.setAttribute('stroke', state.color);
                                circle.path.setAttribute('stroke-width', state.width);

                                var value = Math.round(circle.value() * 100);
                                if (value === 0) {
                                    circle.setText('');
                                } else {
                                    circle.setText(value);
                                }

                            }
                        });

                        bar.text.style.fontSize = '0rem';
                        bar.animate(.34); // Number from 0.0 to 1.0
                    }
                    if ($("#marketingOverview").length) {
                        var marketingOverviewChart = document.getElementById("marketingOverview").getContext('2d');
                        var marketingOverviewData = {
                            labels: ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"],
                            datasets: [{
                                    label: '${year}',
                                    data: [${t1==null?0:t1}, ${t2==null?0:t2}, ${t3==null?0:t3},
            ${t4==null?0:t4}, ${t5==null?0:t5}, ${t6==null?0:t6},
            ${t7==null?0:t7}, ${t8==null?0:t8}, ${t9==null?0:t9},
            ${t10==null?0:t10}, ${t11==null?0:t11}, ${t12==null?0:t12}],
                                    backgroundColor: "#1F3BB3",
                                    borderColor: [
                                        '#1F3BB3',
                                    ],
                                    borderWidth: 0,
                                    fill: true, // 3: no fill

                                }]
                        };

                        var marketingOverviewOptions = {
                            responsive: true,
                            maintainAspectRatio: false,
                            scales: {
                                yAxes: [{
                                        gridLines: {
                                            display: true,
                                            drawBorder: false,
                                            color: "#F0F0F0",
                                            zeroLineColor: '#F0F0F0',
                                        },
                                        ticks: {
                                            beginAtZero: true,
                                            autoSkip: true,
                                            maxTicksLimit: 5,
                                            fontSize: 10,
                                            color: "#6B778C"
                                        }
                                    }],
                                xAxes: [{
                                        stacked: true,
                                        barPercentage: 0.35,
                                        gridLines: {
                                            display: false,
                                            drawBorder: false,
                                        },
                                        ticks: {
                                            beginAtZero: false,
                                            autoSkip: true,
                                            maxTicksLimit: 12,
                                            fontSize: 10,
                                            color: "#6B778C"
                                        }
                                    }],
                            },
                            legend: false,
                            legendCallback: function (chart) {
                                var text = [];
                                text.push('<div class="chartjs-legend"><ul>');
                                for (var i = 0; i < chart.data.datasets.length; i++) {
                                    console.log(chart.data.datasets[i]); // see what's inside the obj.
                                    text.push('<li class="text-muted text-small">');
                                    text.push('<span style="background-color:' + chart.data.datasets[i].borderColor + '">' + '</span>');
                                    text.push(chart.data.datasets[i].label);
                                    text.push('</li>');
                                }
                                text.push('</ul></div>');
                                return text.join("");
                            },

                            elements: {
                                line: {
                                    tension: 0.4,
                                }
                            },
                            tooltips: {
                                backgroundColor: 'rgba(31, 59, 179, 1)',
                            }
                        }
                        var marketingOverview = new Chart(marketingOverviewChart, {
                            type: 'bar',
                            data: marketingOverviewData,
                            options: marketingOverviewOptions
                        });
                        document.getElementById('marketing-overview-legend').innerHTML = marketingOverview.generateLegend();
                    }
                    if ($("#marketingOverview-dark").length) {
                        var marketingOverviewChartDark = document.getElementById("marketingOverview-dark").getContext('2d');
                        var marketingOverviewDataDark = {
                            labels: ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"],
                            datasets: [{
                                    label: 'Last week',
                                    data: [110, 220, 200, 190, 220, 110, 210, 110, 205, 202, 201, 150],
                                    backgroundColor: "#52CDFF",
                                    borderColor: [
                                        '#52CDFF',
                                    ],
                                    borderWidth: 0,
                                    fill: true, // 3: no fill

                                }, {
                                    label: 'This week',
                                    data: [215, 290, 210, 250, 290, 230, 290, 210, 280, 220, 190, 300],
                                    backgroundColor: "#1F3BB3",
                                    borderColor: [
                                        '#1F3BB3',
                                    ],
                                    borderWidth: 0,
                                    fill: true, // 3: no fill
                                }]
                        };

                        var marketingOverviewOptionsDark = {
                            responsive: true,
                            maintainAspectRatio: false,
                            scales: {
                                yAxes: [{
                                        gridLines: {
                                            display: true,
                                            drawBorder: false,
                                            color: "rgba(255,255,255,.05)",
                                            zeroLineColor: "rgba(255,255,255,.05)",
                                        },
                                        ticks: {
                                            beginAtZero: true,
                                            autoSkip: true,
                                            maxTicksLimit: 5,
                                            fontSize: 10,
                                            color: "#6B778C"
                                        }
                                    }],
                                xAxes: [{
                                        stacked: true,
                                        barPercentage: 0.35,
                                        gridLines: {
                                            display: false,
                                            drawBorder: false,
                                        },
                                        ticks: {
                                            beginAtZero: false,
                                            autoSkip: true,
                                            maxTicksLimit: 7,
                                            fontSize: 10,
                                            color: "#6B778C"
                                        }
                                    }],
                            },
                            legend: false,
                            legendCallback: function (chart) {
                                var text = [];
                                text.push('<div class="chartjs-legend"><ul>');
                                for (var i = 0; i < chart.data.datasets.length; i++) {
                                    console.log(chart.data.datasets[i]); // see what's inside the obj.
                                    text.push('<li class="text-muted text-small">');
                                    text.push('<span style="background-color:' + chart.data.datasets[i].borderColor + '">' + '</span>');
                                    text.push(chart.data.datasets[i].label);
                                    text.push('</li>');
                                }
                                text.push('</ul></div>');
                                return text.join("");
                            },

                            elements: {
                                line: {
                                    tension: 0.4,
                                }
                            },
                            tooltips: {
                                backgroundColor: 'rgba(31, 59, 179, 1)',
                            }
                        }
                        var marketingOverviewDark = new Chart(marketingOverviewChartDark, {
                            type: 'bar',
                            data: marketingOverviewDataDark,
                            options: marketingOverviewOptionsDark
                        });
                        document.getElementById('marketing-overview-legend').innerHTML = marketingOverviewDark.generateLegend();
                    }
                    if ($("#doughnutChart").length) {
                    var doughnutChartCanvas = $("#doughnutChart").get(0).getContext("2d");
                            var category = [
            <c:forEach items="${category}" var="item" varStatus="status">
                ${item}${!status.last ? ',' : ''}
            </c:forEach>
                            ];
                            var categoryname = [
            <c:forEach items="${categoryname}" var="item" varStatus="status">
                            '${item}'${!status.last ? ',' : ''}
            </c:forEach>
                            ];
                    var doughnutPieData = {
                        datasets: [{
                                data: category,
                                backgroundColor: [
                                    "#1F3BB3",
                                    "#FDD0C7",
                                    "#52CDFF",
                                    "#81DADA"
                                ],
                                borderColor: [
                                    "#1F3BB3",
                                    "#FDD0C7",
                                    "#52CDFF",
                                    "#81DADA"
                                ],
                            }],

                        // These labels appear in the legend and in the tooltips when hovering different arcs
                        labels: categoryname,
                    };
                    var doughnutPieOptions = {
                        cutoutPercentage: 50,
                        animationEasing: "easeOutBounce",
                        animateRotate: true,
                        animateScale: false,
                        responsive: true,
                        maintainAspectRatio: true,
                        showScale: true,
                        legend: false,
                        legendCallback: function (chart) {
                            var text = [];
                            text.push('<div class="chartjs-legend"><ul class="justify-content-center">');
                            for (var i = 0; i < chart.data.datasets[0].data.length; i++) {
                                text.push('<li><span style="background-color:' + chart.data.datasets[0].backgroundColor[i] + '">');
                                text.push('</span>');
                                if (chart.data.labels[i]) {
                                    text.push(chart.data.labels[i]);
                                }
                                text.push('</li>');
                            }
                            text.push('</div></ul>');
                            return text.join("");
                        },

                        layout: {
                            padding: {
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0
                            }
                        },
                        tooltips: {
                            callbacks: {
                                title: function (tooltipItem, data) {
                                    return data['labels'][tooltipItem[0]['index']];
                                },
                                label: function (tooltipItem, data) {
                                    return data['datasets'][0]['data'][tooltipItem['index']];
                                }
                            },

                            backgroundColor: '#fff',
                            titleFontSize: 14,
                            titleFontColor: '#0B0F32',
                            bodyFontColor: '#737F8B',
                            bodyFontSize: 11,
                            displayColors: false
                        }
                    };
                    var doughnutChart = new Chart(doughnutChartCanvas, {
                        type: 'doughnut',
                        data: doughnutPieData,
                        options: doughnutPieOptions
                    });
                    document.getElementById('doughnut-chart-legend').innerHTML = doughnutChart.generateLegend();
                    }
                    if ($("#leaveReport").length) {
                    var leaveReportChart = document.getElementById("leaveReport").getContext('2d');
                            var leaveReportData = {
                            labels: ["Wait", "Process", "Done", "Cancel"],
                                    datasets: [{
                                    label: 'Total',
                                            data: [${wait}, ${process}, ${done}, ${cancel}],
                                            backgroundColor: ['#52CDFF',
                                                    '#ede190',
                                                    '#00504B',
                                                    '#73293B', ],
                                            borderColor: [
                                                    '#52CDFF',
                                                    '#ede190',
                                                    '#00504B',
                                                    '#73293B',
                                            ],
                                            borderWidth: 0,
                                            fill: true, // 3: no fill

                                    }]
                            };
                            var leaveReportOptions = {
                            responsive: true,
                                    maintainAspectRatio: false,
                                    scales: {
                                    yAxes: [{
                                    gridLines: {
                                    display: true,
                                            drawBorder: false,
                                            color: "rgba(255,255,255,.05)",
                                            zeroLineColor: "rgba(255,255,255,.05)",
                                    },
                                            ticks: {
                                            beginAtZero: true,
                                                    autoSkip: true,
                                                    maxTicksLimit: 5,
                                                    fontSize: 10,
                                                    color: "#6B778C"
                                            }
                                    }],
                                            xAxes: [{
                                            barPercentage: 0.5,
                                                    gridLines: {
                                                    display: false,
                                                            drawBorder: false,
                                                    },
                                                    ticks: {
                                                    beginAtZero: false,
                                                            autoSkip: true,
                                                            maxTicksLimit: 7,
                                                            fontSize: 10,
                                                            color: "#6B778C"
                                                    }
                                            }],
                                    },
                                    legend: false,
                                    elements: {
                                    line: {
                                    tension: 0.4,
                                    }
                                    },
                                    tooltips: {
                                    backgroundColor: 'rgba(31, 59, 179, 1)',
                                    }
                            }
                    var leaveReport = new Chart(leaveReportChart, {
                    type: 'bar',
                            data: leaveReportData,
                            options: leaveReportOptions
                    });
                    }
                    if ($("#leaveReport-dark").length) {
                    var leaveReportChartDark = document.getElementById("leaveReport-dark").getContext('2d');
                            var leaveReportDataDark = {
                            labels: ["JAN", "FEB", "MAR", "APR", "MAY"],
                                    datasets: [{
                                    label: 'Last week',
                                            data: [18, 25, 39, 11, 24],
                                            backgroundColor: "#52CDFF",
                                            borderColor: [
                                                    '#52CDFF',
                                            ],
                                            borderWidth: 0,
                                            fill: true, // 3: no fill

                                    }]
                            };
                            var leaveReportOptionsDark = {
                            responsive: true,
                                    maintainAspectRatio: false,
                                    scales: {
                                    yAxes: [{
                                    gridLines: {
                                    display: true,
                                            drawBorder: false,
                                            color: "#383e5d",
                                            zeroLineColor: '#383e5d',
                                    },
                                            ticks: {
                                            beginAtZero: true,
                                                    autoSkip: true,
                                                    maxTicksLimit: 5,
                                                    fontSize: 10,
                                                    color: "#6B778C"
                                            }
                                    }],
                                            xAxes: [{
                                            barPercentage: 0.5,
                                                    gridLines: {
                                                    display: false,
                                                            drawBorder: false,
                                                    },
                                                    ticks: {
                                                    beginAtZero: false,
                                                            autoSkip: true,
                                                            maxTicksLimit: 7,
                                                            fontSize: 10,
                                                            color: "#6B778C"
                                                    }
                                            }],
                                    },
                                    legend: false,
                                    elements: {
                                    line: {
                                    tension: 0.4,
                                    }
                                    },
                                    tooltips: {
                                    backgroundColor: 'rgba(31, 59, 179, 1)',
                                    }
                            }
                    var leaveReportDark = new Chart(leaveReportChartDark, {
                    type: 'bar',
                            data: leaveReportDataDark,
                            options: leaveReportOptionsDark
                    });
                    }

                });
            })(jQuery);
        </script>
        <!-- End custom js for this page-->
    </body>

</html>

