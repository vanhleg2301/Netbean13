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
                    <h1 class="">Order</h1>
                </div>
                <div style="text-align: center">
                    <a onclick="exportToExcel()" class="btn btn-primary text-white me-0"> Export</a>
                </div>
                <div class="orderstatus">
                    <p><a href="OrderCustomerController?service=displayOrderStatus&status=Wait">Wait: ${wait} </a></p>
                    <p><a href="OrderCustomerController?service=displayOrderStatus&status=Process">Process:${process} </a></p>
                    <p><a href="OrderCustomerController?service=displayOrderStatus&status=Done">Done:${done} </a></p>
                    <p><a href="OrderCustomerController?service=displayOrderStatus&status=Cancel">Cancel:${cancel}</a></p>
                </div>
            </div>
            <div>
                <table style="width: 100%" id="myTable">
                    <thead>
                        <tr>
                            <th>Name Receiver</th>
                            <th>Phone Receiver</th>
                            <th>Address Receiver</th>
                            <th>Total Price</th>
                            <th>Order Date</th>
                            <th>Payment</th>
                            <th>Status</th>
                            <th>Detail</th>
                                <c:if test="${status.equalsIgnoreCase('Wait')}">
                                <th>Update Status</th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${data}" var="d">
                            <tr>
                                <td>${d.name_receiver}</td>
                                <td>${d.phone_receiver}</td>
                                <td>${d.address_receiver}</td> 
                                <td class="number">${d.total_price}</td> 
                                <fmt:formatDate value="${d.order_date}" pattern="dd-MM-yyyy" var="formattedDate" />
                                <td>${formattedDate}</td> 
                                <td>${d.payment}</td> 
                                <td>
                                    <div <c:if test="${d.status.equalsIgnoreCase('Wait')}">
                                            class="badge badge-opacity-info"
                                        </c:if> 
                                        <c:if test="${d.status.equalsIgnoreCase('Process')}">
                                            class="badge badge-opacity-warning"
                                        </c:if>
                                        <c:if test="${d.status.equalsIgnoreCase('Done')}">
                                            class="badge badge-opacity-success"
                                        </c:if>
                                        <c:if test="${d.status.equalsIgnoreCase('Cancel')}">
                                            class="badge badge-opacity-danger"
                                        </c:if>
                                        >${d.status}</div>
                                </td> 
                                <td><div><a href="OrderDetailCustomerController?service=DetailOrderDetail&id=${d.order_id}">Detail</a></div></td>  

                                <c:if test="${status.equalsIgnoreCase('Wait')}">
                                    <td> 
                                        <div><a href="OrderCustomerController?service=updateStatus&id=${d.order_id}">Cancel</a></div>    
                                    </td>
                                </c:if>
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
                        function exportToExcel() {
                            const table = document.getElementById("myTable");
                            const wb = XLSX.utils.table_to_book(table, {sheet: "SheetJS"});
                            const wbout = XLSX.write(wb, {bookType: "xlsx", type: "array"});
                            saveAsExcelFile(wbout, "order.xlsx");
                        }

                        function saveAsExcelFile(buffer, fileName) {
                            const data = new Blob([buffer], {type: "application/octet-stream"});
                            const link = document.createElement("a");
                            link.href = window.URL.createObjectURL(data);
                            link.download = fileName;
                            link.click();
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

    </body>
</html>