/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin.controller;

import dao.DAOOrder;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import model.Order;
import model.OrderView;

/**
 *
 * @author Lenovo
 */
public class OrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DAOOrder dao = new DAOOrder();

        ArrayList<OrderView> w = dao.getAllStatusOrder("Wait");
        ArrayList<OrderView> p = dao.getAllStatusOrder("Process");
        ArrayList<OrderView> d = dao.getAllStatusOrder("Done");
        ArrayList<OrderView> c = dao.getAllStatusOrder("Cancel");
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
            ArrayList<OrderView> list = dao.pagingOrder(pageNumber, pageSize);
            request.setAttribute("data", list);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("totalPages", dao.getTotalPages(pageSize));
            dispath(request, response, "Admin/order.jsp");
        }

        if (service.equals("updateOrder")) {
            String submit = request.getParameter("submit");
            if (submit == null) {

                int id = Integer.parseInt(request.getParameter("order_id"));
                ArrayList<Order> list = dao.getOrder(id);
                request.setAttribute("data", list);
                dispath(request, response, "Admin/update/updateOrder.jsp");

            } else {

                int customer_id = Integer.parseInt(request.getParameter("customer_id"));
                String name_receiver = request.getParameter("name_receiver");
                String phone_receiver = request.getParameter("phone_receiver");
                String address_receiver = request.getParameter("address_receiver");
                double total_price = Double.parseDouble(request.getParameter("total_price"));
                Date order_date = Date.valueOf(request.getParameter("order_date"));
                String payment = request.getParameter("payment");
                String status = request.getParameter("status");
                int order_id = Integer.parseInt(request.getParameter("order_id"));

                Order o = new Order(order_id, customer_id, name_receiver,
                        phone_receiver, address_receiver, total_price, order_date, payment, status);

                dao.updateOrder(o);

                response.sendRedirect("OrderController");
            }
        }

        if (service.equals("insertOrder")) {

            int customer_id = Integer.parseInt(request.getParameter("customer_id"));
            String name_receiver = request.getParameter("name_receiver");
            String phone_receiver = request.getParameter("phone_receiver");
            String address_receiver = request.getParameter("address_receiver");
            double total_price = Double.parseDouble(request.getParameter("total_price"));
            Date order_date = Date.valueOf(request.getParameter("order_date"));
            String payment = request.getParameter("payment");
            String status = request.getParameter("status");
            
            Order o = new Order(0, customer_id, name_receiver,
                        phone_receiver, address_receiver, total_price, order_date, payment, status);
            
            dao.insertOrder(o);

            response.sendRedirect("OrderController");

        }

        if (service.equals("updateStatus")) {

            int order_id = Integer.parseInt(request.getParameter("order_id"));
            String status = request.getParameter("status");
            dao.updateStatus(status, order_id);
            response.sendRedirect("OrderController");
        }

        if (service.equals("displayOrderStatus")) {
            String status = request.getParameter("status");
            ArrayList<OrderView> orders = dao.getAllStatusOrder(status);
            request.setAttribute("data", orders);
            request.setAttribute("status", status);

            dispath(request, response, "Admin/order.jsp");

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
