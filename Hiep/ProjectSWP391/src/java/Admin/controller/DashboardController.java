/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin.controller;

import dao.DAOCustomer;
import dao.DAOOrder;
import dao.DAOOrderDetail;
import dao.DAOProduct;
import dao.DAOWarranty;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Customer;
import model.Order;
import model.OrderView;
import model.Product;
import model.ReportWarranty;
import model.TopLoyalCustomers;
import utils.SendGmail;

/**
 *
 * @author Lenovo
 */
public class DashboardController extends HttpServlet {

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

        DAOCustomer dao = new DAOCustomer();
        DAOProduct daoP = new DAOProduct();
        DAOOrder daoO = new DAOOrder();
        DAOOrderDetail daoOD = new DAOOrderDetail();
//        DAOWarranty daoW = new DAOWarranty();
        
//        int n = 0;
//        SendGmail gmail = new SendGmail();
        LocalDate currentDate = LocalDate.now();
        int year = currentDate.getYear();
        
//        ArrayList<ReportWarranty> rp = daoW.ReportWarranty(year);
//        String sendmail = "The product needs to be handled and maintained because "
//                + "the number of customers taking it for warranty is very large: ";
//        
//        for (ReportWarranty reportWarranty : rp) {
//            if (reportWarranty.getTotal_warranty() >= 5) {
//                ArrayList<Product> products = daoP.getProduct(reportWarranty.getProduct_id());
//                sendmail += " ID: " + products.get(0).getProduct_id() + "Name: " + products.get(0).getProduct_name();
//                n++;
//            }
//        }
//        
//        if(n>0){
//             gmail.sendOTPToEmail("hightech05vn@gmail.com", "", sendmail);
//        }

        double totalincome = daoO.getTotalIncome();
        int totalorder = daoO.getTotalOrder();
        int totalproduct = daoP.getTotalProduct();
        int totalproductsold = daoOD.getTotalProductSold();
        int totalcustomer = dao.getTotalCustomer();
        ArrayList<TopLoyalCustomers> list = dao.Toployalcustomers();
        ArrayList<OrderView> w = daoO.getAllStatusOrder("Wait");
        ArrayList<OrderView> p = daoO.getAllStatusOrder("Process");
        ArrayList<OrderView> d = daoO.getAllStatusOrder("Done");
        ArrayList<OrderView> c = daoO.getAllStatusOrder("Cancel");

        ArrayList<Integer> category = daoO.getChartCategory();
        ArrayList<String> categoryname = daoO.getChartCategoryName();

        int wait = 0;
        int process = 0;
        int done = 0;
        int cancel = 0;
        for (OrderView orderView : d) {
            done++;
        }
        for (OrderView orderView : w) {
            wait++;
        }
        for (OrderView orderView : p) {
            process++;
        }
        for (OrderView orderView : c) {
            cancel++;
        }

        request.setAttribute("category", category);
        request.setAttribute("categoryname", categoryname);

        request.setAttribute("totalincome", totalincome);
        request.setAttribute("totalorder", totalorder);
        request.setAttribute("totalproduct", totalproduct);
        request.setAttribute("totalproductsold", totalproductsold);
        request.setAttribute("totalcustomer", totalcustomer);
        request.setAttribute("data", list);
        request.setAttribute("wait", wait);
        request.setAttribute("process", process);
        request.setAttribute("done", done);
        request.setAttribute("cancel", cancel);

        String service = request.getParameter("service");
        if (service == null) {
            service = "displayAll";
        }

        if (service.equals("displayAll")) {
            double totalincomeyear = daoO.getTotalIncomeYear(year);

            int t1 = daoO.getChartTotalMoneyForYear(1, year);
            int t2 = daoO.getChartTotalMoneyForYear(2, year);
            int t3 = daoO.getChartTotalMoneyForYear(3, year);
            int t4 = daoO.getChartTotalMoneyForYear(4, year);
            int t5 = daoO.getChartTotalMoneyForYear(5, year);
            int t6 = daoO.getChartTotalMoneyForYear(6, year);
            int t7 = daoO.getChartTotalMoneyForYear(7, year);
            int t8 = daoO.getChartTotalMoneyForYear(8, year);
            int t9 = daoO.getChartTotalMoneyForYear(9, year);
            int t10 = daoO.getChartTotalMoneyForYear(10, year);
            int t11 = daoO.getChartTotalMoneyForYear(11, year);
            int t12 = daoO.getChartTotalMoneyForYear(12, year);

            request.setAttribute("t1", t1);
            request.setAttribute("t2", t2);
            request.setAttribute("t3", t3);
            request.setAttribute("t4", t4);
            request.setAttribute("t5", t5);
            request.setAttribute("t6", t6);
            request.setAttribute("t7", t7);
            request.setAttribute("t8", t8);
            request.setAttribute("t9", t9);
            request.setAttribute("t10", t10);
            request.setAttribute("t11", t11);
            request.setAttribute("t12", t12);
            request.setAttribute("year", year);
            request.setAttribute("totalincomeyear", totalincomeyear);
            dispath(request, response, "Admin/dashboard.jsp");
        }

        if (service.equals("searchTotalMoneyYear")) {
            int searchyear = Integer.parseInt(request.getParameter("year"));
            
            double totalincomeyear = daoO.getTotalIncomeYear(searchyear);
            
            int t1 = daoO.getChartTotalMoneyForYear(1, searchyear);
            int t2 = daoO.getChartTotalMoneyForYear(2, searchyear);
            int t3 = daoO.getChartTotalMoneyForYear(3, searchyear);
            int t4 = daoO.getChartTotalMoneyForYear(4, searchyear);
            int t5 = daoO.getChartTotalMoneyForYear(5, searchyear);
            int t6 = daoO.getChartTotalMoneyForYear(6, searchyear);
            int t7 = daoO.getChartTotalMoneyForYear(7, searchyear);
            int t8 = daoO.getChartTotalMoneyForYear(8, searchyear);
            int t9 = daoO.getChartTotalMoneyForYear(9, searchyear);
            int t10 = daoO.getChartTotalMoneyForYear(10, searchyear);
            int t11 = daoO.getChartTotalMoneyForYear(11, searchyear);
            int t12 = daoO.getChartTotalMoneyForYear(12, searchyear);

            request.setAttribute("t1", t1);
            request.setAttribute("t2", t2);
            request.setAttribute("t3", t3);
            request.setAttribute("t4", t4);
            request.setAttribute("t5", t5);
            request.setAttribute("t6", t6);
            request.setAttribute("t7", t7);
            request.setAttribute("t8", t8);
            request.setAttribute("t9", t9);
            request.setAttribute("t10", t10);
            request.setAttribute("t11", t11);
            request.setAttribute("t12", t12);
            request.setAttribute("year", searchyear);
            request.setAttribute("totalincomeyear", totalincomeyear);
            dispath(request, response, "Admin/dashboard.jsp");
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
