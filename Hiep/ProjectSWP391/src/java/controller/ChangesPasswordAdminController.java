/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOAdmin;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Admin;
import utils.Vadidate;

/**
 *
 * @author Lenovo
 */
public class ChangesPasswordAdminController extends HttpServlet {

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
        ArrayList<Admin> ad = dao.getAdmin(cs.getAdmin_id());
        request.setAttribute("data", ad);
        request.getRequestDispatcher("Admin/changespassword.jsp").forward(request, response);
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
        String spass = request.getParameter("spass");
        String respass = request.getParameter("respass");
        DAOAdmin dao = new DAOAdmin();
        HttpSession session = request.getSession(true);
        Admin admin = (Admin) session.getAttribute("account");
        if (spass.equals(respass) && v.checkPassword(spass) == true) {
            String haspassword = v.hashPassword(spass);
            dao.changePassword(haspassword, admin.getUsername());
            response.sendRedirect("LoginAdminController");
        } else {
            String ms = "Password does not match! Please re-enter";
            ArrayList<Admin> ad = dao.getAdmin(admin.getAdmin_id());
            request.setAttribute("data", ad);
            request.setAttribute("ms", ms);
            request.getRequestDispatcher("Admin/changespassword.jsp").forward(request, response);
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
    }// </editor-fold>

}
