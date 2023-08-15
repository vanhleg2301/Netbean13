/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOAdmin;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Admin;
import utils.Vadidate;

/**
 *
 * @author Admin
 */
public class EditProfileAdminController extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        Admin cs = (Admin) session.getAttribute("account");
        DAOAdmin dao = new DAOAdmin();
        ArrayList cus = dao.getAdmin(cs.getAdmin_id());
        request.setAttribute("data", cus);
        request.getRequestDispatcher("Admin/editProfileAdmin.jsp").forward(request, response);
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
        Vadidate v = new Vadidate();
        String role = request.getParameter("role");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        HttpSession session = request.getSession(true);
        Admin cs = (Admin) session.getAttribute("account");
        DAOAdmin dao = new DAOAdmin();
        boolean check = true;
        if (v.checkPhone(phone) == true && v.checkGmail(email) == true) {
            dao.editProfileAdmin(role, name, phone, email, cs.getAdmin_id());
            response.sendRedirect("ProfileAdminController");
        }
        if (v.checkPhone(phone) == false) {
            String ms = "*Invalid phone number !!Please re-enter";
            request.setAttribute("ms", ms);
            check = false;
        }
        if (v.checkGmail(email) == false) {
            String ms1 = "*Invalid email!! Please re-enter";
            request.setAttribute("ms1", ms1);
            check = false;
        }
        if (!check) {
            ArrayList cus = dao.getAdmin(cs.getAdmin_id());
            request.setAttribute("data", cus);
            request.getRequestDispatcher("Admin/editProfileAdmin.jsp").forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>d>

}
