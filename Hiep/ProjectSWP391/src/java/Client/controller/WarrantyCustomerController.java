/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Client.controller;

import dao.DAOWarranty;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Array;
import java.util.ArrayList;
import model.Customer;
import model.Warranty;

/**
 *
 * @author Lenovo
 */
public class WarrantyCustomerController extends HttpServlet {

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
        
        DAOWarranty dao = new DAOWarranty();
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("account");
        ArrayList<Warranty> w = dao.getAllStatusWarrantyCustomer("Wait",cus.getCustomer_id());
        ArrayList<Warranty> p = dao.getAllStatusWarrantyCustomer("Process",cus.getCustomer_id());
        ArrayList<Warranty> d = dao.getAllStatusWarrantyCustomer("Done",cus.getCustomer_id());
        int wait = 0;
        int process = 0;
        int done = 0;
        
        for (Warranty warranty : d) {
            done++;
        }
        for (Warranty warranty : w) {
            wait++;
        }
        for (Warranty warranty : p) {
            process++;
        }
  
        request.setAttribute("wait", wait);
        request.setAttribute("process", process);
        request.setAttribute("done", done);
       

        String service = request.getParameter("service");
        if (service == null) {
            service = "displayAll";
        }

        if (service.equals("displayAll")) {
            ArrayList<Warranty> list = dao.OrderWarrantyCheckFor(cus.getCustomer_id());
            request.setAttribute("data", list);
            dispath(request, response, "Client/warranty.jsp");
        }
        
         if (service.equals("displayWarrantyStatus")) {
            String status = request.getParameter("status");
            ArrayList<Warranty> list = dao.getAllStatusWarrantyCustomer(status,cus.getCustomer_id());
            request.setAttribute("data", list);
            request.setAttribute("status", status);
            dispath(request, response, "Client/warranty.jsp");
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
