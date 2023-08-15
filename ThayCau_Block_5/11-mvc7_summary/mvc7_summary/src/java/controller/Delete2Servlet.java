package controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.*;
import java.util.*;

public class Delete2Servlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter pr = response.getWriter();
        String xRollno = request.getParameter("rollno");
        StudentDAO u = new StudentDAO();
        u.delete(xRollno);
        List<Student> lst = u.getStudents();
        request.setAttribute("lst", lst);
        request.getRequestDispatcher("list.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter pr = response.getWriter();
        String xRollno = request.getParameter("rollno");
        StudentDAO u = new StudentDAO();
        Student x = u.getStudent(xRollno);
        if(x==null) {
           pr.println("<h2> A student is not found</h2>");
           request.getRequestDispatcher("delete1.html").include(request, response);
        }
        else {
        request.setAttribute("x", x);
        request.getRequestDispatcher("delete2.jsp").forward(request, response);
        }

    }
}

