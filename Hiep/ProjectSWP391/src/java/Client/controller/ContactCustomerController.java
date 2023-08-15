/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Client.controller;

import dao.DAOContact;
import dao.DAONews;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Contact;
import model.Customer;
import model.News;
import utils.SendGmail;
import utils.Vadidate;

/**
 *
 * @author Lenovo
 */
public class ContactCustomerController extends HttpServlet {

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

        DAOContact dao = new DAOContact();
        DAONews daoN = new DAONews();
        ArrayList<News> contact = daoN.getContact();
        request.setAttribute("contact", contact);
        String service = request.getParameter("service");
        if (service == null) {
            service = "displayAll";
        }
        if (service.equals("displayAll")) {
            HttpSession session = request.getSession();
            if (session.getAttribute("account") != null) {
                Customer cus = (Customer) session.getAttribute("account");
                request.setAttribute("data", cus);
                request.getRequestDispatcher("Client/contact.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("Client/contact.jsp").forward(request, response);
            }
        }

        if (service.equals("addContact")) {
            Vadidate v = new Vadidate();
            LocalDate localDate = LocalDate.now();
            Date date = Date.valueOf(localDate);
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String message = request.getParameter("message");
            if (v.checkGmail(email) == true) {
                SendGmail sendmail = new SendGmail();
                Contact c = new Contact(0, name, email, date, message);
                sendmail.sendOTPToEmail(email, "", "Thank you for your feedback, we will try our best to improve every day.");
                dao.insertContact(c);
                response.sendRedirect("ContactCustomerController");
            } else {
                request.setAttribute("ms", "*Invalid email!");
                request.getRequestDispatcher("Client/contact.jsp").forward(request, response);
            }
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
