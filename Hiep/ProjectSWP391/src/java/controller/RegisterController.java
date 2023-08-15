/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOCustomer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Customer;
import utils.Vadidate;

/**
 *
 * @author Lenovo
 */
public class RegisterController extends HttpServlet {

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
    
        
        DAOCustomer dao = new DAOCustomer();
        Vadidate v = new Vadidate();

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String gmail = request.getParameter("gmail");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String haspassword = v.hashPassword(password);
        String status = "Active";
        if (v.checkGmail(gmail) == true && v.checkAccountCustomer(username) == true && v.checkPhone(phone) == true
                && v.checkPassword(password) == true) {
            if (gender.equals("1")) {
                Customer cus = new Customer(0, name, phone, null, dob, gmail, true, address, username, haspassword, status);
                dao.insertCustomer(cus);
                response.sendRedirect("LoginController");
            } else {
                Customer cus = new Customer(0, name, phone, null, dob, gmail, true, address, username, haspassword, status);
                dao.insertCustomer(cus);
                response.sendRedirect("LoginController");
            }

        } else {
            if (v.checkGmail(gmail) == false) {
                String ms1 = "*invalid gmail!";
                request.setAttribute("ms1", ms1);
            }
            if (v.checkPassword(password) == false) {
                String ms2 = "*password more than 6 characters";
                request.setAttribute("ms2", ms2);
            }
            if (v.checkPhone(phone) == false) {
                String ms3 = "*Phone is full number";
                request.setAttribute("ms3", ms3);
            }
            if (v.checkAccountCustomer(username) == false) {
                String ms4 = "*username is exist! pls enter another username";
                request.setAttribute("ms4", ms4);
            }
            request.getRequestDispatcher("Client/register.jsp").forward(request, response);
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
        request.getRequestDispatcher("Client/register.jsp").forward(request, response);
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
