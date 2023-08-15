/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin.controller;

import dao.DAOAdmin;
import dao.DAOWarranty;
import jakarta.servlet.RequestDispatcher;
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
import model.Admin;
import model.Warranty;

/**
 *
 * @author Lenovo
 */
public class WarrantyController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DAOWarranty dao = new DAOWarranty();
        DAOAdmin daoA = new DAOAdmin();
        ArrayList<Warranty> w = dao.getAllStatusWarranty("Wait");
        ArrayList<Warranty> p = dao.getAllStatusWarranty("Process");
        ArrayList<Warranty> d = dao.getAllStatusWarranty("Done");
        HttpSession session = request.getSession();
        Admin ad = (Admin) session.getAttribute("account");

        int wait = 0;
        int process = 0;
        int done = 0;

        for (Warranty warranty : d) {
            done++;
        }
        for (Warranty warranty : w) {
            wait++;
        }
        for (Warranty warranty : p) {
            process++;
        }

        request.setAttribute("wait", wait);
        request.setAttribute("process", process);
        request.setAttribute("done", done);

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
            ArrayList<Warranty> list = dao.pagingWarranty(pageNumber, pageSize);
            ArrayList<Admin> admin = daoA.getAdmin(ad.getAdmin_id());
            request.setAttribute("data", list);
            request.setAttribute("admin", admin.get(0));
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("totalPages", dao.getTotalPages(pageSize));
            dispath(request, response, "Admin/warranty.jsp");
        }

        if (service.equals("displayWarrantyStatus")) {
            String status = request.getParameter("status");
            ArrayList<Warranty> list = dao.getAllStatusWarranty(status);
            ArrayList<Admin> admin = daoA.getAdmin(ad.getAdmin_id());
            request.setAttribute("admin", admin.get(0));
            request.setAttribute("data", list);
            request.setAttribute("status", status);
            dispath(request, response, "Admin/warranty.jsp");
        }

        if (service.equals("updateWarrantyforAdmin")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                int id = Integer.parseInt(request.getParameter("id"));
                ArrayList<Warranty> list = dao.getWarrantyForID(id);
                request.setAttribute("data", list);
                dispath(request, response, "Admin/update/updateWarranty.jsp");
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                String image = "images/product/" + request.getParameter("image");
                String status = request.getParameter("status");
                LocalDate localDate = LocalDate.now();
                Date date = Date.valueOf(localDate);
                dao.updateWarranty(status, image, date , id);
                response.sendRedirect("WarrantyController");
            }
        }

        if (service.equals("displayWarrantyforProduct")) {
            int id = Integer.parseInt(request.getParameter("id"));
            ArrayList<Warranty> list = dao.getAllWarrantyforProduct(id);
            ArrayList<Admin> admin = daoA.getAdmin(ad.getAdmin_id());
            request.setAttribute("admin", admin.get(0));
            request.setAttribute("data", list);
            dispath(request, response, "Admin/warranty.jsp");
        }

        if (service.equals("updateStatus")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");
            dao.updateStatus(status, id);
            response.sendRedirect("WarrantyController");
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
