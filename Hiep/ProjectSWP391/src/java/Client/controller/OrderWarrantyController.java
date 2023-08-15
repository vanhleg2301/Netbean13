/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Client.controller;


import dao.DAOOrderDetail;
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
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import model.AddWarranty;
import model.Customer;
import model.OrderDetail;
import model.OrderWarranty;
import model.Warranty;

/**
 *
 * @author Lenovo
 */
public class OrderWarrantyController extends HttpServlet {

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
        DAOOrderDetail daoOD = new DAOOrderDetail();
        String service = request.getParameter("service");
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("account");
        if (service == null) {
            service = "displayAll";
        }

        if (service.equals("displayAll")) {
            ArrayList<Warranty> list = dao.OrderWarrantyCheckFor(cus.getCustomer_id());
            if (list.isEmpty()) {
                ArrayList<OrderWarranty> list1 = dao.OrderWarrantyIFNULLCustomer(cus.getCustomer_id());
                request.setAttribute("data", list1);
                request.getRequestDispatcher("Client/orderwarranty.jsp").forward(request, response);
            } else {
                ArrayList<OrderWarranty> list2 = dao.OrderWarrantyCustomer(cus.getCustomer_id());
                request.setAttribute("data", list2);
                request.getRequestDispatcher("Client/orderwarranty.jsp").forward(request, response);
            }
        }

        if (service.equals("AddWarranty")) {
            int id = Integer.parseInt(request.getParameter("id"));
            ArrayList<AddWarranty> list = daoOD.getOrderDetailWarranty(id);
            request.setAttribute("data", list);
            request.getRequestDispatcher("Client/addwarranty.jsp").forward(request, response);
        }

        if (service.equals("insertWarranty")) {
            
            int customer_id = Integer.parseInt(request.getParameter("customer_id"));
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            
            int product_id = Integer.parseInt(request.getParameter("product_id"));
            String product_name = request.getParameter("product_name");
            String image = request.getParameter("image");
            
            int orderdetail_id = Integer.parseInt(request.getParameter("orderdetail_id"));
           
            
            String image_product = "images/product/"+request.getParameter("image_product");
            String product_status = request.getParameter("product_status");
          
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            String order_date = request.getParameter("order_date");
            LocalDate dobStr = LocalDate.parse(order_date);
            LocalDate localDate = LocalDate.now();
            // Date
            Date date = Date.valueOf(localDate);
            Period age = Period.between(dobStr, localDate);
            
            // warranty
            String warranty_status;
            if(age.getYears()>=1){
                warranty_status = "Void";
            }else{
                warranty_status = "Still Valid";
            }
            String status = request.getParameter("status");            
            Warranty w = new Warranty(0, orderdetail_id, product_id, customer_id,
                    name, phone, product_name, image, image_product, product_status,
                    date, warranty_status, quantity, status,null,null,null);

            dao.insertWarranty(w);

            response.sendRedirect("WarrantyCustomerController");
        }

    }

    void dispath(HttpServletRequest request, HttpServletResponse response,
            String url) throws ServletException, IOException {
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
