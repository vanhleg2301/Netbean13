/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOAdmin;
import dao.DAOCustomer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.SendGmail;

/**
 *
 * @author Lenovo
 */
public class SendOTPAdminController extends HttpServlet {

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
        
        String email = request.getParameter("email");
                
        String username = request.getParameter("username");

        SendGmail gm = new SendGmail();
        DAOAdmin dao = new DAOAdmin();

        if (gm.isValidEmail(email)) {
            if (dao.checkUsernameAndEmailExists(username, email)) {
                String otp = gm.generateOTP(); // Tạo mã OTP
                gm.sendOTPToEmail(email, otp,"Your OTP is: "); // Gửi mã OTP đến email
                dao.saveOTP(email, otp, request); // Lưu trữ OTP vào session
                // Chuyển hướng đến trang nhập mã OTP
               response.sendRedirect("VerifyOTPAdminController");
            } else {
                request.setAttribute("message", "Email không tồn tại");
                request.getRequestDispatcher("Admin/forgotpassword.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("message", "Email không hợp lệ");
            request.getRequestDispatcher("Admin/forgotpassword.jsp").forward(request, response);
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
