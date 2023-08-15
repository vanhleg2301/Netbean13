/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Client.controller;

import dao.DAOCustomer;
import dao.DAOOrder;
import dao.DAOOrderDetail;
import dao.DAOProduct;
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
import java.util.Enumeration;
import model.Cart;
import model.Customer;
import model.Order;
import model.OrderDetail;
import model.Product;
import utils.SendGmail;
import utils.Vadidate;

/**
 *
 * @author Lenovo
 */
public class CheckoutGuestController extends HttpServlet {

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


        Vadidate v = new Vadidate();
        String service = request.getParameter("service");
        DAOCustomer daoC = new DAOCustomer();
        DAOOrderDetail daoOD = new DAOOrderDetail();
        DAOOrder daoO = new DAOOrder();
        DAOProduct daoP = new DAOProduct();
        HttpSession session = request.getSession(true);
        Enumeration<String> em = session.getAttributeNames();

        if (service == null) {
            service = "displayAll";
        }

        if (service.equals("displayAll")) {

            ArrayList<Cart> carts = new ArrayList<>();
            while (em.hasMoreElements()) {
                String id = em.nextElement();
                if (!id.equals("account")) {
                    if (v.checkPhone(id)) {
                        String count = session.getAttribute(id).toString();
                        int idpro = Integer.parseInt(id);
                        int quantity = Integer.parseInt(count);
                        ArrayList<Product> products = daoP.getProduct(idpro);
                        double price = Math.ceil((1 - products.get(0).getDiscount()) * products.get(0).getList_price());
                        double subprice
                                = Math.ceil(price * quantity);
                        carts.add(new Cart(idpro, products.get(0).getProduct_name(), products.get(0).getImage(),
                                price, quantity, subprice));
                    }
                }
            }
            double totalprice = 0;
            for (int i = 0; i < carts.size(); i++) {
                totalprice = totalprice + carts.get(i).getSubtotal();
            }
            request.setAttribute("totalprice", totalprice);
            request.getRequestDispatcher("Client/checkout.jsp").forward(request, response);
        }

