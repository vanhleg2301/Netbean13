
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : charts
    Created on : May 14, 2023, 10:34:17 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <div class="col-lg-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Total Warranty Status</h4>
                                        <canvas id="pieChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Total Order 7 Days</h4>
                                        <canvas id="barChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Total Income 7 Days</h4>
                                        <canvas id="areaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Total Order Status</h4>
                                        <canvas id="doughnutChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- content-wrapper ends -->
                    <!-- partial:../../partials/_footer.html -->
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
        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="Admin/js/off-canvas.js"></script>
        <script src="Admin/js/hoverable-collapse.js"></script>
        <script src="Admin/js/template.js"></script>
        <script src="Admin/js/settings.js"></script>
        <script src="Admin/js/todolist.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page-->
        <!-- End custom js for this page-->


        <script>
            $(function () {
                /* ChartJS
                 * -------
                 * Data and config for chartjs
                 */
                'use strict';
                var data = {
                    labels: ["${day - 6}/${month}",
                                    "${day - 5}/${month}",
                                                    "${day - 4}/${month}",
                                                                    "${day - 3}/${month}",
                                                                                    "${day - 2}/${month}",
                                                                                                    "${day - 1}/${month}",
                                                                                                                    "${day}/${month}"],
                                                                                                                                datasets: [{
                                                                                                                                        label: '# of Votes',
                                                                                                                                        data: [${o1==null?0:o1}, ${o2==null?0:o2},
            ${o3==null?0:o3}, ${o4==null?0:o4}, ${o5==null?0:o5}, ${o6==null?0:o6},
            ${o7==null?0:o7}],
                                                                                                                                        backgroundColor: [
                                                                                                                                            'rgba(255, 99, 132, 0.2)',
                                                                                                                                            'rgba(54, 162, 235, 0.2)',
                                                                                                                                            'rgba(255, 206, 86, 0.2)',
                                                                                                                                            'rgba(75, 192, 192, 0.2)',
                                                                                                                                            'rgba(153, 102, 255, 0.2)',
                                                                                                                                            'rgba(54, 162, 235, 0.2)'
                                                                                                                                        ],
                                                                                                                                        borderColor: [
                                                                                                                                            'rgba(255,99,132,1)',
                                                                                                                                            'rgba(54, 162, 235, 1)',
                                                                                                                                            'rgba(255, 206, 86, 1)',
                                                                                                                                            'rgba(75, 192, 192, 1)',
                                                                                                                                            'rgba(153, 102, 255, 1)',
                                                                                                                                            'rgba(54, 162, 235, 1)'
                                                                                                                                        ],
                                                                                                                                        borderWidth: 1,
                                                                                                                                        fill: false
                                                                                                                                    }]
                                                                                                                            };


                                                                                                                            var options = {
                                                                                                                                scales: {
                                                                                                                                    yAxes: [{
                                                                                                                                            ticks: {
                                                                                                                                                beginAtZero: true
                                                                                                                                            }
                                                                                                                                        }]
                                                                                                                                },
                                                                                                                                legend: {
                                                                                                                                    display: false
                                                                                                                                },
                                                                                                                                elements: {
                                                                                                                                    point: {
                                                                                                                                        radius: 0
                                                                                                                                    }
                                                                                                                                }

                                                                                                                            };

                                                                                                                            var OrderData = {
                                                                                                                                datasets: [{
                                                                                                                                        data: [${orderWait==null?0:orderWait},
            ${orderProcess==null?0:orderProcess},
            ${orderDone==null?0:orderDone},
            ${orderCancel==null?0:orderCancel}],
                                                                                                                                        backgroundColor: [
                                                                                                                                            'rgba(255, 99, 132, 0.5)',
                                                                                                                                            'rgba(54, 162, 235, 0.5)',
                                                                                                                                            'rgba(255, 206, 86, 0.5)',
                                                                                                                                            'rgba(75, 192, 192, 0.5)',
                                                                                                                                            'rgba(153, 102, 255, 0.5)',
                                                                                                                                            'rgba(255, 159, 64, 0.5)'
                                                                                                                                        ],
                                                                                                                                        borderColor: [
                                                                                                                                            'rgba(255,99,132,1)',
                                                                                                                                            'rgba(54, 162, 235, 1)',
                                                                                                                                            'rgba(255, 206, 86, 1)',
                                                                                                                                            'rgba(75, 192, 192, 1)',
                                                                                                                                            'rgba(153, 102, 255, 1)',
                                                                                                                                            'rgba(255, 159, 64, 1)'
                                                                                                                                        ],
                                                                                                                                    }],

                                                                                                                                // These labels appear in the legend and in the tooltips when hovering different arcs
                                                                                                                                labels: [
                                                                                                                                    'Wait',
                                                                                                                                    'Process',
                                                                                                                                    'Done',
                                                                                                                                    'Cancel'
                                                                                                                                ]
                                                                                                                            };

                                                                                                                            var WarrantyData = {
                                                                                                                                datasets: [{
                                                                                                                                        data: [${warrantyWait == null ? 0 : warrantyWait},
            ${warrantyProcess == null ? 0 : warrantyProcess},
            ${warrantyDone == null ? 0 : warrantyDone}],
                                                                                                                                        backgroundColor: [
                                                                                                                                            'rgba(255, 99, 132, 0.5)',
                                                                                                                                            'rgba(54, 162, 235, 0.5)',
                                                                                                                                            'rgba(255, 206, 86, 0.5)',
                                                                                                                                            'rgba(75, 192, 192, 0.5)',
                                                                                                                                            'rgba(153, 102, 255, 0.5)',
                                                                                                                                            'rgba(255, 159, 64, 0.5)'
                                                                                                                                        ],
                                                                                                                                        borderColor: [
                                                                                                                                            'rgba(255,99,132,1)',
                                                                                                                                            'rgba(54, 162, 235, 1)',
                                                                                                                                            'rgba(255, 206, 86, 1)',
                                                                                                                                            'rgba(75, 192, 192, 1)',
                                                                                                                                            'rgba(153, 102, 255, 1)',
                                                                                                                                            'rgba(255, 159, 64, 1)'
                                                                                                                                        ],
                                                                                                                                    }],

                                                                                                                                // These labels appear in the legend and in the tooltips when hovering different arcs
                                                                                                                                labels: [
                                                                                                                                    'Wait',
                                                                                                                                    'Process',
                                                                                                                                    'Done',
                                                                                                                                ]
                                                                                                                            };

                                                                                                                            var doughnutPieOptions = {
                                                                                                                                responsive: true,
                                                                                                                                animation: {
                                                                                                                                    animateScale: true,
                                                                                                                                    animateRotate: true
                                                                                                                                }
                                                                                                                            };
                                                                                                                            var areaData = {
                                                                                                                                labels: ["${day - 6}/${month}",
                                                                                                                                                "${day - 5}/${month}",
                                                                                                                                                                "${day - 4}/${month}",
                                                                                                                                                                                "${day - 3}/${month}",
                                                                                                                                                                                                "${day - 2}/${month}",
                                                                                                                                                                                                        "${day - 1}/${month}",
                                                                                                                                                                                                        "${day}/${month}"],
                                                                                                                                                                                                                                            datasets: [{
                                                                                                                                                                                                                                                    label: 'Total',
                                                                                                                                                                                                        data: [${m1 == null ? 0 : m1}, ${m2 == null ? 0 : m2}, ${m3 == null ? 0 : m3},
            ${m4 == null ? 0 : m4}, ${m5 == null ? 0 : m5}, ${m6 == null ? 0 : m6}, ${m7 == null ? 0 : m7}],
                                                                                                                                                                                                                                                    backgroundColor: [
                                                                                                                                                                                                                                                        'rgba(255, 99, 132, 0.2)',
                                                                                                                                                                                                                                                        'rgba(54, 162, 235, 0.2)',
                                                                                                                                                                                                                                                        'rgba(255, 206, 86, 0.2)',
                                                                                                                                                                                                                                                        'rgba(75, 192, 192, 0.2)',
                                                                                                                                                                                                                                                        'rgba(153, 102, 255, 0.2)',
                                                                                                                                                                                                                                                        'rgba(255, 159, 64, 0.2)',
                                                                                                                                                                                                                                                        'rgba(255, 159, 64, 0.2)'
                                                                                                                                                                                                                                                    ],
                                                                                                                                                                                                                                                    borderColor: [
                                                                                                                                                                                                                                                        'rgba(255,99,132,1)',
                                                                                                                                                                                                                                                        'rgba(54, 162, 235, 1)',
                                                                                                                                                                                                                                                        'rgba(255, 206, 86, 1)',
                                                                                                                                                                                                                                                        'rgba(75, 192, 192, 1)',
                                                                                                                                                                                                                                                        'rgba(153, 102, 255, 1)',
                                                                                                                                                                                                                                                        'rgba(255, 159, 64, 1)',
                                                                                                                                                                                                                                                        'rgba(255, 159, 64, 1)'
                                                                                                                                                                                                                                                    ],
                                                                                                                                                                                                                                                    borderWidth: 1,
                                                                                                                                                                                                                                                    fill: true, // 3: no fill
                                                                                                                                                                                                                                                }]
                                                                                                                                                                                                                                        };

                                                                                                                                                                                                                                        var areaOptions = {
                                                                                                                                                                                                                                            plugins: {
                                                                                                                                                                                                                                                filler: {
                                                                                                                                                                                                                                                    propagate: true
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                        };

                                                                                                                                                                                                                                        // Get context with jQuery - using jQuery's .get() method.
                                                                                                                                                                                                                                        if ($("#barChart").length) {
                                                                                                                                                                                                                                            var barChartCanvas = $("#barChart").get(0).getContext("2d");
                                                                                                                                                                                                                                            // This will get the first returned node in the jQuery collection.
                                                                                                                                                                                                                                            var barChart = new Chart(barChartCanvas, {
                                                                                                                                                                                                                                                type: 'bar',
                                                                                                                                                                                                                                                data: data,
                                                                                                                                                                                                                                                options: options
                                                                                                                                                                                                                                            });
                                                                                                                                                                                                                                        }

                                                                                                                                                                                                                                        if ($("#lineChart").length) {
                                                                                                                                                                                                                                            var lineChartCanvas = $("#lineChart").get(0).getContext("2d");
                                                                                                                                                                                                                                            var lineChart = new Chart(lineChartCanvas, {
                                                                                                                                                                                                                                                type: 'line',
                                                                                                                                                                                                                                                data: data,
                                                                                                                                                                                                                                                options: options
                                                                                                                                                                                                                                            });
                                                                                                                                                                                                                                        }

                                                                                                                                                                                                                                        if ($("#doughnutChart").length) {
                                                                                                                                                                                                                                            var doughnutChartCanvas = $("#doughnutChart").get(0).getContext("2d");
                                                                                                                                                                                                                                            var doughnutChart = new Chart(doughnutChartCanvas, {
                                                                                                                                                                                                                                                type: 'doughnut',
                                                                                                                                                                                                                                                data: OrderData,
                                                                                                                                                                                                                                                options: doughnutPieOptions
                                                                                                                                                                                                                                            });
                                                                                                                                                                                                                                        }

                                                                                                                                                                                                                                        if ($("#pieChart").length) {
                                                                                                                                                                                                                                            var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
                                                                                                                                                                                                                                            var pieChart = new Chart(pieChartCanvas, {
                                                                                                                                                                                                                                                type: 'pie',
                                                                                                                                                                                                                                                data: WarrantyData,
                                                                                                                                                                                                                                                options: doughnutPieOptions
                                                                                                                                                                                                                                            });
                                                                                                                                                                                                                                        }

                                                                                                                                                                                                                                        if ($("#areaChart").length) {
                                                                                                                                                                                                                                            var areaChartCanvas = $("#areaChart").get(0).getContext("2d");
                                                                                                                                                                                                                                            var areaChart = new Chart(areaChartCanvas, {
                                                                                                                                                                                                                                                type: 'line',
                                                                                                                                                                                                                                                data: areaData,
                                                                                                                                                                                                                                                options: areaOptions
                                                                                                                                                                                                                                            });
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                    });
        </script>

    </body>

</html>

