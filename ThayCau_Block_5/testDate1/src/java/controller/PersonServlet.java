package controller;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class PersonServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String xId,xName,xDob;
        xId = request.getParameter("id");
        xName = request.getParameter("name");
        xDob = request.getParameter("dob");
        String str = "<html>";
        str += "<p> Id: " + xId;
        str += "<p> Name: " + xName;
        str += "<p> Dob: " + xDob;
        str += "</html>";
        pr.print(str);
    }

}