        if (service.equals("addOrder")) {
            // Tao acccount va send mat khau!
            SendGmail gmail = new SendGmail();
            String name_receiver = request.getParameter("name_receiver");
            String phone_receiver = request.getParameter("phone_receiver");
            String address_receiver = request.getParameter("address_receiver");
            String gmail_receiver = request.getParameter("gmail_receiver");
            String gender = request.getParameter("gender");

            if (v.checkAccountGmailCustomer(gmail_receiver) == true
                    && v.checkPhone(phone_receiver) == true && v.checkGmail(gmail_receiver) == true) {

                String password = v.generateRandomString();
                gmail.sendOTPToEmail(gmail_receiver, password, "Your username: " + gmail_receiver + " and password: " + password);
                String hasspassword = v.hashPassword(password);
                if (gender.equals("1")) {
                    daoC.insertGuestCustomer(name_receiver, phone_receiver,
                            gmail_receiver, true, address_receiver, gmail_receiver, hasspassword, "Active");
                } else {
                    daoC.insertGuestCustomer(name_receiver, phone_receiver,
                            gmail_receiver, false, address_receiver, gmail_receiver, hasspassword, "Active");
                }
            } else {
                if (v.checkGmail(gmail_receiver) == false) {
                    String ms1 = "gmail have must have '@' ";
                    request.setAttribute("ms1", ms1);
                }
                if (v.checkPhone(phone_receiver) == false) {
                    String ms2 = "Phone is full number";
                    request.setAttribute("ms2", ms2);
                }
                if (v.checkAccountGmailCustomer(gmail_receiver) == false) {
                    String ms3 = "gmail is exist! pls enter another gmail";
                    request.setAttribute("ms3", ms3);
                }
                ArrayList<Cart> carts = new ArrayList<>();
                while (em.hasMoreElements()) {
                    String id = em.nextElement();
                    if (!id.equals("account")) {
                        String count = session.getAttribute(id).toString();
                        int idpro = Integer.parseInt(id);
                        int quantity = Integer.parseInt(count);
                        ArrayList<Product> products = daoP.getProduct(idpro);
                        double price = Math.ceil((1 - products.get(0).getDiscount()) * products.get(0).getList_price());
                        double subprice
                                = Math.ceil(price * quantity);
                        carts.add(new Cart(idpro, products.get(0).getProduct_name(), products.get(0).getImage(),
                                price, quantity, subprice));
                    }
                }
                double totalprice = 0;
                for (int i = 0; i < carts.size(); i++) {
                    totalprice = totalprice + carts.get(i).getSubtotal();
                }
                request.setAttribute("totalprice", totalprice);
                request.getRequestDispatcher("Client/checkout.jsp").forward(request, response);
            }

            ArrayList<Customer> cus = daoC.getCustomerUsername(gmail_receiver);

            LocalDate localDate = LocalDate.now();
            Date date = Date.valueOf(localDate);
            double total_price = Double.parseDouble(request.getParameter("total_price"));
            String payment = request.getParameter("payment");
            String status = request.getParameter("status");

            if (payment.equals("Ship COD")) {
                Order o = new Order(0, cus.get(0).getCustomer_id(), name_receiver,
                        phone_receiver, address_receiver, total_price, date, payment, status);
                daoO.insertOrder(o);
                ArrayList<OrderDetail> details = new ArrayList<>();
                while (em.hasMoreElements()) {
                    String id = em.nextElement();
                    if (!id.equals("account")) {
                        String count = session.getAttribute(id).toString();
                        int idpro = Integer.parseInt(id);
                        int quantity = Integer.parseInt(count);
                        ArrayList<Product> products = daoP.getProduct(idpro);
                        double price = Math.ceil((1 - products.get(0).getDiscount()) * products.get(0).getList_price());
                        double subprice
                                = Math.ceil(price * quantity);
                        details.add(new OrderDetail(0, 0, cus.get(0).getCustomer_id(),
                                products.get(0).getProduct_id(), products.get(0).getProduct_name(),
                                products.get(0).getImage(), subprice, quantity));
                    }
                }
                int n = 0;
                ArrayList<Order> orders = daoO.getAllOrder();
                for (Order order : orders) {
                    n++;
                }
                // nen sua
                for (OrderDetail detail : details) {
                    detail.setOrder_id(n);
                }
                for (OrderDetail detail : details) {
                    OrderDetail od = new OrderDetail(0, detail.getOrder_id(), detail.getCustomer_id(), detail.getProduct_id(),
                            detail.getProduct_name(), detail.getImage(), detail.getList_price(), detail.getQuantity_order());
                    daoOD.insertOrderDetail(od);
                }
                response.sendRedirect("CartController?service=checkoutCart");
            }
            if (payment.equals("Payment by Card")) {

                Order o = new Order(0, cus.get(0).getCustomer_id(), name_receiver,
                        phone_receiver, address_receiver, total_price, date, payment, status);

                session.setAttribute("order", o);

                ArrayList<OrderDetail> details = new ArrayList<>();
                while (em.hasMoreElements()) {
                    String id = em.nextElement();
                    if (!id.equals("account")) {
                        String count = session.getAttribute(id).toString();
                        int idpro = Integer.parseInt(id);
                        int quantity = Integer.parseInt(count);
                        ArrayList<Product> products = daoP.getProduct(idpro);
                        double price = Math.ceil((1 - products.get(0).getDiscount()) * products.get(0).getList_price());
                        double subprice
                                = Math.ceil(price * quantity);
                        details.add(new OrderDetail(0, 0, cus.get(0).getCustomer_id(),
                                products.get(0).getProduct_id(), products.get(0).getProduct_name(),
                                products.get(0).getImage(), subprice, quantity));
                    }
                }
                int n = 1;
                ArrayList<Order> orders = daoO.getAllOrder();
                for (Order order : orders) {
                    n++;
                }
                // nen sua
                for (OrderDetail detail : details) {
                    detail.setOrder_id(n);
                }
                for (OrderDetail detail : details) {
                    OrderDetail od = new OrderDetail(0, detail.getOrder_id(), detail.getCustomer_id(), detail.getProduct_id(),
                            detail.getProduct_name(), detail.getImage(), detail.getList_price(), detail.getQuantity_order());
                    session.setAttribute("orderdetail", od);
                }

                // tra ve vnpay de thanh toan 
                int totalprice = (int) (total_price);
                request.setAttribute("totalprice", totalprice);
                request.getRequestDispatcher("Client/VNPAY.jsp").forward(request, response);
            }
        }

        if (service.equals("VNPAY")) {
            String status = request.getParameter("status");
            if (status.equals("Success")) {
                while (em.hasMoreElements()) {
                    String id = em.nextElement();
                    if (id.equals("order")) {
                        Order order = (Order) session.getAttribute("order");
                        daoO.insertOrder(order);
                    } else if (id.equals("orderdetail")) {
                        OrderDetail orderdetail = (OrderDetail) session.getAttribute("orderdetail");
                        daoOD.insertOrderDetail(orderdetail);
                    }
                }
                response.sendRedirect("CartController?service=checkoutCart");
            } else {
                while (em.hasMoreElements()) {
                    String id = em.nextElement();
                    if (id.equals("order")) {
                        session.removeAttribute("order");
                    } else if (id.equals("orderdetail")) {
                        session.removeAttribute("orderdetail");
                    }
                }
                request.setAttribute("ms", "Fail to Order!");
                response.sendRedirect("CartController");
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
