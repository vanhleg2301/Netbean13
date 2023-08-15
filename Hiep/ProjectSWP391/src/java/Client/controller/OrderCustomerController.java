/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Client.controller;


import dao.DAOOrder;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import model.Customer;
import model.Order;
import model.OrderView;


/**
 *
 * @author Lenovo
 */
public class OrderCustomerController extends HttpServlet {

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
      
        DAOOrder dao = new DAOOrder();
        HttpSession session = request.getSession(true);
        Customer cus = (Customer) session.getAttribute("account");
        ArrayList<OrderView> w = dao.getAllStatusOrderCustomer(cus.getCustomer_id(),"Wait");
        ArrayList<OrderView> p = dao.getAllStatusOrderCustomer(cus.getCustomer_id(),"Process");
        ArrayList<OrderView> d = dao.getAllStatusOrderCustomer(cus.getCustomer_id(),"Done");
        ArrayList<OrderView> c = dao.getAllStatusOrderCustomer(cus.getCustomer_id(),"Cancel");
        int wait = 0;
        int process = 0;
        int done = 0;
        int cancel = 0;
        for (OrderView orderView : d) {
            done++;
        }
        for (OrderView orderView : w) {
            wait++;
        }
        for (OrderView orderView : p) {
            process++;
        }
        for (OrderView orderView : c) {
            cancel++;
        }
        request.setAttribute("wait", wait);
        request.setAttribute("process", process);
        request.setAttribute("done", done);
        request.setAttribute("cancel", cancel);

        String service = request.getParameter("service");
        if (service == null) {
            service = "displayAll";
        }

        if (service.equals("displayAll")) {
            ArrayList<OrderView> list = dao.getViewOrderCustomer(cus.getCustomer_id());
            request.setAttribute("data", list);
            dispath(request, response, "Client/order.jsp");
        }

        if (service.equals("updateStatus")) {
            int order_id = Integer.parseInt(request.getParameter("id"));
            dao.updateStatus("Cancel", order_id);
            response.sendRedirect("OrderCustomerController");
        }

        if (service.equals("displayOrderStatus")) {
            String status = request.getParameter("status");
            ArrayList<OrderView> orders = dao.getAllStatusOrderCustomer(cus.getCustomer_id(),status);
            request.setAttribute("data", orders);
            request.setAttribute("status", status);
            dispath(request, response, "Client/order.jsp");
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
