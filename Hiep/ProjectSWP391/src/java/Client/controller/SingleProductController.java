/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Client.controller;

import dao.DAOComment;
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
import model.Comment;
import model.CommentView;
import model.Customer;
import model.Product;


/**
 *
 * @author Lenovo
 */
public class SingleProductController extends HttpServlet {

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

        String service = request.getParameter("service");
        DAOProduct dao = new DAOProduct();
        DAOComment daoC = new DAOComment();

        if (service == null) {
            service = "displayAll";
            String code = request.getPathInfo().substring(1);
            ArrayList<Product> products = dao.getProductByCode(code);
            ArrayList<CommentView> comments = daoC.listCommentProductByCode(code);
            ArrayList<Product> pro = dao.getRelatedProductsByCode(code);
            request.setAttribute("data", products);
            request.setAttribute("comment", comments);
            request.setAttribute("product_id", products.get(0).getProduct_id());
            request.setAttribute("relatepro", pro);
            request.getRequestDispatcher("/Client/single-product.jsp").forward(request, response);
        }

        if (service.equals("insertComment")) {
            HttpSession session = request.getSession(true);
            LocalDate localDate = LocalDate.now();
            Date date = Date.valueOf(localDate);
            Customer cus = (Customer) session.getAttribute("account");
            int id = Integer.parseInt(request.getParameter("product_id"));
            String content = request.getParameter("comment_content");

            Comment c = new Comment(0, id, cus.getCustomer_id(), date, content);
            daoC.insertComment(c);

            ArrayList<Product> products = dao.getProduct(id);
            ArrayList<CommentView> comments = daoC.listCommentProduct(id);
            ArrayList<Product> pro = dao.getRelatedProducts(id);
            request.setAttribute("data", products);
            request.setAttribute("comment", comments);
            request.setAttribute("product_id", id);
            request.setAttribute("relatepro", pro);
            request.getRequestDispatcher("Client/single-product.jsp").forward(request, response);
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
