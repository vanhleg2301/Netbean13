/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Client.controller;

import dao.DAOProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Enumeration;
import model.Cart;
import model.Product;
import utils.Vadidate;

/**
 *
 * @author Lenovo
 */
public class CartController extends HttpServlet {

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

        

        DAOProduct dao = new DAOProduct();
        Vadidate v = new Vadidate();
        HttpSession session = request.getSession();
        Enumeration<String> em = session.getAttributeNames();
        String service = request.getParameter("service");
        if (service == null) {
            service = "displayAll";
        }
        if (service.equals("displayAll")) {
            if (!session.isNew()) {
                ArrayList<Cart> carts = new ArrayList<>();
                while (em.hasMoreElements()) {
                    String id = em.nextElement();
                    if (!id.equals("account")) {
                        String count = session.getAttribute(id).toString();
                        if (v.checkPhone(id) == true) {
                            int idpro = Integer.parseInt(id);
                            int quantity = Integer.parseInt(count);
                            ArrayList<Product> products = dao.getProduct(idpro);
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

                request.setAttribute("listCart", carts);
                request.setAttribute("totalprice", totalprice);

                request.getRequestDispatcher("Client/cart.jsp").forward(request, response);
            } else {
                request.setAttribute("listCart", null);
                request.setAttribute("totalprice", null);
                request.getRequestDispatcher("Client/cart.jsp").forward(request, response);
            }

        }

        if (service.equals("addToCart")) {
            String id = request.getParameter("id");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            Object value = session.getAttribute(id);
            String quantitynull = String.valueOf(quantity);
            if (value == null) {
                session.setAttribute(id, quantitynull);
            } else {
                int count = Integer.parseInt(value.toString()) + quantity;
                session.setAttribute(id, String.valueOf(count));
            }
            response.sendRedirect("HomeController");
        }

        if (service.equals("deleteCart")) {
            String idpro = request.getParameter("id");
            while (em.hasMoreElements()) {
                String id = em.nextElement();
                if (idpro.equals(id)) {
                    session.removeAttribute(id);
                }
            }
            response.sendRedirect("CartController");
        }

        if (service.equals("updateCart")) {
            Enumeration<String> parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements()) {

                String paramName = parameterNames.nextElement();
                if (paramName.startsWith("id")) {
                    String index = paramName.substring(2); // Lấy chỉ số sau chuỗi "id"
                    String idpro = request.getParameter(paramName);
                    String quantity = request.getParameter("quantity" + index);
                    Enumeration<String> update = session.getAttributeNames();
                    while (update.hasMoreElements()) {
                        String id = update.nextElement();
                        if (idpro.equals(id)) {
                            session.setAttribute(id, quantity);
                        }
                    }
                }
            }
            response.sendRedirect("CartController");
        }

        if (service.equals("checkoutCart")) {
            while (em.hasMoreElements()) {
                String product = em.nextElement();
                if (!product.equals("account")) {
                    session.removeAttribute(product);
                }
            }
            request.setAttribute("ms", "Order Successfully.");
            response.sendRedirect("CartController");
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
