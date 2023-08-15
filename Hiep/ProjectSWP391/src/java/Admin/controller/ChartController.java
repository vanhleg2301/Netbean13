/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin.controller;

import dao.DAOOrder;
import dao.DAOWarranty;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;

/**
 *
 * @author Lenovo
 */
public class ChartController extends HttpServlet {

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

        DAOOrder daoO = new DAOOrder();
        DAOWarranty daoW = new DAOWarranty();

        LocalDate currentDate = LocalDate.now();
        int year = currentDate.getYear();
        int month = currentDate.getMonthValue();
        int dayOfMonth = currentDate.getDayOfMonth();

        int warrantyWait = daoW.getChartStatusWarranty("Wait");
        int warrantyProcess = daoW.getChartStatusWarranty("Process");
        int warrantyDone = daoW.getChartStatusWarranty("Done");

        int orderWait = daoO.getChartStatusOrder("Wait");
        int orderProcess = daoO.getChartStatusOrder("Process");
        int orderDone = daoO.getChartStatusOrder("Done");
        int orderCancel = daoO.getChartStatusOrder("Cancel");

        int m1 = daoO.getChartTotalIncomeWeek(dayOfMonth - 6, month, year);
        int m2 = daoO.getChartTotalIncomeWeek(dayOfMonth - 5, month, year);
        int m3 = daoO.getChartTotalIncomeWeek(dayOfMonth - 4, month, year);
        int m4 = daoO.getChartTotalIncomeWeek(dayOfMonth - 3, month, year);
        int m5 = daoO.getChartTotalIncomeWeek(dayOfMonth - 2, month, year);
        int m6 = daoO.getChartTotalIncomeWeek(dayOfMonth - 1, month, year);
        int m7 = daoO.getChartTotalIncomeWeek(dayOfMonth, month, year);

        int o1 = daoO.getChartTotalOrderWeek(dayOfMonth - 6, month, year);
        int o2 = daoO.getChartTotalOrderWeek(dayOfMonth - 5, month, year);
        int o3 = daoO.getChartTotalOrderWeek(dayOfMonth - 4, month, year);
        int o4 = daoO.getChartTotalOrderWeek(dayOfMonth - 3, month, year);
        int o5 = daoO.getChartTotalOrderWeek(dayOfMonth - 2, month, year);
        int o6 = daoO.getChartTotalOrderWeek(dayOfMonth - 1, month, year);
        int o7 = daoO.getChartTotalOrderWeek(dayOfMonth, month, year);

        // chart 
        request.setAttribute("warrantyWait", warrantyWait);
        request.setAttribute("warrantyProcess", warrantyProcess);
        request.setAttribute("warrantyDone", warrantyDone);

        // Chart 
        request.setAttribute("orderWait", orderWait);
        request.setAttribute("orderProcess", orderProcess);
        request.setAttribute("orderDone", orderDone);
        request.setAttribute("orderCancel", orderCancel);

        // Chart
        request.setAttribute("o1", o1);
        request.setAttribute("o2", o2);
        request.setAttribute("o3", o3);
        request.setAttribute("o4", o4);
        request.setAttribute("o5", o5);
        request.setAttribute("o6", o6);
        request.setAttribute("o7", o7);

        // Chart
        request.setAttribute("m1", m1);
        request.setAttribute("m2", m2);
        request.setAttribute("m3", m3);
        request.setAttribute("m4", m4);
        request.setAttribute("m5", m5);
        request.setAttribute("m6", m6);
        request.setAttribute("m7", m7);
        
        
        // Day month year
        request.setAttribute("day", dayOfMonth);
        request.setAttribute("month", month);
        request.setAttribute("year", year);
        
        request.getRequestDispatcher("Admin/charts.jsp").forward(request, response);
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
