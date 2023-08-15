/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Client.controller;

import dao.DAOAboutUs;
import dao.DAONews;
import dao.DAOQuote;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.AboutUs;
import model.NewsView;
import model.Quote;
import utils.Vadidate;

/**
 *
 * @author Lenovo
 */
public class AboutCustomerController extends HttpServlet {

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
        DAOAboutUs daoA = new DAOAboutUs();
        DAONews daoN = new DAONews();
        DAOQuote dao = new DAOQuote();
        Vadidate v = new Vadidate();
        ArrayList<AboutUs> list = daoA.getAllAboutUs();
        ArrayList<Quote> list4 = dao.getTop1Quote();
        ArrayList<NewsView> list3 = daoN.getTop3News();
        for (NewsView newsView : list3) {
            newsView.setMonth(v.convertMonthNumberToName(newsView.getMonth()));
        }
        ArrayList<Quote> quoteall = dao.getAllQuote();
        request.setAttribute("about", list);
         request.setAttribute("allquote", quoteall);
        request.setAttribute("news", list3);
        request.setAttribute("quote", list4);
        request.getRequestDispatcher("Client/about.jsp").forward(request, response);
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
