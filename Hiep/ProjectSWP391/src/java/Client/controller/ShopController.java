/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Client.controller;

import dao.DAOBrand;
import dao.DAOCategory;
import dao.DAOProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author Lenovo
 */
public class ShopController extends HttpServlet {

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
     

        DAOProduct daoP = new DAOProduct();
        DAOCategory daoC = new DAOCategory();
        DAOBrand daoB = new DAOBrand();

        ArrayList<Category> categorys = new ArrayList<>();
        ArrayList<Brand> brands = new ArrayList<>();
        ArrayList<Product> products = new ArrayList<>();

        int pageNumber = 1;
        int pageSize = 6;

        String pageNumberParam = request.getParameter("page");
        if (pageNumberParam != null && !pageNumberParam.isEmpty()) {
            pageNumber = Integer.parseInt(pageNumberParam);
        }

        String service = request.getParameter("service");
        if (service == null) {
            service = "displayAll";
        }

        if (service.equals("displayAll")) {
            products = daoP.pagingProduct(pageNumber, pageSize);
            categorys = daoC.getAllCategory();
            brands = daoB.getAllBrand();

            request.setAttribute("data", products);
            request.setAttribute("listC", categorys);
            request.setAttribute("listB", brands);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("totalPages", daoP.getTotalPages(pageSize));

            request.getRequestDispatcher("Client/shop.jsp").forward(request, response);
        }
        if (service.equals("displayProductbyCategory")) {
            int id = Integer.parseInt(request.getParameter("id"));

            products = daoP.searchProductByCategory(id, pageNumber, pageSize);
            categorys = daoC.getAllCategory();
            brands = daoB.getAllBrand();

            request.setAttribute("data", products);
            request.setAttribute("listC", categorys);
            request.setAttribute("listB", brands);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("sv", "displayProductbyCategory");
            request.setAttribute("id", id);
            request.setAttribute("totalPages", daoP.getTotalPagesByCategory(id, pageSize));

            request.getRequestDispatcher("Client/shop.jsp").forward(request, response);
        }
        if (service.equals("displayProductbyBrand")) {
            int id = Integer.parseInt(request.getParameter("id"));

            products = daoP.searchProductByBrand(id, pageNumber, pageSize);
            categorys = daoC.getAllCategory();
            brands = daoB.getAllBrand();

            request.setAttribute("data", products);
            request.setAttribute("listC", categorys);
            request.setAttribute("listB", brands);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("sv", "displayProductbyBrand");
            request.setAttribute("id", id);
            request.setAttribute("totalPages", daoP.getTotalPagesByBrand(id, pageSize));

            request.getRequestDispatcher("Client/shop.jsp").forward(request, response);
        }
        if (service.equals("displayProductbyName")) {
            String name = request.getParameter("name");
            products = daoP.searchProductByName(name, pageNumber, pageSize);
            categorys = daoC.getAllCategory();
            brands = daoB.getAllBrand();

            request.setAttribute("data", products);
            request.setAttribute("listC", categorys);
            request.setAttribute("listB", brands);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("sv", "displayProductbyName");
            request.setAttribute("name", name);
            request.setAttribute("totalPages", daoP.getTotalPagesByName(name, pageSize));

            request.getRequestDispatcher("Client/shop.jsp").forward(request, response);
        }

        if (service.equals("displayProductByPrice")) {
            String priceRange = request.getParameter("priceRange");
            double minPrice = 0;
            double maxPrice = 0;

            if (priceRange.equals("0-500")) {
                minPrice = 0;
                maxPrice = 5000000;
            }
            if (priceRange.equals("500-1000")) {
                minPrice = 5000000;
                maxPrice = 10000000;
            }
            if (priceRange.equals("1000-2000")) {
                minPrice = 10000000;
                maxPrice = 20000000;
            }
            if (priceRange.equals("2000-")) {
                minPrice = 20000000;
                maxPrice = Double.MAX_VALUE;
            }

            products = daoP.searchProductByPriceRange(minPrice, maxPrice, pageNumber, pageSize);
            categorys = daoC.getAllCategory();
            brands = daoB.getAllBrand();

            request.setAttribute("data", products);
            request.setAttribute("listC", categorys);
            request.setAttribute("listB", brands);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("sv", "displayProductByPrice");
            request.setAttribute("priceRange", priceRange);
            request.setAttribute("totalPages", daoP.getTotalPagesByPriceRange(minPrice, maxPrice, pageSize));

            request.getRequestDispatcher("Client/shop.jsp").forward(request, response);
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
