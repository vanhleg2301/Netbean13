package controller;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.*;

public class DeletePersonServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String xId = request.getParameter("id").trim();
        if(xId.length()==0) {
           pr.print("<h3> Id cannot be empty! </h3>");
           request.getRequestDispatcher("PersonList.jsp").include(request, response);
           return;
        }
        PersonDAO u = new PersonDAO();
        Person x = u.getPerson(xId);
        if(x==null) {
           pr.print("<h3> Person with id " + xId + " is not found </h3>");
           request.getRequestDispatcher("personList.jsp").include(request, response);
           return;
        }
        u.deleteById(xId);
        response.sendRedirect("personList.jsp");
    }
}
