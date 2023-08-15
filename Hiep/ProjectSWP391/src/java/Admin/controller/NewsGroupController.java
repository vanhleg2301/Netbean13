/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin.controller;

import dao.DAONewsGroup;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.NewsGroup;

/**
 *
 * @author Lenovo
 */
public class NewsGroupController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

       DAONewsGroup dao = new DAONewsGroup();

        String service = request.getParameter("service");
        int pageNumber = 1;
        int pageSize = 4;
        if (service == null) {
            service = "displayAll";
        }

        String pageNumberParam = request.getParameter("page");
        if (pageNumberParam != null && !pageNumberParam.isEmpty()) {
            pageNumber = Integer.parseInt(pageNumberParam);
        }

        if (service.equals("displayAll")) {
            ArrayList<NewsGroup> list = dao.pagingNewsGroup(pageNumber, pageSize);
            request.setAttribute("data", list);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("totalPages", dao.getTotalPages(pageSize));
            dispath(request, response, "Admin/newsgroup.jsp");
        }

        if (service.equals("updateNewsGroup")) {
            String submit = request.getParameter("submit");
            if (submit == null) {

                int id = Integer.parseInt(request.getParameter("id"));
                ArrayList<NewsGroup> list = dao.getNewsGroup(id);
                request.setAttribute("data", list);
                dispath(request, response, "Admin/update/updateNewsGroup.jsp");

            } else {

                String name = request.getParameter("name");
                int id = Integer.parseInt(request.getParameter("id"));

                NewsGroup ng = new NewsGroup(id, name);

                dao.updateNewsGroup(ng);

                response.sendRedirect("NewsGroupController");
            }
        }

        if (service.equals("insertNewsGroup")) {
            String submit = request.getParameter("submit");
            if (submit == null) {

                dispath(request, response, "Admin/add/addNewsGroup.jsp");

            } else {

                String name = request.getParameter("name");

                NewsGroup ng = new NewsGroup(0, name);

                dao.insertNewsGroup(ng);

                response.sendRedirect("NewsGroupController");
            }
        }

        if (service.equals("deleteNewsGroup")) {
            int id = Integer.parseInt(request.getParameter("id"));
            int n = dao.deleteNewsGroup(id);
            if (n <= 0) {
                ArrayList<NewsGroup> list = dao.getAllNewsGroup();
                String ms = "Cannot delete NewsGroup";
                request.setAttribute("ms", ms);
                request.setAttribute("data", list);
                dispath(request, response, "Admin/newsgroup.jsp");
            } else {
                response.sendRedirect("NewsGroupController");
            }
        }

        if (service.equals("searchNewsGroup")) {
            String name = request.getParameter("name");
            ArrayList<NewsGroup> list = dao.searchNewsGroup(name);
             if (list.isEmpty()) {
                request.setAttribute("ms", "No Record Found");
                dispath(request, response, "Admin/newsgroup.jsp");
            } else {
                request.setAttribute("data", list);
                dispath(request, response, "Admin/newsgroup.jsp");
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
