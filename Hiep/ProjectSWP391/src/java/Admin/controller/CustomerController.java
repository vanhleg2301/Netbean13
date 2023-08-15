/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin.controller;

import dao.DAOCustomer;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import model.Contact;
import model.Customer;
import utils.Vadidate;

/**
 *
 * @author Lenovo
 */
public class CustomerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DAOCustomer dao = new DAOCustomer();
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
            ArrayList<Customer> list = dao.pagingCustomer(pageNumber, pageSize);
            request.setAttribute("data", list);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("totalPages", dao.getTotalPages(pageSize));
            dispath(request, response, "Admin/customer.jsp");
        }

        if (service.equals("updateCustomer")) {
            String submit = request.getParameter("submit");
            if (submit == null) {

                int id = Integer.parseInt(request.getParameter("id"));
                ArrayList<Customer> list = dao.getCustomer(id);
                request.setAttribute("data", list);
                dispath(request, response, "Admin/update/updateCustomer.jsp");

            } else {
                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                Date date = Date.valueOf(request.getParameter("dob"));
                String gmail = request.getParameter("gmail");
                boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
                String address = request.getParameter("address");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String status = request.getParameter("status");
                int customer_id = Integer.parseInt(request.getParameter("id"));
                String haspassword = v.hashPassword(password);
                Customer c = new Customer(customer_id, name,
                        phone, null, date, gmail, gender, address, username, haspassword, status);
                dao.updateCustomer(c);
                response.sendRedirect("CustomerController");
            }
        }

        if (service.equals("insertCustomer")) {

            String submit = request.getParameter("submit");
            if (submit == null) {

                dispath(request, response, "Admin/add/addCustomer.jsp");

            } else {

                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                Date date = Date.valueOf(request.getParameter("dob"));
                String gmail = request.getParameter("gmail");
                boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
                String address = request.getParameter("address");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String haspassword = v.hashPassword(password);
                Customer c = new Customer(0, name,
                        phone, null, date, gmail, gender, address, username, haspassword, "Active");

                dao.insertCustomer(c);

                response.sendRedirect("CustomerController");
            }
        }

        if (service.equals("deleteCustomer")) {
            int id = Integer.parseInt(request.getParameter("id"));
            int n = dao.deleteCustomer(id);
            if (n <= 0) {
                ArrayList<Customer> list = dao.getAllCustomer();
                String ms = "Cannot delete Customer";
                request.setAttribute("ms", ms);
                request.setAttribute("data", list);
                dispath(request, response, "Admin/customer.jsp");
            } else {
                response.sendRedirect("CustomerController");
            }
        }

        if (service.equals("searchCustomer")) {
            String name = request.getParameter("name");
            ArrayList<Customer> list = dao.searchCustomer(name);
            if (list.isEmpty()) {
                request.setAttribute("ms", "No Record Found");
                dispath(request, response, "Admin/customer.jsp");
            } else {
                request.setAttribute("data", list);
                dispath(request, response, "Admin/customer.jsp");
            }
        }

        if (service.equals("updateStatus")) {
            int admin_id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");
            dao.updateCustomerStatus(admin_id, status);
            response.sendRedirect("CustomerController");
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
