package controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import model.*;
import java.sql.Date;

public class InsertPersonServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String xId,xName,sDob;
        Date xDob;
        xId = request.getParameter("id").trim();
        if(xId.length()==0) {
           pr.print("<h3> The id must not be empty!");
           request.getRequestDispatcher("insertPerson.html").include(request, response);
           return;
         }
        PersonDAO u = new PersonDAO();
        Person x = u.getPerson(xId);
        if(x != null) {
           pr.print("<h3> The id " + xId + " already exists!");
           request.getRequestDispatcher("insertPerson.html").include(request, response);
           return;
        }
        xName = request.getParameter("name").trim();
        if(xName.length()==0) {
           pr.print("<h3> The name cannot be empty!");
           request.getRequestDispatcher("insertPerson.html").include(request, response);
           return;
         }
        sDob = request.getParameter("dob");
        xDob = Date.valueOf(sDob);           
        x = new Person(xId,xName,xDob);
        u.insert(x);
        response.sendRedirect("personList.jsp");
    }
}
// not correct: xDob = new SimpleDateFormat("yyyy-mm-dd").parse(sDob);           
    