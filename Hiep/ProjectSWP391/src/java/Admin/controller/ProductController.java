/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin.controller;

import dao.DAOBrand;
import dao.DAOCategory;
import dao.DAOProduct;
import dao.DAOWarranty;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Brand;
import model.Category;
import model.Product;
import model.ProductView;
import model.ReportWarranty;

/**
 *
 * @author Lenovo
 */
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DAOProduct dao = new DAOProduct();
        DAOCategory daoC = new DAOCategory();
        DAOBrand daoB = new DAOBrand();
        DAOWarranty daoW = new DAOWarranty();
        LocalDate currentDate = LocalDate.now();
        int year = currentDate.getYear();
        ArrayList<ReportWarranty> rp = daoW.ReportWarranty(year);
        request.setAttribute("totalwarrantyofproduct", rp);
        int pageNumber = 1;
        int pageSize = 8;

        String pageNumberParam = request.getParameter("page");
        if (pageNumberParam != null && !pageNumberParam.isEmpty()) {
            pageNumber = Integer.parseInt(pageNumberParam);
        }

        String service = request.getParameter("service");
        if (service == null) {
            service = "displayAll";
        }

        if (service.equals("displayAll")) {
            ArrayList<ProductView> list = dao.pagingProductView(pageNumber, pageSize);
            request.setAttribute("data", list);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("totalPages", dao.getTotalPages(pageSize));
            dispath(request, response, "Admin/product.jsp");
        }

        if (service.equals("updateProduct")) {
            String submit = request.getParameter("submit");
            if (submit == null) {

                int id = Integer.parseInt(request.getParameter("id"));

                ArrayList<Product> list = dao.getProduct(id);
                ArrayList<Category> categorys = daoC.getAllCategory();
                ArrayList<Brand> brands = daoB.getAllBrand();

                request.setAttribute("data", list);
                request.setAttribute("listC", categorys);
                request.setAttribute("listB", brands);

                dispath(request, response, "Admin/update/updateProduct.jsp");

            } else {
                String image;
                String product_name = request.getParameter("product_name");
                String sub_description = request.getParameter("sub_description");
                String description = request.getParameter("description");
                String img = request.getParameter("image");
                if (img.isEmpty()) {
                    image = request.getParameter("imageoriginal");
                } else {
                    image = "images/product/" + img;
                }

                double list_price = Double.parseDouble(request.getParameter("list_price"));
                double discount = Double.parseDouble(request.getParameter("discount"));
                int category_id = Integer.parseInt(request.getParameter("category_id"));
                int brand_id = Integer.parseInt(request.getParameter("brand_id"));
                String status = request.getParameter("status");
                int product_id = Integer.parseInt(request.getParameter("id"));

                Product p = new Product(product_id, product_name, sub_description, description,
                        image, list_price, discount, category_id, brand_id, status, "");

                dao.updateProduct(p);

                response.sendRedirect("ProductController");
            }
        }

        if (service.equals("insertProduct")) {
            String submit = request.getParameter("submit");
            if (submit == null) {

                ArrayList<Category> categorys = daoC.getAllCategory();
                ArrayList<Brand> brands = daoB.getAllBrand();

                request.setAttribute("listC", categorys);
                request.setAttribute("listB", brands);
                dispath(request, response, "Admin/add/addProduct.jsp");

            } else {

                String product_name = request.getParameter("product_name");
                String sub_description = request.getParameter("sub_description");
                String description = request.getParameter("description");
                String image = "images/product/" + request.getParameter("image");
                double list_price = Double.parseDouble(request.getParameter("list_price"));
                double discount = Double.parseDouble(request.getParameter("discount"));
                int category_id = Integer.parseInt(request.getParameter("category_id"));
                int brand_id = Integer.parseInt(request.getParameter("brand_id"));
                String status = request.getParameter("status");

                Product p = new Product(0, product_name, sub_description, description,
                        image, list_price, discount, category_id, brand_id, status, "");

                dao.insertProduct(p);

                response.sendRedirect("ProductController");
            }
        }

        if (service.equals("deleteProduct")) {
            int id = Integer.parseInt(request.getParameter("id"));
            int n = dao.deleteProduct(id);
            if (n <= 0) {
                ArrayList<ProductView> list = dao.getAllProduct();
                String ms = "Cannot delete Product";
                request.setAttribute("ms", ms);
                request.setAttribute("data", list);
                dispath(request, response, "Admin/product.jsp");
            } else {
                response.sendRedirect("ProductController");
            }
        }

        if (service.equals("displayProductWarranty")) {
            ArrayList<ProductView> list = dao.pagingProductViewWarranty(pageNumber, pageSize);
            request.setAttribute("data", list);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("totalPages", dao.getTotalPages(pageSize));
            dispath(request, response, "Admin/product.jsp");
        }

        if (service.equals("searchProduct")) {
            String name = request.getParameter("name");
            ArrayList<ProductView> list = dao.searchProduct(name);
            if (list.isEmpty()) {
                request.setAttribute("ms", "No Record Found");
                dispath(request, response, "Admin/product.jsp");
            } else {
                request.setAttribute("data", list);
                dispath(request, response, "Admin/product.jsp");
            }
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
