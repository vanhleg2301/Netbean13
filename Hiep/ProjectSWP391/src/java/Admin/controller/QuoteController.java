/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin.controller;

import dao.DAOQuote;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Quote;
import utils.Vadidate;

/**
 *
 * @author Lenovo
 */
public class QuoteController extends HttpServlet {

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
        DAOQuote dao = new DAOQuote();

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
            ArrayList<Quote> list = dao.pagingQuote(pageNumber, pageSize);
            request.setAttribute("data", list);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("totalPages", dao.getTotalPages(pageSize));
            dispath(request, response, "Admin/quote.jsp");
        }

        if (service.equals("updateQuote")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                int news_id = Integer.parseInt(request.getParameter("id"));
                ArrayList<Quote> list = dao.getQuoteById(news_id);
                request.setAttribute("data", list);
                dispath(request, response, "Admin/update/updateQuote.jsp");
            } else {
                int news_id = Integer.parseInt(request.getParameter("id"));
                String content = request.getParameter("content");
                String author = request.getParameter("author");
                Quote q = new Quote(news_id, 0, content, author);
                dao.updateQuote(q);
                response.sendRedirect("QuoteController");
            }
        }

        if (service.equals("insertQuote")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                dispath(request, response, "Admin/add/addQuote.jsp");
            } else {
                String content = request.getParameter("content");
                String author = request.getParameter("author");
                Quote q = new Quote(0, 5, content, author);
                dao.insertQuote(q);
                response.sendRedirect("QuoteController");
            }
        }

        if (service.equals("deleteQuote")) {
            int news_id = Integer.parseInt(request.getParameter("id"));
            int n = dao.removeQuote(news_id);
            if (n <= 0) {
                ArrayList<Quote> list = dao.getAllQuote();
                String ms = "Cannot delete Quote";
                request.setAttribute("data", list);
                request.setAttribute("ms", ms);
                dispath(request, response, "Admin/quote.jsp");
            } else {
                response.sendRedirect("QuoteController");
            }
        }

        if (service.equals("searchQuote")) {
            String name = request.getParameter("name");
            ArrayList<Quote> list = dao.searchQuote(name);
            if (list.isEmpty()) {
                request.setAttribute("ms", "No Record Found");
                dispath(request, response, "Admin/quote.jsp");
            } else {
                request.setAttribute("data", list);
                dispath(request, response, "Admin/quote.jsp");
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
