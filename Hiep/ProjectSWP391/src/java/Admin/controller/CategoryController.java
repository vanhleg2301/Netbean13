/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin.controller;

import dao.DAOCategory;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Category;

/**
 *
 * @author Lenovo
 */
public class CategoryController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DAOCategory dao = new DAOCategory();

        String service = request.getParameter("service");
        int pageNumber = 1;
        int pageSize = 6;
        if (service == null) {
            service = "displayAll";
        }

        String pageNumberParam = request.getParameter("page");
        if (pageNumberParam != null && !pageNumberParam.isEmpty()) {
            pageNumber = Integer.parseInt(pageNumberParam);
        }

        if (service.equals("displayAll")) {

            ArrayList<Category> list = dao.pagingCategory(pageNumber, pageSize);
            request.setAttribute("data", list);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("totalPages", dao.getTotalPages(pageSize));
            dispath(request, response, "Admin/category.jsp");
        }

        if (service.equals("updateCategory")) {

            String submit = request.getParameter("submit");

            if (submit == null) {

                int id = Integer.parseInt(request.getParameter("id"));
                ArrayList<Category> list = dao.getCategory(id);
                request.setAttribute("data", list);
                dispath(request, response, "Admin/update/updateCategory.jsp");

            } else {

                int category_id = Integer.parseInt(request.getParameter("id"));
                String category_name = request.getParameter("name");

                Category c = new Category(category_id, category_name);

                dao.updateCategory(c);

                response.sendRedirect("CategoryController");
            }
        }

        if (service.equals("insertCategory")) {

            String submit = request.getParameter("submit");

            if (submit == null) {

                dispath(request, response, "Admin/add/addCategory.jsp");

            } else {

                String category_name = request.getParameter("name");

                Category c = new Category(0, category_name);

                dao.insertCategory(c);

                response.sendRedirect("CategoryController");
            }
        }

        if (service.equals("deleteCategory")) {
            int id = Integer.parseInt(request.getParameter("id"));
            int n = dao.deleteCategory(id);
            if (n <= 0) {
                ArrayList<Category> list = dao.getAllCategory();
                String ms = "Cannot delete Category";
                request.setAttribute("ms", ms);
                request.setAttribute("data", list);
                response.sendRedirect("CategoryController");
            } else {
                response.sendRedirect("CategoryController");
            }
        }

        if (service.equals("searchCategory")) {
            String name = request.getParameter("name");
            ArrayList<Category> list = dao.searchCategory(name);
          if (list.isEmpty()) {
                request.setAttribute("ms", "No Record Found");
                dispath(request, response, "Admin/category.jsp");
            } else {
                request.setAttribute("data", list);
                dispath(request, response, "Admin/category.jsp");
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
