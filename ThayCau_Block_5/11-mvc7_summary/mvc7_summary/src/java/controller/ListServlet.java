package controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.*;
import java.util.*;

public class ListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        StudentDAO u = new StudentDAO();
        List<Student> lst = u.getStudents();
        request.setAttribute("lst", lst);
        request.getRequestDispatcher("list.jsp").forward(request, response);

    }

}

