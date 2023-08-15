<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <style>
            .orderstatus {
                margin-bottom:  20px;
                display: flex;
                justify-content: space-evenly;
                margin-top:   20px;
            }
        </style>
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


        <div class="col-lg-12 col-md-12">
            <div>
                <div style="text-align: center">
                    <h1 class="">Warranty</h1>
                </div>
                <div style="text-align: center">
                    <a onclick="exportToExcel()" class="btn btn-primary text-white me-0"> Export</a>
                </div>
                <div class="orderstatus">
                    <p><a href="WarrantyCustomerController?service=displayWarrantyStatus&status=Wait">Wait: ${wait} </a></p>
                    <p><a href="WarrantyCustomerController?service=displayWarrantyStatus&status=Process">Process:${process} </a></p>
                    <p><a href="WarrantyCustomerController?service=displayWarrantyStatus&status=Done">Done:${done} </a></p>
                </div>
            </div>
            <div>
                <table style="width: 100%" id="myTable">
                    <thead>
                        <tr>
                            <th>Product Name</th>
                            <th>Image</th>
                            <th>Warranty Quantity</th>
                            <th>Image Product</th>
                            <th>Product Status</th>
                            <th>Warranty Status</th>
                            <th>Warranty Date</th>
                            <th>Status</th>
                            <th>DOWNLOAD</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${data}" var="d">
                            <tr>
                                <td>${d.product_name}</td>
                                <td><img style="width: 60%" src="${d.image}" alt="alt"/></td>
                                <td>${d.warranty_quantity}</td>
                                <td><img style="width: 60%" src="${d.image_product}" alt="alt"/></td>
                                <td>${d.product_status}</td> 
                                <td>${d.warranty_status}</td>
                                <td><fmt:formatDate value="${d.warranty_date}" pattern="dd-MM-yyyy" var="formattedDate" />${formattedDate}</td>
                                <td>${d.status}</td> 
                                <td>
                                    <input type="hidden"  class="name" value="${d.name}">
                                    <input type="hidden"  class="phone" value="${d.phone}">

                                    <input type="hidden" class="product_id" value="${d.product_id}">
                                    <input type="hidden"  class="product_name" value="${d.product_name}">

                                    <input type="hidden" class="status_product" value="${d.product_status}">
                                    <input type="hidden" class="warranty_date" value="${formattedDate}">
                                    <input type="hidden" class="warranty_status" value="${d.warranty_status}">

                                    <a onclick="updateDocumentAndDownload(this)" class="btn btn-primary text-white me-0">Download</a>
                                </td> 
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
        <script src="Client/js/jquery-1.11.0.min.js"></script>
        <script src="Client/js/plugins.js"></script>
        <script src="Client/js/script.js"></script>
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

                                            var url = "https://script.google.com/macros/s/AKfycbxsj42Fpb0guQYIovzC9o69ohTsiiJMYBShBYWP4lw--M9drmy_cYHrbWSNPxECIFMNKQ/exec";

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
                                                    "&warranty_date=" + encodeURIComponent(warranty_date) + "&status_warranty=" + encodeURIComponent(status_warranty);
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