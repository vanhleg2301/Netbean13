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
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import model.Customer;
import utils.Vadidate;

/**
 *
 * @author Lenovo
 */
public class EditProfileController extends HttpServlet {

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
        Customer cs = (Customer) session.getAttribute("account");
        DAOCustomer dao = new DAOCustomer();
        ArrayList cus = dao.getCustomer(cs.getCustomer_id());
        request.setAttribute("data", cus);
        request.getRequestDispatcher("Client/editprofileCustomer.jsp").forward(request, response);
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
        
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String email = request.getParameter("email");
        String genderString = request.getParameter("gender");
        boolean gender = true;
        if (genderString.equals("female")) {
            gender = false;
        }
        String address = request.getParameter("address");
        
        HttpSession session = request.getSession(true);
        Customer cs = (Customer) session.getAttribute("account");
        DAOCustomer cusdao = new DAOCustomer();
        boolean check = true;
        
        
        if(v.checkGmail(email)==true && v.checkPhone(phone)==true){
            cusdao.editCustomer(name, phone, dob, email, gender, address, cs.getCustomer_id());
            response.sendRedirect("ProfileController");
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
            ArrayList cus = cusdao.getCustomer(cs.getCustomer_id());
            request.setAttribute("data", cus);
            request.getRequestDispatcher("Client/editprofileCustomer.jsp").forward(request, response);
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
