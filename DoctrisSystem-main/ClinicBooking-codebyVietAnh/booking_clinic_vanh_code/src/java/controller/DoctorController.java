/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AppointmentDAO;
import dao.DoctorDAO;
import dao.PatientDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Appointment;
import model.Doctor;
import model.Patient;
import model.Setting;

/**
 *
 * @author DELL
 */
public class DoctorController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        DoctorDAO doctordao = new DoctorDAO();
        PatientDAO patientdao = new PatientDAO();
        AppointmentDAO appointmentdao = new AppointmentDAO();
        String url = null;
        List<Patient> patientlist = null;

        HttpSession session = request.getSession();
        String action = request.getParameter("action");
//        action để lưu giá trị đc truy xuất từ tham số tên "action"
//         lấy giá trị của tham số "action" từ yêu cầu HTTP
//  getParameter("action") được sử dụng để truy xuất giá trị của tham số có tên là "action" từ yêu cầu

        Account user = (Account) session.getAttribute("user"); // ép kiểu (Cast)
//      vì đã setAttribute bên trang login rồi nên bên này chỉ cần getAttribute
//      Dùng user để truy xuất các phương thức trong đối tượng account
//        getAttribute("user") là một phương thức của đối tượng HttpSession
//     Điều này giả định rằng giá trị của thuộc tính "user" trong session hiện tại là một đối tượng kiểu Account.
//        và được sử dụng để truy xuất giá trị của thuộc tính có tên là "user" từ phiên hiện tại

        List<Doctor> getdoctor = null;
        ArrayList<Doctor> doctorall = new ArrayList<>();
        try {

            if (action.equals("search")) {
                int doctor_id = doctordao.getDoctorIDByUsername(user.getUsername());
                String text = request.getParameter("searchname");
                patientlist = doctordao.search(doctor_id, text);
                url = "doctormanage?action=search&txt=" + text;
                request.getRequestDispatcher("mypatients.jsp").forward(request, response);
            }

// mypatient
            if (action.equals("mypatient")) {

                int doctor_id = doctordao.getDoctorIDByUsername(user.getUsername());
//                user.getUsername() - dùng user để truy xuất phương thức trong đối tượng account
                // trả về 1 id của doctor trong bảng doctor với username mà mình đã đăng nhập 
                List<Patient> patients = patientdao.getPatientByDoctor(doctor_id);
                // Biến patients để lưu danh sách

                request.setAttribute("patients", patients);
// set giá trị patiens vào thuộc tính có tên "patients"
//Ví dụ: ${patients} sẽ truy cập đến thuộc tính "patients" và hiển thị nội dung tương ứng trong giao diện.
//request.setAttribute("patients", patients); cho phép truyền dữ liệu từ phía máy chủ đến phía khách hàng 
//thông qua request, 
//để sử dụng và hiển thị trong giao diện của ứng dụng web.
                request.getRequestDispatcher("mypatients.jsp").forward(request, response);
            }

// detailpatient
            if (action.equals("detailpatient")) {
                int doctor_id = doctordao.getDoctorIDByUsername(user.getUsername());

                int patient_id = Integer.parseInt(request.getParameter("id"));
                // lấy giá trị chuỗi từ tham số id bên jsp và chuyển đổi thành kiểu số nguyện int
                // Mục đich của dòng này là để nó khớp với dữ liệu trong database

                Patient patients = patientdao.getPatientbyid(patient_id);
                List<model.Appointment> appointmentlist = appointmentdao.getAppointmentByPatient(doctor_id, patient_id);
                //  là một danh sách (List) các đối tượng Appointment
                request.setAttribute("patients", patients);


                request.setAttribute("appointmentlist", appointmentlist);

                request.getRequestDispatcher("mypatientdetails.jsp").forward(request, response);
            }

// myappointment
            if (action.equals("myappointment")) {

                int doctor_id = doctordao.getDoctorIDByUsername(user.getUsername());
                List<Appointment> getAppointment = doctordao.getAllAppointment(doctor_id);

                int page, numperpage = 3; // Số trang đc hiển thị, số lượng hiển thị trên mỗi trang 
                int size = getAppointment.size(); // tổng số mục 
                int num = (size % 3 == 0 ? (size / 3) : ((size / 3)) + 1); // số lượng trang cần hiển thị 

                String xpage = request.getParameter("page");
                // Trang nguoiwf dungf bam
// xpage là giá trị của tham số "page" trong request URL. Nó đại diện cho trang được yêu cầu từ người dùng.
                if (xpage == null) {
//Nếu xpage là null, tức là không có giá trị "page" trong URL, thì page được đặt là 1 (trang đầu tiên).
// Tức là người dùng ko bấm gì thì page mặc định sẽ là 1 
                    page = 1;
                } else {
//Nếu xpage không null, 
//page được chuyển đổi từ kiểu dữ liệu chuỗi sang kiểu dữ liệu int bằng phương thức Integer.parseInt().
// page đc gán cho giá trị nguyên của xpage 
                    page = Integer.parseInt(xpage);
                }

                int start, end;

                start = (page - 1) * numperpage; // 
                end = Math.min(page * numperpage, size); // lấy cái bé hơn. Nếu size quá bé thì ko hiện thêm

                List<Appointment> AppointmentList = appointmentdao.getListByPage(getAppointment, start, end);
                // Nếu ở trang 1 thì hiển thị các phàn tử trong danh sách từ 0 - 2  (start=0, end=3)
          // Sau khi bấm trang 2 bên trang jsp thì nó mới gọi lại controller để in ra từ 3 - 5 (start=3, end =6)

                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("AppointmentList", AppointmentList);

                request.getRequestDispatcher("myappointment.jsp").forward(request, response);
//Phương thức getRequestDispatcher().forward() 
//được sử dụng để chuyển hướng yêu cầu và dữ liệu tới trang JSP để hiển thị danh sách cuộc hẹn.
            }
        } catch (Exception e) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
