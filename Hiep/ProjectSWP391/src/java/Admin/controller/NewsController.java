/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin.controller;

import dao.DAONews;
import dao.DAONewsGroup;
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
import model.Customer;
import model.News;
import model.NewsGroup;
import model.NewsView;

/**
 *
 * @author Lenovo
 */
public class NewsController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DAONews dao = new DAONews();
        DAONewsGroup daoG = new DAONewsGroup();
        HttpSession session = request.getSession();
        Admin ad = (Admin) session.getAttribute("account");

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
            ArrayList<NewsView> list = dao.pagingNewsView(pageNumber, pageSize);
            ArrayList<NewsGroup> groups = daoG.getAllNewsGroup();
            request.setAttribute("listG", groups);
            request.setAttribute("data", list);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("totalPages", dao.getTotalPages(pageSize));
            dispath(request, response, "Admin/news.jsp");
        }

        if (service.equals("updateNews")) {
            String submit = request.getParameter("submit");
            if (submit == null) {

                int id = Integer.parseInt(request.getParameter("id"));

                ArrayList<News> list = dao.getNews(id);
                ArrayList<NewsGroup> groups = daoG.getAllNewsGroup();

                request.setAttribute("listG", groups);
                request.setAttribute("data", list);
                dispath(request, response, "Admin/update/updateNews.jsp");

            } else {
                String image;
                LocalDate localDate = LocalDate.now();
                Date date = Date.valueOf(localDate);
                int newsgroup_id = Integer.parseInt(request.getParameter("newsgroup_id"));
                String img = request.getParameter("image");
                if (img.isEmpty()) {
                    image = request.getParameter("imageoriginal");
                } else {
                    image = "images/news/" + img;
                }
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                int news_id = Integer.parseInt(request.getParameter("news_id"));

                ArrayList<News> n = dao.getNews(news_id);

                News news = new News(news_id, newsgroup_id, image, title, content,
                        n.get(0).getCreateby(), n.get(0).getCreated_date(), ad.getName(), date);

                dao.updateNews(news);

                response.sendRedirect("NewsController");
            }
        }

        if (service.equals("insertNews")) {
            String submit = request.getParameter("submit");
            if (submit == null) {

                ArrayList<NewsGroup> groups = daoG.getAllNewsGroup();

                request.setAttribute("listG", groups);

                dispath(request, response, "Admin/add/addNews.jsp");

            } else {
                LocalDate localDate = LocalDate.now();
                Date date = Date.valueOf(localDate);
                int newsgroup_id = Integer.parseInt(request.getParameter("newsgroup_id"));
                String image = "images/news/" + request.getParameter("image");
                String title = request.getParameter("title");
                String content = request.getParameter("content");

                News n = new News(0, newsgroup_id, image, title, content,
                        ad.getName(), date, null, null);

                dao.insertNews(n);

                response.sendRedirect("NewsController");
            }
        }

        if (service.equals("deleteNews")) {
            int id = Integer.parseInt(request.getParameter("id"));
            int n = dao.deleteNews(id);
            if (n <= 0) {
                ArrayList<NewsView> list = dao.getAllNews();
                String ms = "Cannot delete News";
                request.setAttribute("ms", ms);
                request.setAttribute("data", list);
                dispath(request, response, "Admin/news.jsp");
            } else {
                response.sendRedirect("NewsController");
            }
        }

        if (service.equals("searchNews")) {
            String title = request.getParameter("title");
            ArrayList<NewsView> list = dao.searchNews(title);
            ArrayList<NewsGroup> groups = daoG.getAllNewsGroup();
            request.setAttribute("listG", groups);
            if (list.isEmpty()) {
                request.setAttribute("ms", "No Record Found");
                dispath(request, response, "Admin/news.jsp");
            } else {
                request.setAttribute("data", list);
                dispath(request, response, "Admin/news.jsp");
            }
        }

        if (service.equals("searchNewsGroup")) {
            int newsgroup_id = Integer.parseInt(request.getParameter("newsgroup_id"));
            ArrayList<NewsView> list = dao.searchNewsGroup(newsgroup_id);
            ArrayList<NewsGroup> groups = daoG.getAllNewsGroup();
            request.setAttribute("newsgroup_id", newsgroup_id);
            request.setAttribute("listG", groups);
            request.setAttribute("data", list);
            dispath(request, response, "Admin/news.jsp");
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
