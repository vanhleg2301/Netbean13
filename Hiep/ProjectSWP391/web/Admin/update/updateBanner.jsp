<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : addAdmin
    Created on : May 16, 2023, 9:40:00 PM
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
        <link rel="stylesheet" href="Admin/vendors/select2/select2.min.css">
        <link rel="stylesheet" href="Admin/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="Admin/css/vertical-layout-light/style.css">
        <!-- endinject -->
    </head>


    <body>
        <div class="container-scroller">
            <!-- partial:../../partials/_navbar.html -->
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
                <!-- partial:../../partials/_settings-panel.html -->
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
                <!-- partial:../../partials/_sidebar.html -->
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

                        <form class="forms-sample" method="post" action="BannerController">
                            <input type="hidden" name="service" value="updateBanner">
                            <c:forEach var="d" items="${data}">
                                <div class="row">
                                    <div class="col-md-12 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">Update Banner</h4>
                                                <p class="card-description">
                                                    Fill all the bank
                                                </p>
                                                <form class="forms-sample" method="post" action="BannerController">
                                                    <input type="hidden" name="service" value="updateBanner">
                                                    <input type="hidden" name="news_id" value="${d.news_id}">
                                                    <div class="form-group">
                                                        <label for="title">Title</label>
                                                        <input type="text" class="form-control" value="${d.title}" name="title" id="title" placeholder="Title">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="image">Image</label>
                                                        <img id="preview-img" src="${d.image}"  style="width: 30%">
                                                        <input type="file" class="form-control" onchange="previewImage()" accept="image/*" name="image" id="image" value="${d.image}"  placeholder="image">
                                                        <input type="hidden" name="imageoriginal" value="${d.image}">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="content">Content</label> <br>
                                                        <textarea name="content" >${d.content}</textarea>
                                                    </div>
                                                    <button type="submit" name="submit" class="btn btn-primary me-2">Submit</button>
                                                    <a class="btn btn-light" href="BannerController">Cancel</a>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </form>
                    </div>
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
        <script src="Admin/vendors/typeahead.js/typeahead.bundle.min.js"></script>
        <script src="Admin/vendors/select2/select2.min.js"></script>
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
        <script src="Admin/js/file-upload.js"></script>
        <script src="Admin/js/typeahead.js"></script>
        <script src="Admin/js/select2.js"></script>
        <!-- End custom js for this page-->
        <script src="Admin/vendors/tinymce/tinymce.min.js"></script>
        <script src="Admin/vendors/tinymce/tinymce.js"></script>
        <script src="Admin/vendors/tinymce/jquery.tinymce.js"></script>
        <script src="Admin/vendors/tinymce/jquery.tinymce.min.js"></script>
        <script>
                                                            tinymce.init({
                                                                selector: 'textarea',
                                                                height: 500,
                                                                menubar: 'file edit view format',
                                                                plugins: 'advlist autolink lists link image charmap print preview anchor',
                                                                toolbar: 'undo redo | formatselect | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image'
                                                            });
        </script>
    </body>

</html>

