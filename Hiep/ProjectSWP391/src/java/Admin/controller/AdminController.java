/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin.controller;

import dao.DAOAdmin;
import jakarta.servlet.RequestDispatcher;
import model.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import utils.Vadidate;

/**
 *
 * @author Lenovo
 */
public class AdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DAOAdmin dao = new DAOAdmin();
        Vadidate v = new Vadidate();
        String service = request.getParameter("service");
        int pageNumber = 1;
        int pageSize = 8;
        if (service == null) {
            service = "displayAll";
        }

        String pageNumberParam = request.getParameter("page");
        if (pageNumberParam != null && !pageNumberParam.isEmpty()) {
            pageNumber = Integer.parseInt(pageNumberParam);
        }

        if (service.equals("displayAll")) {
            ArrayList<Admin> list = dao.pagingAdmin(pageNumber, pageSize);
            request.setAttribute("data", list);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("totalPages", dao.getTotalPages(pageSize));
            dispath(request, response, "Admin/admin.jsp");
        }

        if (service.equals("updateAdmin")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                int admin_id = Integer.parseInt(request.getParameter("id"));
                ArrayList<Admin> list = dao.getAdmin(admin_id);
                request.setAttribute("data", list);
                dispath(request, response, "Admin/update/updateAdmin.jsp");
            } else {

                int admin_id = Integer.parseInt(request.getParameter("id"));
                String role = request.getParameter("role");
                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String gmail = request.getParameter("gmail");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String status = request.getParameter("status");
                String haspassword = v.hashPassword(password);
                Admin ad = new Admin(admin_id, role, name,
                        phone, gmail, username, haspassword, status);

                dao.updateAdmin(ad);

                response.sendRedirect("AdminController");
            }
        }

        if (service.equals("insertAdmin")) {
            String submit = request.getParameter("submit");
            if (submit == null) {

                dispath(request, response, "Admin/add/addAdmin.jsp");

            } else {

                String role = request.getParameter("role");
                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String gmail = request.getParameter("gmail");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String haspassword = v.hashPassword(password);
                Admin ad = new Admin(0, role, name,
                        phone, gmail, username, haspassword, "Active");

                dao.insertAdmin(ad);

                response.sendRedirect("AdminController");
            }
        }

        if (service.equals("deleteAdmin")) {
            int admin_id = Integer.parseInt(request.getParameter("id"));
            int n = dao.removeAdmin(admin_id);
            if (n <= 0) {
                ArrayList<Admin> list = dao.getAllAdmin();
                String ms = "Cannot delete Admin";
                request.setAttribute("data", list);
                request.setAttribute("ms", ms);
                dispath(request, response, "Admin/admin.jsp");
            } else {
                response.sendRedirect("AdminController");
            }
        }

        if (service.equals("searchAdmin")) {
            String name = request.getParameter("name");
            ArrayList<Admin> list = dao.searchAdmin(name);
            if (list.isEmpty()) {
                request.setAttribute("ms", "No Record Found");
                dispath(request, response, "Admin/admin.jsp");
            } else {
                request.setAttribute("data", list);
                dispath(request, response, "Admin/admin.jsp");
            }
        }

        if (service.equals("updateStatus")) {
            int admin_id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");
            dao.updateAdminStatus(admin_id, status);
            response.sendRedirect("AdminController");
        }
    }

    void dispath(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
        RequestDispatcher disp = request.getRequestDispatcher(url);
        disp.forward(request, response);
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
