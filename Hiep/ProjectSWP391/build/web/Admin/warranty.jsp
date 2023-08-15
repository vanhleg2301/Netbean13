<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : admin
    Created on : May 14, 2023, 10:34:54 AM
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
                        <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-sm-flex justify-content-between align-items-start">
                                        <div>
                                            <h4 class="card-title card-title-dash">Warranty</h4>
                                        </div>
                                        <div>
                                            <a onclick="exportToExcel()" class="btn btn-primary text-white me-0"><i class="icon-download"></i> Export</a>
                                        </div>
                                    </div>
                                    <div class="d-sm-flex justify-content-evenly">
                                        <p class="badge badge-info"><a href="WarrantyController?service=displayWarrantyStatus&status=Wait">Wait: ${wait} </a></p>
                                        <p class="badge badge-warning"><a href="WarrantyController?service=displayWarrantyStatus&status=Process">Process:${process} </a></p>
                                        <p class="badge badge-success"><a href="WarrantyController?service=displayWarrantyStatus&status=Done">Done:${done} </a></p>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-hover" id="myTable">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Customer Id</th>
                                                    <th>Image</th>
                                                    <th>Product Name</th>
                                                    <th>Image Product</th>
                                                    <th>Product Status</th>
                                                    <th>Warranty Status</th>
                                                    <th>Warranty Quantity</th>
                                                    <th>Warranty Date</th>
                                                    <th>Image Product Official</th>  
                                                    <th>Status Product Official</th>
                                                    <th>Date</th>
                                                    <th>Status</th>
                                                    <th>Update</th>
                                                    <th>DOWNLOAD</th>
                                                        <c:if test="${status.equalsIgnoreCase('Wait')}">
                                                        <th>Update Status</th>
                                                        </c:if>
                                                        <c:if test="${status.equalsIgnoreCase('Process')}">
                                                        <th>Update Status</th>
                                                        </c:if>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${data}" var="d">
                                                    <fmt:formatDate value="${d.warranty_date}" pattern="dd-MM-yyyy" var="formattedDate" />
                                                    <fmt:formatDate value="${d.warranty_date_admin}" pattern="dd-MM-yyyy" var="formattedDate1" />
                                                    <tr>
                                                        <td>${d.warranty_id}</td>
                                                        <td>${d.customer_id}</td>
                                                        <td><img src="${d.image}" alt="alt"/></td>
                                                        <td>${d.product_name}</td>
                                                        <td><img src="${d.image_product}" alt="alt"/></td>
                                                        <td>${d.product_status}</td> 
                                                        <td>${d.warranty_status}</td>
                                                        <td>${d.warranty_quantity}</td>
                                                        <td>${formattedDate}</td>
                                                        <td><img src="${empty d.image_product_admin?"NULL":d.image_product_admin}" alt="alt"/></td>
                                                        <td>${empty d.product_status_admin?"NULL":d.product_status_admin}</td>
                                                        <td>${empty d.warranty_date_admin?"NULL":formattedDate1}</td>

                                                        <td><div class="badge badge-opacity-info"> <a href="WarrantyController?service=updateWarrantyforAdmin&id=${d.warranty_id}">Update</a> </div></td>

                                                        <td>
                                                            <div 
                                                                <c:if test="${d.status.equalsIgnoreCase('Wait')}">
                                                                    class="badge badge-opacity-info"
                                                                </c:if> 
                                                                <c:if test="${d.status.equalsIgnoreCase('Process')}">
                                                                    class="badge badge-opacity-warning"
                                                                </c:if>
                                                                <c:if test="${d.status.equalsIgnoreCase('Done')}">
                                                                    class="badge badge-opacity-success"
                                                                </c:if>
                                                                >${d.status}</div>
                                                        </td> 

                                                        <td>
                                                            <input type="hidden"  class="name_admin" value="${d.name}">
                                                            <input type="hidden"  class="name_admin" value="${d.name}">

                                                            <input type="hidden"  class="name" value="${d.name}">
                                                            <input type="hidden"  class="phone" value="${d.phone}">

                                                            <input type="hidden" class="product_id" value="${d.product_id}">
                                                            <input type="hidden"  class="product_name" value="${d.product_name}">

                                                            <input type="hidden" class="status_product" value="${d.product_status}">
                                                            <input type="hidden" class="warranty_date" value="${formattedDate}">
                                                            <input type="hidden" class="warranty_status" value="${d.warranty_status}">

                                                            <button class="btn btn-inverse-success btn-icon" onclick="updateDocumentAndDownload(this)"><i class="icon-download"></i></button>
                                                        </td> 
                                                        <c:if test="${status.equalsIgnoreCase('Wait')}">
                                                            <td> 
                                                                <form method="post" action="WarrantyController"> 
                                                                    <input type="hidden" name="service" value="updateStatus">
                                                                    <input  type="hidden" name="id" id="id" value="${d.warranty_id}"> 
                                                                    <label  for="status">Status: </label> 
                                                                    <Select class="input" name="status" id="status"> 
                                                                        <option selected value="Wait">Wait</option>
                                                                        <option value="Process">Process</option> 
                                                                    </Select> 
                                                                    <input type="submit" value="Update">
                                                                </form> 
                                                            </td>
                                                        </c:if>
                                                        <c:if test="${status.equalsIgnoreCase('Process')}">
                                                            <td> 
                                                                <form method="post" action="WarrantyController"> 
                                                                    <input type="hidden" name="service" value="updateStatus">
                                                                    <input  type="hidden" name="id" id="id" value="${d.warranty_id}"> 
                                                                    <label  for="status">Status: </label> 
                                                                    <Select class="input" name="status" id="status"> 
                                                                        <option  value="Wait">Wait</option>
                                                                        <option selected value="Process">Process</option> 
                                                                        <option value="Done">Done</option>
                                                                    </Select> 
                                                                    <input type="submit" value="Update">
                                                                </form> 
                                                            </td>
                                                        </c:if>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div style="text-align: center">
                                            <c:choose>
                                                <c:when test="${currentPage > 1}">
                                                    <a href="?page=${currentPage - 1}">Previous</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <span>Previous</span>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                <c:choose>
                                                    <c:when test="${loop.index == currentPage}">
                                                        <span>${loop.index}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:if test="${id == null}">
                                                            <a href="?page=${loop.index}">${loop.index}</a>
                                                        </c:if>  
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${currentPage < totalPages}">
                                                    <a href="?page=${currentPage + 1}">Next</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <span>Next</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
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
    <script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
    <script>
                                                                function updateDocumentAndDownload(element) {
                                                                    var currentDate = new Date();
                                                                    var day = currentDate.getDate();
                                                                    var month = currentDate.getMonth() + 1;
                                                                    var year = currentDate.getFullYear();
                                                                    var dateString = day + '/' + month + '/' + year;
                                                                    var date = dateString;
                                                                    var row = element.parentNode.parentNode;
                                                                    var name = row.getElementsByClassName("name")[0].value;
                                                                    var phone = row.getElementsByClassName("phone")[0].value;
                                                                    var product_id = row.getElementsByClassName("product_id")[0].value;
                                                                    var product_name = row.getElementsByClassName("product_name")[0].value;
                                                                    var status_product = row.getElementsByClassName("status_product")[0].value;
                                                                    var warranty_date = row.getElementsByClassName("warranty_date")[0].value;
                                                                    var status_warranty = row.getElementsByClassName("warranty_status")[0].value;
                                                                    var admin_name = '${admin.name}';
                                                                    var id_admin = '${admin.admin_id}';

                                                                    var url = "https://script.google.com/macros/s/AKfycbwBdkazjfAPDM9w0MYKj89YFPA0QbabTUIecQDV0QBAtApktuxvahKm4sZHVFndFGby/exec";

                                                                    var xhr = new XMLHttpRequest();
                                                                    xhr.open("POST", url);
                                                                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                                                                    xhr.responseType = "text";
                                                                    xhr.onreadystatechange = function () {
                                                                        if (xhr.readyState === XMLHttpRequest.DONE) {
                                                                            if (xhr.status === 200) {
                                                                                var responseText = xhr.responseText;
                                                                                var responseJson = JSON.parse(responseText);
                                                                                var downloadUrl = responseJson.url;
                                                                                var downloadUrlDocx = downloadUrl.replace("/edit?usp=drivesdk", "/export?format=doc");
                                                                                var link = document.createElement("a");
                                                                                link.href = downloadUrlDocx;
                                                                                link.download = "Warranty.txt";
                                                                                document.body.appendChild(link);
                                                                                link.click();
                                                                                document.body.removeChild(link);
                                                                                URL.revokeObjectURL(downloadUrl);
                                                                            } else {
                                                                                console.error("Error:", xhr.status);
                                                                            }
                                                                        }
                                                                    };
                                                                    var params = "name=" + encodeURIComponent(name) + "&phone=" + encodeURIComponent(phone) +
                                                                            "&date=" + encodeURIComponent(date) + "&product_id=" + encodeURIComponent(product_id) +
                                                                            "&product_name=" + encodeURIComponent(product_name) + "&status_product=" + encodeURIComponent(status_product) +
                                                                            "&warranty_date=" + encodeURIComponent(warranty_date) + "&status_warranty=" + encodeURIComponent(status_warranty)
                                                                            + "&admin_name=" + encodeURIComponent(admin_name) + "&id_admin=" + encodeURIComponent(id_admin);
                                                                    xhr.send(params);
                                                                }
    </script>
    <script>
        function exportToExcel() {
            const table = document.getElementById("myTable");
            const wb = XLSX.utils.table_to_book(table, {sheet: "SheetJS"});
            const wbout = XLSX.write(wb, {bookType: "xlsx", type: "array"});
            saveAsExcelFile(wbout, "warranty.xlsx");
        }

        function saveAsExcelFile(buffer, fileName) {
            const data = new Blob([buffer], {type: "application/octet-stream"});
            const link = document.createElement("a");
            link.href = window.URL.createObjectURL(data);
            link.download = fileName;
            link.click();
        }
    </script>

</body>

</html>

