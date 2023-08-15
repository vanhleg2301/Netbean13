/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin.controller;

import dao.DAOOrderDetail;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import model.OrderDetail;

/**
 *
 * @author Lenovo
 */
public class OrderDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DAOOrderDetail dao = new DAOOrderDetail();

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
            ArrayList<OrderDetail> list = dao.pagingOrderDetail(pageNumber, pageSize);
            request.setAttribute("data", list);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("totalPages", dao.getTotalPages(pageSize));
            dispath(request, response, "Admin/orderdetail.jsp");
        }

        if (service.equals("updateOrderDetail")) {
            String submit = request.getParameter("submit");
            if (submit == null) {

                int id = Integer.parseInt(request.getParameter("orderdetail_id"));
                ArrayList<OrderDetail> list = dao.getOrderDetail(id);
                request.setAttribute("data", list);
                dispath(request, response, "");

            } else {

                int order_id = Integer.parseInt(request.getParameter("order_id"));
                int customer_id = Integer.parseInt(request.getParameter("customer_id"));
                int product_id = Integer.parseInt(request.getParameter("product_id"));
                String product_name = request.getParameter("product_name");
                String image = request.getParameter("image");
                double list_price = Double.parseDouble(request.getParameter("list_price"));
                int quantity_order = Integer.parseInt(request.getParameter("quantity_order"));
                int orderdetail_id = Integer.parseInt(request.getParameter("orderdetail_id"));

                OrderDetail od = new OrderDetail(orderdetail_id, order_id,
                        customer_id, product_id, product_name, image, list_price, quantity_order);

                dao.updateOrderDetail(od);

                response.sendRedirect("");
            }
        }

        if (service.equals("insertOrderDetail")) {

            int order_id = Integer.parseInt(request.getParameter("order_id"));
            int customer_id = Integer.parseInt(request.getParameter("customer_id"));
            int product_id = Integer.parseInt(request.getParameter("product_id"));
            String product_name = request.getParameter("product_name");
            String image = request.getParameter("image");
            double list_price = Double.parseDouble(request.getParameter("list_price"));
            int quantity_order = Integer.parseInt(request.getParameter("quantity_order"));

            OrderDetail od = new OrderDetail(0, order_id,
                    customer_id, product_id, product_name, image, list_price, quantity_order);

            dao.insertOrderDetail(od);
            
            response.sendRedirect("OrderDetailController");

        }

        if (service.equals("DetailOrderDetail")) {

            int order_id = Integer.parseInt(request.getParameter("id"));
            ArrayList<OrderDetail> orderDetails = dao.DetailOrderDetail(order_id);
            request.setAttribute("data", orderDetails);
            dispath(request, response, "Admin/orderdetail.jsp");

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
