<%-- 
    Document   : mypatients
    Created on : Jun 10, 2023, 11:37:10 PM
    Author     : DELL
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="layout/head.jsp"/>
    <body>
        <jsp:include page="layout/menu_white.jsp"/>
        <section class="bg-dashboard">
            <!--            hẻ <section> giúp tạo ra một khối độc lập và rõ ràng trong tài liệu, 
                            giúp cho việc đọc mã nguồn và hiểu cấu trúc trang web trở nên dễ dàng hơn.
                            kết hợp với flexbox (display: flex;)
            -->
            <div class="container">
                <div class="row justify-content-center">
                    <!--Căn chỉnh các phần tử con ngang trong container ở vị trí center-->
                    <jsp:include page="layout/profileMenu.jsp"/>
                    <div class="col-xl-8 col-lg-8 col-md-7 mt-4 pt-2 mt-sm-0 pt-sm-0">
        <!--col-8 : chiếm 8 cột     xl = extra-large - lớn hơn hoặc bằng 1200px.
                                    g = large - lớn hơn hoặc bằng 992px, nhưng nhỏ hơn 1200px.
                                    d = medium - lớn hơn hoặc bằng 768px, nhưng nhỏ hơn 992px.
                                    mt-4 - margin-top
                                    pt-2 - padding-top
                                mt-sm-0 - margin-top với giá trị là 0 cho kích thước màn hình nhỏ (small) hoặc lớn hơn
                                pt-sm-0 - padding-top với giá trị là 0 cho kích thước màn hình nhỏ (small) hoặc lớn hơn
                                Bootstrap là 1 Framework CSS
                        -->
                        <h3 class="mb-0"></h3>
                        <div class="rounded shadow mt-4">
                            <!--                  rounded shadow  Tạo hiệu ứng 
                                                        rounded để bo góc 
                                                        Shadow để tạo bóng - cụ thể là viền của cả bảng
                            --> 
                            <div class="p-4 border-bottom">
                                <!--                        p-4 : padding : 4px;
                                                    border-bottom được sử dụng để áp dụng đường viền (border) chỉ trên phía dưới của phần tử
                                -->
                                <h5 class="mb-0">Bệnh nhân của tôi</h5>
                            </div>
                            <div class="subcribe-form mt-4">
                                <!--hông thường, thuật ngữ "subscribe-form" được sử dụng để chỉ một biểu mẫu 
                                (form) được sử dụng để cho phép người dùng đăng ký (subscribe) nhận thông tin mới, 
                                tin tức, hoặc cập nhật từ một nguồn nào đó, chẳng hạn như một trang web hoặc dịch vụ.-->
                                <form action="doctor?action=search" method="POST" id="searchform" class="searchform">
                                    <div class="mb-0">
                                        <input type="text" id="help" name="searchname" class="border bg-white rounded-pill" required="" placeholder="Search">
                                        <!--
                                        rounded-pill được sử dụng để bo tròn cả 
                                        hai cạnh của phần tử theo hình dạng hình oval (pill shape) 
                                        thay vì dạng hình vuông thông thường
                                        -->
                                        <button type="submit" class="btn btn-pills btn-primary">Tìm kiếm</button>
<!--                btn Khi áp dụng lớp này, phần tử sẽ có giao diện giống một nút, 
                    với đường viền, hiệu ứng hover, và kiểu dáng được xác định bởi các lớp khác.
                    btn-pills - được sử dụng để tạo hình dạng hình oval (pill shape) cho phần tử nút
                    btn-primary - được sử dụng để áp dụng màu chủ đạo (primary color) cho phần tử nút 
                                        -->
                                    </div>
                                </form>
                            </div>
                            <div class="p-4">
                                <div class="table-responsive bg-white shadow rounded">
                                    <!--background-color: white
                                    table-responsive - thích nghi và hiển thị tốt trên các loại màn hình
                                    có thể cuộn ngang khi cần thiết 
                                    Khi cuộn xuống có thể căn bằng thanh profileMenu
                                    -->
                                    <table class="table mb-0 table-center" style="font-size: smaller;">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom " style="min-width: 100px;">Patient</th>
                                                <th class="border-bottom " style="min-width: 70px;">Phone</th>
                                                <th class="border-bottom " style="min-width: 70px;">Email</th>
                                                <th class="border-bottom " style="min-width: 110px;">Date Booking</th>
                                                <th class="border-bottom" style="min-width: 30px;">Dob</th>
                                                <th class="border-bottom " ></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${patients}" var="a">
                            <!--patients là tên của biến chứa danh sách bệnh nhân được truyền vào từ phía server-side.-->
                                                <!--Dùng biến a vs items là {patients} bên DoctorController-->
                                                <!--a đại diện cho mỗi phần tử trong danh sách patients-->
                                                <tr>
                                                    <td class="">
                                                        <a href="#" class="text-dark"> <!--chữ đen--> 
                                                            <div class="d-flex align-items-center">
                                                                <!--                                                        d-flex (flex display) 
                                                                --> 
                                                                <!--Sau đấy dùng biến a gọi các thuộc tính trong session 
                                                                a.account.name -> để lấy name đc lưu trên session tên là account    -->
                                                                <!--<img src="data:image/png;base64,${a.account.img}" class="avatar avatar-md-sm rounded-circle shadow" alt="img">-->
                                                                <span class="ms-2">${a.account.name}</span>
                                                            </div>
                                                        </a>
                                                    </td>
<!--                                                    account, appointment từ bên class model.Patient.java-->
                                                    <td class="">${a.account.phone}</td>
                                                    <td class="">${a.account.email}</td>
                                                    <td class=""><fmt:formatDate pattern="dd/MM/yyyy" value="${a.appointment.date}" /></td>
                                                    <!--
                                                    fmt:formatDate chuyển từ kkieeur date về kiểu chuỗi để hiển thị trong html
                                                    pattern được sử dụng để chỉ định định dạng ngày tháng mà bạn muốn áp dụng
                                                    value đc lấy từ ${a.appointment.date}
                                                    giá trị ngày tháng sẽ được định dạng theo mẫu đã chỉ định (dd/MM/yyyy) trước khi hiển thị trên trang.
                                                    -->
                                                    <td class=""><fmt:formatDate pattern="dd/MM/yyyy" value="${a.DOB}" /></td>
                                                    <td class="text-end ">
                                                        <a href="doctor?action=detailpatient&id=${a.patient_id}"><u>Detail</u></a>
<!--        doctor là đường dẫn tới một trang servlet, 

Dấu hỏi chấm "?" được sử dụng để chỉ ra rằng sau đó sẽ có một hoặc nhiều tham số được truyền cho Servlet
            
            Dấu hỏi chấm "?" có ý nghĩa đánh dấu sự bắt đầu của chuỗi tham số (query string) trong URL.
            Nó cho biết rằng yêu cầu đến trang doctor servlet là một hành động cụ thể là patientdetail
            Sau dấu ? là truyền vào 1 tham số và giá trị với cú pháp : tham_số = giá_trị
            Dấu hỏi chấm "?" là một phần quan trọng của cú pháp URL và cho phép truyền các tham số và giá trị cụ thể từ client (trình duyệt web, ứng dụng di động, v.v.) đến server, trong trường hợp này là trang Servlet.
                                                        -->                                                    
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="layout/footer.jsp"/>
        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
            <jsp:include page="layout/search.jsp"/>

        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/feather.min.js"></script>
        <script src="assets/js/app.js"></script>
    </body>

</html>


